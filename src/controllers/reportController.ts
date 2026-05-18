import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';

export const reportController = {
  // GET /api/reports/end-of-day
  endOfDay: async (req: Request, res: Response, next: NextFunction) => {
    try {
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
            createdAt: { gte: startDate, lte: endDate },
            status: 'COMPLETED' 
          },
          select: { total: true }
        }),
        prisma.cashbookEntry.findMany({
          where: { createdAt: { gte: startDate, lte: endDate } }
        })
      ]);

      const totalSales = orders.reduce((sum, o) => sum + Number(o.total), 0);
      const totalPaid = orders.reduce((sum, o) => sum + Number(o.paid), 0);
      const totalReturns = returns.reduce((sum, r) => sum + Number(r.total), 0);
      
      const income = cashbook.filter(c => c.type === 'INCOME').reduce((sum, c) => sum + Number(c.amount), 0);
      const expense = cashbook.filter(c => c.type === 'EXPENSE').reduce((sum, c) => sum + Number(c.amount), 0);

      // Map orders to KiotViet style transaction report details
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
          paymentMethod: o.paymentMethod || 'Tiền mặt'
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
      // Mặc định lấy 30 ngày gần nhất
      const days = parseInt(req.query.days as string) || 30;
      const startDate = new Date();
      startDate.setDate(startDate.getDate() - days);
      startDate.setHours(0, 0, 0, 0);

      const orders = await prisma.order.findMany({
        where: { createdAt: { gte: startDate }, status: 'COMPLETED' },
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

  // GET /api/reports/products (Top selling)
  products: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const limit = parseInt(req.query.limit as string) || 10;
      
      const topItems = await prisma.orderItem.groupBy({
        by: ['productId'],
        _sum: {
          quantity: true,
          total: true
        },
        orderBy: {
          _sum: {
            quantity: 'desc'
          }
        },
        take: limit
      });

      // Fetch product details
      const productIds = topItems.map(item => item.productId);
      const products = await prisma.product.findMany({
        where: { id: { in: productIds } },
        select: { id: true, name: true, sku: true, image: true, stock: true }
      });

      const result = topItems.map(item => {
        const product = products.find(p => p.id === item.productId);
        return {
          ...product,
          soldQuantity: item._sum.quantity,
          revenue: item._sum.total
        };
      });

      res.json(result);
    } catch (error) {
      next(error);
    }
  }
};
