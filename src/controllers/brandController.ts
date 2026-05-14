import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';

const brandSchema = z.object({
  name: z.string().min(1, 'Tên thương hiệu không được trống'),
});

export const brandController = {
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const brands = await prisma.brand.findMany({
        orderBy: { name: 'asc' },
      });
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
      res.status(201).json(brand);
    } catch (error) {
      next(error);
    }
  },
};
