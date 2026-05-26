import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';
import { memoryCache } from '../utils/cache';
import { config } from '../config';

const purchaseReturnItemSchema = z.object({
  productId: z.number().int(),
  quantity: z.number().min(0.01),
  unit: z.string().default('Cái'),
  price: z.number().min(0),
  returnPrice: z.number().min(0),
  note: z.string().optional().nullable(),
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

// Auto-generate code using SequenceTracker scoped by tenantId
async function generatePurchaseReturnCode(tenantId: number, txClient?: any): Promise<string> {
  const db = txClient || prisma;
  const seq = await db.sequenceTracker.upsert({
    where: { tenantId_name: { tenantId, name: 'PURCHASE_RETURN' } },
    update: { value: { increment: 1 } },
    create: { tenantId, name: 'PURCHASE_RETURN', value: 1 }
  });
  return `THN${String(seq.value).padStart(6, '0')}`;
}

export const purchaseReturnController = {
  // GET /api/purchase-returns
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const page = Math.max(1, parseInt(req.query.page as string) || 1);
      const limit = Math.min(config.pagination.maxLimit, parseInt(req.query.limit as string) || 20);
      const search = req.query.search as string;
      const status = req.query.status as any;
      const createdBy = req.query.createdBy as string;
      const receivedBy = req.query.receivedBy as string;

      const where: any = { tenantId };
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
      const tenantId = (req as any).tenant!.id;
      const id = Number(req.params.id);
      const pr = await prisma.purchaseReturn.findFirst({
        where: { id, tenantId },
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
      const tenantId = req.user!.tenantId;
      const body = createPurchaseReturnSchema.parse(req.body);
      const pr = await prisma.$transaction(async (tx) => {
        // Verify supplier and PO belong to same tenant
        const sup = await tx.supplier.findFirst({ where: { id: body.supplierId, tenantId } });
        if (!sup) throw new Error('Không tìm thấy nhà cung cấp');

        if (body.purchaseOrderId) {
          const po = await tx.purchaseOrder.findFirst({ where: { id: body.purchaseOrderId, tenantId } });
          if (!po) throw new Error('Không tìm thấy phiếu nhập liên kết');
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

        const code = await generatePurchaseReturnCode(tenantId, tx);
        let total = 0;
        const itemsData = body.items.map(item => {
          const itemTotal = item.quantity * item.returnPrice;
          total += itemTotal;
          return {
            productId: item.productId,
            quantity: item.quantity,
            unit: item.unit,
            price: item.price,
            returnPrice: item.returnPrice,
            total: itemTotal,
            note: item.note || null,
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
            tenantId,
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
          if (debtReduction !== 0) {
            await tx.supplier.update({
              where: { id: body.supplierId },
              data: { totalDebt: { decrement: debtReduction } },
            });
          }

          if (body.paid > 0) {
            const cashbookCode = `PTM${String(Date.now()).slice(-6)}${Math.floor(Math.random() * 100)}`;
            
            await tx.cashbookEntry.create({
              data: {
                code: cashbookCode,
                type: 'INCOME',
                amount: body.paid,
                category: 'Thu tiền trả hàng', 
                partnerType: 'supplier',
                supplierId: body.supplierId,
                partnerName: sup.name,
                paymentMethod: 'cash',
                isAccounting: true,
                status: 'completed',
                branch: 'Chi nhánh trung tâm',
                userId: req.user!.id,
                purchaseOrderId: body.purchaseOrderId || null,
                note: `Thu tiền nhà cung cấp trả lại (Phiếu ${code})`,
                tenantId,
              }
            });
          }
        }

        return newPR;
      });

      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.status(201).json(pr);
    } catch (error) {
      next(error);
    }
  }
};
