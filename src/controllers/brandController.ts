import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { memoryCache } from '../utils/cache';

const brandSchema = z.object({
  name: z.string().min(1, 'Tên thương hiệu không được trống'),
});

export const brandController = {
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const cacheKey = 'brands:all';
      const cached = memoryCache.get(cacheKey);
      if (cached) return res.json(cached);

      const brands = await prisma.brand.findMany({
        orderBy: { name: 'asc' },
      });

      memoryCache.set(cacheKey, brands, 600); // 10 minutes
      res.json(brands);
    } catch (error) {
      next(error);
    }
  },

  create: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const data = brandSchema.parse(req.body);
      const existing = await prisma.brand.findUnique({ where: { name: data.name } });
      if (existing) {
        return res.status(400).json({ message: 'Thương hiệu đã tồn tại' });
      }
      const brand = await prisma.brand.create({ data });
      memoryCache.delete('brands:all');
      memoryCache.clearPattern('products');
      res.status(201).json(brand);
    } catch (error) {
      next(error);
    }
  },
};
