import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';

function parseExcelDate(val: any): Date | null {
  if (!val) return null;
  if (val instanceof Date && !isNaN(val.getTime())) return val;
  const num = Number(val);
  if (!isNaN(num) && num > 10000 && num < 99999) {
    const ms = (num - 25569) * 86400 * 1000;
    const d = new Date(ms);
    if (!isNaN(d.getTime())) return d;
  }
  if (!isNaN(num) && num > 1000000000000) {
    const d = new Date(num);
    if (!isNaN(d.getTime())) return d;
  }
  const str = String(val).trim();
  const d = new Date(str);
  if (!isNaN(d.getTime())) return d;
  const parts = str.split(/[/\-_]/);
  if (parts.length >= 3) {
    const day = parseInt(parts[0], 10);
    const month = parseInt(parts[1], 10) - 1;
    const year = parseInt(parts[2], 10);
    const d2 = new Date(year, month, day);
    if (!isNaN(d2.getTime())) return d2;
  }
  return null;
}

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
            createdAt: parseExcelDate(item.createdAt) || new Date(),
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
