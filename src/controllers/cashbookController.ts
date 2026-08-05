import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';

export const cashbookController = {
  getSummary: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = Number((req as any).tenant?.id || 1);
      const from = req.query.from as string;
      const to = req.query.to as string;
      const paymentMethod = req.query.paymentMethod as string; // cash, bank, wallet, all

      // Build payment method filter
      const pmWhere: any = {};
      if (paymentMethod && paymentMethod !== 'all') {
        if (paymentMethod === 'cash') pmWhere.paymentMethod = 'cash';
        else if (paymentMethod === 'bank') pmWhere.paymentMethod = 'bank';
        else if (paymentMethod === 'wallet') pmWhere.paymentMethod = 'wallet';
      }

      // Parse date range
      let fromDate: Date | null = null;
      let toDate: Date | null = null;
      if (from) {
        const fromStr = from.includes('+') || from.endsWith('Z') ? from : `${from}+07:00`;
        fromDate = new Date(fromStr);
        if (isNaN(fromDate.getTime())) fromDate = null;
      }
      if (to) {
        const toStr = to.includes('+') || to.endsWith('Z') ? to : (to.includes('T') ? `${to}+07:00` : `${to}T23:59:59.999+07:00`);
        toDate = new Date(toStr);
        if (isNaN(toDate.getTime())) toDate = null;
      }

      // Historical initial balance (before system data starts)
      // This is the opening balance from KiotViet before 2026
      // TODO: Make this configurable per tenant via settings table
      const HISTORICAL_INITIAL_BALANCE: Record<string, number> = {
        'cash': 24298256148,    // Tiền mặt opening balance
        'bank': 0,              // Ngân hàng opening balance
        'wallet': 0,            // Ví điện tử opening balance
        'all': 24298256148,     // Tổng quỹ = sum of all
      };
      const fundKey = (paymentMethod && paymentMethod !== 'all') ? paymentMethod : 'all';
      const historicalBalance = HISTORICAL_INITIAL_BALANCE[fundKey] || 0;

      // 1. Opening balance = historical + sum of all entries BEFORE fromDate
      let openingBalance = historicalBalance;
      if (fromDate) {
        const beforeWhere: any = {
          tenantId,
          status: { not: 'cancelled' },
          createdAt: { lt: fromDate },
          ...pmWhere
        };
        const beforeEntries = await prisma.cashbookEntry.aggregate({
          where: { ...beforeWhere, type: 'INCOME' },
          _sum: { amount: true }
        });
        const beforeExpense = await prisma.cashbookEntry.aggregate({
          where: { ...beforeWhere, type: 'EXPENSE' },
          _sum: { amount: true }
        });
        openingBalance += Number(beforeEntries._sum.amount || 0) - Number(beforeExpense._sum.amount || 0);
      } else {
        // No date filter (all time) - opening balance is just the historical balance
        // Don't add DB entries since they'll be counted in the period totals
        openingBalance = historicalBalance;
      }

      // 2. Period totals
      const periodWhere: any = { tenantId, status: { not: 'cancelled' }, ...pmWhere };
      if (fromDate || toDate) {
        periodWhere.createdAt = {};
        if (fromDate) periodWhere.createdAt.gte = fromDate;
        if (toDate) periodWhere.createdAt.lte = toDate;
      }

      const incomeAgg = await prisma.cashbookEntry.aggregate({
        where: { ...periodWhere, type: 'INCOME' },
        _sum: { amount: true }
      });
      const expenseAgg = await prisma.cashbookEntry.aggregate({
        where: { ...periodWhere, type: 'EXPENSE' },
        _sum: { amount: true }
      });

      const totalIncome = Number(incomeAgg._sum.amount || 0);
      const totalExpense = Number(expenseAgg._sum.amount || 0);

      res.json({
        openingBalance,
        totalIncome,
        totalExpense,
        closingBalance: openingBalance + totalIncome - totalExpense
      });
    } catch (error) {
      next(error);
    }
  },

  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = Number((req as any).tenant?.id || 1);
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
      const customerIdParam = req.query.customerId ? parseInt(req.query.customerId as string, 10) : undefined;
      if (customerIdParam && !isNaN(customerIdParam)) where.customerId = customerIdParam;

      if (from || to) {
        where.createdAt = {};
        if (from) {
          const fromStr = from.includes('+') || from.endsWith('Z') ? from : `${from}+07:00`;
          const dFrom = new Date(fromStr);
          if (!isNaN(dFrom.getTime())) where.createdAt.gte = dFrom;
        }
        if (to) {
          const toStr = to.includes('+') || to.endsWith('Z') ? to : (to.includes('T') ? `${to}+07:00` : `${to}T23:59:59.999+07:00`);
          const dTo = new Date(toStr);
          if (!isNaN(dTo.getTime())) where.createdAt.lte = dTo;
        }
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
        if (!customerIdParam) {
          const ptLower = String(partnerType).toLowerCase();
          if (ptLower === 'supplier' || ptLower === 'nhà cung cấp' || ptLower === 'ncc') {
            where.OR = [
              { partnerType: 'supplier' },
              { partnerType: 'Supplier' },
              { partnerType: 'NHÀ CUNG CẤP' },
              { partnerType: 'Nhà cung cấp' },
              { partnerType: 'nhà cung cấp' },
              { supplierId: { not: null } },
              { code: { startsWith: 'PC' } },
              { code: { startsWith: 'PCPN' } }
            ];
          } else if (ptLower === 'customer' || ptLower === 'khách hàng') {
            where.OR = [
              { partnerType: 'customer' },
              { partnerType: 'Customer' },
              { partnerType: 'KHÁCH HÀNG' },
              { partnerType: 'Khách hàng' },
              { partnerType: 'khách hàng' },
              { customerId: { not: null } },
              { code: { startsWith: 'PT' } }
            ];
          } else {
            where.partnerType = partnerType;
          }
        }
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
        createdAt,
      } = req.body;

      const amountNum = Number(amount || 0);
      const typeEnum = (type === 'thu' || type === 'INCOME') ? 'INCOME' : 'EXPENSE';
      const prefix = typeEnum === 'INCOME' ? 'TTM' : 'TCM';
      const customCreatedAt = createdAt ? new Date(createdAt) : new Date();

      const entry = await prisma.$transaction(async (tx) => {
        const isAccountingBool = isAccounting === undefined ? true : Boolean(isAccounting);

        if (customerId && partnerType === 'customer' && isAccountingBool) {
          const cust = await tx.customer.findFirst({ where: { id: Number(customerId), tenantId } });
          if (!cust) throw new Error('Không tìm thấy khách hàng của gian hàng này');

          // Update Customer debt
          const debtChange = typeEnum === 'INCOME' ? -amountNum : amountNum;
          const newDebt = Number(cust.totalDebt) + debtChange;
          await tx.customer.update({
            where: { id: cust.id },
            data: { totalDebt: newDebt, lastTransaction: customCreatedAt }
          });
        }

        if (supplierId && partnerType === 'supplier' && isAccountingBool) {
          const sup = await tx.supplier.findFirst({ where: { id: Number(supplierId), tenantId } });
          if (!sup) throw new Error('Không tìm thấy nhà cung cấp của gian hàng này');

          // Update Supplier debt
          const debtChange = typeEnum === 'EXPENSE' ? -amountNum : amountNum;
          const newDebt = Number(sup.totalDebt) + debtChange;
          await tx.supplier.update({
            where: { id: sup.id },
            data: { totalDebt: newDebt, lastTransaction: customCreatedAt }
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
            createdAt: customCreatedAt,
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
               data: { totalDebt: newDebt, lastTransaction: new Date() }
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
               data: { totalDebt: newDebt, lastTransaction: new Date() }
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
