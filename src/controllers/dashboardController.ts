import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';

export const dashboardController = {
  get: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const today = new Date();
      today.setHours(0, 0, 0, 0);
      const tomorrow = new Date(today);
      tomorrow.setDate(tomorrow.getDate() + 1);

      // All queries run in parallel for speed
      const [
        todayOrders,
        todayRevenue,
        todayReturns,
        totalProducts,
        lowStockProducts,
        totalCustomers,
        recentOrders,
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
          where: { isActive: true, stock: { lte: prisma.product.fields?.minStock || 5 } },
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
      ]);

      res.json({
        todayStats: {
          orders: todayOrders,
          revenue: todayRevenue._sum.total || 0,
          returns: todayReturns,
        },
        overview: {
          totalProducts,
          lowStockProducts,
          totalCustomers,
        },
        recentOrders,
      });
    } catch (error) {
      next(error);
    }
  },
};
