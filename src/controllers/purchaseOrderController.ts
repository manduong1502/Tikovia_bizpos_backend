import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';
import { memoryCache } from '../utils/cache';
import { config } from '../config';

const purchaseOrderItemSchema = z.object({
  productId: z.number().int(),
  quantity: z.number().min(0.001),
  price: z.number().min(0),
});

const createPurchaseOrderSchema = z.object({
  supplierId: z.number().int(),
  items: z.array(purchaseOrderItemSchema).min(1, 'Phiếu nhập phải có ít nhất 1 sản phẩm'),
  paid: z.number().min(0).default(0),
  note: z.string().optional().nullable(),
  status: z.enum(['PENDING', 'COMPLETED']).default('COMPLETED'),
});

// Auto-generate code using SequenceTracker scoped by tenantId
async function generatePOCode(tenantId: number, txClient?: any): Promise<string> {
  const db = txClient || prisma;
  const seq = await db.sequenceTracker.upsert({
    where: { tenantId_name: { tenantId, name: 'PURCHASE_ORDER' } },
    update: { value: { increment: 1 } },
    create: { tenantId, name: 'PURCHASE_ORDER', value: 1 }
  });
  return `PN${String(seq.value).padStart(6, '0')}`;
}

export const purchaseOrderController = {
  // GET /api/purchase-orders
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const page = Math.max(1, parseInt(req.query.page as string) || 1);
      const limit = Math.min(config.pagination.maxLimit, parseInt(req.query.limit as string) || 20);
      const status = req.query.status as any;
      const search = req.query.search as string;

      const where: any = { tenantId };
      if (status) where.status = status;
      if (search) {
        where.OR = [
          { code: { contains: search, mode: 'insensitive' } },
          { supplier: { name: { contains: search, mode: 'insensitive' } } },
        ];
      }

      const [data, total] = await Promise.all([
        prisma.purchaseOrder.findMany({
          where,
          include: {
            supplier: true,
            items: { include: { product: { select: { id: true, sku: true, name: true, unit: true } } } },
            _count: { select: { items: true } },
          },
          skip: (page - 1) * limit,
          take: limit,
          orderBy: { createdAt: 'desc' },
        }),
        prisma.purchaseOrder.count({ where }),
      ]);

      res.json({ data, total, page, limit, totalPages: Math.ceil(total / limit) });
    } catch (error) {
      next(error);
    }
  },

  // GET /api/purchase-orders/:id
  getById: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const id = Number(req.params.id);
      const po = await prisma.purchaseOrder.findFirst({
        where: { id, tenantId },
        include: {
          supplier: true,
          items: { include: { product: { select: { id: true, sku: true, name: true, unit: true } } } },
        },
      });
      if (!po) return res.status(404).json({ message: 'Không tìm thấy phiếu nhập' });
      res.json(po);
    } catch (error) {
      next(error);
    }
  },

  // POST /api/purchase-orders
  create: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const body = createPurchaseOrderSchema.parse(req.body);
      const po = await prisma.$transaction(async (tx) => {
        // Verify supplier belongs to same tenant
        const sup = await tx.supplier.findFirst({ where: { id: body.supplierId, tenantId } });
        if (!sup) throw new Error('Không tìm thấy nhà cung cấp');

        // Verify all products belong to this tenant
        const productIds = body.items.map(it => it.productId);
        const dbProducts = await tx.product.findMany({
          where: {
            id: { in: productIds },
            tenantId
          }
        });
        if (dbProducts.length !== productIds.length) {
          throw new Error('Một hoặc nhiều sản phẩm không hợp lệ hoặc không thuộc cửa hàng này');
        }

        const code = await generatePOCode(tenantId, tx);
        let total = 0;
        const itemsData = body.items.map(item => {
          const itemTotal = item.quantity * item.price;
          total += itemTotal;
          return {
            productId: item.productId,
            quantity: item.quantity,
            price: item.price,
            total: itemTotal,
          };
        });

        // Tạo đơn nhập
        const newPO = await tx.purchaseOrder.create({
          data: {
            code,
            supplierId: body.supplierId,
            status: body.status,
            total,
            paid: body.paid,
            note: body.note,
            items: { create: itemsData },
            tenantId,
          },
          include: {
            items: { include: { product: { select: { id: true, sku: true, name: true, unit: true } } } },
            supplier: { select: { id: true, name: true } }
          }
        });

        // Nếu trạng thái là HOÀN THÀNH thì cập nhật kho và công nợ
        if (body.status === 'COMPLETED') {
          await Promise.all(
            body.items.map(item =>
              tx.product.update({
                where: { id: item.productId },
                data: { stock: { increment: item.quantity } },
              })
            )
          );

          const debt = total - body.paid;
          if (debt !== 0) {
            await tx.supplier.update({
              where: { id: body.supplierId },
              data: { totalDebt: { increment: debt } },
            });
          }
          
          // Generate Cashbook Entry (EXPENSE) if paid > 0
          if (body.paid > 0) {
            const cashbookCode = `TCM${String(Date.now()).slice(-6)}${Math.floor(Math.random() * 100)}`;
            
            await tx.cashbookEntry.create({
              data: {
                code: cashbookCode,
                type: 'EXPENSE',
                amount: body.paid,
                category: 'Trả tiền nhà cung cấp', 
                partnerType: 'supplier',
                supplierId: body.supplierId,
                partnerName: sup.name,
                paymentMethod: 'cash',
                isAccounting: true,
                status: 'completed',
                branch: 'Chi nhánh trung tâm',
                userId: req.user!.id,
                purchaseOrderId: newPO.id,
                note: `Trả tiền nhập hàng ${code}`,
                tenantId,
              }
            });
          }
        }

        return newPO;
      });

      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.status(201).json(po);
    } catch (error) {
      next(error);
    }
  },

  // PUT /api/purchase-orders/:id
  update: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const id = Number(req.params.id);
      const { note, received_by, supplierId, items, paid, status } = req.body;

      const oldPO = await prisma.purchaseOrder.findFirst({
        where: { id, tenantId },
        include: { items: true },
      });
      if (!oldPO) return res.status(404).json({ message: 'Không tìm thấy phiếu nhập' });

      let finalNote = note !== undefined ? note : undefined;
      if (received_by) {
        finalNote = (finalNote || '') + ` [Người nhập: ${received_by}]`;
      }

      const updateData: any = {};
      if (finalNote !== undefined) updateData.note = finalNote;
      if (supplierId !== undefined) updateData.supplierId = Number(supplierId);
      if (paid !== undefined) updateData.paid = Number(paid);
      if (status !== undefined) updateData.status = status;

      const po = await prisma.$transaction(async (tx) => {
        // 1. Nếu phiếu nhập cũ đã COMPLETED, ta revert toàn bộ ảnh hưởng cũ trước
        if (oldPO.status === 'COMPLETED') {
          // Trừ kho hàng
          await Promise.all(
            oldPO.items.map(item =>
              tx.product.update({
                where: { id: item.productId },
                data: { stock: { decrement: item.quantity } },
              })
            )
          );
          // Trừ nợ nhà cung cấp
          const oldDebt = Number(oldPO.total) - Number(oldPO.paid);
          if (oldDebt > 0) {
            await tx.supplier.update({
              where: { id: oldPO.supplierId },
              data: { totalDebt: { decrement: oldDebt } },
            });
          }
          // Hủy phiếu chi cũ
          if (Number(oldPO.paid) > 0) {
            await tx.cashbookEntry.updateMany({
              where: { tenantId, purchaseOrderId: id, status: 'completed' },
              data: { status: 'cancelled', note: 'Hủy thanh toán theo phiếu nhập cập nhật' }
            });
          }
        }

        // 2. Cập nhật chi tiết items
        let total = Number(oldPO.total);
        if (items && Array.isArray(items)) {
          await tx.purchaseOrderItem.deleteMany({ where: { purchaseOrderId: id } });
          
          let computedTotal = 0;
          const itemsData = items.map((item: any) => {
            const itemTotal = Number(item.quantity) * Number(item.price);
            computedTotal += itemTotal;
            return {
              productId: item.productId,
              quantity: Number(item.quantity),
              price: Number(item.price),
              total: itemTotal,
            };
          });

          total = computedTotal;
          updateData.total = total;
          updateData.items = { create: itemsData };
        }

        // 3. Thực hiện cập nhật
        const newPO = await tx.purchaseOrder.update({
          where: { id },
          data: updateData,
          include: {
            items: { include: { product: { select: { id: true, sku: true, name: true, unit: true } } } },
            supplier: true
          }
        });

        // 4. Nếu trạng thái mới là COMPLETED, áp dụng các ảnh hưởng mới
        const finalStatus = status !== undefined ? status : oldPO.status;
        const finalPaid = paid !== undefined ? Number(paid) : Number(oldPO.paid);
        const finalSupplierId = supplierId !== undefined ? Number(supplierId) : oldPO.supplierId;

        if (finalStatus === 'COMPLETED') {
          // Cộng kho mới
          const finalItems = await tx.purchaseOrderItem.findMany({ where: { purchaseOrderId: id } });
          await Promise.all(
            finalItems.map(item =>
              tx.product.update({
                where: { id: item.productId },
                data: { stock: { increment: item.quantity } },
              })
            )
          );

          // Cộng nợ nhà cung cấp mới
          const newDebt = total - finalPaid;
          if (newDebt > 0) {
            await tx.supplier.update({
              where: { id: finalSupplierId },
              data: { totalDebt: { increment: newDebt } },
            });
          }
          
          // Tạo phiếu chi mới nếu paid > 0
          if (finalPaid > 0) {
            const supplierObj = await tx.supplier.findFirst({ where: { id: finalSupplierId, tenantId } });
            const cashbookCode = `TCM${String(Date.now()).slice(-6)}${Math.floor(Math.random() * 100)}`;
            
            await tx.cashbookEntry.create({
              data: {
                code: cashbookCode,
                type: 'EXPENSE',
                amount: finalPaid,
                category: 'Trả tiền nhà cung cấp',
                partnerType: 'supplier',
                supplierId: finalSupplierId,
                partnerName: supplierObj ? supplierObj.name : 'Nhà cung cấp',
                paymentMethod: 'cash',
                isAccounting: true,
                status: 'completed',
                branch: 'Chi nhánh trung tâm',
                userId: req.user!.id,
                purchaseOrderId: id,
                note: `Trả tiền nhập hàng ${newPO.code} (Cập nhật)`,
                tenantId,
              }
            });
          }
        }

        return newPO;
      });

      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.json(po);
    } catch (error) {
      next(error);
    }
  },

  // PUT /api/purchase-orders/:id/cancel
  cancel: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const id = Number(req.params.id);
      
      const po = await prisma.purchaseOrder.findFirst({
        where: { id, tenantId },
        include: { items: true },
      });

      if (!po) return res.status(404).json({ message: 'Không tìm thấy phiếu nhập' });
      if (po.status === 'CANCELLED') return res.status(400).json({ message: 'Phiếu nhập đã hủy trước đó' });

      await prisma.$transaction(async (tx) => {
        await tx.purchaseOrder.update({
          where: { id },
          data: { status: 'CANCELLED' },
        });

        // Nếu hủy đơn đã hoàn thành thì trừ kho và nợ lại
        if (po.status === 'COMPLETED') {
          await Promise.all(
            po.items.map(item =>
              tx.product.update({
                where: { id: item.productId },
                data: { stock: { decrement: item.quantity } },
              })
            )
          );

          const debt = Number(po.total) - Number(po.paid);
          if (debt !== 0) {
            await tx.supplier.update({
              where: { id: po.supplierId },
              data: { totalDebt: { decrement: debt } },
            });
          }
          
          // Also cancel associated cashbook entries
          await tx.cashbookEntry.updateMany({
            where: { tenantId, purchaseOrderId: id, status: 'completed' },
            data: { status: 'cancelled', note: 'Hủy theo phiếu nhập hàng bị hủy' }
          });
        }
      });

      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.json({ message: 'Đã hủy phiếu nhập' });
    } catch (error) {
      next(error);
    }
  },

  // DELETE /api/purchase-orders/:id
  delete: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      return res.status(400).json({ 
        message: 'Dữ liệu tài chính không được phép xóa vật lý. Vui lòng sử dụng tính năng Hủy phiếu.' 
      });
    } catch (error) {
      next(error);
    }
  }
};
