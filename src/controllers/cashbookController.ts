import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';

export const cashbookController = {
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const search = req.query.search as string;
      const type = req.query.type as string; // 'thu', 'chi', 'INCOME', 'EXPENSE'
      const paymentMethod = req.query.paymentMethod as string;
      const isAccounting = req.query.isAccounting as string;
      const status = req.query.status as string;
      const partnerType = req.query.partnerType as string;
      const partnerPhone = req.query.partnerPhone as string;
      const from = req.query.from as string;
      const to = req.query.to as string;

      const where: any = { tenantId };

      if (from || to) {
        where.createdAt = {};
        if (from) where.createdAt.gte = new Date(from);
        if (to) where.createdAt.lte = new Date(to + 'T23:59:59.999Z');
      }

      if (type) {
        if (type === 'thu' || type === 'INCOME') {
          where.type = 'INCOME';
        } else if (type === 'chi' || type === 'EXPENSE') {
          where.type = 'EXPENSE';
        }
      }

      if (search) {
        where.OR = [
          { code: { contains: search, mode: 'insensitive' } },
          { partnerName: { contains: search, mode: 'insensitive' } },
          { note: { contains: search, mode: 'insensitive' } },
        ];
      }

      if (paymentMethod) {
        where.paymentMethod = paymentMethod;
      }

      if (isAccounting) {
        where.isAccounting = isAccounting === 'true';
      }

      if (status) {
        where.status = status;
      }

      if (partnerType && partnerType !== 'Tất cả') {
        where.partnerType = partnerType;
      }

      if (partnerPhone) {
        where.partnerPhone = { contains: partnerPhone, mode: 'insensitive' };
      }

      const entries = await prisma.cashbookEntry.findMany({
        where,
        include: {
          user: { select: { id: true, fullName: true } },
          customer: { select: { id: true, code: true, name: true } },
          supplier: { select: { id: true, code: true, name: true } }
        },
        orderBy: { createdAt: 'desc' },
      });

      res.json(entries);
    } catch (error) {
      next(error);
    }
  },

  create: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const {
        type, // 'thu' (INCOME) or 'chi' (EXPENSE)
        amount,
        category,
        partnerType,
        partnerName,
        partnerPhone,
        partnerAddress,
        paymentMethod,
        isAccounting,
        note,
        branch,
        createdBy,
        customerId,
        supplierId,
      } = req.body;

      const amountNum = Number(amount || 0);
      const typeEnum = (type === 'thu' || type === 'INCOME') ? 'INCOME' : 'EXPENSE';
      const prefix = typeEnum === 'INCOME' ? 'TTM' : 'TCM';

      const entry = await prisma.$transaction(async (tx) => {
        if (customerId) {
          const cust = await tx.customer.findFirst({ where: { id: Number(customerId), tenantId } });
          if (!cust) throw new Error('Không tìm thấy khách hàng của gian hàng này');

          // Update Customer debt
          const debtChange = typeEnum === 'INCOME' ? -amountNum : amountNum;
          const newDebt = Number(cust.totalDebt) + debtChange;
          await tx.customer.update({
            where: { id: cust.id },
            data: { totalDebt: newDebt }
          });
        }

        if (supplierId) {
          const sup = await tx.supplier.findFirst({ where: { id: Number(supplierId), tenantId } });
          if (!sup) throw new Error('Không tìm thấy nhà cung cấp của gian hàng này');

          // Update Supplier debt
          const debtChange = typeEnum === 'EXPENSE' ? -amountNum : amountNum;
          const newDebt = Number(sup.totalDebt) + debtChange;
          await tx.supplier.update({
            where: { id: sup.id },
            data: { totalDebt: newDebt }
          });
        }

        // Auto-generate unique code per tenant
        const count = await tx.cashbookEntry.count({
          where: { tenantId, type: typeEnum },
        });
        const code = `${prefix}${String(count + 1).padStart(6, '0')}`;

        return tx.cashbookEntry.create({
          data: {
            code,
            type: typeEnum,
            amount: amountNum,
            category: category || (typeEnum === 'INCOME' ? 'Thu nhập khác' : 'Chi phí khác'),
            partnerType: partnerType || 'other',
            partnerName: partnerName || 'Khách lẻ',
            partnerPhone: partnerPhone || null,
            partnerAddress: partnerAddress || null,
            paymentMethod: paymentMethod || 'cash',
            isAccounting: isAccounting !== false,
            status: 'completed',
            branch: branch || 'Chi nhánh trung tâm',
            createdBy: createdBy || (req.user as any)?.fullName || req.user?.username || 'Thu ngân',
            note: note || '',
            userId: req.user!.id,
            customerId: customerId ? Number(customerId) : null,
            supplierId: supplierId ? Number(supplierId) : null,
            tenantId,
          },
          include: { user: { select: { id: true, fullName: true } } },
        });
      });

      res.status(201).json(entry);
    } catch (error: any) {
      if (error.message === 'Không tìm thấy khách hàng của gian hàng này' || error.message === 'Không tìm thấy nhà cung cấp của gian hàng này') {
        return res.status(404).json({ message: error.message });
      }
      next(error);
    }
  },

  cancel: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const id = Number(req.params.id);

      const entry = await prisma.$transaction(async (tx) => {
        const existingEntry = await tx.cashbookEntry.findFirst({
          where: { id, tenantId }
        });
        if (!existingEntry) throw new Error('Không tìm thấy phiếu quỹ');
        if (existingEntry.status === 'cancelled') throw new Error('Phiếu quỹ đã được hủy trước đó');

        const amountNum = Number(existingEntry.amount);
        const typeEnum = existingEntry.type;

        // Revert Customer debt if linked
        if (existingEntry.customerId) {
          const cust = await tx.customer.findFirst({ where: { id: existingEntry.customerId, tenantId } });
          if (cust) {
            const debtChange = typeEnum === 'INCOME' ? amountNum : -amountNum;
            const newDebt = Number(cust.totalDebt) + debtChange;
            await tx.customer.update({
              where: { id: cust.id },
              data: { totalDebt: newDebt }
            });
          }
        }

        // Revert Supplier debt if linked
        if (existingEntry.supplierId) {
          const sup = await tx.supplier.findFirst({ where: { id: existingEntry.supplierId, tenantId } });
          if (sup) {
            const debtChange = typeEnum === 'EXPENSE' ? amountNum : -amountNum;
            const newDebt = Number(sup.totalDebt) + debtChange;
            await tx.supplier.update({
              where: { id: sup.id },
              data: { totalDebt: newDebt }
            });
          }
        }

        return tx.cashbookEntry.update({
          where: { id },
          data: { status: 'cancelled' },
        });
      });

      res.json({ message: 'Đã hủy phiếu thành công', entry });
    } catch (error: any) {
      if (error.message === 'Không tìm thấy phiếu quỹ') {
        return res.status(404).json({ message: error.message });
      }
      if (error.message === 'Phiếu quỹ đã được hủy trước đó') {
        return res.status(400).json({ message: error.message });
      }
      next(error);
    }
  },

  // Custom Cashbook Partners (người nộp/nhận tự tạo)
  getPartners: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const search = req.query.search as string;
      const where: any = { tenantId };
      if (search) {
        where.OR = [
          { name: { contains: search, mode: 'insensitive' } },
          { phone: { contains: search, mode: 'insensitive' } },
        ];
      }
      const partners = await prisma.cashbookPartner.findMany({
        where,
        orderBy: { createdAt: 'desc' },
      });
      res.json(partners);
    } catch (error) {
      next(error);
    }
  },

  createPartner: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const { name, phone, address, province, ward, note } = req.body;
      if (!name) {
        return res.status(400).json({ message: 'Tên đối tượng nhận/nộp là bắt buộc' });
      }

      const existing = await prisma.cashbookPartner.findUnique({
        where: {
          tenantId_name: {
            tenantId,
            name,
          }
        }
      });
      if (existing) {
        return res.status(400).json({ message: 'Đối tượng nhận/nộp đã tồn tại' });
      }

      const partner = await prisma.cashbookPartner.create({
        data: {
          name,
          phone: phone || null,
          address: address || null,
          province: province || null,
          ward: ward || null,
          note: note || null,
          tenantId,
        },
      });
      res.status(201).json(partner);
    } catch (error) {
      next(error);
    }
  },
};
