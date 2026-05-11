import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { config } from '../config';

const customerSchema = z.object({
  code: z.string().min(1, 'Mã KH không được trống'),
  name: z.string().min(1, 'Tên KH không được trống'),
  phone: z.string().optional().nullable(),
  email: z.string().email('Email không hợp lệ').optional().nullable(),
  address: z.string().optional().nullable(),
  note: z.string().optional().nullable(),
});

export const customerController = {
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const page = Math.max(1, parseInt(req.query.page as string) || config.pagination.defaultPage);
      const limit = Math.min(config.pagination.maxLimit, parseInt(req.query.limit as string) || config.pagination.defaultLimit);
      const search = (req.query.search as string) || '';

      const where: any = {};
      if (search) {
        where.OR = [
          { name: { contains: search, mode: 'insensitive' } },
          { code: { contains: search, mode: 'insensitive' } },
          { phone: { contains: search, mode: 'insensitive' } },
        ];
      }

      const [data, total] = await Promise.all([
        prisma.customer.findMany({
          where,
          skip: (page - 1) * limit,
          take: limit,
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
      const customer = await prisma.customer.findUnique({
        where: { id: Number(req.params.id) },
        include: { orders: { take: 10, orderBy: { createdAt: 'desc' } } },
      });
      if (!customer) return res.status(404).json({ message: 'Không tìm thấy khách hàng' });
      res.json(customer);
    } catch (error) {
      next(error);
    }
  },

  create: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const data = customerSchema.parse(req.body);
      const customer = await prisma.customer.create({ data });
      res.status(201).json(customer);
    } catch (error) {
      next(error);
    }
  },

  update: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const data = customerSchema.partial().parse(req.body);
      const customer = await prisma.customer.update({
        where: { id: Number(req.params.id) },
        data,
      });
      res.json(customer);
    } catch (error) {
      next(error);
    }
  },

  delete: async (req: Request, res: Response, next: NextFunction) => {
    try {
      await prisma.customer.delete({ where: { id: Number(req.params.id) } });
      res.json({ message: 'Đã xóa khách hàng' });
    } catch (error) {
      next(error);
    }
  },
};
