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

      const timeProd = req.query.timeProd as string || 'Tháng này';
      const timeCust = req.query.timeCust as string || 'Tháng này';
      const timeRange = req.query.timeRange as string || 'Tháng này';
      const dateFrom = req.query.dateFrom as string;
      const dateTo = req.query.dateTo as string;

      const getRange = (type: string) => {
        const d = new Date();
        d.setHours(0, 0, 0, 0);
        const end = new Date(d);
        end.setHours(23, 59, 59, 999);

        if (type === 'Hôm nay') {
          return { start: d, end };
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
        if (type === '30 ngày qua') {
          const start = new Date(d);
          start.setDate(start.getDate() - 29);
          return { start, end };
        }
        if (type === 'Tuần này') {
          const day = d.getDay();
          const diff = d.getDate() - day + (day === 0 ? -6 : 1);
          const start = new Date(d.setDate(diff));
          start.setHours(0, 0, 0, 0);
          return { start, end };
        }
        if (type === 'Tuần trước') {
          const day = d.getDay();
          const diff = d.getDate() - day + (day === 0 ? -6 : 1) - 7;
          const start = new Date(d.setDate(diff));
          start.setHours(0, 0, 0, 0);
          const e = new Date(start);
          e.setDate(e.getDate() + 6);
          e.setHours(23, 59, 59, 999);
          return { start, end: e };
        }
        if (type === 'Tháng trước') {
          const start = new Date(d.getFullYear(), d.getMonth() - 1, 1);
          const e = new Date(d.getFullYear(), d.getMonth(), 0, 23, 59, 59, 999);
          return { start, end: e };
        }
        if (type === 'Quý này') {
          const quarter = Math.floor(d.getMonth() / 3);
          const start = new Date(d.getFullYear(), quarter * 3, 1);
          const e = new Date(d.getFullYear(), quarter * 3 + 3, 0, 23, 59, 59, 999);
          return { start, end: e };
        }
        if (type === 'Quý trước') {
          const quarter = Math.floor(d.getMonth() / 3) - 1;
          const start = new Date(d.getFullYear(), quarter * 3, 1);
          const e = new Date(d.getFullYear(), quarter * 3 + 3, 0, 23, 59, 59, 999);
          return { start, end: e };
        }
        if (type === 'Năm nay') {
          const start = new Date(d.getFullYear(), 0, 1);
          const e = new Date(d.getFullYear(), 11, 31, 23, 59, 59, 999);
          return { start, end: e };
        }
        if (type === 'Năm trước') {
          const start = new Date(d.getFullYear() - 1, 0, 1);
          const e = new Date(d.getFullYear() - 1, 11, 31, 23, 59, 59, 999);
          return { start, end: e };
        }
        if (type === 'Toàn thời gian') {
          const start = new Date(2000, 0, 1);
          const e = new Date(2099, 11, 31, 23, 59, 59, 999);
          return { start, end: e };
        }
        // Default: Tháng này
        const start = new Date(d.getFullYear(), d.getMonth(), 1);
        const e = new Date(d.getFullYear(), d.getMonth() + 1, 0, 23, 59, 59, 999);
        return { start, end: e };
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
          where: { tenantId, createdAt: { gte: today, lt: tomorrow } },
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
          where: { tenantId, createdAt: { gte: startOfPrevMonth, lte: endOfPrevMonth }, status: 'COMPLETED' },
          _sum: { total: true },
        }),
        // Top hàng bán chạy
        prisma.orderItem.groupBy({
          by: ['productId'],
          where: { order: { tenantId, createdAt: { gte: prodRange.start, lte: prodRange.end }, status: 'COMPLETED' } },
          _sum: { quantity: true, total: true },
          orderBy: { _sum: { quantity: 'desc' } },
          take: 5,
        }),
        // Top khách chi tiêu
        prisma.order.groupBy({
          by: ['customerId'],
          where: { tenantId, createdAt: { gte: custRange.start, lte: custRange.end }, status: 'COMPLETED', customerId: { not: null } },
          _sum: { total: true },
          _count: { id: true },
          orderBy: { _sum: { total: 'desc' } },
          take: 5,
        }),
        // Doanh thu theo ngày trong tháng này
        prisma.order.findMany({
          where: { tenantId, createdAt: { gte: startOfMonth, lte: endOfMonth }, status: 'COMPLETED' },
          select: { createdAt: true, total: true }
        }),
        // Đơn hàng trong khoảng thời gian được chọn (để tính periodStats)
        prisma.order.findMany({
          where: { tenantId, createdAt: { gte: rangeStart, lte: rangeEnd }, status: 'COMPLETED' },
          select: {
            id: true,
            total: true,
            items: {
              select: {
                quantity: true,
                product: { select: { costPrice: true } }
              }
            }
          }
        }),
        // Trả hàng trong khoảng thời gian được chọn
        prisma.return.findMany({
          where: { tenantId, createdAt: { gte: rangeStart, lte: rangeEnd } },
          select: { total: true }
        })
      ]);

      // Tính toán số liệu hôm nay và doanh thu tháng này
      let todayOrders = 0;
      let todayRevenueSum = 0;
      let monthlyRevenueSum = 0;

      const dailyRevenuesMap = new Map();
      dailyRevenuesDb.forEach(order => {
        const orderDate = new Date(order.createdAt);
        const orderTotal = Number(order.total || 0);

        monthlyRevenueSum += orderTotal;
        const day = orderDate.getDate();
        dailyRevenuesMap.set(day, (dailyRevenuesMap.get(day) || 0) + orderTotal);

        if (orderDate >= today && orderDate < tomorrow) {
          todayOrders++;
          todayRevenueSum += orderTotal;
        }
      });

      const daily_revenues = Array.from({ length: endOfMonth.getDate() }, (_, i) => ({
        day: i + 1,
        revenue: dailyRevenuesMap.get(i + 1) || 0
      }));

      // Tính toán periodStats (Tổng tiền hàng, tổng hóa đơn, lợi nhuận, đơn trả hàng)
      const periodOrderCount = periodOrders.length;
      const periodRevenue = periodOrders.reduce((sum, o) => sum + Number(o.total || 0), 0);
      const periodCost = periodOrders.reduce((sum, o) => {
        const itemCost = (o.items || []).reduce((isum, it) => {
          const costP = Number(it.product?.costPrice || 0);
          return isum + (Number(it.quantity || 0) * costP);
        }, 0);
        return sum + itemCost;
      }, 0);

      const periodReturnCount = periodReturns.length;
      const periodReturnAmount = periodReturns.reduce((sum, r) => sum + Number(r.total || 0), 0);
      const estimatedProfit = periodCost > 0
        ? Math.max(0, periodRevenue - periodCost - periodReturnAmount)
        : Math.max(0, Math.round((periodRevenue - periodReturnAmount) * 0.18));

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
          total_spent: Number(c._sum.total || 0),
          order_count: Number(c._count.id || 0)
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
