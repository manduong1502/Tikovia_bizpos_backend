import { Request, Response, NextFunction } from 'express';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { z } from 'zod';
import prisma from '../config/database';
import { config } from '../config';
import { AuthRequest } from '../middlewares/auth';

const loginSchema = z.object({
  username: z.string().min(1, 'Tên đăng nhập không được để trống'),
  password: z.string().min(1, 'Mật khẩu không được để trống'),
});

const registerSchema = z.object({
  username: z.string().min(3, 'Tên đăng nhập tối thiểu 3 ký tự'),
  password: z.string().min(6, 'Mật khẩu tối thiểu 6 ký tự'),
  fullName: z.string().min(1, 'Họ tên không được để trống'),
  email: z.string().email('Email không hợp lệ').optional().nullable(),
  phone: z.string().optional().nullable(),
  role: z.enum(['ADMIN', 'MANAGER', 'STAFF']).optional(),
});

export const authController = {
  // POST /api/auth/login
  login: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { username, password } = loginSchema.parse(req.body);

      const user = await prisma.user.findUnique({ where: { username } });
      if (!user || !user.isActive) {
        return res.status(401).json({ message: 'Tên đăng nhập hoặc mật khẩu không đúng' });
      }

      const validPassword = await bcrypt.compare(password, user.password);
      if (!validPassword) {
        return res.status(401).json({ message: 'Tên đăng nhập hoặc mật khẩu không đúng' });
      }

      const token = jwt.sign(
        { id: user.id, username: user.username, role: user.role },
        config.jwt.secret,
        { expiresIn: config.jwt.expiresIn as any }
      );

      res.json({
        token,
        user: {
          id: user.id,
          username: user.username,
          fullName: user.fullName,
          email: user.email,
          role: user.role,
        },
      });
    } catch (error) {
      next(error);
    }
  },

  // POST /api/auth/register (Admin only)
  register: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const data = registerSchema.parse(req.body);
      const hashedPassword = await bcrypt.hash(data.password, 12);

      const user = await prisma.user.create({
        data: {
          ...data,
          password: hashedPassword,
        },
        select: { id: true, username: true, fullName: true, email: true, role: true },
      });

      res.status(201).json(user);
    } catch (error) {
      next(error);
    }
  },

  // GET /api/auth/me
  me: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const user = await prisma.user.findUnique({
        where: { id: req.user!.id },
        select: { id: true, username: true, fullName: true, email: true, phone: true, role: true },
      });
      res.json(user);
    } catch (error) {
      next(error);
    }
  },
};
