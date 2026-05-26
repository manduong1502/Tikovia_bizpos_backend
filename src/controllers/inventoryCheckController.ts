import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';
import { memoryCache } from '../utils/cache';
import { config } from '../config';

const checkItemSchema = z.object({
  productId: z.number().int(),
  actualQty: z.number().int().min(0),
  note: z.string().optional().nullable(),
});

const createInventoryCheckSchema = z.object({
  items: z.array(checkItemSchema).min(1, 'Phải có ít nhất 1 sản phẩm để kiểm kho'),
});

// Auto-generate code using SequenceTracker scoped by tenantId
async function generateCheckCode(tenantId: number, txClient?: any): Promise<string> {
  const db = txClient || prisma;
  const seq = await db.sequenceTracker.upsert({
    where: { tenantId_name: { tenantId, name: 'INVENTORY_CHECK' } },
    update: { value: { increment: 1 } },
    create: { tenantId, name: 'INVENTORY_CHECK', value: 1 }
  });
  return `KK${String(seq.value).padStart(6, '0')}`;
}

export const inventoryCheckController = {
  // GET /api/inventory-checks
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
        ];
      }

      const [data, total] = await Promise.all([
        prisma.inventoryCheck.findMany({
          where,
          include: {
            user: { select: { id: true, fullName: true } },
            items: { include: { product: { select: { id: true, sku: true, name: true } } } },
          },
          skip: (page - 1) * limit,
          take: limit,
          orderBy: { createdAt: 'desc' },
        }),
        prisma.inventoryCheck.count({ where }),
      ]);

      res.json({ data, total, page, limit, totalPages: Math.ceil(total / limit) });
    } catch (error) {
      next(error);
    }
  },

  // POST /api/inventory-checks (Batch create)
  create: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const body = createInventoryCheckSchema.parse(req.body);
      
      const results = await prisma.$transaction(async (tx) => {
        const code = await generateCheckCode(tenantId, tx);
        
        const newCheck = await tx.inventoryCheck.create({
          data: {
            code,
            userId: req.user!.id,
            status: 'COMPLETED',
            tenantId,
          }
        });

        const itemsToCreate = [];

        for (const item of body.items) {
          // Get current system qty scoped to tenant
          const product = await tx.product.findFirst({
            where: { id: item.productId, tenantId },
            select: { stock: true }
          });

          if (!product) continue;

          const systemQty = product.stock;
          const difference = item.actualQty - systemQty;

          itemsToCreate.push({
            inventoryCheckId: newCheck.id,
            productId: item.productId,
            systemQty,
            actualQty: item.actualQty,
            difference,
            note: item.note,
          });

          // Update stock to actual
          await tx.product.update({
            where: { id: item.productId },
            data: { stock: item.actualQty },
          });
        }
        
        if (itemsToCreate.length > 0) {
          await tx.inventoryCheckItem.createMany({
            data: itemsToCreate
          });
        }

        return await tx.inventoryCheck.findUnique({
          where: { id: newCheck.id },
          include: { items: true }
        });
      });

      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.status(201).json(results);
    } catch (error) {
      next(error);
    }
  }
};
