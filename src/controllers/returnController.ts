import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';

const returnItemSchema = z.object({
  productId: z.number().int(),
  quantity: z.number().int().min(1),
  price: z.number().min(0),
});

const createReturnSchema = z.object({
  orderId: z.number().int(),
  customerId: z.number().int().optional().nullable(),
  items: z.array(returnItemSchema).min(1, 'Đơn trả hàng phải có ít nhất 1 sản phẩm'),
  reason: z.string().optional().nullable(),
});

// Auto-generate code using SequenceTracker to avoid race conditions
async function generateReturnCode(txClient?: any): Promise<string> {
  const db = txClient || prisma;
  const seq = await db.sequenceTracker.upsert({
    where: { name: 'RETURN' },
    update: { value: { increment: 1 } },
    create: { name: 'RETURN', value: 1 }
  });
  return `TH${String(seq.value).padStart(6, '0')}`;
}

export const returnController = {
  // GET /api/returns
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const page = Math.max(1, parseInt(req.query.page as string) || 1);
      const limit = Math.min(100, parseInt(req.query.limit as string) || 20);
      const search = req.query.search as string;

      const where: any = {};
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
            order: { select: { id: true, code: true } },
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
      const id = Number(req.params.id);
      const returnDoc = await prisma.return.findUnique({
        where: { id },
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
      const body = createReturnSchema.parse(req.body);
      const returnDoc = await prisma.$transaction(async (tx) => {
        const code = await generateReturnCode(tx);
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
            orderId: body.orderId,
            customerId: body.customerId,
            total,
            reason: body.reason,
            status: 'COMPLETED',
            items: { create: itemsData },
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

        // Trừ chi tiêu khách hàng
        if (body.customerId) {
          await tx.customer.update({
            where: { id: body.customerId },
            data: { totalSpent: { decrement: total } },
          });
        }

        return newReturn;
      });

      res.status(201).json(returnDoc);
    } catch (error) {
      next(error);
    }
  }
};
