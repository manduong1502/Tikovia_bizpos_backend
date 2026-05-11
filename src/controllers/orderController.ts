import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';

const orderItemSchema = z.object({
  productId: z.number().int(),
  quantity: z.number().int().min(1),
  price: z.number().min(0),
  discount: z.number().min(0).default(0),
});

const createOrderSchema = z.object({
  customerId: z.number().int().optional().nullable(),
  items: z.array(orderItemSchema).min(1, 'Đơn hàng phải có ít nhất 1 sản phẩm'),
  discount: z.number().min(0).default(0),
  paid: z.number().min(0).default(0),
  paymentMethod: z.enum(['CASH', 'CARD', 'TRANSFER', 'MIXED']).default('CASH'),
  note: z.string().optional().nullable(),
});

// Auto-generate order code: HD000001, HD000002...
async function generateOrderCode(): Promise<string> {
  const lastOrder = await prisma.order.findFirst({ orderBy: { id: 'desc' } });
  const nextNum = (lastOrder?.id || 0) + 1;
  return `HD${String(nextNum).padStart(6, '0')}`;
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

        // Update customer total if applicable
        if (body.customerId) {
          await tx.customer.update({
            where: { id: body.customerId },
            data: {
              totalSpent: { increment: total },
              totalOrders: { increment: 1 },
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
};
