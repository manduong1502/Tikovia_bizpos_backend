import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';

const categorySchema = z.object({
  name: z.string().min(1, 'Tên nhóm hàng không được trống'),
  note: z.string().optional().nullable(),
});

export const categoryController = {
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const categories = await prisma.category.findMany({
        include: { _count: { select: { products: true } } },
        orderBy: { name: 'asc' },
      });
      res.json(categories);
    } catch (error) {
      next(error);
    }
  },

  create: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const data = categorySchema.parse(req.body);
      const category = await prisma.category.create({ data });
      res.status(201).json(category);
    } catch (error) {
      next(error);
    }
  },

  update: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const data = categorySchema.partial().parse(req.body);
      const category = await prisma.category.update({
        where: { id: Number(req.params.id) },
        data,
      });
      res.json(category);
    } catch (error) {
      next(error);
    }
  },

  delete: async (req: Request, res: Response, next: NextFunction) => {
    try {
      await prisma.category.delete({ where: { id: Number(req.params.id) } });
      res.json({ message: 'Đã xóa nhóm hàng' });
    } catch (error) {
      next(error);
    }
  },
};
