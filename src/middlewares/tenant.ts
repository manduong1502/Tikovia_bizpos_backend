import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';

export interface TenantInfo {
  id: number;
  name: string;
  subdomain: string;
  plan: string;
  isActive: boolean;
  expiredAt?: Date | null;
}

export interface TenantRequest extends Request {
  tenant?: TenantInfo;
}

export const tenantResolver = async (req: TenantRequest, res: Response, next: NextFunction) => {
  // Bỏ qua giải phân giải tenant cho các route public hệ thống
  const publicPaths = ['/tenants/register', '/auth/register-tenant', '/health'];
  if (publicPaths.some(path => req.path.startsWith(path))) {
    return next();
  }

  try {
    // 1. Lấy subdomain từ header hoặc từ hostname
    let subdomain = req.headers['x-tenant-subdomain'] as string;
    
    if (!subdomain && req.headers.host) {
      const host = req.headers.host; // e.g. "demo.localhost:5000" or "vietstore.tikobia.vn"
      const parts = host.split('.');
      if (parts.length > 1) {
        const sub = parts[0].toLowerCase();
        // Loại bỏ www hoặc localhost thông thường
        if (sub !== 'www' && sub !== 'localhost' && sub !== '127') {
          subdomain = sub;
        }
      }
    }

    // Fallback cho local development nếu không có subdomain
    if (!subdomain) {
      subdomain = 'demo'; 
    }

    // 2. Tìm kiếm tenant trong Database
    const tenant = await prisma.tenant.findUnique({
      where: { subdomain },
    });

    if (!tenant) {
      return res.status(404).json({ message: `Cửa hàng '${subdomain}' không tồn tại trên hệ thống.` });
    }

    if (!tenant.isActive) {
      return res.status(403).json({ message: `Cửa hàng '${tenant.name}' đã bị tạm khóa.` });
    }

    if (tenant.expiredAt && new Date(tenant.expiredAt) < new Date()) {
      return res.status(403).json({ message: `Cửa hàng '${tenant.name}' đã hết hạn sử dụng. Vui lòng liên hệ quản trị viên hệ thống để gia hạn.` });
    }

    // 3. Gắn thông tin tenant vào request
    req.tenant = {
      id: tenant.id,
      name: tenant.name,
      subdomain: tenant.subdomain,
      plan: tenant.plan,
      isActive: tenant.isActive,
      expiredAt: tenant.expiredAt,
    };

    next();
  } catch (error) {
    next(error);
  }
};
