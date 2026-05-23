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

const registerTenantSchema = z.object({
  tenantName: z.string().min(1, 'Tên cửa hàng không được để trống'),
  subdomain: z.string().min(2, 'Subdomain tối thiểu 2 ký tự').regex(/^[a-z0-9-]+$/, 'Subdomain chỉ gồm chữ thường, số và dấu gạch ngang'),
  adminUsername: z.string().min(3, 'Tên đăng nhập tối thiểu 3 ký tự'),
  adminPassword: z.string().min(6, 'Mật khẩu tối thiểu 6 ký tự'),
  adminFullName: z.string().min(1, 'Họ tên không được để trống'),
  adminEmail: z.string().email('Email không hợp lệ').optional().nullable(),
});

export const authController = {
  // POST /api/auth/login
  login: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { username, password } = loginSchema.parse(req.body);
      const tenantId = (req as any).tenant?.id;

      if (!tenantId) {
        return res.status(400).json({ message: 'Không xác định được thông tin gian hàng' });
      }

      // Find user by composite unique constraint (tenantId + username)
      const user = await prisma.user.findUnique({
        where: {
          tenantId_username: {
            tenantId,
            username,
          },
        },
      });

      if (!user || !user.isActive) {
        return res.status(401).json({ message: 'Tên đăng nhập hoặc mật khẩu không đúng' });
      }

      const validPassword = await bcrypt.compare(password, user.password);
      if (!validPassword) {
        return res.status(401).json({ message: 'Tên đăng nhập hoặc mật khẩu không đúng' });
      }

      const token = jwt.sign(
        { id: user.id, username: user.username, role: user.role, tenantId: user.tenantId },
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
          tenantId: user.tenantId,
        },
        tenant: (req as any).tenant,
      });
    } catch (error) {
      next(error);
    }
  },

  // POST /api/auth/register (Admin only)
  register: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const data = registerSchema.parse(req.body);
      const tenantId = req.user!.tenantId;
      
      const existingUser = await prisma.user.findFirst({
        where: {
          tenantId,
          OR: [
            { username: data.username },
            ...(data.email ? [{ email: data.email }] : []),
          ],
        },
      });

      if (existingUser) {
        if (existingUser.username === data.username) return res.status(400).json({ message: 'Tên đăng nhập đã tồn tại' });
        if (existingUser.email === data.email) return res.status(400).json({ message: 'Email đã tồn tại' });
      }

      const hashedPassword = await bcrypt.hash(data.password, 12);

      const user = await prisma.user.create({
        data: {
          ...data,
          password: hashedPassword,
          tenantId,
        },
        select: { id: true, username: true, fullName: true, email: true, role: true },
      });

      res.status(201).json(user);
    } catch (error) {
      next(error);
    }
  },

  // POST /api/auth/register-tenant (Public)
  registerTenant: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const body = registerTenantSchema.parse(req.body);

      // Check subdomain uniqueness
      const existingTenant = await prisma.tenant.findUnique({
        where: { subdomain: body.subdomain },
      });
      if (existingTenant) {
        return res.status(400).json({ message: `Tên miền phụ '${body.subdomain}' đã được sử dụng.` });
      }

      const tenant = await prisma.$transaction(async (tx) => {
        // 1. Create Tenant
        const newTenant = await tx.tenant.create({
          data: {
            name: body.tenantName,
            subdomain: body.subdomain,
            plan: 'TRIAL',
          },
        });

        // 2. Create Admin User
        const hashedPassword = await bcrypt.hash(body.adminPassword, 12);
        await tx.user.create({
          data: {
            username: body.adminUsername,
            password: hashedPassword,
            fullName: body.adminFullName,
            email: body.adminEmail,
            role: 'ADMIN',
            tenantId: newTenant.id,
          },
        });

        // 3. Initialize default sequence trackers to avoid race conditions
        const sequences = ['ORDER', 'RETURN', 'PURCHASE_ORDER', 'PURCHASE_RETURN', 'INVENTORY_CHECK', 'CASHBOOK'];
        for (const seq of sequences) {
          await tx.sequenceTracker.create({
            data: {
              name: seq,
              value: 0,
              tenantId: newTenant.id,
            },
          });
        }

        // 4. Create default Category
        await tx.category.create({
          data: {
            name: 'Hàng hóa chung',
            note: 'Nhóm hàng mặc định của cửa hàng',
            tenantId: newTenant.id,
          },
        });

        return newTenant;
      });

      res.status(201).json({
        message: 'Đăng ký cửa hàng thành công!',
        tenant,
      });
    } catch (error) {
      next(error);
    }
  },

  // GET /api/auth/me
  me: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const user = await prisma.user.findUnique({
        where: { id: req.user!.id },
        select: { id: true, username: true, fullName: true, email: true, phone: true, role: true, tenantId: true },
      });
      res.json(user);
    } catch (error) {
      next(error);
    }
  },

  // GET /api/auth/tenant
  getTenant: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenant = (req as any).tenant;
      if (!tenant) {
        return res.status(404).json({ message: 'Không tìm thấy thông tin cửa hàng' });
      }
      res.json(tenant);
    } catch (error) {
      next(error);
    }
  },
};
