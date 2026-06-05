import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';
import { memoryCache } from '../utils/cache';
import { config } from '../config';

const returnItemSchema = z.object({
  productId: z.number().int(),
  quantity: z.number().min(0.001),
  price: z.number().min(0),
});

const createReturnSchema = z.object({
  orderId: z.number().int().optional().nullable(),
  customerId: z.number().int().optional().nullable(),
  items: z.array(returnItemSchema).min(1, 'Đơn trả hàng phải có ít nhất 1 sản phẩm'),
  reason: z.string().optional().nullable(),
  discount: z.number().min(0).default(0), // Phí trả hàng (khách chịu)
  paid: z.number().min(0).default(0), // Tiền thực tế trả khách
});

// Auto-generate return code using SequenceTracker scoped by tenantId
async function generateReturnCode(tenantId: number, txClient?: any): Promise<string> {
  const db = txClient || prisma;
  const seq = await db.sequenceTracker.upsert({
    where: { tenantId_name: { tenantId, name: 'RETURN' } },
    update: { value: { increment: 1 } },
    create: { tenantId, name: 'RETURN', value: 1 }
  });
  return `TH${String(seq.value).padStart(6, '0')}`;
}

export const returnController = {
  // GET /api/returns
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const page = Math.max(1, parseInt(req.query.page as string) || 1);
      const limit = Math.min(config.pagination.maxLimit, parseInt(req.query.limit as string) || 20);
      const search = req.query.search as string;

      const where: any = { tenantId };
      if (search) {
        where.OR = [
          { code: { contains: search, mode: 'insensitive' } },
          { customer: { name: { contains: search, mode: 'insensitive' } } },
        ];
      }

      const [data, total] = await Promise.all([
        prisma.return.findMany({
          where,
          include: {
            customer: { select: { id: true, name: true, phone: true } },
            order: { select: { id: true, code: true, user: { select: { fullName: true } } } },
            _count: { select: { items: true } },
          },
          skip: (page - 1) * limit,
          take: limit,
          orderBy: { createdAt: 'desc' },
        }),
        prisma.return.count({ where }),
      ]);

      res.json({ data, total, page, limit, totalPages: Math.ceil(total / limit) });
    } catch (error) {
      next(error);
    }
  },

  // GET /api/returns/:id
  getById: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const id = Number(req.params.id);
      const returnDoc = await prisma.return.findFirst({
        where: { id, tenantId },
        include: {
          customer: true,
          order: { select: { id: true, code: true } },
          items: { include: { product: { select: { id: true, sku: true, name: true } } } },
        },
      });
      if (!returnDoc) return res.status(404).json({ message: 'Không tìm thấy đơn trả hàng' });
      res.json(returnDoc);
    } catch (error) {
      next(error);
    }
  },

  // POST /api/returns
  create: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const body = createReturnSchema.parse(req.body);
      const returnDoc = await prisma.$transaction(async (tx) => {
        // Verify order exists in the same tenant if provided
        if (body.orderId) {
          const ord = await tx.order.findFirst({ where: { id: body.orderId, tenantId } });
          if (!ord) throw new Error('Không tìm thấy hóa đơn liên kết');
        }

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

        const code = await generateReturnCode(tenantId, tx);
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

        const newReturn = await tx.return.create({
          data: {
            code,
            orderId: body.orderId || null,
            customerId: body.customerId || null,
            total,
            discount: body.discount,
            paid: body.paid,
            reason: body.reason,
            status: 'COMPLETED',
            items: { create: itemsData },
            tenantId,
          },
          include: {
            items: { include: { product: { select: { id: true, name: true } } } },
            customer: { select: { id: true, name: true } }
          }
        });

        // Hoàn lại kho
        for (const item of body.items) {
          await tx.product.update({
            where: { id: item.productId },
            data: { stock: { increment: item.quantity } },
          });
        }

        // Cập nhật chi tiêu & nợ khách hàng
        if (body.customerId) {
          await tx.customer.update({
            where: { id: body.customerId },
            data: { 
              totalSpent: { decrement: total },
              lastTransaction: new Date(),
            },
          });

          // nợ giảm = (tổng tiền hàng trả - phí trả hàng) - tiền thực tế trả khách
          const netRefund = total - body.discount;
          const debtReduction = body.paid > 0 ? body.paid : netRefund;
          if (debtReduction !== 0) {
            await tx.customer.update({
              where: { id: body.customerId },
              data: { totalDebt: { decrement: debtReduction } },
            });
          }
        }

        // Tạo phiếu chi sổ quỹ nếu thực tế có trả lại tiền mặt/chuyển khoản cho khách
        if (body.paid > 0) {
          const customerObj = body.customerId ? await tx.customer.findFirst({ where: { id: body.customerId, tenantId } }) : null;
          const cashbookCode = `TCM${String(Date.now()).slice(-6)}${Math.floor(Math.random() * 100)}`;
          
          await tx.cashbookEntry.create({
            data: {
              code: cashbookCode,
              type: 'EXPENSE',
              amount: body.paid,
              category: 'Chi tiền trả hàng', 
              partnerType: body.customerId ? 'customer' : 'other',
              customerId: body.customerId || null,
              partnerName: customerObj ? customerObj.name : 'Khách lẻ',
              paymentMethod: 'cash',
              isAccounting: true,
              status: 'completed',
              branch: 'Chi nhánh trung tâm',
              userId: req.user!.id,
              returnId: newReturn.id,
              note: `Chi trả khách trả hàng (Phiếu trả ${code})`,
              tenantId,
            }
          });
        }

        return newReturn;
      });

      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.status(201).json(returnDoc);
    } catch (error) {
      next(error);
    }
  },

  // PUT /api/returns/:id
  update: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const id = Number(req.params.id);
      const { reason } = req.body;
      const ret = await prisma.return.findFirst({ where: { id, tenantId } });
      if (!ret) return res.status(404).json({ message: 'Không tìm thấy phiếu trả hàng' });
      
      const updated = await prisma.return.update({
        where: { id },
        data: { reason },
      });
      res.json(updated);
    } catch (error) {
      next(error);
    }
  },

  // PUT /api/returns/:id/cancel
  cancel: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const id = Number(req.params.id);
      
      const ret = await prisma.return.findFirst({
        where: { id, tenantId },
        include: { items: true },
      });
      if (!ret) return res.status(404).json({ message: 'Không tìm thấy phiếu trả hàng' });
      if (ret.status === 'CANCELLED') return res.status(400).json({ message: 'Phiếu trả hàng đã hủy trước đó' });
      
      await prisma.$transaction(async (tx) => {
        await tx.return.update({
          where: { id },
          data: { status: 'CANCELLED' },
        });
        
        // Hoàn lại kho (phiếu trả bị hủy nên phải trừ lại kho sản phẩm)
        for (const item of ret.items) {
          await tx.product.update({
            where: { id: item.productId },
            data: { stock: { decrement: item.quantity } },
          });
        }
        
        // Revert customer spent & debt
        if (ret.customerId) {
          const total = Number(ret.total);
          const discount = Number(ret.discount);
          const paid = Number(ret.paid);
          
          await tx.customer.update({
            where: { id: ret.customerId },
            data: { totalSpent: { increment: total } },
          });
          
          const netRefund = total - discount;
          const debtReduction = netRefund - paid;
          if (debtReduction !== 0) {
            await tx.customer.update({
              where: { id: ret.customerId },
              data: { totalDebt: { increment: debtReduction } },
            });
          }
        }
        
        // Hủy phiếu chi quỹ tương ứng
        await tx.cashbookEntry.updateMany({
          where: { tenantId, returnId: id, status: 'completed' },
          data: { status: 'cancelled', note: 'Hủy theo phiếu trả hàng bị hủy' }
        });
      });
      
      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.json({ message: 'Đã hủy phiếu trả hàng thành công' });
    } catch (error) {
      next(error);
    }
  }
};
