import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';
import bcrypt from 'bcryptjs';
import { AuthRequest } from '../middlewares/auth';

export const userController = {
  getAll: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const users = await prisma.user.findMany({
        where: { tenantId },
        select: {
          id: true, username: true, fullName: true, email: true,
          phone: true, role: true, isActive: true, createdAt: true,
        },
        orderBy: { createdAt: 'desc' },
      });
      res.json(users);
    } catch (error) {
      next(error);
    }
  },

  update: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const { password, ...data } = req.body;
      
      const existingUser = await prisma.user.findFirst({
        where: { id: Number(req.params.id), tenantId }
      });
      if (!existingUser) return res.status(404).json({ message: 'Không tìm thấy nhân viên' });

      const updateData: any = { ...data };
      if (password) {
        updateData.password = await bcrypt.hash(password, 12);
      }
      const user = await prisma.user.update({
        where: { id: Number(req.params.id) },
        data: updateData,
        select: {
          id: true, username: true, fullName: true, email: true,
          phone: true, role: true, isActive: true,
        },
      });
      res.json(user);
    } catch (error) {
      next(error);
    }
  },

  toggleActive: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const user = await prisma.user.findFirst({
        where: { id: Number(req.params.id), tenantId }
      });
      if (!user) return res.status(404).json({ message: 'Không tìm thấy nhân viên' });

      const updated = await prisma.user.update({
        where: { id: user.id },
        data: { isActive: !user.isActive },
        select: { id: true, username: true, isActive: true },
      });
      res.json(updated);
    } catch (error) {
      next(error);
    }
  },
};
