import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';

export const supplierController = {
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const suppliers = await prisma.supplier.findMany({ orderBy: { name: 'asc' } });
      res.json(suppliers);
    } catch (error) {
      next(error);
    }
  },

  create: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const supplier = await prisma.supplier.create({ data: req.body });
      res.status(201).json(supplier);
    } catch (error) {
      next(error);
    }
  },

  update: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const supplier = await prisma.supplier.update({
        where: { id: Number(req.params.id) },
        data: req.body,
      });
      res.json(supplier);
    } catch (error) {
      next(error);
    }
  },

  delete: async (req: Request, res: Response, next: NextFunction) => {
    try {
      await prisma.supplier.delete({ where: { id: Number(req.params.id) } });
      res.json({ message: 'Đã xóa nhà cung cấp' });
    } catch (error) {
      next(error);
    }
  },
};
