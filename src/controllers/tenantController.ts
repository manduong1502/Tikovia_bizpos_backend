import { Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { SuperAdminRequest } from '../middlewares/auth';

const updateTenantSchema = z.object({
  name: z.string().optional(),
  plan: z.enum(['TRIAL', 'STANDARD', 'PRO']).optional(),
  isActive: z.boolean().optional(),
  expiredAt: z.preprocess((val) => {
    if (val === '' || val === null || val === 'vĩnh viễn') return null;
    return val;
  }, z.string().datetime({ message: 'Định dạng thời gian không hợp lệ (ISO 8601)' }).nullable().optional()),
});

export const tenantController = {
  // GET /api/tenants (Super Admin only)
  getAll: async (req: SuperAdminRequest, res: Response, next: NextFunction) => {
    try {
      const tenants = await prisma.tenant.findMany({
        orderBy: { createdAt: 'desc' },
        include: {
          _count: {
            select: {
              users: true,
              products: true,
              orders: true,
            }
          }
        }
      });

      res.json(tenants);
    } catch (error) {
      next(error);
    }
  },

  // PUT /api/tenants/:id (Super Admin only)
  update: async (req: SuperAdminRequest, res: Response, next: NextFunction) => {
    try {
      const id = Number(req.params.id);
      const data = updateTenantSchema.parse(req.body);

      const existing = await prisma.tenant.findUnique({ where: { id } });
      if (!existing) return res.status(404).json({ message: 'Không tìm thấy gian hàng' });

      // Cannot disable or expire the master tenant (id: 1)
      if (id === 1) {
        if (data.isActive === false) {
          return res.status(400).json({ message: 'Không thể khóa gian hàng hệ thống gốc (id: 1)' });
        }
        if (data.expiredAt !== undefined) {
          return res.status(400).json({ message: 'Không thể thiết lập hạn sử dụng cho gian hàng hệ thống gốc' });
        }
      }

      const updated = await prisma.tenant.update({
        where: { id },
        data: {
          ...data,
          expiredAt: data.expiredAt ? new Date(data.expiredAt) : data.expiredAt === null ? null : undefined,
        },
      });

      res.json(updated);
    } catch (error) {
      next(error);
    }
  },

  // DELETE /api/tenants/:id (Super Admin only)
  delete: async (req: SuperAdminRequest, res: Response, next: NextFunction) => {
    try {
      const id = Number(req.params.id);
      if (id === 1) {
        return res.status(400).json({ message: 'Không thể xóa gian hàng hệ thống gốc (id: 1)' });
      }

      const existing = await prisma.tenant.findUnique({ where: { id } });
      if (!existing) return res.status(404).json({ message: 'Không tìm thấy gian hàng' });

      await prisma.tenant.delete({ where: { id } });

      res.json({ message: `Đã xóa thành công gian hàng '${existing.name}' và toàn bộ dữ liệu đi kèm.` });
    } catch (error) {
      next(error);
    }
  },
};
