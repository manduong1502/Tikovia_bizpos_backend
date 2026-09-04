import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { config } from '../config';
import { AuthRequest } from '../middlewares/auth';
import { memoryCache } from '../utils/cache';

const customerSchema = z.object({
  code: z.preprocess((val) => val === null || val === '' ? undefined : val, z.string().optional()),
  name: z.string().min(1, 'Tên KH không được trống'),
  phone: z.string().optional().nullable(),
  email: z.preprocess((val) => {
    if (typeof val === 'string') {
      const trimmed = val.trim();
      return trimmed === '' ? null : trimmed;
    }
    return val;
  }, z.string().email('Email không hợp lệ').optional().nullable()),
  address: z.string().optional().nullable(),
  note: z.string().optional().nullable(),
  customerType: z.string().optional().nullable(),
  branch: z.string().optional().nullable(),
  totalSpent: z.preprocess((val) => val === undefined || val === '' || val === null ? 0 : Number(val), z.number().optional()),
  totalDebt: z.preprocess((val) => val === undefined || val === '' || val === null ? 0 : Number(val), z.number().optional()),
  isActive: z.preprocess((val) => {
    if (typeof val === 'string') return val === 'true';
    if (typeof val === 'boolean') return val;
    return true;
  }, z.boolean().optional()),
  createdBy: z.string().optional().nullable(),
  latitude: z.preprocess((val) => val === undefined || val === '' || val === null ? null : Number(val), z.number().optional().nullable()),
  longitude: z.preprocess((val) => val === undefined || val === '' || val === null ? null : Number(val), z.number().optional().nullable()),
});

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

function parseQueryDate(val: any, isEndOfDay = false): Date | null {
  if (!val) return null;
  if (val instanceof Date && !isNaN(val.getTime())) return val;
  const str = String(val).trim();
  if (!str) return null;

  // Format YYYY-MM-DD
  if (/^\d{4}-\d{2}-\d{2}/.test(str)) {
    const parts = str.split('T')[0].split('-');
    const year = parseInt(parts[0], 10);
    const month = parseInt(parts[1], 10) - 1;
    const day = parseInt(parts[2], 10);
    if (isEndOfDay) {
      return new Date(Date.UTC(year, month, day, 16, 59, 59, 999));
    } else {
      return new Date(Date.UTC(year, month, day, -7, 0, 0, 0));
    }
  }

  // Format DD/MM/YYYY
  if (/^\d{1,2}\/\d{1,2}\/\d{4}/.test(str)) {
    const parts = str.split('/');
    const day = parseInt(parts[0], 10);
    const month = parseInt(parts[1], 10) - 1;
    const year = parseInt(parts[2], 10);
    if (isEndOfDay) {
      return new Date(Date.UTC(year, month, day, 16, 59, 59, 999));
    } else {
      return new Date(Date.UTC(year, month, day, -7, 0, 0, 0));
    }
  }

  const d = new Date(str);
  if (!isNaN(d.getTime())) {
    if (isEndOfDay) {
      d.setHours(23, 59, 59, 999);
    } else {
      d.setHours(0, 0, 0, 0);
    }
    return d;
  }
  return null;
}

function toNum(val: any): number {
  if (val === null || val === undefined) return 0;
  if (typeof val === 'number') return isNaN(val) ? 0 : val;
  if (typeof val?.toNumber === 'function') return val.toNumber();
  const n = Number(String(val));
  return isNaN(n) ? 0 : n;
}

export const customerController = {
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const page = Math.max(1, parseInt(req.query.page as string) || config.pagination.defaultPage);
      const limit = Math.min(config.pagination.maxLimit, parseInt(req.query.limit as string) || config.pagination.defaultLimit);
      const search = (req.query.search as string) || '';
      const email = (req.query.email as string) || '';
      const address = (req.query.address as string) || '';
      const note = (req.query.note as string) || '';
      const orderCode = (req.query.orderCode as string) || '';

      const startDateStr = (req.query.startDate as string) || (req.query.transactionStartDate as string) || '';
      const endDateStr = (req.query.endDate as string) || (req.query.transactionEndDate as string) || '';
      const createdStartDateStr = (req.query.createdStartDate as string) || '';
      const createdEndDateStr = (req.query.createdEndDate as string) || '';

      const startDate = parseQueryDate(startDateStr, false);
      const endDate = parseQueryDate(endDateStr, true);
      const createdStartDate = parseQueryDate(createdStartDateStr, false);
      const createdEndDate = parseQueryDate(createdEndDateStr, true);

      const where: any = { tenantId };
      const andConditions: any[] = [];

      if (search) {
        const q = search.trim();
        andConditions.push({
          OR: [
            { name: { contains: q, mode: 'insensitive' } },
            { code: { contains: q, mode: 'insensitive' } },
            { phone: { contains: q, mode: 'insensitive' } },
            { address: { contains: q, mode: 'insensitive' } },
            { note: { contains: q, mode: 'insensitive' } },
          ]
        });
      }

      if (email) {
        andConditions.push({ email: { contains: email, mode: 'insensitive' } });
      }

      if (address) {
        andConditions.push({ address: { contains: address, mode: 'insensitive' } });
      }

      if (note) {
        andConditions.push({ note: { contains: note, mode: 'insensitive' } });
      }

      if (orderCode) {
        andConditions.push({
          orders: {
            some: {
              code: { contains: orderCode, mode: 'insensitive' }
            }
          }
        });
      }

      // Filter by Transaction date range (Order, Return, Cashbook, or Customer creation)
      const hasPeriodFilter = Boolean(startDate || endDate);
      if (hasPeriodFilter) {
        const txDateCond: any = {};
        if (startDate) txDateCond.gte = startDate;
        if (endDate) txDateCond.lte = endDate;

        andConditions.push({
          OR: [
            { orders: { some: { createdAt: txDateCond, status: { not: 'CANCELLED' } } } },
            { returns: { some: { createdAt: txDateCond, status: { not: 'CANCELLED' } } } },
            { cashbookEntries: { some: { createdAt: txDateCond, status: { not: 'cancelled' } } } },
            { createdAt: txDateCond }
          ]
        });
      }

      // Filter by Account creation date range
      if (createdStartDate || createdEndDate) {
        const createdDateCond: any = {};
        if (createdStartDate) createdDateCond.gte = createdStartDate;
        if (createdEndDate) createdDateCond.lte = createdEndDate;
        andConditions.push({ createdAt: createdDateCond });
      }

      if (andConditions.length > 0) {
        where.AND = andConditions;
      }

      const txDateCond: any = {};
      if (startDate) txDateCond.gte = startDate;
      if (endDate) txDateCond.lte = endDate;

      const [rawData, total] = await Promise.all([
        prisma.customer.findMany({
          where,
          skip: (page - 1) * limit,
          take: limit,
          select: {
            id: true,
            code: true,
            name: true,
            phone: true,
            email: true,
            address: true,
            note: true,
            customerType: true,
            branch: true,
            totalSpent: true,
            totalDebt: true,
            totalOrders: true,
            isActive: true,
            createdBy: true,
            lastTransaction: true,
            latitude: true,
            longitude: true,
            createdAt: true,
            updatedAt: true,
          },
          orderBy: [
            { lastTransaction: { sort: 'desc', nulls: 'last' } },
            { updatedAt: 'desc' },
            { id: 'desc' }
          ],
        }),
        prisma.customer.count({ where }),
      ]);

      const periodSpentMap: Record<number, number> = {};
      const periodOrdersMap: Record<number, number> = {};
      const debtDeltaAfterMap: Record<number, number> = {};

      if (hasPeriodFilter && rawData.length > 0) {
        const customerIds = rawData.map(c => c.id);

        const [
          ordersInPeriod,
          returnsInPeriod,
          ordersAfter,
          returnsAfter,
          cbExpenseAfter,
          cbIncomeAfter
        ] = await Promise.all([
          prisma.order.groupBy({
            by: ['customerId'],
            where: {
              customerId: { in: customerIds },
              status: { not: 'CANCELLED' },
              ...(Object.keys(txDateCond).length > 0 ? { createdAt: txDateCond } : {})
            },
            _sum: { total: true },
            _count: { id: true }
          }),
          prisma.return.groupBy({
            by: ['customerId'],
            where: {
              customerId: { in: customerIds },
              status: { not: 'CANCELLED' },
              ...(Object.keys(txDateCond).length > 0 ? { createdAt: txDateCond } : {})
            },
            _sum: { total: true }
          }),
          endDate ? prisma.order.groupBy({
            by: ['customerId'],
            where: {
              customerId: { in: customerIds },
              status: { not: 'CANCELLED' },
              createdAt: { gt: endDate }
            },
            _sum: { total: true, paid: true }
          }) : Promise.resolve([] as any[]),
          endDate ? prisma.return.groupBy({
            by: ['customerId'],
            where: {
              customerId: { in: customerIds },
              status: { not: 'CANCELLED' },
              createdAt: { gt: endDate }
            },
            _sum: { total: true, paid: true }
          }) : Promise.resolve([] as any[]),
          endDate ? prisma.cashbookEntry.groupBy({
            by: ['customerId'],
            where: {
              customerId: { in: customerIds },
              status: { not: 'cancelled' },
              type: 'EXPENSE',
              createdAt: { gt: endDate }
            },
            _sum: { amount: true }
          }) : Promise.resolve([] as any[]),
          endDate ? prisma.cashbookEntry.groupBy({
            by: ['customerId'],
            where: {
              customerId: { in: customerIds },
              status: { not: 'cancelled' },
              type: 'INCOME',
              createdAt: { gt: endDate }
            },
            _sum: { amount: true }
          }) : Promise.resolve([] as any[]),
        ]);

        const orderSumMap = new Map<number, number>();
        const orderCountMap = new Map<number, number>();
        ordersInPeriod.forEach(o => {
          if (o.customerId) {
            orderSumMap.set(o.customerId, toNum(o._sum.total));
            orderCountMap.set(o.customerId, o._count.id);
          }
        });

        const returnSumMap = new Map<number, number>();
        returnsInPeriod.forEach(r => {
          if (r.customerId) {
            returnSumMap.set(r.customerId, toNum(r._sum.total));
          }
        });

        customerIds.forEach(cId => {
          const ordSum = orderSumMap.get(cId) || 0;
          const retSum = returnSumMap.get(cId) || 0;
          periodSpentMap[cId] = Math.max(0, ordSum - retSum);
          periodOrdersMap[cId] = orderCountMap.get(cId) || 0;
        });

        if (endDate) {
          const orderDeltaAfterMap = new Map<number, number>();
          ordersAfter.forEach((o: any) => {
            if (o.customerId) {
              orderDeltaAfterMap.set(o.customerId, toNum(o._sum.total));
            }
          });

          const returnDeltaAfterMap = new Map<number, number>();
          returnsAfter.forEach((r: any) => {
            if (r.customerId) {
              returnDeltaAfterMap.set(r.customerId, toNum(r._sum.total));
            }
          });

          const cbExpenseMap = new Map<number, number>();
          cbExpenseAfter.forEach((cb: any) => {
            if (cb.customerId) {
              cbExpenseMap.set(cb.customerId, toNum(cb._sum.amount));
            }
          });

          const cbIncomeMap = new Map<number, number>();
          cbIncomeAfter.forEach((cb: any) => {
            if (cb.customerId) {
              cbIncomeMap.set(cb.customerId, toNum(cb._sum.amount));
            }
          });

          customerIds.forEach(cId => {
            const oTotal = orderDeltaAfterMap.get(cId) || 0;
            const rTotal = returnDeltaAfterMap.get(cId) || 0;
            const cbExp = cbExpenseMap.get(cId) || 0;
            const cbInc = cbIncomeMap.get(cId) || 0;
            debtDeltaAfterMap[cId] = (oTotal + cbExp) - (rTotal + cbInc);
          });
        }
      }

      const data = rawData.map((c: any) => {
        const lifetimeSpent = toNum(c.totalSpent);
        const lifetimeDebt = toNum(c.totalDebt);
        const lifetimeOrders = toNum(c.totalOrders);

        if (hasPeriodFilter) {
          const periodSpent = periodSpentMap[c.id] ?? 0;
          const periodOrders = periodOrdersMap[c.id] ?? 0;
          const netDebtDeltaAfter = debtDeltaAfterMap[c.id] ?? 0;
          const periodDebt = lifetimeDebt - netDebtDeltaAfter;

          return {
            ...c,
            lifetimeSpent,
            lifetimeDebt,
            lifetimeOrders,
            periodSpent,
            periodOrders,
            periodDebt,
            totalSpent: periodSpent,
            total_spent: periodSpent,
            totalOrders: periodOrders,
            totalDebt: periodDebt,
            debt: periodDebt,
          };
        }

        return {
          ...c,
          lifetimeSpent,
          lifetimeDebt,
          lifetimeOrders,
          periodSpent: lifetimeSpent,
          periodOrders: lifetimeOrders,
          totalSpent: lifetimeSpent,
          total_spent: lifetimeSpent,
          totalDebt: lifetimeDebt,
          debt: lifetimeDebt,
          totalOrders: lifetimeOrders,
        };
      });

      res.json({
        data,
        total,
        page,
        limit,
        totalPages: Math.ceil(total / limit),
        dateRange: hasPeriodFilter ? { startDate, endDate } : null,
      });
    } catch (error) {
      next(error);
    }
  },

  getById: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const customer = await prisma.customer.findFirst({
        where: { id: Number(req.params.id), tenantId },
        include: { orders: { take: 10, orderBy: { createdAt: 'desc' } } },
      });
      if (!customer) return res.status(404).json({ message: 'Không tìm thấy khách hàng' });
      res.json(customer);
    } catch (error) {
      next(error);
    }
  },

  create: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const bodyData = { ...req.body };
      if (bodyData.debt !== undefined && bodyData.totalDebt === undefined) {
        bodyData.totalDebt = Number(bodyData.debt);
      }
      const parsed = customerSchema.parse(bodyData);
      
      const existingName = await prisma.customer.findFirst({
        where: { tenantId, name: parsed.name }
      });
      if (existingName) return res.status(400).json({ message: 'Tên khách hàng đã tồn tại' });
      
      const code = parsed.code && parsed.code.trim() !== '' ? parsed.code.trim() : `KH${Math.floor(100000 + Math.random() * 900000)}`;
      const customer = await prisma.customer.create({
        data: {
          ...parsed,
          code,
          tenantId,
          lastTransaction: new Date(),
        }
      });
      res.status(201).json(customer);
    } catch (error) {
      next(error);
    }
  },

  update: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const bodyData = { ...req.body };
      if (bodyData.debt !== undefined && bodyData.totalDebt === undefined) {
        bodyData.totalDebt = Number(bodyData.debt);
      }
      const data = customerSchema.partial().parse(bodyData);
      
      const existingCustomer = await prisma.customer.findFirst({
        where: { id: Number(req.params.id), tenantId }
      });
      if (!existingCustomer) return res.status(404).json({ message: 'Không tìm thấy khách hàng' });

      if (data.name) {
        const existingName = await prisma.customer.findFirst({
          where: { tenantId, name: data.name, id: { not: Number(req.params.id) } }
        });
        if (existingName) return res.status(400).json({ message: 'Tên khách hàng đã tồn tại' });
      }

      const customer = await prisma.customer.update({
        where: { id: Number(req.params.id) },
        data,
      });
      res.json(customer);
    } catch (error) {
      next(error);
    }
  },

  delete: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const customerId = Number(req.params.id);
      
      const existingCustomer = await prisma.customer.findFirst({
        where: { id: customerId, tenantId }
      });
      if (!existingCustomer) return res.status(404).json({ message: 'Không tìm thấy khách hàng' });

      await prisma.$transaction(async (tx) => {
        // 1. Find all order IDs belonging to this customer
        const customerOrders = await tx.order.findMany({
          where: { customerId, tenantId },
          select: { id: true }
        });
        const orderIds = customerOrders.map(o => o.id);

        // 2. Find all return IDs belonging to this customer
        const customerReturns = await tx.return.findMany({
          where: { customerId, tenantId },
          select: { id: true }
        });
        const returnIds = customerReturns.map(r => r.id);

        // 3. Delete Cashbook entries associated with customer or its orders/returns
        await tx.cashbookEntry.deleteMany({
          where: {
            tenantId,
            OR: [
              { customerId },
              ...(orderIds.length > 0 ? [{ orderId: { in: orderIds } }] : []),
              ...(returnIds.length > 0 ? [{ returnId: { in: returnIds } }] : [])
            ]
          }
        });

        // 4. Delete return items and returns
        if (returnIds.length > 0) {
          await tx.returnItem.deleteMany({
            where: { returnId: { in: returnIds } }
          });
          await tx.return.deleteMany({
            where: { id: { in: returnIds }, tenantId }
          });
        }

        // 5. Delete order items and orders
        if (orderIds.length > 0) {
          await tx.orderItem.deleteMany({
            where: { orderId: { in: orderIds } }
          });
          await tx.order.deleteMany({
            where: { id: { in: orderIds }, tenantId }
          });
        }

        // 6. Delete the customer
        await tx.customer.delete({
          where: { id: customerId }
        });
      });

      if (memoryCache) {
        memoryCache.clearPattern(`tenant:${tenantId}:*`);
      }
      res.json({ message: 'Đã xóa khách hàng và toàn bộ hóa đơn, giao dịch liên quan thành công' });
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
            const code = item.code && item.code.trim() !== '' ? item.code.trim() : `KH${Math.floor(Math.random() * 100000).toString().padStart(5, '0')}`;
            
            const customerData = {
              name: item.name,
              phone: item.phone || null,
              email: item.email || null,
              address: item.address || null,
              note: item.note || null,
              customerType: item.customerType || null,
              branch: item.branch || null,
              totalSpent: item.totalSpent !== undefined ? Number(item.totalSpent) : 0,
              totalDebt: item.totalDebt !== undefined ? Number(item.totalDebt) : 0,
              isActive: item.isActive !== undefined ? Boolean(item.isActive) : true,
              createdBy: item.createdBy || null,
              lastTransaction: parseExcelDate(item.lastTransaction),
              createdAt: parseExcelDate(item.createdAt) || new Date(),
              latitude: item.latitude !== undefined && item.latitude !== null && item.latitude !== '' ? Number(item.latitude) : null,
              longitude: item.longitude !== undefined && item.longitude !== null && item.longitude !== '' ? Number(item.longitude) : null,
            };

            const ex = await tx.customer.findUnique({
              where: {
                tenantId_code: {
                  tenantId,
                  code,
                },
              },
            });
            if (ex) {
              await tx.customer.update({
                where: { id: ex.id },
                data: customerData,
              });
            } else {
              await tx.customer.create({
                data: {
                  code,
                  ...customerData,
                  tenantId,
                },
              });
            }
            importedCount++;
          }
        });
      }

      res.status(201).json({ message: `Đã import thành công ${importedCount} khách hàng`, count: importedCount });
    } catch (error) {
      next(error);
    }
  },

  // Temporary endpoint: Bulk update customer debts by code
  bulkUpdateDebt: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const { updates } = req.body; // [{ code: 'KH001113', totalDebt: 69610000 }, ...]
      
      if (!Array.isArray(updates)) {
        return res.status(400).json({ message: 'updates must be an array of { code, totalDebt }' });
      }

      let success = 0, notFound = 0;
      const results: any[] = [];

      for (const u of updates) {
        const customer = await prisma.customer.findFirst({
          where: { tenantId, code: u.code }
        });
        
        if (!customer) {
          results.push({ code: u.code, status: 'not_found' });
          notFound++;
          continue;
        }

        await prisma.customer.update({
          where: { id: customer.id },
          data: { totalDebt: Number(u.totalDebt) }
        });
        
        results.push({ code: u.code, name: customer.name, oldDebt: Number(customer.totalDebt), newDebt: Number(u.totalDebt), status: 'ok' });
        success++;
      }

      res.json({ message: `Updated ${success} customers, ${notFound} not found`, success, notFound, results });
    } catch (error) {
      next(error);
    }
  },
};
