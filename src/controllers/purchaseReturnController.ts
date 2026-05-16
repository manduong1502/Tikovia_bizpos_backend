import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';

const purchaseReturnItemSchema = z.object({
  productId: z.number().int(),
  quantity: z.number().min(0.01),
  price: z.number().min(0),
  returnPrice: z.number().min(0),
});

const createPurchaseReturnSchema = z.object({
  purchaseOrderId: z.number().int().optional().nullable(),
  supplierId: z.number().int(),
  items: z.array(purchaseReturnItemSchema).min(1, 'Đơn trả hàng phải có ít nhất 1 sản phẩm'),
  paid: z.number().min(0).default(0), // Tiền NCC trả
  discount: z.number().min(0).default(0), // Giảm giá
  note: z.string().optional().nullable(),
  status: z.enum(['PENDING', 'COMPLETED']).default('COMPLETED'),
  receivedBy: z.string().optional().nullable(),
  createdBy: z.string().optional().nullable(),
});

async function generatePurchaseReturnCode(): Promise<string> {
  const lastPR = await prisma.purchaseReturn.findFirst({ orderBy: { id: 'desc' } });
  const nextNum = (lastPR?.id || 0) + 1;
  return `THN${String(nextNum).padStart(6, '0')}`;
}

export const purchaseReturnController = {
  // GET /api/purchase-returns
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const page = Math.max(1, parseInt(req.query.page as string) || 1);
      const limit = Math.min(500, parseInt(req.query.limit as string) || 20);
      const search = req.query.search as string;
      const status = req.query.status as any;
      const createdBy = req.query.createdBy as string;
      const receivedBy = req.query.receivedBy as string;

      const where: any = {};
      if (status) where.status = status;
      if (createdBy) where.createdBy = createdBy;
      if (receivedBy) where.receivedBy = receivedBy;

      if (search) {
        where.OR = [
          { code: { contains: search, mode: 'insensitive' } },
          { supplier: { name: { contains: search, mode: 'insensitive' } } },
          { supplier: { code: { contains: search, mode: 'insensitive' } } },
        ];
      }

      const [data, total] = await Promise.all([
        prisma.purchaseReturn.findMany({
          where,
          include: {
            supplier: true,
            purchaseOrder: { select: { id: true, code: true } },
            items: { include: { product: { select: { id: true, sku: true, name: true, unit: true } } } },
            _count: { select: { items: true } },
          },
          skip: (page - 1) * limit,
          take: limit,
          orderBy: { createdAt: 'desc' },
        }),
        prisma.purchaseReturn.count({ where }),
      ]);

      res.json({ data, total, page, limit, totalPages: Math.ceil(total / limit) });
    } catch (error) {
      next(error);
    }
  },

  // GET /api/purchase-returns/:id
  getById: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const id = Number(req.params.id);
      const pr = await prisma.purchaseReturn.findUnique({
        where: { id },
        include: {
          supplier: true,
          purchaseOrder: true,
          items: { include: { product: { select: { id: true, sku: true, name: true, unit: true } } } },
        },
      });
      if (!pr) return res.status(404).json({ message: 'Không tìm thấy phiếu trả hàng nhập' });
      res.json(pr);
    } catch (error) {
      next(error);
    }
  },

  // POST /api/purchase-returns
  create: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const body = createPurchaseReturnSchema.parse(req.body);
      const code = await generatePurchaseReturnCode();

      const pr = await prisma.$transaction(async (tx) => {
        let total = 0;
        const itemsData = body.items.map(item => {
          const itemTotal = item.quantity * item.returnPrice;
          total += itemTotal;
          return {
            productId: item.productId,
            quantity: item.quantity,
            price: item.price,
            returnPrice: item.returnPrice,
            total: itemTotal,
          };
        });

        const newPR = await tx.purchaseReturn.create({
          data: {
            code,
            purchaseOrderId: body.purchaseOrderId || null,
            supplierId: body.supplierId,
            status: body.status,
            total,
            discount: body.discount,
            paid: body.paid,
            note: body.note,
            receivedBy: body.receivedBy,
            createdBy: body.createdBy || req.user?.username || 'Võ Thành Huy',
            items: { create: itemsData },
          },
          include: {
            items: { include: { product: { select: { id: true, sku: true, name: true, unit: true } } } },
            supplier: true,
            purchaseOrder: true
          }
        });

        if (body.status === 'COMPLETED') {
          for (const item of body.items) {
            await tx.product.update({
              where: { id: item.productId },
              data: { stock: { decrement: item.quantity } },
            });
          }

          const netReturn = total - body.discount;
          const debtReduction = netReturn - body.paid;
          if (debtReduction > 0) {
            await tx.supplier.update({
              where: { id: body.supplierId },
              data: { totalDebt: { decrement: debtReduction } },
            });
          }
        }

        return newPR;
      });

      res.status(201).json(pr);
    } catch (error) {
      next(error);
    }
  }
};
