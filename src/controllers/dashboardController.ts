import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';
import { computePeriodFinancialMetrics, filterByWorkingHoursDateRange } from './reportController';

function getTimeRangeYMD(timeRange: string): { fromDate: string; toDate: string } {
  const nowVn = new Date(new Date().getTime() + (7 * 3600 * 1000));
  const vnYear = nowVn.getUTCFullYear();
  const vnMonth = nowVn.getUTCMonth(); // 0-based
  const vnDate = nowVn.getUTCDate();

  const toYMD = (d: Date) => {
    const y = d.getUTCFullYear();
    const m = String(d.getUTCMonth() + 1).padStart(2, '0');
    const day = String(d.getUTCDate()).padStart(2, '0');
    return `${y}-${m}-${day}`;
  };

  const todayDate = new Date(Date.UTC(vnYear, vnMonth, vnDate));
  
  if (timeRange === 'Hôm nay') {
    const s = toYMD(todayDate);
    return { fromDate: s, toDate: s };
  }
  if (timeRange === 'Hôm qua') {
    const yesterday = new Date(todayDate.getTime() - (24 * 3600 * 1000));
    const s = toYMD(yesterday);
    return { fromDate: s, toDate: s };
  }
  if (timeRange === '7 ngày qua') {
    const start = new Date(todayDate.getTime() - (6 * 24 * 3600 * 1000));
    return { fromDate: toYMD(start), toDate: toYMD(todayDate) };
  }
  if (timeRange === '30 ngày qua') {
    const start = new Date(todayDate.getTime() - (29 * 24 * 3600 * 1000));
    return { fromDate: toYMD(start), toDate: toYMD(todayDate) };
  }
  if (timeRange === 'Tuần này') {
    const day = nowVn.getUTCDay();
    const diff = vnDate - day + (day === 0 ? -6 : 1);
    const start = new Date(Date.UTC(vnYear, vnMonth, diff));
    return { fromDate: toYMD(start), toDate: toYMD(todayDate) };
  }
  if (timeRange === 'Tuần trước') {
    const day = nowVn.getUTCDay();
    const diff = vnDate - day + (day === 0 ? -6 : 1) - 7;
    const start = new Date(Date.UTC(vnYear, vnMonth, diff));
    const end = new Date(start.getTime() + (6 * 24 * 3600 * 1000));
    return { fromDate: toYMD(start), toDate: toYMD(end) };
  }
  if (timeRange === 'Tháng này') {
    const start = new Date(Date.UTC(vnYear, vnMonth, 1));
    const end = new Date(Date.UTC(vnYear, vnMonth + 1, 0));
    return { fromDate: toYMD(start), toDate: toYMD(end) };
  }
  if (timeRange === 'Tháng trước') {
    const start = new Date(Date.UTC(vnYear, vnMonth - 1, 1));
    const end = new Date(Date.UTC(vnYear, vnMonth, 0));
    return { fromDate: toYMD(start), toDate: toYMD(end) };
  }
  if (timeRange === 'Quý này') {
    const quarter = Math.floor(vnMonth / 3);
    const start = new Date(Date.UTC(vnYear, quarter * 3, 1));
    const end = new Date(Date.UTC(vnYear, quarter * 3 + 3, 0));
    return { fromDate: toYMD(start), toDate: toYMD(end) };
  }
  if (timeRange === 'Quý trước') {
    const quarter = Math.floor(vnMonth / 3) - 1;
    const start = new Date(Date.UTC(vnYear, quarter * 3, 1));
    const end = new Date(Date.UTC(vnYear, quarter * 3 + 3, 0));
    return { fromDate: toYMD(start), toDate: toYMD(end) };
  }
  if (timeRange === 'Năm nay') {
    return { fromDate: `${vnYear}-01-01`, toDate: `${vnYear}-12-31` };
  }
  if (timeRange === 'Năm trước') {
    return { fromDate: `${vnYear - 1}-01-01`, toDate: `${vnYear - 1}-12-31` };
  }
  if (timeRange === 'Toàn thời gian') {
    return { fromDate: '2000-01-01', toDate: '2099-12-31' };
  }

  // Default: Tháng này
  const start = new Date(Date.UTC(vnYear, vnMonth, 1));
  const end = new Date(Date.UTC(vnYear, vnMonth + 1, 0));
  return { fromDate: toYMD(start), toDate: toYMD(end) };
}

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

      const prodRange = getTimeRangeYMD(timeProd);
      const custRange = getTimeRangeYMD(timeCust);

      // Fetch all core raw entities for tenant to compute exact report-aligned metrics
      const [
        allOrders,
        allReturns,
        allCashbook,
        totalProducts,
        lowStockProducts,
        totalCustomers,
        recentOrders
      ] = await Promise.all([
        prisma.order.findMany({
          where: { tenantId, status: { not: 'CANCELLED' } },
          select: {
            id: true,
            total: true,
            discount: true,
            customerId: true,
            createdAt: true,
            items: { select: { productId: true, quantity: true, costPrice: true, total: true, price: true, product: { select: { costPrice: true } } } }
          }
        }),
        prisma.return.findMany({
          where: { tenantId, status: 'COMPLETED' },
          select: {
            id: true,
            total: true,
            customerId: true,
            createdAt: true,
            items: { select: { productId: true, quantity: true, costPrice: true, total: true, price: true, product: { select: { costPrice: true } } } }
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
        })
      ]);

      // Calculate Vietnam Today YMD string
      const vnNowStr = new Date(new Date().getTime() + 7 * 3600 * 1000).toISOString().split('T')[0];

      // 1. Compute TODAY metrics matching Report logic
      const todayMetrics = computePeriodFinancialMetrics(allOrders, allReturns, allCashbook, { fromDate: vnNowStr, toDate: vnNowStr });
      
      // 2. Compute SELECTED PERIOD metrics matching Report logic 100%
      let activeFromDate = dateFrom;
      let activeToDate = dateTo;
      if (!activeFromDate || !activeToDate) {
        const parsedRange = getTimeRangeYMD(timeRange);
        activeFromDate = parsedRange.fromDate;
        activeToDate = parsedRange.toDate;
      }
      const periodMetrics = computePeriodFinancialMetrics(allOrders, allReturns, allCashbook, { fromDate: activeFromDate, toDate: activeToDate, timeRange });

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

      // 4. Compute Top Products
      const prodFilteredOrders = filterByWorkingHoursDateRange(allOrders, { fromDate: prodRange.fromDate, toDate: prodRange.toDate });
      const prodMap: Record<number, { id: number; total_sold: number; total_revenue: number }> = {};
      prodFilteredOrders.forEach((o: any) => {
        (o.items || []).forEach((it: any) => {
          const pId = Number(it.productId || 0);
          if (!pId) return;
          if (!prodMap[pId]) prodMap[pId] = { id: pId, total_sold: 0, total_revenue: 0 };
          const qty = Number(it.quantity || 0);
          const total = Number(it.total || 0) || (Number(it.price || 0) * qty);
          prodMap[pId].total_sold += qty;
          prodMap[pId].total_revenue += total;
        });
      });

      const topProdList = Object.values(prodMap).sort((a, b) => b.total_sold - a.total_sold).slice(0, 5);
      const topProdIds = topProdList.map(p => p.id);
      const productsData = await prisma.product.findMany({
        where: { tenantId, id: { in: topProdIds } },
        select: { id: true, name: true }
      });
      const top_products = topProdList.map(p => {
        const prod = productsData.find(pd => pd.id === p.id);
        return {
          name: prod?.name || 'Sản phẩm',
          total_sold: p.total_sold,
          total_revenue: p.total_revenue
        };
      });

      // 5. Compute Top Customers
      const custFilteredOrders = filterByWorkingHoursDateRange(allOrders, { fromDate: custRange.fromDate, toDate: custRange.toDate });
      const custMap: Record<number, { id: number; order_count: number; total_spent: number }> = {};
      custFilteredOrders.forEach((o: any) => {
        const cId = Number(o.customerId || 0);
        if (!cId) return;
        if (!custMap[cId]) custMap[cId] = { id: cId, order_count: 0, total_spent: 0 };
        custMap[cId].order_count += 1;
        custMap[cId].total_spent += Number(o.total || 0);
      });

      const topCustList = Object.values(custMap).sort((a, b) => b.total_spent - a.total_spent).slice(0, 5);
      const topCustIds = topCustList.map(c => c.id);
      const customersData = await prisma.customer.findMany({
        where: { tenantId, id: { in: topCustIds } },
        select: { id: true, name: true }
      });
      const top_customers = topCustList.map(c => {
        const cust = customersData.find(cd => cd.id === c.id);
        return {
          name: cust?.name || 'Khách lẻ',
          total_spent: c.total_spent,
          order_count: c.order_count
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
