import { Response, NextFunction } from 'express';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';

export const notificationController = {
  // GET /api/notifications
  getAll: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const page = Math.max(1, parseInt(req.query.page as string) || 1);
      const limit = Math.min(100, parseInt(req.query.limit as string) || 50);

      const [data, total, unreadCount] = await Promise.all([
        prisma.notification.findMany({
          where: { tenantId },
          skip: (page - 1) * limit,
          take: limit,
          orderBy: { createdAt: 'desc' },
        }),
        prisma.notification.count({ where: { tenantId } }),
        prisma.notification.count({ where: { tenantId, isRead: false } }),
      ]);

      res.json({
        data,
        total,
        unreadCount,
        page,
        limit,
        totalPages: Math.ceil(total / limit),
      });
    } catch (error) {
      next(error);
    }
  },

  // PUT /api/notifications/read-all
  readAll: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;

      await prisma.notification.updateMany({
        where: { tenantId, isRead: false },
        data: { isRead: true },
      });

      res.json({ message: 'Đã đánh dấu đọc tất cả thông báo' });
    } catch (error) {
      next(error);
    }
  },

  // PUT /api/notifications/:id/read
  readOne: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const id = Number(req.params.id);

      const notification = await prisma.notification.findFirst({
        where: { id, tenantId },
      });

      if (!notification) {
        return res.status(404).json({ message: 'Không tìm thấy thông báo' });
      }

      const updated = await prisma.notification.update({
        where: { id },
        data: { isRead: true },
      });

      res.json(updated);
    } catch (error) {
      next(error);
    }
  },

  // DELETE /api/notifications/:id
  delete: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const id = Number(req.params.id);

      const notification = await prisma.notification.findFirst({
        where: { id, tenantId },
      });

      if (!notification) {
        return res.status(404).json({ message: 'Không tìm thấy thông báo' });
      }

      await prisma.notification.delete({
        where: { id },
      });

      res.json({ message: 'Đã xóa thông báo thành công' });
    } catch (error) {
      next(error);
    }
  },
};
