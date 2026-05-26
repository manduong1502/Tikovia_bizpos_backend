import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { config } from '../config';
import { memoryCache } from '../utils/cache';
import { AuthRequest } from '../middlewares/auth';

const productSchema = z.object({
  sku: z.string().optional().nullable(),
  name: z.string().min(1, 'Tên hàng không được trống'),
  barcode: z.string().optional().nullable(),
  categoryId: z.number().int().optional().nullable(),
  brandId: z.number().int().optional().nullable(),
  supplierId: z.number().int().optional().nullable(),
  costPrice: z.number().min(0),
  sellPrice: z.number().min(0),
  stock: z.number().default(0),
  minStock: z.number().default(0),
  maxStock: z.number().default(999999999),
  unit: z.string().default('Cái'),
  weight: z.number().min(0).optional().nullable(),
  weightUnit: z.string().default('g'),
  location: z.string().optional().nullable(),
  description: z.string().optional().nullable(),
  note: z.string().optional().nullable(),
  image: z.string().optional().nullable(),
  isActive: z.boolean().default(true),
  directSale: z.boolean().default(true),
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

export const productController = {
  // GET /api/products/all — lấy tất cả (cho dropdown/select)
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const cacheKey = memoryCache.tenantKey(tenantId, 'products:all');
      const cached = memoryCache.get(cacheKey);
      if (cached) return res.json(cached);

      const products = await prisma.product.findMany({
        where: { tenantId, isActive: true },
        include: { 
          category: { select: { id: true, name: true } },
          brand: { select: { id: true, name: true } },
          supplier: { select: { id: true, name: true } }
        },
        orderBy: { createdAt: 'desc' },
      });

      memoryCache.set(cacheKey, products, 600); // 10 minutes
      res.json(products);
    } catch (error) {
      next(error);
    }
  },

  // GET /api/products — phân trang + tìm kiếm
  list: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const page = Math.max(1, parseInt(req.query.page as string) || config.pagination.defaultPage);
      const limit = Math.min(config.pagination.maxLimit, parseInt(req.query.limit as string) || config.pagination.defaultLimit);
      const search = (req.query.search as string) || '';
      const categoryId = req.query.categoryId ? parseInt(req.query.categoryId as string) : undefined;

      const cacheKey = memoryCache.tenantKey(tenantId, `products:list:${page}:${limit}:${search}:${categoryId || ''}`);
      const cached = memoryCache.get(cacheKey);
      if (cached) return res.json(cached);

      const where: any = { tenantId, isActive: true };
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
          include: { 
            category: { select: { id: true, name: true } },
            brand: { select: { id: true, name: true } },
            supplier: { select: { id: true, name: true } }
          },
          skip: (page - 1) * limit,
          take: limit,
          orderBy: { createdAt: 'desc' },
        }),
        prisma.product.count({ where }),
      ]);

      const result = { data, total, page, limit, totalPages: Math.ceil(total / limit) };
      memoryCache.set(cacheKey, result, 600); // 10 minutes
      res.json(result);
    } catch (error) {
      next(error);
    }
  },

  // GET /api/products/:id
  getById: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const cacheKey = memoryCache.tenantKey(tenantId, `products:id:${req.params.id}`);
      const cached = memoryCache.get(cacheKey);
      if (cached) return res.json(cached);

      const product = await prisma.product.findFirst({
        where: { id: Number(req.params.id), tenantId },
        include: { category: true, brand: true, supplier: true },
      });
      if (!product) return res.status(404).json({ message: 'Không tìm thấy hàng hóa' });

      memoryCache.set(cacheKey, product, 600); // 10 minutes
      res.json(product);
    } catch (error) {
      next(error);
    }
  },

  // POST /api/products
  create: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const data = productSchema.parse(req.body);
      const tenantId = req.user!.tenantId;
      
      const existingName = await prisma.product.findFirst({
        where: { tenantId, name: data.name }
      });
      if (existingName) return res.status(400).json({ message: 'Tên hàng hóa đã tồn tại' });
      
      // Ensure SKU is unique if manually entered
      if (data.sku && data.sku.trim() !== '') {
        const existingSku = await prisma.product.findFirst({
          where: { tenantId, sku: data.sku.trim(), isActive: true }
        });
        if (existingSku) return res.status(400).json({ message: 'Mã hàng hóa (SKU) đã tồn tại' });
      }

      // Auto-generate sku if empty
      if (!data.sku || data.sku.trim() === '') {
        data.sku = `SP${Math.floor(Math.random() * 100000).toString().padStart(5, '0')}`;
      }

      const product = await prisma.product.create({
        data: {
          ...data,
          tenantId,
        } as any,
        include: { 
          category: { select: { id: true, name: true } },
          brand: { select: { id: true, name: true } },
          supplier: { select: { id: true, name: true } }
        },
      });

      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.status(201).json(product);
    } catch (error) {
      next(error);
    }
  },

  // PUT /api/products/:id
  update: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const bodyData = { ...req.body };
      if (bodyData.sell_price !== undefined) bodyData.sellPrice = Number(bodyData.sell_price);
      if (bodyData.cost_price !== undefined) bodyData.costPrice = Number(bodyData.cost_price);

      const data = productSchema.partial().parse(bodyData);
      
      const existingProduct = await prisma.product.findFirst({
        where: { id: Number(req.params.id), tenantId }
      });
      if (!existingProduct) return res.status(404).json({ message: 'Không tìm thấy hàng hóa' });

      if (data.name) {
        const existingName = await prisma.product.findFirst({
          where: { tenantId, name: data.name, id: { not: Number(req.params.id) } }
        });
        if (existingName) return res.status(400).json({ message: 'Tên hàng hóa đã tồn tại' });
      }

      if (data.sku === '') {
        delete data.sku; // Do not overwrite with empty string
      } else if (data.sku) {
        const existingSku = await prisma.product.findFirst({
          where: { tenantId, sku: data.sku.trim(), id: { not: Number(req.params.id) }, isActive: true }
        });
        if (existingSku) return res.status(400).json({ message: 'Mã hàng hóa (SKU) đã tồn tại' });
      }

      const product = await prisma.product.update({
        where: { id: Number(req.params.id) },
        data: data as any,
        include: { 
          category: { select: { id: true, name: true } },
          brand: { select: { id: true, name: true } },
          supplier: { select: { id: true, name: true } }
        },
      });

      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.json(product);
    } catch (error) {
      next(error);
    }
  },

  // DELETE /api/products/:id (soft delete)
  delete: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      
      const existingProduct = await prisma.product.findFirst({
        where: { id: Number(req.params.id), tenantId }
      });
      if (!existingProduct) return res.status(404).json({ message: 'Không tìm thấy hàng hóa' });

      await prisma.product.update({
        where: { id: Number(req.params.id) },
        data: { isActive: false },
      });

      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.json({ message: 'Đã xóa hàng hóa' });
    } catch (error) {
      next(error);
    }
  },

  // POST /api/products/import
  importExcel: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const items = req.body.items;
      const tenantId = req.user!.tenantId;
      let importedCount = 0;

      await prisma.$transaction(async (tx) => {
        for (const item of items) {
          const sku = item.sku && item.sku.trim() !== '' ? item.sku.trim() : `SP${Math.floor(Math.random() * 100000).toString().padStart(5, '0')}`;
          
          // 1. Resolve Category
          let categoryId = item.categoryId || null;
          if (!categoryId && item.category_name) {
            const catName = item.category_name.trim();
            let cat = await tx.category.findFirst({ where: { tenantId, name: catName } });
            if (!cat) {
              cat = await tx.category.create({ data: { name: catName, tenantId } });
            }
            categoryId = cat.id;
          }

          // 2. Resolve Brand
          let brandId = item.brandId || null;
          if (!brandId && item.brand_name) {
            const brandName = item.brand_name.trim();
            let br = await tx.brand.findFirst({ where: { tenantId, name: brandName } });
            if (!br) {
              br = await tx.brand.create({ data: { name: brandName, tenantId } });
            }
            brandId = br.id;
          }

          // 3. Resolve Supplier
          let supplierId = item.supplierId || null;
          if (!supplierId && item.supplier_name) {
            const supName = item.supplier_name.trim();
            let sup = await tx.supplier.findFirst({ where: { tenantId, name: supName } });
            if (!sup) {
              sup = await tx.supplier.create({ data: { code: `NCC${String(Date.now()).slice(-6)}${Math.floor(Math.random() * 100)}`, name: supName, tenantId } });
            }
            supplierId = sup.id;
          }

          const productData = {
            name: item.name,
            barcode: item.barcode || null,
            categoryId,
            brandId,
            supplierId,
            costPrice: item.costPrice !== undefined ? Number(item.costPrice) : 0,
            sellPrice: item.sellPrice !== undefined ? Number(item.sellPrice) : 0,
            stock: item.stock !== undefined ? Number(item.stock) : 0,
            minStock: item.minStock !== undefined ? Number(item.minStock) : 0,
            maxStock: item.maxStock !== undefined ? Number(item.maxStock) : 999999999,
            unit: item.unit || 'Cái',
            weight: item.weight !== undefined ? Number(item.weight) : null,
            weightUnit: item.weightUnit || 'g',
            location: item.location || null,
            description: item.description || null,
            note: item.note || null,
            image: item.image || null,
            isActive: item.isActive !== undefined ? Boolean(item.isActive) : true,
            directSale: item.directSale !== undefined ? Boolean(item.directSale) : true,
            createdAt: parseExcelDate(item.createdAt) || new Date(),
            tenantId,
          };

          const ex = await tx.product.findUnique({
            where: {
              tenantId_sku: {
                tenantId,
                sku,
              },
            },
          });
          if (ex) {
            await tx.product.update({
              where: { id: ex.id },
              data: productData,
            });
          } else {
            await tx.product.create({
              data: {
                sku,
                ...productData,
              },
            });
          }
          importedCount++;
        }
      });

      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      memoryCache.delete(memoryCache.tenantKey(tenantId, 'categories:all'));
      memoryCache.delete(memoryCache.tenantKey(tenantId, 'brands:all'));
      res.status(201).json({ message: `Đã import thành công ${importedCount} hàng hóa`, count: importedCount });
    } catch (error) {
      next(error);
    }
  },
};
