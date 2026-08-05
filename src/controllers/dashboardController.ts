import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';
import { computePeriodFinancialMetrics, filterByWorkingHoursDateRange } from './reportController';

export const dashboardController = {
  get: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const today = new Date();

      const timeProd = req.query.timeProd as string || 'Tháng này';
      const timeCust = req.query.timeCust as string || 'Tháng này';
      const timeRange = req.query.timeRange as string || 'Tháng này';
      const dateFrom = req.query.dateFrom as string;
      const dateTo = req.query.dateTo as string;

      const getRange = (type: string) => {
        const now = new Date();
        const vnTime = new Date(now.getTime() + (7 * 3600 * 1000));
        const vnYear = vnTime.getUTCFullYear();
        const vnMonth = vnTime.getUTCMonth();
        const vnDate = vnTime.getUTCDate();

        const startOfDay = new Date(Date.UTC(vnYear, vnMonth, vnDate, 0, 0, 0, 0) - (7 * 3600 * 1000));
        const endOfDay = new Date(Date.UTC(vnYear, vnMonth, vnDate, 23, 59, 59, 999) - (7 * 3600 * 1000));

        if (type === 'Hôm nay') return { start: startOfDay, end: endOfDay };
        if (type === 'Hôm qua') return { start: new Date(startOfDay.getTime() - 24 * 3600 * 1000), end: new Date(endOfDay.getTime() - 24 * 3600 * 1000) };
        if (type === 'Tháng trước') return { start: new Date(Date.UTC(vnYear, vnMonth - 1, 1, 0, 0, 0, 0) - 7 * 3600 * 1000), end: new Date(Date.UTC(vnYear, vnMonth, 0, 23, 59, 59, 999) - 7 * 3600 * 1000) };
        
        return { start: new Date(Date.UTC(vnYear, vnMonth, 1, 0, 0, 0, 0) - 7 * 3600 * 1000), end: new Date(Date.UTC(vnYear, vnMonth + 1, 0, 23, 59, 59, 999) - 7 * 3600 * 1000) };
      };

      const prodRange = getRange(timeProd);
      const custRange = getRange(timeCust);

      // Fetch all core raw entities for tenant to compute exact report-aligned metrics
      const [
        allOrders,
        allReturns,
        allCashbook,
        totalProducts,
        lowStockProducts,
        totalCustomers,
        recentOrders,
        topProductsDb,
        topCustomersDb
      ] = await Promise.all([
        prisma.order.findMany({
          where: { tenantId, status: { not: 'CANCELLED' } },
          select: {
            id: true,
            total: true,
            discount: true,
            createdAt: true,
            items: { select: { quantity: true, costPrice: true, product: { select: { costPrice: true } } } }
          }
        }),
        prisma.return.findMany({
          where: { tenantId, status: 'COMPLETED' },
          select: {
            id: true,
            total: true,
            createdAt: true,
            items: { select: { quantity: true, costPrice: true, product: { select: { costPrice: true } } } }
          }
        }),
        prisma.cashbookEntry.findMany({
          where: { tenantId },
          select: { id: true, type: true, amount: true, isBusinessExpense: true, groupName: true, createdAt: true }
        }),
        prisma.product.count({ where: { tenantId, isActive: true } }),
        prisma.product.count({ where: { tenantId, isActive: true, stock: { lte: 5 } } }).catch(() => 0),
        prisma.customer.count({ where: { tenantId } }),
        prisma.order.findMany({
          where: { tenantId },
          take: 10,
          orderBy: { createdAt: 'desc' },
          include: { customer: { select: { name: true } }, user: { select: { fullName: true } } }
        }),
        prisma.orderItem.groupBy({
          by: ['productId'],
          where: { order: { tenantId, createdAt: { gte: prodRange.start, lte: prodRange.end }, status: { not: 'CANCELLED' } } },
          _sum: { quantity: true, total: true },
          orderBy: { _sum: { quantity: 'desc' } },
          take: 5
        }),
        prisma.order.groupBy({
          by: ['customerId'],
          where: { tenantId, createdAt: { gte: custRange.start, lte: custRange.end }, status: { not: 'CANCELLED' }, customerId: { not: null } },
          _sum: { total: true },
          _count: { id: true },
          orderBy: { _sum: { total: 'desc' } },
          take: 5
        })
      ]);

      // Calculate Vietnam Today YMD string
      const vnNowStr = new Date(new Date().getTime() + 7 * 3600 * 1000).toISOString().split('T')[0];

      // 1. Compute TODAY metrics matching Report logic
      const todayMetrics = computePeriodFinancialMetrics(allOrders, allReturns, allCashbook, { fromDate: vnNowStr, toDate: vnNowStr });
      
      // 2. Compute SELECTED PERIOD metrics matching Report logic 100%
      const periodMetrics = computePeriodFinancialMetrics(allOrders, allReturns, allCashbook, { fromDate: dateFrom, toDate: dateTo, timeRange });

      // 3. Compute THIS MONTH & PREV MONTH metrics matching Report logic
      const nowVn = new Date(new Date().getTime() + 7 * 3600 * 1000);
      const currY = nowVn.getUTCFullYear();
      const currM = String(nowVn.getUTCMonth() + 1).padStart(2, '0');
      const lastM = String(nowVn.getUTCMonth() === 0 ? 12 : nowVn.getUTCMonth()).padStart(2, '0');
      const lastY = nowVn.getUTCMonth() === 0 ? currY - 1 : currY;

      const thisMonthMetrics = computePeriodFinancialMetrics(allOrders, allReturns, allCashbook, { fromDate: `${currY}-${currM}-01`, toDate: `${currY}-${currM}-31` });
      const prevMonthMetrics = computePeriodFinancialMetrics(allOrders, allReturns, allCashbook, { fromDate: `${lastY}-${lastM}-01`, toDate: `${lastY}-${lastM}-31` });

      // Daily breakdown for current month (for chart)
      const dailyRevenuesMap = new Map();
      const currentMonthOrders = filterByWorkingHoursDateRange(allOrders, { fromDate: `${currY}-${currM}-01`, toDate: `${currY}-${currM}-31` });
      currentMonthOrders.forEach((order: any) => {
        const d = new Date(order.createdAt).getDate();
        dailyRevenuesMap.set(d, (dailyRevenuesMap.get(d) || 0) + Number(order.total || 0));
      });

      const daysInMonth = new Date(currY, nowVn.getUTCMonth() + 1, 0).getDate();
      const daily_revenues = Array.from({ length: daysInMonth }, (_, i) => ({
        day: i + 1,
        revenue: dailyRevenuesMap.get(i + 1) || 0
      }));

      // Enrich top customers with name
      const topCustomersIds = topCustomersDb.map(c => c.customerId).filter(id => id !== null) as number[];
      const customersData = await prisma.customer.findMany({
        where: { tenantId, id: { in: topCustomersIds } },
        select: { id: true, name: true }
      });
      const top_customers = topCustomersDb.map(c => {
        const cust = customersData.find(cd => cd.id === c.customerId);
        return {
          name: cust?.name || 'Khách lẻ',
          total_spent: Number(c._sum?.total || 0),
          order_count: Number((c._count as any)?.id || 0)
        };
      });

      const topProductsIds = topProductsDb.map(p => p.productId).filter(id => id !== null) as number[];
      const productsData = await prisma.product.findMany({
        where: { tenantId, id: { in: topProductsIds } },
        select: { id: true, name: true }
      });
      const top_products = topProductsDb.map(p => {
        const prod = productsData.find(pd => pd.id === p.productId);
        return {
          name: prod?.name || 'Sản phẩm',
          total_sold: Number(p._sum?.quantity || 0),
          total_revenue: Number(p._sum?.total || 0)
        };
      });

      res.json({
        todayStats: {
          orders: todayMetrics.orderCount,
          revenue: todayMetrics.grossSales,
          returns: todayMetrics.returnCount,
        },
        periodStats: {
          orderCount: periodMetrics.orderCount,
          revenue: periodMetrics.grossSales,
          profit: periodMetrics.netProfit,
          returnCount: periodMetrics.returnCount,
          returnAmount: periodMetrics.returnSales,
          timeRange
        },
        overview: {
          totalProducts,
          lowStockProducts,
          totalCustomers,
        },
        recentOrders,
        monthly_revenue: thisMonthMetrics.netSales,
        prev_month_revenue: prevMonthMetrics.netSales,
        top_products,
        top_customers,
        daily_revenues
      });
    } catch (error) {
      next(error);
    }
  },
};
