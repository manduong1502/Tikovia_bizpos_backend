import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { config } from '../config';
import { AuthRequest } from '../middlewares/auth';

const customerSchema = z.object({
  code: z.preprocess((val) => val === null || val === '' ? undefined : val, z.string().optional()),
  name: z.string().min(1, 'Tên KH không được trống'),
  phone: z.string().optional().nullable(),
  email: z.preprocess((val) => {
    if (typeof val === 'string') {
      const trimmed = val.trim();
      return trimmed === '' ? null : trimmed;
    }
    return val;
  }, z.string().email('Email không hợp lệ').optional().nullable()),
  address: z.string().optional().nullable(),
  note: z.string().optional().nullable(),
  customerType: z.string().optional().nullable(),
  branch: z.string().optional().nullable(),
  totalSpent: z.preprocess((val) => val === undefined || val === '' || val === null ? 0 : Number(val), z.number().optional()),
  totalDebt: z.preprocess((val) => val === undefined || val === '' || val === null ? 0 : Number(val), z.number().optional()),
  isActive: z.preprocess((val) => {
    if (typeof val === 'string') return val === 'true';
    if (typeof val === 'boolean') return val;
    return true;
  }, z.boolean().optional()),
  createdBy: z.string().optional().nullable(),
  latitude: z.preprocess((val) => val === undefined || val === '' || val === null ? null : Number(val), z.number().optional().nullable()),
  longitude: z.preprocess((val) => val === undefined || val === '' || val === null ? null : Number(val), z.number().optional().nullable()),
});

function parseExcelDate(val: any): Date | null {
  if (!val) return null;
  if (val instanceof Date && !isNaN(val.getTime())) return val;
  const num = Number(val);
  if (!isNaN(num) && num > 10000 && num < 99999) {
    const ms = (num - 25569) * 86400 * 1000;
    const d = new Date(ms);
    if (!isNaN(d.getTime())) return d;
  }
  if (!isNaN(num) && num > 1000000000000) {
    const d = new Date(num);
    if (!isNaN(d.getTime())) return d;
  }
  const str = String(val).trim();
  const d = new Date(str);
  if (!isNaN(d.getTime())) return d;
  const parts = str.split(/[/\-_]/);
  if (parts.length >= 3) {
    const day = parseInt(parts[0], 10);
    const month = parseInt(parts[1], 10) - 1;
    const year = parseInt(parts[2], 10);
    const d2 = new Date(year, month, day);
    if (!isNaN(d2.getTime())) return d2;
  }
  return null;
}

export const customerController = {
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const page = Math.max(1, parseInt(req.query.page as string) || config.pagination.defaultPage);
      const limit = Math.min(config.pagination.maxLimit, parseInt(req.query.limit as string) || config.pagination.defaultLimit);
      const search = (req.query.search as string) || '';
      const email = (req.query.email as string) || '';
      const address = (req.query.address as string) || '';
      const note = (req.query.note as string) || '';
      const orderCode = (req.query.orderCode as string) || '';

      const where: any = { tenantId };
      const andConditions: any[] = [];

      if (search) {
        andConditions.push({
          OR: [
            { name: { contains: search, mode: 'insensitive' } },
            { code: { contains: search, mode: 'insensitive' } },
            { phone: { contains: search, mode: 'insensitive' } },
          ]
        });
      }

      if (email) {
        andConditions.push({ email: { contains: email, mode: 'insensitive' } });
      }

      if (address) {
        andConditions.push({ address: { contains: address, mode: 'insensitive' } });
      }

      if (note) {
        andConditions.push({ note: { contains: note, mode: 'insensitive' } });
      }

      if (orderCode) {
        andConditions.push({
          orders: {
            some: {
              code: { contains: orderCode, mode: 'insensitive' }
            }
          }
        });
      }

      if (andConditions.length > 0) {
        where.AND = andConditions;
      }

      const [data, total] = await Promise.all([
        prisma.customer.findMany({
          where,
          skip: (page - 1) * limit,
          take: limit,
          include: {
            orders: {
              select: {
                code: true,
                createdAt: true,
                total: true,
                paid: true,
                discount: true,
                status: true
              },
              orderBy: { createdAt: 'desc' }
            }
          },
          orderBy: { createdAt: 'desc' },
        }),
        prisma.customer.count({ where }),
      ]);

      res.json({ data, total, page, limit, totalPages: Math.ceil(total / limit) });
    } catch (error) {
      next(error);
    }
  },

  getById: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const customer = await prisma.customer.findFirst({
        where: { id: Number(req.params.id), tenantId },
        include: { orders: { take: 10, orderBy: { createdAt: 'desc' } } },
      });
      if (!customer) return res.status(404).json({ message: 'Không tìm thấy khách hàng' });
      res.json(customer);
    } catch (error) {
      next(error);
    }
  },

  create: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const bodyData = { ...req.body };
      if (bodyData.debt !== undefined && bodyData.totalDebt === undefined) {
        bodyData.totalDebt = Number(bodyData.debt);
      }
      const parsed = customerSchema.parse(bodyData);
      
      const existingName = await prisma.customer.findFirst({
        where: { tenantId, name: parsed.name }
      });
      if (existingName) return res.status(400).json({ message: 'Tên khách hàng đã tồn tại' });
      
      const code = parsed.code && parsed.code.trim() !== '' ? parsed.code.trim() : `KH${Math.floor(100000 + Math.random() * 900000)}`;
      const customer = await prisma.customer.create({
        data: {
          ...parsed,
          code,
          tenantId,
        }
      });
      res.status(201).json(customer);
    } catch (error) {
      next(error);
    }
  },

  update: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const bodyData = { ...req.body };
      if (bodyData.debt !== undefined && bodyData.totalDebt === undefined) {
        bodyData.totalDebt = Number(bodyData.debt);
      }
      const data = customerSchema.partial().parse(bodyData);
      
      const existingCustomer = await prisma.customer.findFirst({
        where: { id: Number(req.params.id), tenantId }
      });
      if (!existingCustomer) return res.status(404).json({ message: 'Không tìm thấy khách hàng' });

      if (data.name) {
        const existingName = await prisma.customer.findFirst({
          where: { tenantId, name: data.name, id: { not: Number(req.params.id) } }
        });
        if (existingName) return res.status(400).json({ message: 'Tên khách hàng đã tồn tại' });
      }

      const customer = await prisma.customer.update({
        where: { id: Number(req.params.id) },
        data,
      });
      res.json(customer);
    } catch (error) {
      next(error);
    }
  },

  delete: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      
      const existingCustomer = await prisma.customer.findFirst({
        where: { id: Number(req.params.id), tenantId }
      });
      if (!existingCustomer) return res.status(404).json({ message: 'Không tìm thấy khách hàng' });

      await prisma.customer.delete({ where: { id: Number(req.params.id) } });
      res.json({ message: 'Đã xóa khách hàng' });
    } catch (error) {
      next(error);
    }
  },

  importExcel: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const items = req.body.items || [];
      const tenantId = req.user!.tenantId;
      let importedCount = 0;

      const CHUNK_SIZE = 100;
      for (let i = 0; i < items.length; i += CHUNK_SIZE) {
        const chunk = items.slice(i, i + CHUNK_SIZE);
        await prisma.$transaction(async (tx) => {
          for (const item of chunk) {
            const code = item.code && item.code.trim() !== '' ? item.code.trim() : `KH${Math.floor(Math.random() * 100000).toString().padStart(5, '0')}`;
            
            const customerData = {
              name: item.name,
              phone: item.phone || null,
              email: item.email || null,
              address: item.address || null,
              note: item.note || null,
              customerType: item.customerType || null,
              branch: item.branch || null,
              totalSpent: item.totalSpent !== undefined ? Number(item.totalSpent) : 0,
              totalDebt: item.totalDebt !== undefined ? Number(item.totalDebt) : 0,
              isActive: item.isActive !== undefined ? Boolean(item.isActive) : true,
              createdBy: item.createdBy || null,
              lastTransaction: parseExcelDate(item.lastTransaction),
              createdAt: parseExcelDate(item.createdAt) || new Date(),
              latitude: item.latitude !== undefined && item.latitude !== null && item.latitude !== '' ? Number(item.latitude) : null,
              longitude: item.longitude !== undefined && item.longitude !== null && item.longitude !== '' ? Number(item.longitude) : null,
            };

            const ex = await tx.customer.findUnique({
              where: {
                tenantId_code: {
                  tenantId,
                  code,
                },
              },
            });
            if (ex) {
              await tx.customer.update({
                where: { id: ex.id },
                data: customerData,
              });
            } else {
              await tx.customer.create({
                data: {
                  code,
                  ...customerData,
                  tenantId,
                },
              });
            }
            importedCount++;
          }
        });
      }

      res.status(201).json({ message: `Đã import thành công ${importedCount} khách hàng`, count: importedCount });
    } catch (error) {
      next(error);
    }
  },
};
