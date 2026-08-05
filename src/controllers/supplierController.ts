import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';

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
      const tenantId = (req as any).tenant!.id;
      const suppliers = await prisma.supplier.findMany({
        where: { tenantId },
        orderBy: [
          { lastTransaction: { sort: 'desc', nulls: 'last' } },
          { createdAt: 'desc' }
        ],
        include: {
          purchaseOrders: {
            where: { tenantId, status: 'COMPLETED' }
          },
          purchaseReturns: {
            where: { tenantId, status: 'COMPLETED' }
          }
        }
      });
      
      const enriched = suppliers.map(s => {
        const poSpent = s.purchaseOrders.reduce((sum, po) => sum + Number(po.total || 0), 0);
        const baseSpent = Number(s.totalSpent || 0);
        const actualSpent = baseSpent > 0 ? baseSpent : poSpent;
        
        const totalReturn = s.purchaseReturns.reduce((sum, pr) => sum + Number(pr.total || 0), 0);
        const netPurchase = actualSpent - totalReturn;
        const debtVal = Number(s.totalDebt || 0);
        
        return {
          ...s,
          totalSpent: actualSpent,
          totalReturn,
          netPurchase,
          total_spent: actualSpent,
          total_return: totalReturn,
          net_purchase: netPurchase,
          debt: debtVal,
          created_by: s.createdBy || 'Admin',
          created_at: s.createdAt
        };
      });

      res.json(enriched);
    } catch (error) {
      next(error);
    }
  },

  create: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const data = { ...req.body };
      if (!data.name || data.name.trim() === '') return res.status(400).json({ message: 'Tên nhà cung cấp không được trống' });
      
      const existingName = await prisma.supplier.findFirst({
        where: { tenantId, name: data.name }
      });
      if (existingName) return res.status(400).json({ message: 'Tên nhà cung cấp đã tồn tại' });
      
      const totalSpent = Number(data.total_spent || data.totalSpent || 0);
      const totalDebt = Number(data.debt || data.totalDebt || 0);
      const code = data.code && data.code.trim() !== '' ? data.code.trim() : `NCC${Math.floor(Math.random() * 100000).toString().padStart(5, '0')}`;
      
      const supplierData = {
        code,
        name: data.name,
        phone: data.phone || null,
        email: data.email || null,
        address: data.address || null,
        note: data.note || null,
        totalSpent,
        totalDebt,
        isActive: data.isActive !== undefined ? Boolean(data.isActive) : true,
        createdBy: data.created_by || data.createdBy || 'Admin',
        lastTransaction: data.created_at ? new Date(data.created_at) : new Date(),
        createdAt: data.created_at ? new Date(data.created_at) : new Date(),
        tenantId,
      };

      const supplier = await prisma.supplier.create({ data: supplierData });
      res.status(201).json({
        ...supplier,
        totalSpent: Number(supplier.totalSpent),
        totalReturn: 0,
        netPurchase: Number(supplier.totalSpent),
        total_spent: Number(supplier.totalSpent),
        total_return: 0,
        net_purchase: Number(supplier.totalSpent),
        debt: Number(supplier.totalDebt),
        created_by: supplier.createdBy || 'Admin',
        created_at: supplier.createdAt
      });
    } catch (error) {
      next(error);
    }
  },

  update: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const data = { ...req.body };
      
      const existingSupplier = await prisma.supplier.findFirst({
        where: { id: Number(req.params.id), tenantId }
      });
      if (!existingSupplier) return res.status(404).json({ message: 'Không tìm thấy nhà cung cấp' });

      if (data.name) {
        const existingName = await prisma.supplier.findFirst({
          where: { tenantId, name: data.name, id: { not: Number(req.params.id) } }
        });
        if (existingName) return res.status(400).json({ message: 'Tên nhà cung cấp đã tồn tại' });
      }

      const updateData: any = {
        name: data.name,
        phone: data.phone || null,
        email: data.email || null,
        address: data.address || null,
        note: data.note || null,
        isActive: data.isActive !== undefined ? Boolean(data.isActive) : true,
      };

      if (data.total_spent !== undefined || data.totalSpent !== undefined) {
        updateData.totalSpent = Number(data.total_spent || data.totalSpent || 0);
      }
      if (data.debt !== undefined || data.totalDebt !== undefined) {
        updateData.totalDebt = Number(data.debt || data.totalDebt || 0);
      }

      const supplier = await prisma.supplier.update({
        where: { id: Number(req.params.id) },
        data: updateData,
      });

      res.json({
        ...supplier,
        totalSpent: Number(supplier.totalSpent),
        totalReturn: 0,
        netPurchase: Number(supplier.totalSpent),
        total_spent: Number(supplier.totalSpent),
        total_return: 0,
        net_purchase: Number(supplier.totalSpent),
        debt: Number(supplier.totalDebt),
        created_by: supplier.createdBy || 'Admin',
        created_at: supplier.createdAt
      });
    } catch (error) {
      next(error);
    }
  },

  delete: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;

      const existingSupplier = await prisma.supplier.findFirst({
        where: { id: Number(req.params.id), tenantId }
      });
      if (!existingSupplier) return res.status(404).json({ message: 'Không tìm thấy nhà cung cấp' });

      await prisma.supplier.delete({ where: { id: Number(req.params.id) } });
      res.json({ message: 'Đã xóa nhà cung cấp' });
    } catch (error) {
      next(error);
    }
  },

  importExcel: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const items = req.body.items || [];
      const tenantId = req.user!.tenantId;
      let importedCount = 0;

      const CHUNK_SIZE = 100;
      for (let i = 0; i < items.length; i += CHUNK_SIZE) {
        const chunk = items.slice(i, i + CHUNK_SIZE);
        await prisma.$transaction(async (tx) => {
          for (const item of chunk) {
            const code = item.code && item.code.trim() !== '' ? item.code.trim() : `NCC${Math.floor(Math.random() * 100000).toString().padStart(5, '0')}`;
            const totalSpent = Number(item.totalSpent || item.total_spent || 0);
            const totalDebt = Number(item.totalDebt || item.debt || 0);
            
            const supplierData = {
              name: item.name,
              phone: item.phone || null,
              email: item.email || null,
              address: item.address || null,
              note: item.note || null,
              totalSpent,
              totalDebt,
              isActive: item.isActive !== undefined ? Boolean(item.isActive) : true,
              createdBy: item.createdBy || item.created_by || 'Admin',
              createdAt: item.createdAt ? parseExcelDate(item.createdAt) || new Date() : new Date(),
            };

            const ex = await tx.supplier.findUnique({
              where: {
                tenantId_code: {
                  tenantId,
                  code,
                },
              },
            });
            if (ex) {
              await tx.supplier.update({
                where: { id: ex.id },
                data: supplierData,
              });
            } else {
              await tx.supplier.create({
                data: {
                  code,
                  ...supplierData,
                  tenantId,
                },
              });
            }
            importedCount++;
          }
        });
      }

      res.status(201).json({ message: `Đã import thành công ${importedCount} nhà cung cấp`, count: importedCount });
    } catch (error) {
      next(error);
    }
  },

  getDebtLedger: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const id = Number(req.params.id);

      const supplier = await prisma.supplier.findFirst({
        where: { id, tenantId },
        select: { id: true, code: true, name: true, totalDebt: true }
      });

      if (!supplier) {
        return res.status(404).json({ message: 'Không tìm thấy nhà cung cấp' });
      }

      // Get all PurchaseOrders for this supplier
      const purchaseOrders = await prisma.purchaseOrder.findMany({
        where: { tenantId, supplierId: id, status: 'COMPLETED' },
        select: { code: true, total: true, paid: true, createdAt: true },
        orderBy: { createdAt: 'desc' }
      });

      // Get all CashbookEntries (payments) for this supplier
      const cashbookEntries = await prisma.cashbookEntry.findMany({
        where: { tenantId, supplierId: id, type: 'EXPENSE' },
        select: { code: true, amount: true, createdAt: true },
        orderBy: { createdAt: 'desc' }
      });

      // Get all PurchaseReturns for this supplier
      const purchaseReturns = await prisma.purchaseReturn.findMany({
        where: { tenantId, supplierId: id, status: 'COMPLETED' },
        select: { code: true, total: true, createdAt: true },
        orderBy: { createdAt: 'desc' }
      });

      // Merge all entries into a single list
      const entries: { code: string; type: string; typeName: string; date: Date; amount: number }[] = [];

      for (const po of purchaseOrders) {
        entries.push({
          code: po.code,
          type: 'import',
          typeName: 'Nhập hàng',
          date: po.createdAt,
          amount: Number(po.total || 0) // PO increases debt
        });
      }

      for (const ce of cashbookEntries) {
        entries.push({
          code: ce.code,
          type: 'payment',
          typeName: 'Thanh toán',
          date: ce.createdAt,
          amount: -Math.abs(Number(ce.amount || 0)) // Payment decreases debt
        });
      }

      for (const pr of purchaseReturns) {
        entries.push({
          code: pr.code,
          type: 'return',
          typeName: 'Trả hàng',
          date: pr.createdAt,
          amount: -Number(pr.total || 0) // Return decreases debt
        });
      }

      // Sort by date DESC (newest first), with payments before imports at same time (like KiotViet)
      entries.sort((a, b) => {
        const timeDiff = new Date(b.date).getTime() - new Date(a.date).getTime();
        if (timeDiff !== 0) return timeDiff;
        // At same time: payment first, then return, then import
        const getPriority = (t: string) => {
          if (t === 'payment') return 1;
          if (t === 'return') return 2;
          if (t === 'import') return 3;
          return 4;
        };
        return getPriority(a.type) - getPriority(b.type);
      });

      // Calculate running debt from current total debt going backwards
      let tempDebt = Number(supplier.totalDebt || 0);
      const ledger = entries.map((item) => {
        const runningDebt = tempDebt;
        tempDebt -= item.amount;
        return {
          code: item.code,
          type: item.type,
          typeName: item.typeName,
          date: item.date,
          amount: item.amount,
          debt: item.amount,
          runningDebt
        };
      });

      res.json(ledger);
    } catch (error) {
      next(error);
    }
  },
};
