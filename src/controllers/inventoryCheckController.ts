import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';

const checkItemSchema = z.object({
  productId: z.number().int(),
  actualQty: z.number().int().min(0),
  note: z.string().optional().nullable(),
});

const createInventoryCheckSchema = z.object({
  items: z.array(checkItemSchema).min(1, 'Phải có ít nhất 1 sản phẩm để kiểm kho'),
});

// Auto-generate code: KK000001
async function generateCheckCode(): Promise<string> {
  const lastCheck = await prisma.inventoryCheck.findFirst({ orderBy: { id: 'desc' } });
  const nextNum = (lastCheck?.id || 0) + 1;
  return `KK${String(nextNum).padStart(6, '0')}`;
}

export const inventoryCheckController = {
  // GET /api/inventory-checks
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const page = Math.max(1, parseInt(req.query.page as string) || 1);
      const limit = Math.min(100, parseInt(req.query.limit as string) || 20);
      const search = req.query.search as string;

      const where: any = {};
      if (search) {
        where.OR = [
          { code: { contains: search, mode: 'insensitive' } },
          { product: { name: { contains: search, mode: 'insensitive' } } },
        ];
      }

      const [data, total] = await Promise.all([
        prisma.inventoryCheck.findMany({
          where,
          include: {
            product: { select: { id: true, sku: true, name: true } },
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
      const body = createInventoryCheckSchema.parse(req.body);
      
      const results = await prisma.$transaction(async (tx) => {
        const createdChecks = [];

        for (const item of body.items) {
          // Get current system qty
          const product = await tx.product.findUnique({
            where: { id: item.productId },
            select: { stock: true }
          });

          if (!product) continue;

          const systemQty = product.stock;
          const difference = item.actualQty - systemQty;

          // Only create record if there's a difference or if we want to log every check.
          // Let's log every check for audit purposes.
          const code = await generateCheckCode();
          
          const newCheck = await tx.inventoryCheck.create({
            data: {
              code,
              productId: item.productId,
              systemQty,
              actualQty: item.actualQty,
              difference,
              note: item.note,
            }
          });

          // Update stock to actual
          await tx.product.update({
            where: { id: item.productId },
            data: { stock: item.actualQty },
          });

          createdChecks.push(newCheck);
        }

        return createdChecks;
      });

      res.status(201).json(results);
    } catch (error) {
      next(error);
    }
  }
};
