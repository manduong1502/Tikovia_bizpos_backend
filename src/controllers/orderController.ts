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
  latitude: z.coerce.number().optional().nullable(),
  longitude: z.coerce.number().optional().nullable(),
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
  latitude: z.coerce.number().optional().nullable(),
  longitude: z.coerce.number().optional().nullable(),
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
            customer: { select: { id: true, name: true, phone: true, code: true } },
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
        let orderLat: number | null = body.latitude || null;
        let orderLng: number | null = body.longitude || null;

        let customerDebtBefore = 0;
        if (body.customerId) {
          const cust = await tx.customer.findFirst({
            where: { id: body.customerId, tenantId }
          });
          if (cust) {
            customerName = cust.name;
            customerDebtBefore = Number(cust.totalDebt || 0);
            if (!orderLat) orderLat = cust.latitude;
            if (!orderLng) orderLng = cust.longitude;
          }
        }

        // Create order
        const code = await generateOrderCode(tenantId, tx);
        const debtChange = total - (body.paid ?? total);
        const newOrder = await tx.order.create({
          data: {
            code,
            customerId: body.customerId,
            userId: req.user!.id,
            subtotal,
            discount: body.discount,
            total,
            paid: body.paid ?? total,
            oldDebt: customerDebtBefore,
            newDebt: customerDebtBefore + debtChange,
            paymentMethod: body.paymentMethod,
            note: body.note,
            status: body.status || 'COMPLETED',
            deliveryAddress: body.deliveryAddress || null,
            receiverName: body.receiverName || null,
            receiverPhone: body.receiverPhone || null,
            driverId: body.driverId || null,
            driverName: body.driverName || null,
            deliveryStatus: body.deliveryStatus || null,
            latitude: orderLat,
            longitude: orderLng,
            items: { create: itemsData },
            tenantId,
          },
          include: {
            items: { include: { product: { select: { id: true, name: true } } } },
            customer: { select: { id: true, name: true, phone: true, code: true, address: true, latitude: true, longitude: true } },
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
              lastTransaction: new Date(),
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
      console.log(`[UPDATE ORDER API] id=${id}, tenantId=${tenantId}, body:`, JSON.stringify(body, null, 2));
      
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

          let customerDebtBefore = 0;
          if (body.customerId) {
            const cust = await tx.customer.findUnique({
              where: { id: body.customerId }
            });
            if (cust) {
              customerDebtBefore = Number(cust.totalDebt || 0);
            }
          }
          const newDebtChange = total - paid;

          let statusToUpdate = body.status;
          let deliveryStatusToUpdate = body.deliveryStatus;
          if (paid > 0 && paid >= total) {
            statusToUpdate = 'COMPLETED';
            deliveryStatusToUpdate = null;
          }

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
              oldDebt: customerDebtBefore,
              newDebt: customerDebtBefore + newDebtChange,
              paymentMethod: body.paymentMethod ?? 'CASH',
              note: body.note,
              items: { create: itemsData },
              ...(statusToUpdate !== undefined && { status: statusToUpdate }),
              ...(body.deliveryAddress !== undefined && { deliveryAddress: body.deliveryAddress }),
              ...(body.receiverName !== undefined && { receiverName: body.receiverName }),
              ...(body.receiverPhone !== undefined && { receiverPhone: body.receiverPhone }),
              ...(body.driverId !== undefined && { driverId: body.driverId }),
              ...(body.driverName !== undefined && { driverName: body.driverName }),
              ...((paid > 0 && paid >= total) ? { deliveryStatus: null } : (deliveryStatusToUpdate !== undefined && { deliveryStatus: deliveryStatusToUpdate })),
              ...(body.latitude !== undefined && { latitude: body.latitude }),
              ...(body.longitude !== undefined && { longitude: body.longitude }),
            },
            include: {
              items: { include: { product: { select: { id: true, name: true } } } },
              customer: { select: { id: true, name: true, phone: true, code: true, address: true, latitude: true, longitude: true } },
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
                lastTransaction: new Date(),
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
          if (body.status !== undefined) dataToUpdate.status = body.status;
          if (body.deliveryAddress !== undefined) dataToUpdate.deliveryAddress = body.deliveryAddress;
          if (body.receiverName !== undefined) dataToUpdate.receiverName = body.receiverName;
          if (body.receiverPhone !== undefined) dataToUpdate.receiverPhone = body.receiverPhone;
          if (body.driverId !== undefined) dataToUpdate.driverId = body.driverId;
          if (body.driverName !== undefined) dataToUpdate.driverName = body.driverName;
          if (body.deliveryStatus !== undefined) dataToUpdate.deliveryStatus = body.deliveryStatus;
          if (body.latitude !== undefined) dataToUpdate.latitude = body.latitude;
          if (body.longitude !== undefined) dataToUpdate.longitude = body.longitude;
          
          if (body.paid !== undefined) {
            const oldPaid = Number(order.paid);
            const newPaid = Number(body.paid);
            dataToUpdate.paid = newPaid;
            
            const orderTotal = Number(order.total);
            if (newPaid >= orderTotal) {
              dataToUpdate.status = 'COMPLETED';
              dataToUpdate.deliveryStatus = null;
            }
            
            // Update customer debt if any
            if (order.customerId) {
              const diffPaid = newPaid - oldPaid;
              await tx.customer.update({
                where: { id: order.customerId },
                data: { totalDebt: { decrement: diffPaid } }
              });
              const storedOldDebt = Number(order.oldDebt || 0);
              dataToUpdate.newDebt = storedOldDebt + orderTotal - newPaid;
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
              customer: { select: { id: true, name: true, phone: true, code: true, address: true, latitude: true, longitude: true } },
            }
          });
        }
      });

      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      if (updatedOrder && updatedOrder.status === 'SHIPPING') {
        syncOrderToDriverApp(updatedOrder).catch(err => {
          console.error('Lỗi khi đồng bộ hóa đơn cập nhật sang app tài xế:', err);
        });
      }

      // Phát sự kiện cập nhật đơn hàng thời gian thực
      try {
        const io = req.app.get('io');
        if (io) {
          const roomName = `tenant_${tenantId}`;
          io.to(roomName).emit('order_updated', {
            orderId: updatedOrder.id,
            code: updatedOrder.code,
            status: updatedOrder.status,
            deliveryStatus: updatedOrder.deliveryStatus
          });
        }
      } catch (err) {
        console.error('Lỗi khi phát socket cập nhật hóa đơn:', err);
      }

      res.json(updatedOrder);
    } catch (error) {
      next(error);
    }
  },

  importExcel: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const orders = req.body.orders || req.body.items || [];
      let importedCount = 0;

      const CHUNK_SIZE = 100;
      for (let i = 0; i < orders.length; i += CHUNK_SIZE) {
        const chunk = orders.slice(i, i + CHUNK_SIZE);
        await prisma.$transaction(async (tx) => {
          for (const orderData of chunk) {
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
      }

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

        return tx.order.update({
          where: { id: order.id },
          data: updateData
        });
      });

      // Create and send real-time notification
      try {
        let notifTitle = 'Cập nhật đơn hàng';
        let notifMessage = `Đơn hàng ${code} có cập nhật trạng thái mới.`;
        const driverNameStr = updated.driverName || driverName || 'Tài xế';

        if (deliveryStatus === 'DELIVERING') {
          notifTitle = 'Đơn hàng đang giao';
          notifMessage = `Tài xế ${driverNameStr} đã nhận giao đơn hàng ${code}.`;
        } else if (deliveryStatus === 'DELIVERED') {
          const finalPaid = Number(codAmount ?? order.total);
          notifTitle = 'Giao hàng thành công';
          notifMessage = `Đơn hàng ${code} đã được giao thành công bởi tài xế ${driverNameStr}. Thu COD: ${finalPaid.toLocaleString('vi-VN')} đ.`;
        } else if (deliveryStatus === 'CANCELED') {
          notifTitle = 'Giao hàng thất bại / Hủy';
          notifMessage = `Đơn hàng ${code} bị hủy hoặc giao thất bại bởi tài xế ${driverNameStr}.`;
        }

        const notification = await prisma.notification.create({
          data: {
            tenantId,
            title: notifTitle,
            message: notifMessage,
            type: 'ORDER_STATUS',
            isRead: false,
          }
        });

        // Broadcast to tenant socket room
        const io = req.app.get('io');
        if (io) {
          const roomName = `tenant_${tenantId}`;
          io.to(roomName).emit('notification', notification);
          io.to(roomName).emit('order_updated', {
            orderId: updated.id,
            code: updated.code,
            status: updated.status,
            deliveryStatus: updated.deliveryStatus
          });
        }
      } catch (err) {
        console.error('Lỗi khi tạo/phát thông báo thời gian thực:', err);
      }

      res.json(updated);
    } catch (error) {
      next(error);
    }
  },

  getOrdersForDriver: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      
      const todayStart = new Date();
      todayStart.setHours(0, 0, 0, 0);

      const dbOrders = await prisma.order.findMany({
        where: {
          tenantId,
          OR: [
            { 
              status: 'SHIPPING',
              paid: 0
            },
            {
              status: { in: ['COMPLETED', 'CANCELLED'] },
              deliveryStatus: { in: ['DELIVERED', 'CANCELED'] },
              updatedAt: { gte: todayStart }
            }
          ]
        },
        include: {
          customer: true,
          items: {
            include: {
              product: {
                select: { name: true }
              }
            }
          }
        },
        orderBy: { createdAt: 'desc' }
      });

      const formatted = dbOrders.map(order => {
        const items = (order.items || []).map((it: any) => {
          const productName = it.product?.name || 'Sản phẩm';
          return `${productName} (x${it.quantity})`;
        });

        return {
          id: `DH-${order.code}`,
          customerName: order.receiverName || order.customer?.name || 'Khách lẻ',
          customerPhone: order.receiverPhone || order.customer?.phone || '',
          address: order.deliveryAddress || order.customer?.address || 'Tại cửa hàng',
          location: {
            lat: order.latitude || order.customer?.latitude || 10.762622,
            lng: order.longitude || order.customer?.longitude || 106.660172
          },
          orderValue: Number(order.total),
          status: order.deliveryStatus || 'ASSIGNED',
          driverId: order.driverId || '',
          driverName: order.driverName || 'Chưa gán',
          items,
          note: order.note || '',
          createdAt: order.createdAt.toISOString()
        };
      });

      res.json(formatted);
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
      lat: order.latitude || order.customer?.latitude || 10.762622,
      lng: order.longitude || order.customer?.longitude || 106.660172,
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
