import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { memoryCache } from '../utils/cache';
import { AuthRequest } from '../middlewares/auth';

const categorySchema = z.object({
  name: z.string().min(1, 'Tên nhóm hàng không được trống'),
  note: z.string().optional().nullable(),
  parentId: z.number().int().optional().nullable(),
});

export const categoryController = {
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const cacheKey = memoryCache.tenantKey(tenantId, 'categories:all');
      const cached = memoryCache.get(cacheKey);
      if (cached) return res.json(cached);

      const categories = await prisma.category.findMany({
        where: { tenantId, parentId: null },
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
      const totalCount = await prisma.category.count({
        where: { tenantId },
      });

      const result = { roots: categories, totalCount };
      memoryCache.set(cacheKey, result, 600); // 10 minutes
      res.json(result);
    } catch (error) {
      next(error);
    }
  },

  create: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const data = categorySchema.parse(req.body);
      const tenantId = req.user!.tenantId;

      const existing = await prisma.category.findUnique({
        where: {
          tenantId_name: {
            tenantId,
            name: data.name,
          },
        },
      });
      if (existing) return res.status(400).json({ message: 'Tên nhóm hàng đã tồn tại' });

      const category = await prisma.category.create({
        data: {
          ...data,
          tenantId,
        },
        include: { _count: { select: { products: true, children: true } } },
      });

      memoryCache.delete(memoryCache.tenantKey(tenantId, 'categories:all'));
      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.status(201).json(category);
    } catch (error) {
      next(error);
    }
  },

  update: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const data = categorySchema.partial().parse(req.body);
      const tenantId = req.user!.tenantId;

      const existingCat = await prisma.category.findFirst({
        where: { id: Number(req.params.id), tenantId }
      });
      if (!existingCat) return res.status(404).json({ message: 'Không tìm thấy nhóm hàng' });

      if (data.name) {
        const existing = await prisma.category.findFirst({
          where: {
            tenantId,
            name: data.name,
            id: { not: Number(req.params.id) },
          },
        });
        if (existing) return res.status(400).json({ message: 'Tên nhóm hàng đã tồn tại' });
      }

      const category = await prisma.category.update({
        where: { id: Number(req.params.id) },
        data,
        include: { _count: { select: { products: true, children: true } } },
      });

      memoryCache.delete(memoryCache.tenantKey(tenantId, 'categories:all'));
      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.json(category);
    } catch (error) {
      next(error);
    }
  },

  delete: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;

      const existingCat = await prisma.category.findFirst({
        where: { id: Number(req.params.id), tenantId }
      });
      if (!existingCat) return res.status(404).json({ message: 'Không tìm thấy nhóm hàng' });

      // Move children to root before deleting
      await prisma.category.updateMany({
        where: { tenantId, parentId: Number(req.params.id) },
        data: { parentId: null },
      });

      await prisma.category.delete({ where: { id: Number(req.params.id) } });

      memoryCache.delete(memoryCache.tenantKey(tenantId, 'categories:all'));
      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.json({ message: 'Đã xóa nhóm hàng' });
    } catch (error) {
      next(error);
    }
  },
};

