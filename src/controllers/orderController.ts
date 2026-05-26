import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';
import { memoryCache } from '../utils/cache';
import { config } from '../config';

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
  status: z.enum(['COMPLETED', 'CANCELLED', 'PENDING', 'SHIPPING']).default('COMPLETED'),
  deliveryAddress: z.string().optional().nullable(),
  receiverName: z.string().optional().nullable(),
  receiverPhone: z.string().optional().nullable(),
  driverId: z.string().optional().nullable(),
  driverName: z.string().optional().nullable(),
  deliveryStatus: z.string().optional().nullable(),
});

const updateOrderSchema = z.object({
  customerId: z.number().int().optional().nullable(),
  items: z.array(orderItemSchema).min(1).optional(),
  discount: z.coerce.number().min(0).optional(),
  paid: z.coerce.number().min(0).optional(),
  paymentMethod: z.enum(['CASH', 'CARD', 'TRANSFER', 'MIXED']).optional(),
  note: z.string().optional().nullable(),
  status: z.enum(['COMPLETED', 'CANCELLED', 'PENDING', 'SHIPPING']).optional(),
  deliveryAddress: z.string().optional().nullable(),
  receiverName: z.string().optional().nullable(),
  receiverPhone: z.string().optional().nullable(),
  driverId: z.string().optional().nullable(),
  driverName: z.string().optional().nullable(),
  deliveryStatus: z.string().optional().nullable(),
});

// Auto-generate order code using SequenceTracker scoped by tenantId
async function generateOrderCode(tenantId: number, txClient?: any): Promise<string> {
  const db = txClient || prisma;
  const seq = await db.sequenceTracker.upsert({
    where: { tenantId_name: { tenantId, name: 'ORDER' } },
    update: { value: { increment: 1 } },
    create: { tenantId, name: 'ORDER', value: 1 }
  });
  return `HD${String(seq.value).padStart(6, '0')}`;
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
      const tenantId = (req as any).tenant!.id;
      const page = Math.max(1, parseInt(req.query.page as string) || 1);
      const limit = Math.min(config.pagination.maxLimit, parseInt(req.query.limit as string) || 20);
      const status = req.query.status as string;
      const from = req.query.from as string;
      const to = req.query.to as string;
      const search = req.query.search as string;

      const where: any = { tenantId };
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
            returns: { select: { code: true } },
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
      const tenantId = (req as any).tenant!.id;
      const order = await prisma.order.findFirst({
        where: { id: Number(req.params.id), tenantId },
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

  // POST /api/orders
  create: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const body = createOrderSchema.parse(req.body);
      
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

        // Verify all products belong to this tenant
        const productIds = body.items.map(it => it.productId);
        const dbProducts = await tx.product.findMany({
          where: {
            id: { in: productIds },
            tenantId
          }
        });
        if (dbProducts.length !== productIds.length) {
          throw new Error('Một hoặc nhiều sản phẩm không hợp lệ hoặc không thuộc cửa hàng này');
        }

        const total = subtotal - body.discount;
        let customerName = 'Khách lẻ';

        if (body.customerId) {
          const cust = await tx.customer.findFirst({
            where: { id: body.customerId, tenantId }
          });
          if (cust) customerName = cust.name;
        }

        // Create order
        const code = await generateOrderCode(tenantId, tx);
        const newOrder = await tx.order.create({
          data: {
            code,
            customerId: body.customerId,
            userId: req.user!.id,
            subtotal,
            discount: body.discount,
            total,
            paid: body.paid ?? total,
            paymentMethod: body.paymentMethod,
            note: body.note,
            status: body.status || 'COMPLETED',
            deliveryAddress: body.deliveryAddress || null,
            receiverName: body.receiverName || null,
            receiverPhone: body.receiverPhone || null,
            driverId: body.driverId || null,
            driverName: body.driverName || null,
            deliveryStatus: body.deliveryStatus || null,
            items: { create: itemsData },
            tenantId,
          },
          include: {
            items: { include: { product: { select: { id: true, name: true } } } },
            customer: { select: { id: true, name: true, phone: true, address: true } },
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

        // Generate Cashbook Entry if paid > 0
        if (body.paid > 0) {
          const cashbookCode = `TTM${String(Date.now()).slice(-6)}${Math.floor(Math.random() * 100)}`;
          
          await tx.cashbookEntry.create({
            data: {
              code: cashbookCode,
              type: 'INCOME',
              amount: body.paid,
              category: 'Thu tiền khách trả',
              partnerType: body.customerId ? 'customer' : 'other',
              customerId: body.customerId || null,
              partnerName: customerName,
              paymentMethod: body.paymentMethod === 'CASH' ? 'cash' : 'bank',
              isAccounting: true,
              status: 'completed',
              branch: (body as any).branch || 'Chi nhánh trung tâm',
              userId: req.user!.id,
              orderId: newOrder.id,
              note: `Thu tiền đơn hàng ${code}`,
              tenantId,
            }
          });
        }

        return newOrder;
      });

      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      if (order.status === 'SHIPPING') {
        syncOrderToDriverApp(order).catch(err => {
          console.error('Lỗi khi đồng bộ đơn hàng sang app tài xế:', err);
        });
      }
      res.status(201).json(order);
    } catch (error) {
      next(error);
    }
  },

  // PUT /api/orders/:id/cancel
  cancel: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const id = Number(req.params.id);
      
      const order = await prisma.order.findFirst({
        where: { id, tenantId },
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
          const debtChange = Number(order.total) - Number(order.paid);
          await tx.customer.update({
            where: { id: order.customerId },
            data: {
              totalSpent: { decrement: order.total },
              totalOrders: { decrement: 1 },
              totalDebt: { decrement: debtChange },
            },
          });
        }
        
        // Also cancel associated cashbook entries
        await tx.cashbookEntry.updateMany({
          where: { tenantId, orderId: id, status: 'completed' },
          data: { status: 'cancelled', note: 'Hủy theo đơn hàng bị hủy' }
        });
      });

      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.json({ message: 'Đã hủy đơn hàng' });
    } catch (error) {
      next(error);
    }
  },

  // PUT /api/orders/:id
  update: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const id = Number(req.params.id);
      const body = updateOrderSchema.parse(req.body);
      
      const order = await prisma.order.findFirst({
        where: { id, tenantId },
        include: { items: true },
      });
      if (!order) return res.status(404).json({ message: 'Không tìm thấy đơn hàng' });

      const updatedOrder = await prisma.$transaction(async (tx) => {
        if (body.items) {
          // 1. Revert old order effects
          for (const item of order.items) {
            await tx.product.update({
              where: { id: item.productId },
              data: { stock: { increment: item.quantity } },
            });
          }
          if (order.customerId) {
            const oldDebtChange = Number(order.total) - Number(order.paid);
            await tx.customer.update({
              where: { id: order.customerId },
              data: {
                totalSpent: { decrement: order.total },
                totalOrders: { decrement: 1 },
                totalDebt: { decrement: oldDebtChange },
              },
            });
          }

          // 2. Clear old items
          await tx.orderItem.deleteMany({ where: { orderId: id } });

          // 3. Calculate new totals
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
          const total = subtotal - (body.discount ?? 0);
          const paid = body.paid ?? total;

          // 4. Update order
          const newOrder = await tx.order.update({
            where: { id },
            data: {
              customerId: body.customerId,
              userId: req.user!.id,
              subtotal,
              discount: body.discount ?? 0,
              total,
              paid,
              paymentMethod: body.paymentMethod ?? 'CASH',
              note: body.note,
              items: { create: itemsData },
            },
            include: {
              items: { include: { product: { select: { id: true, name: true } } } },
              customer: { select: { id: true, name: true } },
            },
          });

          // 5. Apply new order effects
          for (const item of body.items) {
            await tx.product.update({
              where: { id: item.productId },
              data: { stock: { decrement: item.quantity } },
            });
          }
          if (body.customerId) {
            const newDebtChange = total - paid;
            await tx.customer.update({
              where: { id: body.customerId },
              data: {
                totalSpent: { increment: total },
                totalOrders: { increment: 1 },
                totalDebt: { increment: newDebtChange },
              },
            });
          }
          
          // 6. Update/Sync Cashbook entry
          const existingEntry = await tx.cashbookEntry.findFirst({
            where: { tenantId, orderId: id }
          });
          if (paid > 0) {
            if (existingEntry) {
              await tx.cashbookEntry.update({
                where: { id: existingEntry.id },
                data: { amount: paid, customerId: body.customerId || null, status: 'completed' }
              });
            } else {
              const cashbookCode = `TTM${String(Date.now()).slice(-6)}${Math.floor(Math.random() * 100)}`;
              await tx.cashbookEntry.create({
                data: {
                  code: cashbookCode,
                  type: 'INCOME',
                  amount: paid,
                  category: 'Thu tiền khách trả',
                  partnerType: body.customerId ? 'customer' : 'other',
                  customerId: body.customerId || null,
                  partnerName: newOrder.customer?.name || 'Khách lẻ',
                  paymentMethod: body.paymentMethod === 'CARD' ? 'bank' : (body.paymentMethod === 'TRANSFER' ? 'bank' : 'cash'),
                  isAccounting: true,
                  status: 'completed',
                  branch: 'Chi nhánh trung tâm',
                  userId: req.user!.id,
                  orderId: id,
                  note: `Thu tiền đơn hàng ${newOrder.code} (Cập nhật)`,
                  tenantId,
                }
              });
            }
          } else {
            if (existingEntry) {
              await tx.cashbookEntry.update({
                where: { id: existingEntry.id },
                data: { amount: 0, status: 'cancelled', note: 'Hủy thanh toán theo hóa đơn cập nhật' }
              });
            }
          }

          return newOrder;
        } else {
          // Partial update
          const dataToUpdate: any = {};
          if (body.note !== undefined) dataToUpdate.note = body.note;
          if (body.paymentMethod !== undefined) dataToUpdate.paymentMethod = body.paymentMethod;
          
          if (body.paid !== undefined) {
            const oldPaid = Number(order.paid);
            const newPaid = Number(body.paid);
            dataToUpdate.paid = newPaid;
            
            // Update customer debt if any
            if (order.customerId) {
              const diffPaid = newPaid - oldPaid;
              await tx.customer.update({
                where: { id: order.customerId },
                data: { totalDebt: { decrement: diffPaid } }
              });
            }
            
            // Sync Cashbook Entry
            const existingEntry = await tx.cashbookEntry.findFirst({
              where: { tenantId, orderId: id }
            });
            if (newPaid > 0) {
              if (existingEntry) {
                await tx.cashbookEntry.update({
                  where: { id: existingEntry.id },
                  data: { amount: newPaid, status: 'completed' }
                });
              } else {
                const cashbookCode = `TTM${String(Date.now()).slice(-6)}${Math.floor(Math.random() * 100)}`;
                const customerName = order.customerId ? (await tx.customer.findFirst({ where: { id: order.customerId } }))?.name || 'Khách lẻ' : 'Khách lẻ';
                await tx.cashbookEntry.create({
                  data: {
                    code: cashbookCode,
                    type: 'INCOME',
                    amount: newPaid,
                    category: 'Thu tiền khách trả',
                    partnerType: order.customerId ? 'customer' : 'other',
                    customerId: order.customerId || null,
                    partnerName: customerName,
                    paymentMethod: body.paymentMethod === 'CARD' ? 'bank' : (body.paymentMethod === 'TRANSFER' ? 'bank' : 'cash'),
                    isAccounting: true,
                    status: 'completed',
                    branch: 'Chi nhánh trung tâm',
                    userId: req.user!.id,
                    orderId: id,
                    note: `Thu tiền đơn hàng ${order.code} (Cập nhật số tiền)`,
                    tenantId,
                  }
                });
              }
            } else {
              if (existingEntry) {
                await tx.cashbookEntry.update({
                  where: { id: existingEntry.id },
                  data: { amount: 0, status: 'cancelled', note: 'Hủy thanh toán theo hóa đơn cập nhật' }
                });
              }
            }
          }
          
          return tx.order.update({
            where: { id },
            data: dataToUpdate,
            include: {
              items: { include: { product: { select: { id: true, sku: true, name: true } } } },
              customer: { select: { id: true, name: true } },
            }
          });
        }
      });

      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.json(updatedOrder);
    } catch (error) {
      next(error);
    }
  },

  importExcel: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const orders = req.body.orders || req.body.items;
      let importedCount = 0;

      await prisma.$transaction(async (tx) => {
        for (const orderData of orders) {
          const code = orderData.code || orderData.order_code || await generateOrderCode(tenantId, tx);
          
          // 1. Resolve Customer
          let customerId = orderData.customerId || null;
          if (!customerId && (orderData.customer_code || orderData.customer_name || orderData.customer_phone)) {
            const custCode = orderData.customer_code || `KH${String(Date.now()).slice(-6)}${Math.floor(Math.random() * 1000)}`;
            const custPhone = orderData.customer_phone || null;
            
            let existingCust = null;
            if (custCode && custCode !== 'KH...') {
              existingCust = await tx.customer.findUnique({
                where: {
                  tenantId_code: {
                    tenantId,
                    code: custCode,
                  },
                },
              });
            }
            if (!existingCust && custPhone) {
              existingCust = await tx.customer.findFirst({
                where: { tenantId, phone: custPhone }
              });
            }

            if (existingCust) {
              customerId = existingCust.id;
            } else {
              const newCust = await tx.customer.create({
                data: {
                  code: custCode,
                  name: orderData.customer_name || 'Khách lẻ',
                  phone: custPhone,
                  address: orderData.customer_address || null,
                  tenantId,
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
              let existingProd = await tx.product.findUnique({
                where: {
                  tenantId_sku: {
                    tenantId,
                    sku: pSku,
                  },
                },
              });
              if (!existingProd && item.product_name) {
                existingProd = await tx.product.findFirst({
                  where: { tenantId, name: item.product_name }
                });
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
                    tenantId,
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

          // Check if order code already exists within same tenant
          const existingOrder = await tx.order.findUnique({
            where: {
              tenantId_code: {
                tenantId,
                code,
              },
            },
          });
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
                tenantId,
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

      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.status(201).json({ message: `Đã import thành công ${importedCount} hóa đơn`, count: importedCount });
    } catch (error) {
      next(error);
    }
  },

  delete: async (req: Request, res: Response, next: NextFunction) => {
    try {
      return res.status(400).json({ 
        message: 'Dữ liệu tài chính không được phép xóa vật lý. Vui lòng sử dụng tính năng Hủy đơn hàng.' 
      });
    } catch (error) {
      next(error);
    }
  },

  updateDriverStatus: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const code = req.params.code as string;
      const { driverId, driverName, deliveryStatus, codAmount, paymentMethod } = req.body;

      // Find the order
      const order = await prisma.order.findFirst({
        where: { code, tenantId },
        include: { customer: true }
      });

      if (!order) {
        return res.status(404).json({ message: 'Không tìm thấy đơn hàng' });
      }

      const updated = await prisma.$transaction(async (tx) => {
        const updateData: any = {};
        if (driverId !== undefined) updateData.driverId = driverId;
        if (driverName !== undefined) updateData.driverName = driverName;
        if (deliveryStatus !== undefined) updateData.deliveryStatus = deliveryStatus;

        // If deliveryStatus is completed (DELIVERED)
        if (deliveryStatus === 'DELIVERED') {
          updateData.status = 'COMPLETED'; // Transition order to COMPLETED
          const finalPaid = Number(codAmount ?? order.total);
          updateData.paid = finalPaid;

          // Re-calculate customer metrics if we collected cash and it changed
          if (order.customerId) {
            const oldPaid = Number(order.paid);
            const diffPaid = finalPaid - oldPaid;
            await tx.customer.update({
              where: { id: order.customerId },
              data: {
                totalDebt: { decrement: diffPaid }
              }
            });
          }

          // Create Cashbook entry
          const cashbookCode = `TTM${String(Date.now()).slice(-6)}${Math.floor(Math.random() * 100)}`;
          const customerName = order.customerId ? order.customer?.name || 'Khách lẻ' : 'Khách lẻ';
          
          await tx.cashbookEntry.create({
            data: {
              code: cashbookCode,
              type: 'INCOME',
              amount: finalPaid,
              category: 'Thu tiền khách trả',
              partnerType: order.customerId ? 'customer' : 'other',
              customerId: order.customerId || null,
              partnerName: customerName,
              paymentMethod: paymentMethod === 'TRANSFER' ? 'bank' : 'cash',
              isAccounting: true,
              status: 'completed',
              branch: 'Chi nhánh trung tâm',
              userId: order.userId,
              orderId: order.id,
              note: `Thu tiền COD đơn hàng ${code} (Tài xế giao thành công)`,
              tenantId
            }
          });
        } else if (deliveryStatus === 'CANCELED') {
          updateData.status = 'CANCELLED';
          
          // Restore stock
          const orderWithItems = await tx.order.findUnique({
            where: { id: order.id },
            include: { items: true }
          });
          if (orderWithItems) {
            for (const item of orderWithItems.items) {
              await tx.product.update({
                where: { id: item.productId },
                data: { stock: { increment: item.quantity } }
              });
            }
          }

          // Revert customer spent & debt if order was cancelled
          if (order.customerId) {
            const oldDebtChange = Number(order.total) - Number(order.paid);
            await tx.customer.update({
              where: { id: order.customerId },
              data: {
                totalSpent: { decrement: order.total },
                totalOrders: { decrement: 1 },
                totalDebt: { decrement: oldDebtChange },
              }
            });
          }

          // Cancel associated cashbook entries
          await tx.cashbookEntry.updateMany({
            where: { tenantId, orderId: order.id, status: 'completed' },
            data: { status: 'cancelled', note: 'Hủy theo đơn hàng bị hủy bởi tài xế' }
          });
        }

        return tx.order.update({
          where: { id: order.id },
          data: updateData
        });
      });

      res.json(updated);
    } catch (error) {
      next(error);
    }
  },
};

// Helper function to sync order to driver app's Google Sheet
async function syncOrderToDriverApp(order: any) {
  const googleScriptUrl = process.env.DRIVER_APP_GOOGLE_SCRIPT_URL || 'https://script.google.com/macros/s/AKfycbxIN0yxGmHN2GELHmaiGkfeekOyQt8sJjUNU_gRqOBtgcqZfb98P6J3qQK_pGWlGG0l/exec';

  const items = (order.items || []).map((it: any) => {
    const productName = it.product?.name || 'Sản phẩm';
    return `${productName} (x${it.quantity})`;
  });

  const payload = {
    id: `DH-${order.code}`,
    customerName: order.receiverName || order.customer?.name || 'Khách lẻ',
    customerPhone: order.receiverPhone || order.customer?.phone || '',
    address: order.deliveryAddress || order.customer?.address || 'Tại cửa hàng',
    location: {
      lat: 10.762622 + (Math.random() - 0.5) * 0.04,
      lng: 106.660172 + (Math.random() - 0.5) * 0.04,
    },
    orderValue: Number(order.total),
    status: 'ASSIGNED',
    items,
    driverId: order.driverId || '',
    driverName: order.driverName || 'Chưa gán',
    note: order.note || '',
    createdAt: order.createdAt instanceof Date ? order.createdAt.toISOString() : new Date().toISOString(),
  };

  try {
    const fetchFn = (globalThis as any).fetch;
    if (typeof fetchFn === 'function') {
      const response = await fetchFn(`${googleScriptUrl}?action=saveOrder`, {
        method: 'POST',
        headers: { 'Content-Type': 'text/plain;charset=utf-8' },
        body: JSON.stringify(payload),
      });
      const resText = await response.text();
      console.log('Đồng bộ đơn hàng sang App tài xế thành công:', resText);
    } else {
      console.warn('Không tìm thấy hàm fetch toàn cục trong môi trường Node.js này.');
    }
  } catch (error) {
    console.error('Không thể đồng bộ đơn hàng sang App tài xế:', error);
  }
}
