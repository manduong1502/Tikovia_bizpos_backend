import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';

const purchaseOrderItemSchema = z.object({
  productId: z.number().int(),
  quantity: z.number().int().min(1),
  price: z.number().min(0),
});

const createPurchaseOrderSchema = z.object({
  supplierId: z.number().int(),
  items: z.array(purchaseOrderItemSchema).min(1, 'Phiếu nhập phải có ít nhất 1 sản phẩm'),
  paid: z.number().min(0).default(0),
  note: z.string().optional().nullable(),
  status: z.enum(['PENDING', 'COMPLETED']).default('COMPLETED'),
});

// Auto-generate code using SequenceTracker to avoid race conditions
async function generatePOCode(txClient?: any): Promise<string> {
  const db = txClient || prisma;
  const seq = await db.sequenceTracker.upsert({
    where: { name: 'PURCHASE_ORDER' },
    update: { value: { increment: 1 } },
    create: { name: 'PURCHASE_ORDER', value: 1 }
  });
  return `PN${String(seq.value).padStart(6, '0')}`;
}

export const purchaseOrderController = {
  // GET /api/purchase-orders
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const page = Math.max(1, parseInt(req.query.page as string) || 1);
      const limit = Math.min(100, parseInt(req.query.limit as string) || 20);
      const status = req.query.status as any;
      const search = req.query.search as string;

      const where: any = {};
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
            items: { include: { product: { select: { id: true, sku: true, name: true } } } },
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
      const id = Number(req.params.id);
      const po = await prisma.purchaseOrder.findUnique({
        where: { id },
        include: {
          supplier: true,
          items: { include: { product: { select: { id: true, sku: true, name: true } } } },
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
      const body = createPurchaseOrderSchema.parse(req.body);
      const po = await prisma.$transaction(async (tx) => {
        const code = await generatePOCode(tx);
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
          },
          include: {
            items: { include: { product: { select: { id: true, name: true } } } },
            supplier: { select: { id: true, name: true } }
          }
        });

        // Nếu trạng thái là HOÀN THÀNH thì cập nhật kho và công nợ
        if (body.status === 'COMPLETED') {
          for (const item of body.items) {
            await tx.product.update({
              where: { id: item.productId },
              data: { stock: { increment: item.quantity } },
            });
          }

          const debt = total - body.paid;
          if (debt > 0) {
            await tx.supplier.update({
              where: { id: body.supplierId },
              data: { totalDebt: { increment: debt } },
            });
          }
          
          // Generate Cashbook Entry (EXPENSE) if paid > 0
          if (body.paid > 0) {
            const supplier = await tx.supplier.findUnique({ where: { id: body.supplierId } });
            const count = await tx.cashbookEntry.count({ where: { type: 'EXPENSE' } });
            const cashbookCode = `TCM${String(Date.now()).slice(-6)}${Math.floor(Math.random() * 100)}`;
            
            await tx.cashbookEntry.create({
              data: {
                code: cashbookCode,
                type: 'EXPENSE',
                amount: body.paid,
                category: 'Trả tiền nhà cung cấp', // Trả tiền nhập hàng
                partnerType: 'supplier',
                supplierId: body.supplierId,
                partnerName: supplier ? supplier.name : 'Nhà cung cấp',
                paymentMethod: 'cash', // Or dynamically fetched
                isAccounting: true,
                status: 'completed',
                branch: 'Chi nhánh trung tâm',
                userId: req.user!.id,
                purchaseOrderId: newPO.id,
                note: `Trả tiền nhập hàng ${code}`,
              }
            });
          }
        }

        return newPO;
      });

      res.status(201).json(po);
    } catch (error) {
      next(error);
    }
  },

  // PUT /api/purchase-orders/:id
  update: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const id = Number(req.params.id);
      const { note, received_by, supplierId, items, paid, status } = req.body;

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
        if (items && Array.isArray(items)) {
          await tx.purchaseOrderItem.deleteMany({ where: { purchaseOrderId: id } });
          
          let total = 0;
          const itemsData = items.map((item: any) => {
            const itemTotal = Number(item.quantity) * Number(item.price);
            total += itemTotal;
            return {
              productId: item.productId,
              quantity: Number(item.quantity),
              price: Number(item.price),
              total: itemTotal,
            };
          });

          updateData.total = total;
          await tx.purchaseOrder.update({
            where: { id },
            data: {
              ...updateData,
              items: { create: itemsData }
            }
          });
        } else {
          await tx.purchaseOrder.update({
            where: { id },
            data: updateData
          });
        }

        return await tx.purchaseOrder.findUnique({
          where: { id },
          include: {
            items: { include: { product: { select: { id: true, sku: true, name: true } } } },
            supplier: true
          }
        });
      });

      res.json(po);
    } catch (error) {
      next(error);
    }
  },

  // PUT /api/purchase-orders/:id/cancel
  cancel: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const id = Number(req.params.id);
      const po = await prisma.purchaseOrder.findUnique({
        where: { id },
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
          for (const item of po.items) {
            await tx.product.update({
              where: { id: item.productId },
              data: { stock: { decrement: item.quantity } },
            });
          }

          const debt = Number(po.total) - Number(po.paid);
          if (debt !== 0) {
            await tx.supplier.update({
              where: { id: po.supplierId },
              data: { totalDebt: { decrement: debt } },
            });
          }
          
          // Also cancel associated cashbook entries
          await tx.cashbookEntry.updateMany({
            where: { purchaseOrderId: id, status: 'completed' },
            data: { status: 'cancelled', note: 'Hủy theo phiếu nhập hàng bị hủy' }
          });
        }
      });

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
