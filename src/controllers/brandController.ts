import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { memoryCache } from '../utils/cache';
import { AuthRequest } from '../middlewares/auth';

const brandSchema = z.object({
  name: z.string().min(1, 'Tên thương hiệu không được trống'),
});

export const brandController = {
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const cacheKey = memoryCache.tenantKey(tenantId, 'brands:all');
      const cached = memoryCache.get(cacheKey);
      if (cached) return res.json(cached);

      const brands = await prisma.brand.findMany({
        where: { tenantId },
        orderBy: { name: 'asc' },
      });

      memoryCache.set(cacheKey, brands, 600); // 10 minutes
      res.json(brands);
    } catch (error) {
      next(error);
    }
  },

  create: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const data = brandSchema.parse(req.body);
      const tenantId = req.user!.tenantId;

      const existing = await prisma.brand.findUnique({
        where: {
          tenantId_name: {
            tenantId,
            name: data.name,
          },
        },
      });
      if (existing) {
        return res.status(400).json({ message: 'Thương hiệu đã tồn tại' });
      }

      const brand = await prisma.brand.create({
        data: {
          ...data,
          tenantId,
        },
      });

      memoryCache.delete(memoryCache.tenantKey(tenantId, 'brands:all'));
      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.status(201).json(brand);
    } catch (error) {
      next(error);
    }
  },
};

