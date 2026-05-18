import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';

export const dashboardController = {
  get: async (req: Request, res: Response, next: NextFunction) => {
    try {
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

      const timeProd = req.query.timeProd as string || 'Tháng này';
      const timeCust = req.query.timeCust as string || 'Tháng này';

      const getRange = (type: string) => {
        const d = new Date();
        d.setHours(0, 0, 0, 0);
        const end = new Date(d);
        end.setHours(23, 59, 59, 999);
        if (type === 'Hôm nay') {
          return { start: d, end: end };
        }
        if (type === 'Hôm qua') {
          const start = new Date(d);
          start.setDate(start.getDate() - 1);
          const e = new Date(start);
          e.setHours(23, 59, 59, 999);
          return { start, end: e };
        }
        if (type === '7 ngày qua') {
          const start = new Date(d);
          start.setDate(start.getDate() - 6);
          return { start, end };
        }
        if (type === 'Tháng trước') {
          const start = new Date(d.getFullYear(), d.getMonth() - 1, 1);
          const e = new Date(d.getFullYear(), d.getMonth(), 0, 23, 59, 59, 999);
          return { start, end: e };
        }
        // Default: Tháng này
        const start = new Date(d.getFullYear(), d.getMonth(), 1);
        const e = new Date(d.getFullYear(), d.getMonth() + 1, 0, 23, 59, 59, 999);
        return { start, end: e };
      };

      const prodRange = getRange(timeProd);
      const custRange = getRange(timeCust);

      // All queries run in parallel for speed
      const [
        todayOrders,
        todayRevenue,
        todayReturns,
        totalProducts,
        lowStockProducts,
        totalCustomers,
        recentOrders,
        monthlyRevenueAggr,
        prevMonthRevenueAggr,
        topProductsDb,
        topCustomersDb,
        dailyRevenuesDb
      ] = await Promise.all([
        // Đơn hàng hôm nay
        prisma.order.count({
          where: { createdAt: { gte: today, lt: tomorrow }, status: 'COMPLETED' },
        }),
        // Doanh thu hôm nay
        prisma.order.aggregate({
          where: { createdAt: { gte: today, lt: tomorrow }, status: 'COMPLETED' },
          _sum: { total: true },
        }),
        // Trả hàng hôm nay
        prisma.return.count({
          where: { createdAt: { gte: today, lt: tomorrow } },
        }),
        // Tổng sản phẩm active
        prisma.product.count({ where: { isActive: true } }),
        // Sản phẩm sắp hết hàng
        prisma.product.count({
          where: { isActive: true, stock: { lte: 5 } }, // Hardcode 5 for now since minStock might not exist
        }).catch(() => 0),
        // Tổng khách hàng
        prisma.customer.count(),
        // 10 đơn hàng gần nhất
        prisma.order.findMany({
          take: 10,
          orderBy: { createdAt: 'desc' },
          include: {
            customer: { select: { name: true } },
            user: { select: { fullName: true } },
          },
        }),
        // Doanh thu tháng này
        prisma.order.aggregate({
          where: { createdAt: { gte: startOfMonth, lte: endOfMonth }, status: 'COMPLETED' },
          _sum: { total: true },
        }),
        // Doanh thu tháng trước
        prisma.order.aggregate({
          where: { createdAt: { gte: startOfPrevMonth, lte: endOfPrevMonth }, status: 'COMPLETED' },
          _sum: { total: true },
        }),
        // Top hàng bán chạy
        prisma.orderItem.groupBy({
          by: ['productId'],
          where: { order: { createdAt: { gte: prodRange.start, lte: prodRange.end }, status: 'COMPLETED' } },
          _sum: { quantity: true, total: true },
          orderBy: { _sum: { quantity: 'desc' } },
          take: 5,
        }),
        // Top khách chi tiêu
        prisma.order.groupBy({
          by: ['customerId'],
          where: { createdAt: { gte: custRange.start, lte: custRange.end }, status: 'COMPLETED', customerId: { not: null } },
          _sum: { total: true },
          _count: { id: true },
          orderBy: { _sum: { total: 'desc' } },
          take: 5,
        }),
        // Doanh thu theo ngày trong tháng này
        prisma.order.findMany({
          where: { createdAt: { gte: startOfMonth, lte: endOfMonth }, status: 'COMPLETED' },
          select: { createdAt: true, total: true }
        })
      ]);

      // Process daily revenues manually since Prisma doesn't support grouping by day easily in all DBs
      const dailyRevenuesMap = new Map();
      dailyRevenuesDb.forEach(order => {
        const day = order.createdAt.getDate();
        dailyRevenuesMap.set(day, (dailyRevenuesMap.get(day) || 0) + Number(order.total || 0));
      });
      const daily_revenues = Array.from({ length: endOfMonth.getDate() }, (_, i) => ({
        day: i + 1,
        revenue: dailyRevenuesMap.get(i + 1) || 0
      }));

      // Enrich top customers with name
      const topCustomersIds = topCustomersDb.map(c => c.customerId).filter(id => id !== null) as number[];
      const customersData = await prisma.customer.findMany({
        where: { id: { in: topCustomersIds } },
        select: { id: true, name: true }
      });
      const top_customers = topCustomersDb.map(c => {
        const cust = customersData.find(cd => cd.id === c.customerId);
        return {
          name: cust?.name || 'Khách lẻ',
          total_spent: Number(c._sum.total || 0),
          order_count: Number(c._count.id || 0)
        };
      });

      const topProductsIds = topProductsDb.map(p => p.productId).filter(id => id !== null) as number[];
      const productsData = await prisma.product.findMany({
        where: { id: { in: topProductsIds } },
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
          revenue: Number(todayRevenue._sum.total || 0),
          returns: todayReturns,
        },
        overview: {
          totalProducts,
          lowStockProducts,
          totalCustomers,
        },
        recentOrders,
        monthly_revenue: Number(monthlyRevenueAggr._sum.total || 0),
        prev_month_revenue: Number(prevMonthRevenueAggr._sum.total || 0),
        top_products,
        top_customers,
        daily_revenues
      });
    } catch (error) {
      next(error);
    }
  },
};
