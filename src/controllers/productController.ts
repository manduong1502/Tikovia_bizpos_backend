import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { config } from '../config';

const productSchema = z.object({
  sku: z.string().min(1, 'Mã hàng không được trống'),
  name: z.string().min(1, 'Tên hàng không được trống'),
  barcode: z.string().optional().nullable(),
  categoryId: z.number().int().optional().nullable(),
  costPrice: z.number().min(0).default(0),
  sellPrice: z.number().min(0).default(0),
  stock: z.number().int().default(0),
  minStock: z.number().int().default(0),
  unit: z.string().default('Cái'),
  image: z.string().optional().nullable(),
  isActive: z.boolean().default(true),
});

export const productController = {
  // GET /api/products/all — lấy tất cả (cho dropdown/select)
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const products = await prisma.product.findMany({
        where: { isActive: true },
        include: { category: { select: { id: true, name: true } } },
        orderBy: { createdAt: 'desc' },
      });
      res.json(products);
    } catch (error) {
      next(error);
    }
  },

  // GET /api/products — phân trang + tìm kiếm
  list: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const page = Math.max(1, parseInt(req.query.page as string) || config.pagination.defaultPage);
      const limit = Math.min(config.pagination.maxLimit, parseInt(req.query.limit as string) || config.pagination.defaultLimit);
      const search = (req.query.search as string) || '';
      const categoryId = req.query.categoryId ? parseInt(req.query.categoryId as string) : undefined;

      const where: any = { isActive: true };
      if (search) {
        where.OR = [
          { name: { contains: search, mode: 'insensitive' } },
          { sku: { contains: search, mode: 'insensitive' } },
          { barcode: { contains: search, mode: 'insensitive' } },
        ];
      }
      if (categoryId) where.categoryId = categoryId;

      const [data, total] = await Promise.all([
        prisma.product.findMany({
          where,
          include: { category: { select: { id: true, name: true } } },
          skip: (page - 1) * limit,
          take: limit,
          orderBy: { createdAt: 'desc' },
        }),
        prisma.product.count({ where }),
      ]);

      res.json({ data, total, page, limit, totalPages: Math.ceil(total / limit) });
    } catch (error) {
      next(error);
    }
  },

  // GET /api/products/:id
  getById: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const product = await prisma.product.findUnique({
        where: { id: Number(req.params.id) },
        include: { category: true },
      });
      if (!product) return res.status(404).json({ message: 'Không tìm thấy hàng hóa' });
      res.json(product);
    } catch (error) {
      next(error);
    }
  },

  // POST /api/products
  create: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const data = productSchema.parse(req.body);
      const product = await prisma.product.create({
        data,
        include: { category: { select: { id: true, name: true } } },
      });
      res.status(201).json(product);
    } catch (error) {
      next(error);
    }
  },

  // PUT /api/products/:id
  update: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const data = productSchema.partial().parse(req.body);
      const product = await prisma.product.update({
        where: { id: Number(req.params.id) },
        data,
        include: { category: { select: { id: true, name: true } } },
      });
      res.json(product);
    } catch (error) {
      next(error);
    }
  },

  // DELETE /api/products/:id (soft delete)
  delete: async (req: Request, res: Response, next: NextFunction) => {
    try {
      await prisma.product.update({
        where: { id: Number(req.params.id) },
        data: { isActive: false },
      });
      res.json({ message: 'Đã xóa hàng hóa' });
    } catch (error) {
      next(error);
    }
  },
};
