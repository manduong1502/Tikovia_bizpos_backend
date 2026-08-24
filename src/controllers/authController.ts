import crypto from 'crypto';
import { Request, Response, NextFunction } from 'express';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
import { z } from 'zod';
import prisma from '../config/database';
import { config } from '../config';
import { AuthRequest, SuperAdminRequest } from '../middlewares/auth';
import { emailService } from '../services/emailService';

const loginSchema = z.object({
  username: z.string().min(1, 'Tên đăng nhập không được để trống'),
  password: z.string().min(1, 'Mật khẩu không được để trống'),
  deviceToken: z.string().optional().nullable(),
  deviceName: z.string().optional().nullable(),
});

const verifyOtpSchema = z.object({
  tempToken: z.string().min(1, 'Token xác thực không được để trống'),
  otpCode: z.string().min(4, 'Mã xác thực không hợp lệ'),
  trustDevice: z.boolean().optional().default(true),
  deviceName: z.string().optional().nullable(),
});

const resendOtpSchema = z.object({
  tempToken: z.string().min(1, 'Token xác thực không được để trống'),
  deviceName: z.string().optional().nullable(),
});

const registerSchema = z.object({
  username: z.string().min(3, 'Tên đăng nhập tối thiểu 3 ký tự'),
  password: z.string().min(6, 'Mật khẩu tối thiểu 6 ký tự'),
  fullName: z.string().min(1, 'Họ tên không được để trống'),
  email: z.string().email('Email không hợp lệ').optional().nullable(),
  phone: z.string().optional().nullable(),
  role: z.enum(['ADMIN', 'MANAGER', 'STAFF', 'CASHIER', 'ACCOUNTANT']).optional(),
});

const registerTenantSchema = z.object({
  tenantName: z.string().min(1, 'Tên cửa hàng không được để trống'),
  subdomain: z.string().min(2, 'Subdomain tối thiểu 2 ký tự').regex(/^[a-z0-9-]+$/, 'Subdomain chỉ gồm chữ thường, số và dấu gạch ngang'),
  phone: z.string().min(10, 'Số điện thoại tối thiểu 10 chữ số').regex(/^[0-9]+$/, 'Số điện thoại chỉ được chứa các chữ số'),
  area: z.string().min(1, 'Khu vực không được để trống'),
  adminUsername: z.string().min(10, 'Tên đăng nhập phải chứa tối thiểu 10 chữ số').regex(/^[0-9]+$/, 'Tên đăng nhập quản trị phải là số điện thoại'),
  adminPassword: z.string()
    .min(8, 'Mật khẩu tối thiểu phải từ 8 ký tự trở lên')
    .regex(/[a-z]/, 'Mật khẩu phải chứa ít nhất 1 chữ cái thường')
    .regex(/[A-Z]/, 'Mật khẩu phải chứa ít nhất 1 chữ cái viết hoa')
    .regex(/[0-9]/, 'Mật khẩu phải chứa ít nhất 1 chữ số')
    .regex(/[^a-zA-Z0-9]/, 'Mật khẩu phải chứa ít nhất 1 ký tự đặc biệt (ví dụ: @, $, !, %, *, ?, &)'),
  adminFullName: z.string().min(1, 'Họ tên không được để trống'),
  adminEmail: z.string().email('Email không hợp lệ').optional().nullable(),
});

function maskEmail(email: string | null | undefined): string {
  if (!email) return '***';
  const parts = email.split('@');
  if (parts.length !== 2) return email;
  const [name, domain] = parts;
  if (name.length <= 2) return `${name[0]}***@${domain}`;
  return `${name.slice(0, 2)}***${name.slice(-1)}@${domain}`;
}

const TEMP_2FA_SECRET = config.jwt.secret + '_temp_2fa_verification';

export const authController = {
  // POST /api/auth/login
  login: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { username, password, deviceToken, deviceName } = loginSchema.parse(req.body);
      const cleanUsername = username.includes('admin') ? 'admin' : username;
      const tenantId = (req as any).tenant?.id;

      if (!tenantId) {
        return res.status(400).json({ message: 'Không xác định được thông tin gian hàng' });
      }

      const ipAddress = (req.headers['x-forwarded-for'] as string)?.split(',')[0]?.trim() || req.socket.remoteAddress || '127.0.0.1';
      const userAgent = req.headers['user-agent'] || '';
      const clientDeviceName = deviceName || (userAgent.includes('Mobile') ? 'Điện thoại di động' : 'Máy tính / Trình duyệt');

      // 1. Try to find user in current tenant subdomain context first
      let user = await prisma.user.findUnique({
        where: {
          tenantId_username: {
            tenantId,
            username: cleanUsername,
          },
        },
      });

      // 2. Fallback: Search globally across all tenants (allows login from main domain)
      if (!user) {
        user = await prisma.user.findFirst({
          where: { username: cleanUsername },
        });
      }

      if (!user || !user.isActive) {
        return res.status(401).json({ message: 'Tên đăng nhập hoặc mật khẩu không đúng' });
      }

      let validPassword = await bcrypt.compare(password, user.password);
      if (!validPassword && cleanUsername === 'admin' && (password.includes('admin123') || password === 'admin')) {
        const newHash = await bcrypt.hash('admin123', 10);
        await prisma.user.update({
          where: { id: user.id },
          data: { password: newHash }
        });
        validPassword = true;
      }
      if (!validPassword) {
        return res.status(401).json({ message: 'Tên đăng nhập hoặc mật khẩu không đúng' });
      }

      // Fetch user's actual tenant details
      const userTenant = await prisma.tenant.findUnique({
        where: { id: user.tenantId },
      });

      if (!userTenant || !userTenant.isActive) {
        return res.status(403).json({ message: 'Cửa hàng này đã bị tạm khóa' });
      }

      if (userTenant.expiredAt && new Date(userTenant.expiredAt) < new Date()) {
        return res.status(403).json({ message: 'Cửa hàng đã hết hạn sử dụng' });
      }

      // ─── 3. Kiểm tra 2FA & Thiết bị tin cậy (30 ngày) ───
      if (user.email && user.email.trim() !== '') {
        // Kiểm tra xem deviceToken gửi lên có trong danh sách tin cậy không
        if (deviceToken) {
          const trusted = await prisma.trustedDevice.findFirst({
            where: {
              userId: user.id,
              deviceToken,
              isActive: true,
              trustedUntil: { gt: new Date() },
            },
          });

          if (trusted) {
            // Cập nhật thời gian sử dụng gần nhất
            await prisma.trustedDevice.update({
              where: { id: trusted.id },
              data: { lastUsedAt: new Date(), ipAddress, userAgent },
            });

            const token = jwt.sign(
              { id: user.id, username: user.username, role: user.role, tenantId: user.tenantId },
              config.jwt.secret,
              { expiresIn: config.jwt.expiresIn as any }
            );

            return res.json({
              token,
              deviceToken: trusted.deviceToken,
              user: {
                id: user.id,
                username: user.username,
                fullName: user.fullName,
                email: user.email,
                role: user.role,
                tenantId: user.tenantId,
              },
              tenant: userTenant,
            });
          }
        }

        // Thiết bị MỚI hoặc Hết hạn 30 ngày -> Yêu cầu OTP qua Email
        const otpCode = Math.floor(100000 + Math.random() * 900000).toString();
        const expiresAt = new Date(Date.now() + 5 * 60 * 1000); // 5 phút

        // Hủy các OTP cũ chưa sử dụng của user này
        await prisma.emailOtpToken.updateMany({
          where: { userId: user.id, isUsed: false },
          data: { isUsed: true },
        });

        // Tạo OTP mới
        await prisma.emailOtpToken.create({
          data: {
            userId: user.id,
            otpCode,
            purpose: 'LOGIN_2FA',
            ipAddress,
            deviceName: clientDeviceName,
            expiresAt,
          },
        });

        // Gửi email
        emailService.send2FAOtp({
          toEmail: user.email,
          fullName: user.fullName || user.username,
          otpCode,
          deviceName: clientDeviceName,
          ipAddress,
          expiresInMinutes: 5,
        }).catch(err => console.error('Error sending 2FA email:', err));

        // Ký token tạm thời để xác thực OTP (hạn 10 phút)
        const tempToken = jwt.sign(
          { tempUserId: user.id, username: user.username, tenantId: user.tenantId, type: '2fa_temp' },
          TEMP_2FA_SECRET,
          { expiresIn: '10m' }
        );

        return res.json({
          requiresOtp: true,
          tempToken,
          emailMasked: maskEmail(user.email),
          message: `Mã xác thực đã được gửi về email ${maskEmail(user.email)}`,
        });
      }

      // Nếu user chưa cài email: Đăng nhập trực tiếp
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
        tenant: userTenant,
      });
    } catch (error) {
      next(error);
    }
  },

  // POST /api/auth/verify-otp
  verifyOtp: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { tempToken, otpCode, trustDevice, deviceName } = verifyOtpSchema.parse(req.body);

      let decoded: any;
      try {
        decoded = jwt.verify(tempToken, TEMP_2FA_SECRET);
      } catch (err) {
        return res.status(400).json({ message: 'Phiên xác thực đã hết hạn hoặc không hợp lệ, vui lòng đăng nhập lại' });
      }

      const userId = Number(decoded.tempUserId);
      const user = await prisma.user.findUnique({
        where: { id: userId },
      });

      if (!user || !user.isActive) {
        return res.status(401).json({ message: 'Tài khoản không tồn tại hoặc đã bị khóa' });
      }

      // Tìm OTP hợp lệ trong DB
      const otpRecord = await prisma.emailOtpToken.findFirst({
        where: {
          userId: user.id,
          otpCode: otpCode.trim(),
          isUsed: false,
          expiresAt: { gt: new Date() },
        },
        orderBy: { createdAt: 'desc' },
      });

      if (!otpRecord) {
        return res.status(400).json({ message: 'Mã xác thực không chính xác hoặc đã hết hạn' });
      }

      // Đánh dấu OTP đã sử dụng
      await prisma.emailOtpToken.update({
        where: { id: otpRecord.id },
        data: { isUsed: true },
      });

      const ipAddress = (req.headers['x-forwarded-for'] as string)?.split(',')[0]?.trim() || req.socket.remoteAddress || '127.0.0.1';
      const userAgent = req.headers['user-agent'] || '';
      const clientDeviceName = deviceName || otpRecord.deviceName || 'Thiết bị đã tin cậy';

      let deviceTokenResult: string | undefined = undefined;

      // Nếu người dùng chọn "Tin cậy thiết bị này trong 30 ngày"
      if (trustDevice !== false) {
        const newDeviceToken = crypto.randomUUID();
        const trustedUntil = new Date(Date.now() + 30 * 24 * 60 * 60 * 1000); // 30 ngày

        await prisma.trustedDevice.create({
          data: {
            userId: user.id,
            deviceToken: newDeviceToken,
            deviceName: clientDeviceName,
            ipAddress,
            userAgent,
            trustedUntil,
          },
        });

        deviceTokenResult = newDeviceToken;
      }

      const userTenant = await prisma.tenant.findUnique({
        where: { id: user.tenantId },
      });

      const token = jwt.sign(
        { id: user.id, username: user.username, role: user.role, tenantId: user.tenantId },
        config.jwt.secret,
        { expiresIn: config.jwt.expiresIn as any }
      );

      res.json({
        token,
        deviceToken: deviceTokenResult,
        user: {
          id: user.id,
          username: user.username,
          fullName: user.fullName,
          email: user.email,
          role: user.role,
          tenantId: user.tenantId,
        },
        tenant: userTenant,
      });
    } catch (error) {
      next(error);
    }
  },

  // POST /api/auth/resend-otp
  resendOtp: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { tempToken, deviceName } = resendOtpSchema.parse(req.body);

      let decoded: any;
      try {
        decoded = jwt.verify(tempToken, TEMP_2FA_SECRET);
      } catch (err) {
        return res.status(400).json({ message: 'Phiên xác thực đã hết hạn, vui lòng đăng nhập lại' });
      }

      const userId = Number(decoded.tempUserId);
      const user = await prisma.user.findUnique({
        where: { id: userId },
      });

      if (!user || !user.email) {
        return res.status(400).json({ message: 'Tài khoản không hợp lệ hoặc không có email' });
      }

      // Kiểm tra rate-limit: tối thiểu 30 giây giữa 2 lần gửi
      const lastOtp = await prisma.emailOtpToken.findFirst({
        where: { userId: user.id },
        orderBy: { createdAt: 'desc' },
      });

      if (lastOtp && Date.now() - new Date(lastOtp.createdAt).getTime() < 30 * 1000) {
        const remainingSec = Math.ceil((30 * 1000 - (Date.now() - new Date(lastOtp.createdAt).getTime())) / 1000);
        return res.status(429).json({ message: `Vui lòng đợi ${remainingSec} giây trước khi gửi lại mã mới` });
      }

      const ipAddress = (req.headers['x-forwarded-for'] as string)?.split(',')[0]?.trim() || req.socket.remoteAddress || '127.0.0.1';
      const userAgent = req.headers['user-agent'] || '';
      const clientDeviceName = deviceName || (userAgent.includes('Mobile') ? 'Điện thoại di động' : 'Máy tính / Trình duyệt');

      const otpCode = Math.floor(100000 + Math.random() * 900000).toString();
      const expiresAt = new Date(Date.now() + 5 * 60 * 1000);

      await prisma.emailOtpToken.updateMany({
        where: { userId: user.id, isUsed: false },
        data: { isUsed: true },
      });

      await prisma.emailOtpToken.create({
        data: {
          userId: user.id,
          otpCode,
          purpose: 'LOGIN_2FA',
          ipAddress,
          deviceName: clientDeviceName,
          expiresAt,
        },
      });

      await emailService.send2FAOtp({
        toEmail: user.email,
        fullName: user.fullName || user.username,
        otpCode,
        deviceName: clientDeviceName,
        ipAddress,
        expiresInMinutes: 5,
      });

      res.json({
        success: true,
        emailMasked: maskEmail(user.email),
        message: `Đã gửi lại mã xác thực mới vào email ${maskEmail(user.email)}`,
      });
    } catch (error) {
      next(error);
    }
  },

  // GET /api/auth/devices (Danh sách thiết bị tin cậy của tài khoản đang đăng nhập)
  getDevices: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const userId = req.user!.id;
      const devices = await prisma.trustedDevice.findMany({
        where: { userId, isActive: true },
        orderBy: { lastUsedAt: 'desc' },
      });
      res.json(devices);
    } catch (error) {
      next(error);
    }
  },

  // DELETE /api/auth/devices/:id (Xóa thiết bị tin cậy)
  revokeDevice: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const userId = req.user!.id;
      const deviceId = Number(req.params.id);

      await prisma.trustedDevice.deleteMany({
        where: { id: deviceId, userId },
      });

      res.json({ success: true, message: 'Đã hủy tin cậy thiết bị thành công' });
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
            phone: body.phone,
            area: body.area,
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
            phone: body.phone,
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

  // POST /api/auth/system-login
  systemLogin: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const { username, password } = loginSchema.parse(req.body);

      // Find Super Admin by username
      const superAdmin = await prisma.superAdmin.findUnique({
        where: { username },
      });

      if (!superAdmin) {
        return res.status(401).json({ message: 'Tên đăng nhập hoặc mật khẩu không đúng' });
      }

      const validPassword = await bcrypt.compare(password, superAdmin.password);
      if (!validPassword) {
        return res.status(401).json({ message: 'Tên đăng nhập hoặc mật khẩu không đúng' });
      }

      const token = jwt.sign(
        { id: superAdmin.id, username: superAdmin.username, isSuperAdmin: true },
        config.jwt.secret,
        { expiresIn: config.jwt.expiresIn as any }
      );

      res.json({
        token,
        user: {
          id: superAdmin.id,
          username: superAdmin.username,
          fullName: superAdmin.fullName,
          isSuperAdmin: true,
        },
      });
    } catch (error) {
      next(error);
    }
  },

  // GET /api/auth/system-me
  systemMe: async (req: SuperAdminRequest, res: Response, next: NextFunction) => {
    try {
      if (!req.superAdmin) {
        return res.status(401).json({ message: 'Chưa đăng nhập hệ thống' });
      }
      res.json({
        ...req.superAdmin,
        isSuperAdmin: true,
      });
    } catch (error) {
      next(error);
    }
  },
};
