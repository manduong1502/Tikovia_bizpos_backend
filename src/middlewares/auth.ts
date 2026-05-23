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

