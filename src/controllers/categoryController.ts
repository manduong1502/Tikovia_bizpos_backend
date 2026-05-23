import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { memoryCache } from '../utils/cache';

const categorySchema = z.object({
  name: z.string().min(1, 'Tên nhóm hàng không được trống'),
  note: z.string().optional().nullable(),
  parentId: z.number().int().optional().nullable(),
});

export const categoryController = {
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const cacheKey = 'categories:all';
      const cached = memoryCache.get(cacheKey);
      if (cached) return res.json(cached);

      const categories = await prisma.category.findMany({
        where: { parentId: null },
        include: {
          _count: { select: { products: true, children: true } },
          children: {
            include: {
              _count: { select: { products: true, children: true } },
              children: {
                include: {
                  _count: { select: { products: true, children: true } },
                },
              },
            },
          },
        },
        orderBy: { name: 'asc' },
      });

      // Also fetch all categories (flat) for total count
      const totalCount = await prisma.category.count();

      const result = { roots: categories, totalCount };
      memoryCache.set(cacheKey, result, 600); // 10 minutes
      res.json(result);
    } catch (error) {
      next(error);
    }
  },

  create: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const data = categorySchema.parse(req.body);
      const existing = await prisma.category.findUnique({ where: { name: data.name } });
      if (existing) return res.status(400).json({ message: 'Tên nhóm hàng đã tồn tại' });

      const category = await prisma.category.create({
        data,
        include: { _count: { select: { products: true, children: true } } },
      });
      memoryCache.delete('categories:all');
      memoryCache.clearPattern('products');
      res.status(201).json(category);
    } catch (error) {
      next(error);
    }
  },

  update: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const data = categorySchema.partial().parse(req.body);
      if (data.name) {
        const existing = await prisma.category.findFirst({ where: { name: data.name, id: { not: Number(req.params.id) } } });
        if (existing) return res.status(400).json({ message: 'Tên nhóm hàng đã tồn tại' });
      }

      const category = await prisma.category.update({
        where: { id: Number(req.params.id) },
        data,
        include: { _count: { select: { products: true, children: true } } },
      });
      memoryCache.delete('categories:all');
      memoryCache.clearPattern('products');
      res.json(category);
    } catch (error) {
      next(error);
    }
  },

  delete: async (req: Request, res: Response, next: NextFunction) => {
    try {
      // Move children to root before deleting
      await prisma.category.updateMany({
        where: { parentId: Number(req.params.id) },
        data: { parentId: null },
      });
      await prisma.category.delete({ where: { id: Number(req.params.id) } });
      memoryCache.delete('categories:all');
      memoryCache.clearPattern('products');
      res.json({ message: 'Đã xóa nhóm hàng' });
    } catch (error) {
      next(error);
    }
  },
};
