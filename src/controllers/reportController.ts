import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';

export const reportController = {
  // GET /api/reports/end-of-day
  endOfDay: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      let startDate = new Date();
      let endDate = new Date();

      if (req.query.date) {
        const dateStr = req.query.date as string;
        let parsedDate: Date;
        if (dateStr.includes('/')) {
          const [d, m, y] = dateStr.split('/');
          parsedDate = new Date(Number(y), Number(m) - 1, Number(d));
        } else {
          parsedDate = new Date(dateStr);
        }
        startDate = new Date(parsedDate);
        startDate.setHours(0, 0, 0, 0);
        endDate = new Date(parsedDate);
        endDate.setHours(23, 59, 59, 999);
      } else if (req.query.fromDate && req.query.toDate) {
        startDate = new Date(req.query.fromDate as string);
        startDate.setHours(0, 0, 0, 0);
        endDate = new Date(req.query.toDate as string);
        endDate.setHours(23, 59, 59, 999);
      } else {
        startDate.setHours(0, 0, 0, 0);
        endDate.setHours(23, 59, 59, 999);
      }

      const [orders, returns, cashbook] = await Promise.all([
        prisma.order.findMany({
          where: { 
            tenantId,
            createdAt: { gte: startDate, lte: endDate },
            status: 'COMPLETED'
          },
          include: {
            items: true,
            customer: true,
            user: { select: { id: true, username: true } }
          },
          orderBy: { createdAt: 'desc' }
        }),
        prisma.return.findMany({
          where: { 
            tenantId,
            createdAt: { gte: startDate, lte: endDate },
            status: 'COMPLETED' 
          },
          select: { total: true }
        }),
        prisma.cashbookEntry.findMany({
          where: { tenantId, createdAt: { gte: startDate, lte: endDate } }
        })
      ]);

      const totalSales = orders.reduce((sum, o) => sum + Number(o.total), 0);
      const totalPaid = orders.reduce((sum, o) => sum + Number(o.paid), 0);
      const totalReturns = returns.reduce((sum, r) => sum + Number(r.total), 0);
      
      const income = cashbook.filter(c => c.type === 'INCOME').reduce((sum, c) => sum + Number(c.amount), 0);
      const expense = cashbook.filter(c => c.type === 'EXPENSE').reduce((sum, c) => sum + Number(c.amount), 0);

      // Map orders to KiotViet style transaction report details
      const FRIENDLY_PAYMENT_METHODS: Record<string, string> = {
        CASH: 'Tiền mặt',
        CARD: 'Quẹt thẻ',
        TRANSFER: 'Chuyển khoản',
        MIXED: 'Kết hợp'
      };

      const transactionDetails = orders.map(o => {
        const totalQty = o.items.reduce((qtySum, item) => qtySum + Number(item.quantity), 0);
        return {
          id: o.id,
          code: o.code || `HD00000${o.id}`,
          time: o.createdAt,
          quantity: totalQty,
          revenue: Number(o.total),
          otherFee: 0,
          vat: 0,
          rounding: 0,
          returnFee: 0,
          netRevenue: Number(o.total),
          customerName: o.customer?.name || 'Khách lẻ',
          customerPhone: o.customer?.phone || '',
          createdBy: o.user?.username || 'Võ Thành Huy',
          paymentMethod: FRIENDLY_PAYMENT_METHODS[o.paymentMethod] || o.paymentMethod || 'Tiền mặt'
        };
      });

      res.json({
        dateRange: { from: startDate, to: endDate },
        orderCount: orders.length,
        totalSales,
        totalPaid,
        totalReturns,
        cashbookIncome: income,
        cashbookExpense: expense,
        netRevenue: totalSales - totalReturns,
        transactions: transactionDetails
      });
    } catch (error) {
      next(error);
    }
  },

  // GET /api/reports/sales
  sales: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      // Mặc định lấy 30 ngày gần nhất
      const days = parseInt(req.query.days as string) || 30;
      const startDate = new Date();
      startDate.setDate(startDate.getDate() - days);
      startDate.setHours(0, 0, 0, 0);

      const orders = await prisma.order.findMany({
        where: { tenantId, createdAt: { gte: startDate }, status: 'COMPLETED' },
        select: { createdAt: true, total: true }
      });

      // Group by date (YYYY-MM-DD)
      const salesByDate: Record<string, number> = {};
      
      orders.forEach(order => {
        const dateStr = order.createdAt.toISOString().split('T')[0];
        salesByDate[dateStr] = (salesByDate[dateStr] || 0) + Number(order.total);
      });

      // Format thành array để vẽ chart
      const chartData = Object.keys(salesByDate).sort().map(date => ({
        date,
        total: salesByDate[date]
      }));

      res.json(chartData);
    } catch (error) {
      next(error);
    }
  },

  // GET /api/reports/products (Products sales report)
  products: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      let startDate = new Date();
      let endDate = new Date();

      if (req.query.date) {
        const dateStr = req.query.date as string;
        let parsedDate: Date;
        if (dateStr.includes('/')) {
          const [d, m, y] = dateStr.split('/');
          parsedDate = new Date(Number(y), Number(m) - 1, Number(d));
        } else {
          parsedDate = new Date(dateStr);
        }
        startDate = new Date(parsedDate);
        startDate.setHours(0, 0, 0, 0);
        endDate = new Date(parsedDate);
        endDate.setHours(23, 59, 59, 999);
      } else if (req.query.fromDate && req.query.toDate) {
        startDate = new Date(req.query.fromDate as string);
        startDate.setHours(0, 0, 0, 0);
        endDate = new Date(req.query.toDate as string);
        endDate.setHours(23, 59, 59, 999);
      } else {
        // default to today
        startDate.setHours(0, 0, 0, 0);
        endDate.setHours(23, 59, 59, 999);
      }

      // Fetch all COMPLETED orders in period with items & product details
      const orders = await prisma.order.findMany({
        where: { 
          tenantId,
          createdAt: { gte: startDate, lte: endDate },
          status: 'COMPLETED'
        },
        include: {
          items: {
            include: { product: { select: { id: true, name: true, sku: true, unit: true, categoryId: true } } }
          }
        }
      });

      // Fetch all COMPLETED returns in period with items
      const returns = await prisma.return.findMany({
        where: { 
          tenantId,
          createdAt: { gte: startDate, lte: endDate },
          status: 'COMPLETED' 
        },
        include: {
          items: true
        }
      });

      // Aggregate
      const productMap: Record<number, any> = {};

      orders.forEach(order => {
        order.items.forEach(item => {
          if (!productMap[item.productId]) {
            productMap[item.productId] = {
              id: item.productId,
              sku: item.product.sku,
              name: item.product.name,
              unit: item.product.unit,
              categoryId: item.product.categoryId,
              soldQty: 0,
              revenue: 0,
              returnQty: 0,
              returnVal: 0,
              netRevenue: 0
            };
          }
          productMap[item.productId].soldQty += Number(item.quantity);
          productMap[item.productId].revenue += Number(item.total);
          productMap[item.productId].netRevenue += Number(item.total);
        });
      });

      returns.forEach(ret => {
        ret.items.forEach(item => {
          if (productMap[item.productId]) {
            productMap[item.productId].returnQty += Number(item.quantity);
            productMap[item.productId].returnVal += Number(item.total);
            productMap[item.productId].netRevenue -= Number(item.total);
          }
        });
      });

      const result = Object.values(productMap);
      res.json(result);
    } catch (error) {
      next(error);
    }
  },

  // Báo cáo khách hàng
  getCustomers: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const { fromDate, toDate } = req.query;
      let startDate = new Date(0);
      let endDate = new Date();

      if (fromDate) startDate = new Date(fromDate as string);
      if (toDate) {
        endDate = new Date(toDate as string);
        endDate.setHours(23, 59, 59, 999);
      }

      // Fetch all COMPLETED orders in period that have a customer attached
      const orders = await prisma.order.findMany({
        where: {
          tenantId,
          createdAt: { gte: startDate, lte: endDate },
          status: 'COMPLETED',
          customerId: { not: null }
        },
        include: {
          customer: { select: { id: true, name: true, phone: true, code: true } }
        }
      });

      // Fetch all COMPLETED returns in period that have a customer attached
      const returns = await prisma.return.findMany({
        where: { 
          tenantId,
          createdAt: { gte: startDate, lte: endDate },
          status: 'COMPLETED',
          customerId: { not: null }
        },
        include: {
          customer: { select: { id: true, name: true, phone: true, code: true } }
        }
      });

      // Aggregate
      const customerMap: Record<number, any> = {};

      orders.forEach(order => {
        const cus = order.customer;
        if (!cus) return;
        if (!customerMap[cus.id]) {
          customerMap[cus.id] = {
            id: cus.id,
            code: cus.code,
            name: cus.name,
            phone: cus.phone,
            revenue: 0,
            returnVal: 0,
            netRevenue: 0
          };
        }
        customerMap[cus.id].revenue += Number(order.total);
        customerMap[cus.id].netRevenue += Number(order.total);
      });

      returns.forEach(ret => {
        const cus = ret.customer;
        if (!cus) return;
        if (!customerMap[cus.id]) {
          customerMap[cus.id] = {
            id: cus.id,
            code: cus.code,
            name: cus.name,
            phone: cus.phone,
            revenue: 0,
            returnVal: 0,
            netRevenue: 0
          };
        }
        customerMap[cus.id].returnVal += Number(ret.total);
        customerMap[cus.id].netRevenue -= Number(ret.total);
      });

      const result = Object.values(customerMap);
      res.json(result);
    } catch (error) {
      next(error);
    }
  }
};
