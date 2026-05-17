import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';

const orderItemSchema = z.object({
  productId: z.number().int(),
  quantity: z.number().min(0.001),
  price: z.coerce.number().min(0),
  discount: z.coerce.number().min(0).default(0),
});

const createOrderSchema = z.object({
  customerId: z.number().int().optional().nullable(),
  items: z.array(orderItemSchema).min(1, 'Đơn hàng phải có ít nhất 1 sản phẩm'),
  discount: z.coerce.number().min(0).default(0),
  paid: z.coerce.number().min(0).default(0),
  paymentMethod: z.enum(['CASH', 'CARD', 'TRANSFER', 'MIXED']).default('CASH'),
  note: z.string().optional().nullable(),
});

// Auto-generate order code: HD000001, HD000002...
async function generateOrderCode(): Promise<string> {
  const lastOrder = await prisma.order.findFirst({ orderBy: { id: 'desc' } });
  const nextNum = (lastOrder?.id || 0) + 1;
  return `HD${String(nextNum).padStart(6, '0')}`;
}

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

export const orderController = {
  // GET /api/orders — phân trang + lọc
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const page = Math.max(1, parseInt(req.query.page as string) || 1);
      const limit = Math.min(100, parseInt(req.query.limit as string) || 20);
      const status = req.query.status as string;
      const from = req.query.from as string;
      const to = req.query.to as string;
      const search = req.query.search as string;

      const where: any = {};
      if (status) where.status = status;
      if (from || to) {
        where.createdAt = {};
        if (from) where.createdAt.gte = new Date(from);
        if (to) where.createdAt.lte = new Date(to + 'T23:59:59.999Z');
      }
      if (search) {
        where.OR = [
          { code: { contains: search, mode: 'insensitive' } },
          { customer: { name: { contains: search, mode: 'insensitive' } } },
        ];
      }

      const [data, total] = await Promise.all([
        prisma.order.findMany({
          where,
          include: {
            customer: { select: { id: true, name: true, phone: true } },
            user: { select: { id: true, fullName: true } },
            _count: { select: { items: true } },
          },
          skip: (page - 1) * limit,
          take: limit,
          orderBy: { createdAt: 'desc' },
        }),
        prisma.order.count({ where }),
      ]);

      res.json({ data, total, page, limit, totalPages: Math.ceil(total / limit) });
    } catch (error) {
      next(error);
    }
  },

  // GET /api/orders/:id
  getById: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const order = await prisma.order.findUnique({
        where: { id: Number(req.params.id) },
        include: {
          customer: true,
          user: { select: { id: true, fullName: true } },
          items: { include: { product: { select: { id: true, sku: true, name: true } } } },
        },
      });
      if (!order) return res.status(404).json({ message: 'Không tìm thấy đơn hàng' });
      res.json(order);
    } catch (error) {
      next(error);
    }
  },

  // POST /api/orders — tạo đơn hàng mới (Transaction để đảm bảo data consistency)
  create: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const body = createOrderSchema.parse(req.body);
      const code = await generateOrderCode();

      const order = await prisma.$transaction(async (tx) => {
        // Calculate totals
        let subtotal = 0;
        const itemsData = body.items.map((item) => {
          const itemTotal = item.quantity * item.price - item.discount;
          subtotal += itemTotal;
          return {
            productId: item.productId,
            quantity: item.quantity,
            price: item.price,
            discount: item.discount,
            total: itemTotal,
          };
        });

        const total = subtotal - body.discount;

        // Create order
        const newOrder = await tx.order.create({
          data: {
            code,
            customerId: body.customerId,
            userId: req.user!.id,
            subtotal,
            discount: body.discount,
            total,
            paid: body.paid || total,
            paymentMethod: body.paymentMethod,
            note: body.note,
            status: 'COMPLETED',
            items: { create: itemsData },
          },
          include: {
            items: { include: { product: { select: { id: true, name: true } } } },
            customer: { select: { id: true, name: true } },
          },
        });

        // Deduct stock for each product
        for (const item of body.items) {
          await tx.product.update({
            where: { id: item.productId },
            data: { stock: { decrement: item.quantity } },
          });
        }

        // Update Customer metrics if any
        if (body.customerId) {
          const debtChange = total - body.paid;
          await tx.customer.update({
            where: { id: body.customerId },
            data: {
              totalSpent: { increment: total },
              totalOrders: { increment: 1 },
              totalDebt: { increment: debtChange },
            },
          });
        }

        return newOrder;
      });

      res.status(201).json(order);
    } catch (error) {
      next(error);
    }
  },

  // PUT /api/orders/:id/cancel
  cancel: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const id = Number(req.params.id);
      const order = await prisma.order.findUnique({
        where: { id },
        include: { items: true },
      });

      if (!order) return res.status(404).json({ message: 'Không tìm thấy đơn hàng' });
      if (order.status === 'CANCELLED') return res.status(400).json({ message: 'Đơn hàng đã hủy trước đó' });

      // Transaction: cancel order + restore stock
      await prisma.$transaction(async (tx) => {
        await tx.order.update({
          where: { id },
          data: { status: 'CANCELLED' },
        });

        // Restore stock
        for (const item of order.items) {
          await tx.product.update({
            where: { id: item.productId },
            data: { stock: { increment: item.quantity } },
          });
        }

        // Revert customer stats
        if (order.customerId) {
          await tx.customer.update({
            where: { id: order.customerId },
            data: {
              totalSpent: { decrement: order.total },
              totalOrders: { decrement: 1 },
            },
          });
        }
      });

      res.json({ message: 'Đã hủy đơn hàng' });
    } catch (error) {
      next(error);
    }
  },

  importExcel: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const orders = req.body.orders || req.body.items;
      let importedCount = 0;

      await prisma.$transaction(async (tx) => {
        for (const orderData of orders) {
          const code = orderData.code || orderData.order_code || await generateOrderCode();
          
          // 1. Resolve Customer
          let customerId = orderData.customerId || null;
          if (!customerId && (orderData.customer_code || orderData.customer_name || orderData.customer_phone)) {
            const custCode = orderData.customer_code || `KH${String(Date.now()).slice(-6)}${Math.floor(Math.random() * 1000)}`;
            const custPhone = orderData.customer_phone || null;
            
            // Try finding existing by code or phone
            let existingCust = null;
            if (custCode && custCode !== 'KH...') existingCust = await tx.customer.findUnique({ where: { code: custCode } });
            if (!existingCust && custPhone) existingCust = await tx.customer.findFirst({ where: { phone: custPhone } });

            if (existingCust) {
              customerId = existingCust.id;
            } else {
              const newCust = await tx.customer.create({
                data: {
                  code: custCode,
                  name: orderData.customer_name || 'Khách lẻ',
                  phone: custPhone,
                  address: orderData.customer_address || null,
                }
              });
              customerId = newCust.id;
            }
          }

          // 2. Resolve Items & Products
          let subtotal = 0;
          const itemsToCreate = [];

          const itemsList = orderData.items || [];
          for (const item of itemsList) {
            let productId = item.productId;
            if (!productId) {
              const pSku = item.product_sku || `SP-HD-${code}-${Math.floor(Math.random() * 10000)}`;
              let existingProd = await tx.product.findUnique({ where: { sku: pSku } });
              if (!existingProd && item.product_name) {
                existingProd = await tx.product.findFirst({ where: { name: item.product_name } });
              }
              if (existingProd) {
                productId = existingProd.id;
              } else {
                const newProd = await tx.product.create({
                  data: {
                    sku: pSku,
                    name: item.product_name || 'Hàng hóa chung',
                    sellPrice: item.price !== undefined ? item.price : (item.unit_price || 0),
                    unit: item.unit || 'Cái',
                  }
                });
                productId = newProd.id;
              }
            }

            const qty = item.quantity ? Number(item.quantity) : 1;
            const prc = item.price !== undefined ? Number(item.price) : Number(item.unit_price || 0);
            const disc = item.discount ? Number(item.discount) : 0;
            const itemTotal = qty * prc - disc;
            subtotal += itemTotal;

            itemsToCreate.push({
              productId,
              quantity: qty,
              price: prc,
              discount: disc,
              total: itemTotal,
            });

            // Deduct stock
            await tx.product.update({
              where: { id: productId },
              data: { stock: { decrement: qty } },
            });
          }

          const total = subtotal - (orderData.discount || 0);
          const paid = orderData.paid !== undefined ? orderData.paid : total;

          // Check if order code already exists
          const existingOrder = await tx.order.findUnique({ where: { code } });
          if (existingOrder) {
            // Delete old items and update
            await tx.orderItem.deleteMany({ where: { orderId: existingOrder.id } });
            await tx.order.update({
              where: { id: existingOrder.id },
              data: {
                customerId,
                userId: req.user!.id,
                subtotal,
                discount: orderData.discount || 0,
                total,
                paid,
                paymentMethod: orderData.paymentMethod || 'CASH',
                note: orderData.note || null,
                branch: orderData.branch || null,
                priceBook: orderData.priceBook || null,
                channel: orderData.channel || null,
                status: 'COMPLETED',
                createdAt: parseExcelDate(orderData.createdAt) || new Date(),
                items: { create: itemsToCreate },
              }
            });
          } else {
            await tx.order.create({
              data: {
                code,
                customerId,
                userId: req.user!.id,
                subtotal,
                discount: orderData.discount || 0,
                total,
                paid,
                paymentMethod: orderData.paymentMethod || 'CASH',
                note: orderData.note || null,
                branch: orderData.branch || null,
                priceBook: orderData.priceBook || null,
                channel: orderData.channel || null,
                status: 'COMPLETED',
                createdAt: parseExcelDate(orderData.createdAt) || new Date(),
                items: { create: itemsToCreate },
              },
            });
          }

          if (customerId) {
            const debtChange = total - paid;
            await tx.customer.update({
              where: { id: customerId },
              data: {
                totalSpent: { increment: total },
                totalOrders: { increment: 1 },
                totalDebt: { increment: debtChange },
              },
            });
          }

          importedCount++;
        }
      });

      res.status(201).json({ message: `Đã import thành công ${importedCount} hóa đơn`, count: importedCount });
    } catch (error) {
      next(error);
    }
  },

  delete: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const id = Number(req.params.id);
      const order = await prisma.order.findUnique({
        where: { id },
        include: { items: true },
      });

      if (!order) return res.status(404).json({ message: 'Không tìm thấy đơn hàng' });

      await prisma.$transaction(async (tx) => {
        // If order was not cancelled, we should restore stock
        if (order.status !== 'CANCELLED') {
          for (const item of order.items) {
            await tx.product.update({
              where: { id: item.productId },
              data: { stock: { increment: item.quantity } },
            });
          }
          
          // Revert customer metrics
          if (order.customerId) {
            const debtChange = Number(order.total) - Number(order.paid);
            await tx.customer.update({
              where: { id: order.customerId },
              data: {
                totalSpent: { decrement: Number(order.total) },
                totalOrders: { decrement: 1 },
                totalDebt: { decrement: debtChange },
              },
            });
          }
        }

        // Delete order items
        await tx.orderItem.deleteMany({ where: { orderId: id } });
        // Delete order
        await tx.order.delete({ where: { id } });
      });

      res.json({ message: 'Đã xóa đơn hàng thành công' });
    } catch (error) {
      next(error);
    }
  },
};
