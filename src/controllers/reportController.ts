function parseReportDateRange(reqQuery: any): { startDate: Date; endDate: Date } {
  let startDate: Date;
  let endDate: Date;

  const { date, fromDate, toDate } = reqQuery;

  const parseYMD = (str: string, isEnd = false): Date => {
    if (!str) return isEnd ? new Date() : new Date(0);
    const clean = str.split('T')[0].trim();
    let y = 0, m = 0, d = 0;
    if (clean.includes('/')) {
      const parts = clean.split('/');
      d = parseInt(parts[0], 10);
      m = parseInt(parts[1], 10);
      y = parseInt(parts[2], 10);
    } else if (clean.includes('-')) {
      const parts = clean.split('-');
      if (parts[0].length === 4) {
        y = parseInt(parts[0], 10);
        m = parseInt(parts[1], 10);
        d = parseInt(parts[2], 10);
      } else {
        d = parseInt(parts[0], 10);
        m = parseInt(parts[1], 10);
        y = parseInt(parts[2], 10);
      }
    }

    if (y && m && d) {
      const sy = String(y).padStart(4, '0');
      const sm = String(m).padStart(2, '0');
      const sd = String(d).padStart(2, '0');
      return isEnd ? new Date(`${sy}-${sm}-${sd}T23:59:59.999Z`) : new Date(`${sy}-${sm}-${sd}T00:00:00.000Z`);
    }
    return isEnd ? new Date() : new Date(0);
  };

  if (date) {
    startDate = parseYMD(String(date), false);
    endDate = parseYMD(String(date), true);
  } else if (fromDate || toDate) {
    const fStr = fromDate ? String(fromDate) : '';
    const tStr = toDate ? String(toDate) : (fromDate ? String(fromDate) : '');
    startDate = parseYMD(fStr, false);
    endDate = parseYMD(tStr, true);
  } else {
    startDate = new Date(0);
    endDate = new Date();
  }

  return { startDate, endDate };
}

export const reportController = {
  // GET /api/reports/end-of-day
  endOfDay: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const { startDate, endDate } = parseReportDateRange(req.query);

      const [orders, returns, cashbook] = await Promise.all([
        prisma.order.findMany({
          where: { 
            tenantId,
            createdAt: { gte: startDate, lte: endDate },
            status: { not: 'CANCELLED' }
          },
          include: {
            items: { include: { product: true } },
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
          include: {
            items: { include: { product: true } },
            customer: true
          },
          orderBy: { createdAt: 'desc' }
        }),
        prisma.cashbookEntry.findMany({
          where: { tenantId, createdAt: { gte: startDate, lte: endDate } }
        })
      ]);

      const totalSales = orders.reduce((sum, o) => sum + Number(o.total), 0);
      const totalPaid = orders.reduce((sum, o) => sum + Number(o.paid), 0);
      const totalReturns = returns.reduce((sum, r) => sum + Number(r.total), 0);
      const totalReturnPaid = returns.reduce((sum, r) => sum + Number(r.paid), 0);
      
      const income = cashbook.filter(c => c.type === 'INCOME').reduce((sum, c) => sum + Number(c.amount), 0);
      const expense = cashbook.filter(c => c.type === 'EXPENSE').reduce((sum, c) => sum + Number(c.amount), 0);

      // Map orders to KiotViet style transaction report details
      const FRIENDLY_PAYMENT_METHODS: Record<string, string> = {
        CASH: 'Tiền mặt',
        CARD: 'Quẹt thẻ',
        TRANSFER: 'Chuyển khoản',
        MIXED: 'Kết hợp'
      };

      const transactionDetails = orders.map((o: any) => {
        const totalQty = (o.items || []).reduce((qtySum: number, item: any) => qtySum + Number(item.quantity || 0), 0);
        const totalCost = o.costPrice !== undefined && o.costPrice !== null
          ? Number(o.costPrice)
          : (o.items || []).reduce((costSum: number, item: any) => {
              const costUnit = Number(item.costPrice || item.product?.costPrice || item.product?.cost_price || 0);
              return costSum + costUnit * Number(item.quantity || 0);
            }, 0);

        return {
          id: o.id,
          code: o.code || `HD00000${o.id}`,
          time: o.createdAt,
          quantity: totalQty,
          revenue: Number(o.total || 0),
          paid: Number(o.paid || 0),
          costPrice: totalCost,
          otherFee: 0,
          vat: 0,
          rounding: 0,
          returnFee: 0,
          netRevenue: Number(o.paid || 0),
          customerName: o.customer?.name || 'Khách lẻ',
          customerPhone: o.customer?.phone || '',
          createdBy: o.user?.username || 'Võ Thành Huy',
          paymentMethod: FRIENDLY_PAYMENT_METHODS[o.paymentMethod] || o.paymentMethod || 'Tiền mặt'
        };
      });

      const returnDetails = returns.map((r: any) => {
        const totalQty = (r.items || []).reduce((qtySum: number, item: any) => qtySum + Number(item.quantity || 0), 0);
        const totalCost = (r.items || []).reduce((costSum: number, item: any) => {
          const costUnit = Number(item.costPrice || item.product?.costPrice || item.product?.cost_price || 0);
          return costSum + costUnit * Number(item.quantity || 0);
        }, 0);
        return {
          id: r.id,
          code: r.code || `TH00000${r.id}`,
          time: r.createdAt,
          quantity: totalQty,
          revenue: -Number(r.total || 0),
          paid: -Number(r.paid || 0),
          costPrice: totalCost,
          otherFee: 0,
          vat: 0,
          rounding: 0,
          returnFee: 0,
          netRevenue: -Number(r.paid || 0),
          customerName: r.customer?.name || 'Khách lẻ',
          customerPhone: r.customer?.phone || '',
          createdBy: 'Võ Thành Huy'
        };
      });

      res.json({
        dateRange: { from: startDate, to: endDate },
        orderCount: orders.length,
        returnCount: returns.length,
        totalSales,
        totalPaid,
        totalReturns,
        totalReturnPaid,
        cashbookIncome: income,
        cashbookExpense: expense,
        netRevenue: totalSales - totalReturns,
        transactions: transactionDetails,
        returns: returnDetails
      });
    } catch (error) {
      next(error);
    }
  },

  // GET /api/reports/financial (Báo cáo Kết quả hoạt động kinh doanh chuẩn KiotViet)
  financial: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const { startDate, endDate } = parseReportDateRange(req.query);

      const [orders, returns, cashbook] = await Promise.all([
        prisma.order.findMany({
          where: {
            tenantId,
            createdAt: { gte: startDate, lte: endDate },
            status: { not: 'CANCELLED' }
          },
          include: {
            items: { include: { product: true } }
          }
        }),
        prisma.return.findMany({
          where: {
            tenantId,
            createdAt: { gte: startDate, lte: endDate },
            status: 'COMPLETED'
          },
          include: {
            items: { include: { product: true } }
          }
        }),
        prisma.cashbookEntry.findMany({
          where: {
            tenantId,
            createdAt: { gte: startDate, lte: endDate },
            isAccounting: true,
            status: { not: 'cancelled' }
          }
        })
      ]);

      let grossRevenue = 0;
      let orderDiscounts = 0;
      let soldCostPrice = 0;

      orders.forEach((o: any) => {
        const orderTotal = Number(o.total || 0);
        const discountVal = Number(o.discount || 0);
        grossRevenue += (orderTotal + discountVal);
        orderDiscounts += discountVal;

        (o.items || []).forEach((item: any) => {
          const cost = Number(item.costPrice || item.product?.costPrice || item.product?.cost_price || 0);
          soldCostPrice += cost * Number(item.quantity || 0);
        });
      });

      let returnTotalVal = 0;
      let returnCostPrice = 0;

      returns.forEach((r: any) => {
        returnTotalVal += Number(r.total || 0);
        (r.items || []).forEach((item: any) => {
          const cost = Number(item.costPrice || item.product?.costPrice || item.product?.cost_price || 0);
          returnCostPrice += cost * Number(item.quantity || 0);
        });
      });

      const totalDeductions = returnTotalVal + orderDiscounts;
      const netRevenue = grossRevenue - totalDeductions;
      const cogs = soldCostPrice - returnCostPrice;
      const grossProfit = netRevenue - cogs;

      const isSupplierPayment = (c: any) => {
        if (c.supplierId || c.partnerType === 'supplier') return true;
        const cat = (c.category || '').toLowerCase();
        if (cat.includes('nhà cung cấp') || cat.includes('ncc') || cat.includes('trả nợ') || cat.includes('tiền trả ncc')) return true;
        return false;
      };

      const operatingExpenses = cashbook
        .filter((c: any) => c.type === 'EXPENSE' && !isSupplierPayment(c) && c.category !== 'Chi phí khác')
        .reduce((sum: number, c: any) => sum + Number(c.amount || 0), 0);

      const operatingProfit = grossProfit - operatingExpenses;

      const otherIncome = cashbook
        .filter((c: any) => c.type === 'INCOME' && c.category === 'Thu nhập khác')
        .reduce((sum: number, c: any) => sum + Number(c.amount || 0), 0);

      const otherExpenses = cashbook
        .filter((c: any) => c.type === 'EXPENSE' && c.category === 'Chi phí khác')
        .reduce((sum: number, c: any) => sum + Number(c.amount || 0), 0);

      const netProfit = operatingProfit + otherIncome - otherExpenses;

      res.json({
        dateRange: { from: startDate, to: endDate },
        grossRevenue,
        totalDeductions,
        orderDiscounts,
        returnTotalVal,
        netRevenue,
        cogs,
        grossProfit,
        operatingExpenses,
        operatingProfit,
        otherIncome,
        otherExpenses,
        netProfit,
        profitMargin: netRevenue > 0 ? (netProfit / netRevenue) * 100 : 0
      });
    } catch (error) {
      next(error);
    }
  },

  // GET /api/reports/sales
  sales: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const days = parseInt(req.query.days as string) || 30;
      const startDate = new Date();
      startDate.setDate(startDate.getDate() - days);
      startDate.setHours(0, 0, 0, 0);

      const [orders, returns] = await Promise.all([
        prisma.order.findMany({
          where: { tenantId, createdAt: { gte: startDate }, status: { not: 'CANCELLED' } },
          include: { items: { include: { product: true } } }
        }),
        prisma.return.findMany({
          where: { tenantId, createdAt: { gte: startDate }, status: 'COMPLETED' },
          include: { items: { include: { product: true } } }
        })
      ]);

      const salesByDate: Record<string, { revenue: number; cogs: number; profit: number; count: number }> = {};
      
      orders.forEach((order: any) => {
        const dateStr = order.createdAt.toISOString().split('T')[0];
        if (!salesByDate[dateStr]) salesByDate[dateStr] = { revenue: 0, cogs: 0, profit: 0, count: 0 };
        
        const rev = Number(order.total || 0);
        let cogs = 0;
        (order.items || []).forEach((item: any) => {
          const cost = Number(item.costPrice || item.product?.costPrice || item.product?.cost_price || 0);
          cogs += cost * Number(item.quantity || 0);
        });

        salesByDate[dateStr].revenue += rev;
        salesByDate[dateStr].cogs += cogs;
        salesByDate[dateStr].profit += (rev - cogs);
        salesByDate[dateStr].count += 1;
      });

      returns.forEach((ret: any) => {
        const dateStr = ret.createdAt.toISOString().split('T')[0];
        if (!salesByDate[dateStr]) salesByDate[dateStr] = { revenue: 0, cogs: 0, profit: 0, count: 0 };

        const retVal = Number(ret.total || 0);
        let retCogs = 0;
        (ret.items || []).forEach((item: any) => {
          const cost = Number(item.costPrice || item.product?.costPrice || item.product?.cost_price || 0);
          retCogs += cost * Number(item.quantity || 0);
        });

        salesByDate[dateStr].revenue -= retVal;
        salesByDate[dateStr].cogs -= retCogs;
        salesByDate[dateStr].profit -= (retVal - retCogs);
      });

      const chartData = Object.keys(salesByDate).sort().map(date => ({
        date,
        day: Number(date.split('-')[2]),
        revenue: salesByDate[date].revenue,
        cogs: salesByDate[date].cogs,
        profit: salesByDate[date].profit,
        count: salesByDate[date].count
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
      const { startDate, endDate } = parseReportDateRange(req.query);

      const orders = await prisma.order.findMany({
        where: { 
          tenantId,
          createdAt: { gte: startDate, lte: endDate },
          status: { not: 'CANCELLED' }
        },
        include: {
          items: {
            include: { product: { select: { id: true, name: true, sku: true, unit: true, categoryId: true, costPrice: true } } }
          }
        }
      });

      const returns = await prisma.return.findMany({
        where: { 
          tenantId,
          createdAt: { gte: startDate, lte: endDate },
          status: 'COMPLETED' 
        },
        include: {
          items: { include: { product: true } }
        }
      });

      const productMap: Record<number, any> = {};

      orders.forEach((order: any) => {
        (order.items || []).forEach((item: any) => {
          if (!productMap[item.productId]) {
            productMap[item.productId] = {
              id: item.productId,
              sku: item.product?.sku || '',
              name: item.product?.name || 'Sản phẩm',
              unit: item.product?.unit || 'Kg',
              categoryId: item.product?.categoryId,
              soldQty: 0,
              revenue: 0,
              cogs: 0,
              returnQty: 0,
              returnVal: 0,
              netRevenue: 0,
              profit: 0
            };
          }
          const itemVal = Number(item.total || (Number(item.price || 0) * Number(item.quantity || 0)));
          const itemCost = Number(item.costPrice || item.product?.costPrice || item.product?.cost_price || 0) * Number(item.quantity || 0);

          productMap[item.productId].soldQty += Number(item.quantity || 0);
          productMap[item.productId].revenue += itemVal;
          productMap[item.productId].cogs += itemCost;
          productMap[item.productId].netRevenue += itemVal;
          productMap[item.productId].profit += (itemVal - itemCost);
        });
      });

      returns.forEach((ret: any) => {
        (ret.items || []).forEach((item: any) => {
          if (productMap[item.productId]) {
            const itemVal = Number(item.total || (Number(item.price || 0) * Number(item.quantity || 0)));
            const itemCost = Number(item.costPrice || item.product?.costPrice || item.product?.cost_price || 0) * Number(item.quantity || 0);

            productMap[item.productId].returnQty += Number(item.quantity || 0);
            productMap[item.productId].returnVal += itemVal;
            productMap[item.productId].cogs -= itemCost;
            productMap[item.productId].netRevenue -= itemVal;
            productMap[item.productId].profit -= (itemVal - itemCost);
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
      const { startDate, endDate } = parseReportDateRange(req.query);

      const orders = await prisma.order.findMany({
        where: {
          tenantId,
          createdAt: { gte: startDate, lte: endDate },
          status: { not: 'CANCELLED' },
          customerId: { not: null }
        },
        include: {
          customer: { select: { id: true, name: true, phone: true, code: true } }
        }
      });

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

      const customerMap: Record<number, any> = {};

      orders.forEach((order: any) => {
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

      returns.forEach((ret: any) => {
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
