import { Request, Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';
import { config } from '../config';
import prisma from '../config/database';
import { TenantInfo } from './tenant';

export interface AuthRequest extends Request {
  tenant?: TenantInfo;
  user?: {
    id: number;
    username: string;
    role: string;
    tenantId: number;
  };
}

export const authenticate = async (req: AuthRequest, res: Response, next: NextFunction) => {
  try {
    const authHeader = req.headers.authorization;
    if (!authHeader?.startsWith('Bearer ')) {
      return res.status(401).json({ message: 'Token xác thực không hợp lệ' });
    }

    const token = authHeader.split(' ')[1];
    const decoded = jwt.verify(token, config.jwt.secret) as { id: number; username: string; role: string };

    // Verify user still exists, is active, and belongs to the current tenant
    const user = await prisma.user.findUnique({ where: { id: decoded.id } });
    if (!user || !user.isActive) {
      return res.status(401).json({ message: 'Tài khoản không tồn tại hoặc đã bị khóa' });
    }

    if (req.tenant && user.tenantId !== req.tenant.id) {
      return res.status(401).json({ message: 'Tài khoản không thuộc cửa hàng này' });
    }

    req.user = { id: decoded.id, username: decoded.username, role: decoded.role, tenantId: user.tenantId };
    next();
  } catch (error) {
    return res.status(401).json({ message: 'Phiên đăng nhập đã hết hạn' });
  }
};

// Role-based authorization
export const authorize = (...roles: string[]) => {
  return (req: AuthRequest, res: Response, next: NextFunction) => {
    if (!req.user || !roles.includes(req.user.role)) {
      return res.status(403).json({ message: 'Bạn không có quyền thực hiện thao tác này' });
    }
    next();
  };
};

export interface SuperAdminRequest extends Request {
  superAdmin?: {
    id: number;
    username: string;
    fullName: string;
  };
}

export const authenticateSuperAdmin = async (req: SuperAdminRequest, res: Response, next: NextFunction) => {
  try {
    const authHeader = req.headers.authorization;
    if (!authHeader?.startsWith('Bearer ')) {
      return res.status(401).json({ message: 'Token xác thực không hợp lệ' });
    }

    const token = authHeader.split(' ')[1];
    const decoded = jwt.verify(token, config.jwt.secret) as { id: number; username: string; isSuperAdmin: boolean };

    if (!decoded.isSuperAdmin) {
      return res.status(403).json({ message: 'Tài khoản không có quyền truy cập hệ thống' });
    }

    const superAdmin = await prisma.superAdmin.findUnique({ where: { id: decoded.id } });
    if (!superAdmin) {
      return res.status(401).json({ message: 'Tài khoản Super Admin không tồn tại' });
    }

    req.superAdmin = { id: superAdmin.id, username: superAdmin.username, fullName: superAdmin.fullName };
    next();
  } catch (error) {
    return res.status(401).json({ message: 'Phiên đăng nhập đã hết hạn' });
  }
};

// Middleware xác thực phối hợp: Cho phép JWT User thông thường HOẶC Driver dùng Shared Secret
export const authenticateDriverOrUser = async (req: AuthRequest, res: Response, next: NextFunction) => {
  try {
    const authHeader = req.headers.authorization;
    if (authHeader?.startsWith('Bearer ')) {
      const token = authHeader.split(' ')[1];
      
      // Kiểm tra nếu là Driver dùng Shared Secret
      if (token === config.driverSharedSecret) {
        req.user = {
          id: 0,
          username: 'driver',
          role: 'STAFF',
          tenantId: req.tenant?.id || 1
        };
        return next();
      }
    }
    
    // Nếu không khớp với driver secret, thử xác thực bằng JWT thông thường
    return authenticate(req, res, next);
  } catch (error) {
    return res.status(401).json({ message: 'Lỗi xác thực quyền truy cập' });
  }
};


