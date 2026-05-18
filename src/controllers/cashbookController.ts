import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';

export const cashbookController = {
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const search = req.query.search as string;
      const type = req.query.type as string; // 'thu', 'chi', 'INCOME', 'EXPENSE'
      const paymentMethod = req.query.paymentMethod as string;
      const isAccounting = req.query.isAccounting as string;
      const status = req.query.status as string;
      const partnerType = req.query.partnerType as string;
      const partnerPhone = req.query.partnerPhone as string;
      const from = req.query.from as string;
      const to = req.query.to as string;

      const where: any = {};

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
        include: { user: { select: { id: true, fullName: true } } },
        orderBy: { createdAt: 'desc' },
      });

      res.json(entries);
    } catch (error) {
      next(error);
    }
  },

  create: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
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
      } = req.body;

      const typeEnum = (type === 'thu' || type === 'INCOME') ? 'INCOME' : 'EXPENSE';
      const prefix = typeEnum === 'INCOME' ? 'TTM' : 'TCM';

      // Auto-generate unique code
      const count = await prisma.cashbookEntry.count({
        where: { type: typeEnum },
      });
      const code = `${prefix}${String(count + 1).padStart(6, '0')}`;

      const entry = await prisma.cashbookEntry.create({
        data: {
          code,
          type: typeEnum,
          amount: Number(amount || 0),
          category: category || (typeEnum === 'INCOME' ? 'Thu nhập khác' : 'Chi phí khác'),
          partnerType: partnerType || 'other',
          partnerName: partnerName || 'Khách lẻ',
          partnerPhone: partnerPhone || null,
          partnerAddress: partnerAddress || null,
          paymentMethod: paymentMethod || 'cash',
          isAccounting: isAccounting !== false,
          status: 'completed',
          branch: branch || 'Chi nhánh trung tâm',
          createdBy: createdBy || req.user?.fullName || req.user?.username || 'Thu ngân',
          note: note || '',
          userId: req.user!.id,
        },
        include: { user: { select: { id: true, fullName: true } } },
      });

      res.status(201).json(entry);
    } catch (error) {
      next(error);
    }
  },

  cancel: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const id = Number(req.params.id);
      const entry = await prisma.cashbookEntry.update({
        where: { id },
        data: { status: 'cancelled' },
      });
      res.json({ message: 'Đã hủy phiếu thành công', entry });
    } catch (error) {
      next(error);
    }
  },

  // Custom Cashbook Partners (người nộp/nhận tự tạo)
  getPartners: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const search = req.query.search as string;
      const where: any = {};
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

  createPartner: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { name, phone, address, province, ward, note } = req.body;
      if (!name) {
        return res.status(400).json({ message: 'Tên đối tượng nhận/nộp là bắt buộc' });
      }
      const partner = await prisma.cashbookPartner.create({
        data: {
          name,
          phone: phone || null,
          address: address || null,
          province: province || null,
          ward: ward || null,
          note: note || null,
        },
      });
      res.status(201).json(partner);
    } catch (error) {
      next(error);
    }
  },
};
