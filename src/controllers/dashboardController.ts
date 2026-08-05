import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';

export const dashboardController = {
  get: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const today = new Date();
      today.setHours(0, 0, 0, 0);
      const tomorrow = new Date(today);
      tomorrow.setDate(tomorrow.getDate() + 1);

      // Date range for this month
      const startOfMonth = new Date(today.getFullYear(), today.getMonth(), 1);
      const endOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0, 23, 59, 59, 999);
      
      // Date range for previous month
      const startOfPrevMonth = new Date(today.getFullYear(), today.getMonth() - 1, 1);
      const endOfPrevMonth = new Date(today.getFullYear(), today.getMonth(), 0, 23, 59, 59, 999);

      // Vietnam working hours date range for TODAY
      const vnNow = new Date(new Date().getTime() + (7 * 3600 * 1000));
      const vnY = vnNow.getUTCFullYear();
      const vnM = vnNow.getUTCMonth();
      const vnD = vnNow.getUTCDate();
      const todayStart = new Date(Date.UTC(vnY, vnM, vnD, 0, 0, 0, 0) - (7 * 3600 * 1000));
      const todayEnd = new Date(Date.UTC(vnY, vnM, vnD, 23, 59, 59, 999) - (7 * 3600 * 1000));

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

        if (type === 'Hôm nay') {
          return { start: startOfDay, end: endOfDay };
        }
        if (type === 'Hôm qua') {
          const start = new Date(startOfDay.getTime() - (24 * 3600 * 1000));
          const end = new Date(endOfDay.getTime() - (24 * 3600 * 1000));
          return { start, end };
        }
        if (type === '7 ngày qua') {
          const start = new Date(startOfDay.getTime() - (6 * 24 * 3600 * 1000));
          return { start, end: endOfDay };
        }
        if (type === '30 ngày qua') {
          const start = new Date(startOfDay.getTime() - (29 * 24 * 3600 * 1000));
          return { start, end: endOfDay };
        }
        if (type === 'Tuần này') {
          const day = vnTime.getUTCDay();
          const diff = vnDate - day + (day === 0 ? -6 : 1);
          const start = new Date(Date.UTC(vnYear, vnMonth, diff, 0, 0, 0, 0) - (7 * 3600 * 1000));
          return { start, end: endOfDay };
        }
        if (type === 'Tuần trước') {
          const day = vnTime.getUTCDay();
          const diff = vnDate - day + (day === 0 ? -6 : 1) - 7;
          const start = new Date(Date.UTC(vnYear, vnMonth, diff, 0, 0, 0, 0) - (7 * 3600 * 1000));
          const end = new Date(start.getTime() + (7 * 24 * 3600 * 1000) - 1);
          return { start, end };
        }
        if (type === 'Tháng trước') {
          const start = new Date(Date.UTC(vnYear, vnMonth - 1, 1, 0, 0, 0, 0) - (7 * 3600 * 1000));
          const end = new Date(Date.UTC(vnYear, vnMonth, 0, 23, 59, 59, 999) - (7 * 3600 * 1000));
          return { start, end };
        }
        if (type === 'Quý này') {
          const quarter = Math.floor(vnMonth / 3);
          const start = new Date(Date.UTC(vnYear, quarter * 3, 1, 0, 0, 0, 0) - (7 * 3600 * 1000));
          const end = new Date(Date.UTC(vnYear, quarter * 3 + 3, 0, 23, 59, 59, 999) - (7 * 3600 * 1000));
          return { start, end };
        }
        if (type === 'Quý trước') {
          const quarter = Math.floor(vnMonth / 3) - 1;
          const start = new Date(Date.UTC(vnYear, quarter * 3, 1, 0, 0, 0, 0) - (7 * 3600 * 1000));
          const end = new Date(Date.UTC(vnYear, quarter * 3 + 3, 0, 23, 59, 59, 999) - (7 * 3600 * 1000));
          return { start, end };
        }
        if (type === 'Năm nay') {
          const start = new Date(Date.UTC(vnYear, 0, 1, 0, 0, 0, 0) - (7 * 3600 * 1000));
          const end = new Date(Date.UTC(vnYear, 11, 31, 23, 59, 59, 999) - (7 * 3600 * 1000));
          return { start, end };
        }
        if (type === 'Toàn thời gian') {
          const start = new Date(2000, 0, 1);
          const end = new Date(2099, 11, 31, 23, 59, 59, 999);
          return { start, end };
        }
        // Default: Tháng này
        const start = new Date(Date.UTC(vnYear, vnMonth, 1, 0, 0, 0, 0) - (7 * 3600 * 1000));
        const end = new Date(Date.UTC(vnYear, vnMonth + 1, 0, 23, 59, 59, 999) - (7 * 3600 * 1000));
        return { start, end };
      };

      const prodRange = getRange(timeProd);
      const custRange = getRange(timeCust);

      let rangeStart: Date;
      let rangeEnd: Date;
      if (dateFrom && dateTo) {
        rangeStart = new Date(dateFrom);
        rangeEnd = new Date(dateTo);
        rangeEnd.setHours(23, 59, 59, 999);
      } else {
        const r = getRange(timeRange);
        rangeStart = r.start;
        rangeEnd = r.end;
      }

      // All queries run in parallel for speed, fully scoped by tenantId
      const [
        todayReturns,
        totalProducts,
        lowStockProducts,
        totalCustomers,
        recentOrders,
        prevMonthRevenueAggr,
        topProductsDb,
        topCustomersDb,
        dailyRevenuesDb,
        periodOrders,
        periodReturns
      ] = await Promise.all([
        // Trả hàng hôm nay
        prisma.return.count({
          where: { tenantId, createdAt: { gte: todayStart, lte: todayEnd }, status: 'COMPLETED' },
        }),
        // Tổng sản phẩm active
        prisma.product.count({ where: { tenantId, isActive: true } }),
        // Sản phẩm sắp hết hàng
        prisma.product.count({
          where: { tenantId, isActive: true, stock: { lte: 5 } },
        }).catch(() => 0),
        // Tổng khách hàng
        prisma.customer.count({ where: { tenantId } }),
        // 10 đơn hàng gần nhất
        prisma.order.findMany({
          where: { tenantId },
          take: 10,
          orderBy: { createdAt: 'desc' },
          include: {
            customer: { select: { name: true } },
            user: { select: { fullName: true } },
          },
        }),
        // Doanh thu tháng trước
        prisma.order.aggregate({
          where: { tenantId, createdAt: { gte: startOfPrevMonth, lte: endOfPrevMonth }, status: { not: 'CANCELLED' } },
          _sum: { total: true },
        }),
        // Top hàng bán chạy
        prisma.orderItem.groupBy({
          by: ['productId'],
          where: { order: { tenantId, createdAt: { gte: prodRange.start, lte: prodRange.end }, status: { not: 'CANCELLED' } } },
          _sum: { quantity: true, total: true },
          orderBy: { _sum: { quantity: 'desc' } },
          take: 5,
        }),
        // Top khách chi tiêu
        prisma.order.groupBy({
          by: ['customerId'],
          where: { tenantId, createdAt: { gte: custRange.start, lte: custRange.end }, status: { not: 'CANCELLED' }, customerId: { not: null } },
          _sum: { total: true },
          _count: { id: true },
          orderBy: { _sum: { total: 'desc' } },
          take: 5,
        }),
        // Doanh thu theo ngày trong tháng này
        prisma.order.findMany({
          where: { tenantId, createdAt: { gte: startOfMonth, lte: endOfMonth }, status: { not: 'CANCELLED' } },
          select: { createdAt: true, total: true }
        }),
        // Đơn hàng trong khoảng thời gian được chọn (để tính periodStats)
        prisma.order.findMany({
          where: { tenantId, createdAt: { gte: rangeStart, lte: rangeEnd }, status: { not: 'CANCELLED' } },
          select: { id: true, total: true }
        }),
        // Trả hàng trong khoảng thời gian được chọn
        prisma.return.findMany({
          where: { tenantId, createdAt: { gte: rangeStart, lte: rangeEnd }, status: 'COMPLETED' },
          select: { total: true }
        }),
        // Hóa đơn phát sinh hôm nay
        prisma.order.findMany({
          where: { tenantId, createdAt: { gte: todayStart, lte: todayEnd }, status: { not: 'CANCELLED' } },
          select: { total: true }
        })
      ]);

      // Calculate today stats using Vietnam working hours
      const todayOrdersDb = todayOrdersList || [];
      const todayOrders = todayOrdersDb.length;
      const todayRevenueSum = todayOrdersDb.reduce((sum, o) => sum + Number(o.total || 0), 0);
      const todayReturns = todayReturnsCount || 0;

      let monthlyRevenueSum = 0;
      const dailyRevenuesMap = new Map();
      dailyRevenuesDb.forEach(order => {
        const orderDate = new Date(order.createdAt);
        const orderTotal = Number(order.total || 0);

        monthlyRevenueSum += orderTotal;
        const day = orderDate.getDate();
        dailyRevenuesMap.set(day, (dailyRevenuesMap.get(day) || 0) + orderTotal);
      });

      const daily_revenues = Array.from({ length: endOfMonth.getDate() }, (_, i) => ({
        day: i + 1,
        revenue: dailyRevenuesMap.get(i + 1) || 0
      }));

      // Calculate periodStats (Revenue, Order Count, Profit, Return Count, Return Amount)
      const periodOrderCount = periodOrders.length;
      const periodRevenue = periodOrders.reduce((sum, o) => sum + Number(o.total || 0), 0);
      const periodReturnCount = periodReturns.length;
      const periodReturnAmount = periodReturns.reduce((sum, r) => sum + Number(r.total || 0), 0);
      const netSales = Math.max(0, periodRevenue - periodReturnAmount);
      const estimatedProfit = Math.round(netSales * 0.1273);

      const periodStats = {
        orderCount: periodOrderCount,
        revenue: periodRevenue,
        profit: estimatedProfit,
        returnCount: periodReturnCount,
        returnAmount: periodReturnAmount,
        timeRange
      };

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
          orders: todayOrders,
          revenue: todayRevenueSum,
          returns: todayReturns,
        },
        periodStats,
        overview: {
          totalProducts,
          lowStockProducts,
          totalCustomers,
        },
        recentOrders,
        monthly_revenue: monthlyRevenueSum,
        prev_month_revenue: Number(prevMonthRevenueAggr._sum?.total || 0),
        top_products,
        top_customers,
        daily_revenues
      });
    } catch (error) {
      next(error);
    }
  },
};
