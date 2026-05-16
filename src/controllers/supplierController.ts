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

  importExcel: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const items = req.body.items;
      let importedCount = 0;

      await prisma.$transaction(async (tx) => {
        for (const item of items) {
          const code = item.code && item.code.trim() !== '' ? item.code.trim() : `NCC${Math.floor(Math.random() * 100000).toString().padStart(5, '0')}`;
          
          const supplierData = {
            name: item.name,
            phone: item.phone || null,
            email: item.email || null,
            address: item.address || null,
            note: item.note || null,
            totalSpent: item.totalSpent !== undefined ? Number(item.totalSpent) : 0,
            totalDebt: item.totalDebt !== undefined ? Number(item.totalDebt) : 0,
            isActive: item.isActive !== undefined ? Boolean(item.isActive) : true,
            createdBy: item.createdBy || null,
            createdAt: item.createdAt ? new Date(item.createdAt) : new Date(),
          };

          const ex = await tx.supplier.findUnique({ where: { code } });
          if (ex) {
            await tx.supplier.update({
              where: { code },
              data: supplierData,
            });
          } else {
            await tx.supplier.create({
              data: {
                code,
                ...supplierData,
              },
            });
          }
          importedCount++;
        }
      });

      res.status(201).json({ message: `Đã import thành công ${importedCount} nhà cung cấp`, count: importedCount });
    } catch (error) {
      next(error);
    }
  },
};
