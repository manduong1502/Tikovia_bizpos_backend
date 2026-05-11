import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';
import bcrypt from 'bcryptjs';

export const userController = {
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const users = await prisma.user.findMany({
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

  update: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { password, ...data } = req.body;
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

  toggleActive: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const user = await prisma.user.findUnique({ where: { id: Number(req.params.id) } });
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
