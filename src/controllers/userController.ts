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
          id: true,
          username: true,
          fullName: true,
          email: true,
          phone: true,
          role: true,
          isActive: true,
          createdAt: true,
          _count: {
            select: {
              trustedDevices: {
                where: { isActive: true, trustedUntil: { gt: new Date() } }
              }
            }
          }
        },
        orderBy: { createdAt: 'desc' },
      });
      res.json(users);
    } catch (error) {
      next(error);
    }
  },

  create: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const { username, password, fullName, email, phone, role } = req.body;

      if (!username || !password || !fullName) {
        return res.status(400).json({ message: 'Tên đăng nhập, mật khẩu và họ tên là bắt buộc' });
      }

      const existing = await prisma.user.findFirst({
        where: {
          tenantId,
          OR: [
            { username: username.trim() },
            ...(email && email.trim() ? [{ email: email.trim() }] : []),
          ],
        },
      });

      if (existing) {
        if (existing.username === username.trim()) {
          return res.status(400).json({ message: 'Tên đăng nhập đã tồn tại trong gian hàng' });
        }
        if (email && existing.email === email.trim()) {
          return res.status(400).json({ message: 'Email này đã được sử dụng bởi nhân viên khác' });
        }
      }

      const hashedPassword = await bcrypt.hash(password, 10);
      const user = await prisma.user.create({
        data: {
          tenantId,
          username: username.trim(),
          password: hashedPassword,
          fullName: fullName.trim(),
          email: email?.trim() || null,
          phone: phone?.trim() || null,
          role: role || 'STAFF',
        },
        select: {
          id: true,
          username: true,
          fullName: true,
          email: true,
          phone: true,
          role: true,
          isActive: true,
          createdAt: true,
        },
      });

      res.status(201).json(user);
    } catch (error) {
      next(error);
    }
  },

  update: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const { password, email, ...data } = req.body;
      const userId = Number(req.params.id);
      
      const existingUser = await prisma.user.findFirst({
        where: { id: userId, tenantId }
      });
      if (!existingUser) return res.status(404).json({ message: 'Không tìm thấy nhân viên' });

      if (email && email.trim() !== '') {
        const dupEmail = await prisma.user.findFirst({
          where: {
            tenantId,
            email: email.trim(),
            NOT: { id: userId },
          },
        });
        if (dupEmail) {
          return res.status(400).json({ message: 'Email này đã được sử dụng bởi nhân viên khác' });
        }
      }

      const updateData: any = { 
        ...data,
        email: email !== undefined ? (email?.trim() || null) : existingUser.email,
      };

      if (password && password.trim() !== '') {
        updateData.password = await bcrypt.hash(password, 10);
      }

      const user = await prisma.user.update({
        where: { id: userId },
        data: updateData,
        select: {
          id: true, 
          username: true, 
          fullName: true, 
          email: true,
          phone: true, 
          role: true, 
          isActive: true,
        },
      });
      res.json(user);
    } catch (error) {
      next(error);
    }
  },

  delete: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const userId = Number(req.params.id);

      if (userId === req.user!.id) {
        return res.status(400).json({ message: 'Không thể xóa tài khoản của chính bạn' });
      }

      const existingUser = await prisma.user.findFirst({
        where: { id: userId, tenantId }
      });
      if (!existingUser) return res.status(404).json({ message: 'Không tìm thấy nhân viên' });

      await prisma.user.delete({
        where: { id: userId },
      });

      res.json({ success: true, message: 'Đã xóa nhân viên thành công' });
    } catch (error) {
      next(error);
    }
  },

  toggleActive: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const userId = Number(req.params.id);

      if (userId === req.user!.id) {
        return res.status(400).json({ message: 'Không thể khóa tài khoản của chính bạn' });
      }

      const user = await prisma.user.findFirst({
        where: { id: userId, tenantId }
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

  getUserDevices: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const userId = Number(req.params.id);

      const user = await prisma.user.findFirst({
        where: { id: userId, tenantId }
      });
      if (!user) return res.status(404).json({ message: 'Không tìm thấy nhân viên' });

      const devices = await prisma.trustedDevice.findMany({
        where: { userId, isActive: true },
        orderBy: { lastUsedAt: 'desc' },
      });
      res.json(devices);
    } catch (error) {
      next(error);
    }
  },

  revokeUserDevice: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const userId = Number(req.params.id);
      const deviceId = Number(req.params.deviceId);

      const user = await prisma.user.findFirst({
        where: { id: userId, tenantId }
      });
      if (!user) return res.status(404).json({ message: 'Không tìm thấy nhân viên' });

      await prisma.trustedDevice.deleteMany({
        where: { id: deviceId, userId },
      });

      res.json({ success: true, message: 'Đã hủy tin cậy thiết bị của nhân viên thành công' });
    } catch (error) {
      next(error);
    }
  },
};
