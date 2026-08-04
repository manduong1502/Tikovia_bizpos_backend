import { Request, Response, NextFunction } from 'express';
import { z } from 'zod';
import prisma from '../config/database';
import { AuthRequest } from '../middlewares/auth';
import { memoryCache } from '../utils/cache';
import { config } from '../config';

const returnItemSchema = z.object({
  productId: z.number().int(),
  quantity: z.number().min(0.001),
  price: z.number().min(0),
});

const createReturnSchema = z.object({
  orderId: z.number().int().optional().nullable(),
  customerId: z.number().int().optional().nullable(),
  items: z.array(returnItemSchema).min(1, 'Đơn trả hàng phải có ít nhất 1 sản phẩm'),
  reason: z.string().optional().nullable(),
  createdAt: z.string().optional().nullable(),
  discount: z.number().min(0).default(0), // Phí trả hàng (khách chịu)
  paid: z.number().min(0).default(0), // Tiền thực tế trả khách
});

function parseExcelDate(val: any): Date | null {
  if (!val) return null;
  if (val instanceof Date) return isNaN(val.getTime()) ? null : new Date(val.getTime() - (7 * 3600 * 1000));
  
  if (typeof val === 'number') {
    const ms = Math.round((val - 25569) * 86400 * 1000) - (7 * 3600 * 1000);
    const d = new Date(ms);
    return isNaN(d.getTime()) ? null : d;
  }
  
  const str = String(val).trim();
  if (!str) return null;

  const parts = str.split(' ');
  const datePart = parts[0];
  const timePart = parts[1] || '00:00:00';

  if (datePart.includes('/')) {
    const dParts = datePart.split('/');
    if (dParts.length === 3) {
      const day = parseInt(dParts[0], 10);
      const month = parseInt(dParts[1], 10) - 1;
      const year = parseInt(dParts[2], 10);
      const tParts = timePart.split(':');
      const hour = parseInt(tParts[0] || '0', 10);
      const minute = parseInt(tParts[1] || '0', 10);
      const second = parseInt(tParts[2] || '0', 10);
      
      if (!isNaN(day) && !isNaN(month) && !isNaN(year)) {
        const fullYear = year < 100 ? 2000 + year : year;
        const d = new Date(Date.UTC(fullYear, month, day, hour - 7, minute, second));
        if (!isNaN(d.getTime())) return d;
      }
    }
  }

  const fallback = new Date(str);
  return isNaN(fallback.getTime()) ? null : fallback;
}

// Auto-generate return code using SequenceTracker scoped by tenantId
async function generateReturnCode(tenantId: number, txClient?: any): Promise<string> {
  const db = txClient || prisma;
  const seq = await db.sequenceTracker.upsert({
    where: { tenantId_name: { tenantId, name: 'RETURN' } },
    update: { value: { increment: 1 } },
    create: { tenantId, name: 'RETURN', value: 1 }
  });
  return `TH${String(seq.value).padStart(6, '0')}`;
}

export const returnController = {
  // GET /api/returns
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const page = Math.max(1, parseInt(req.query.page as string) || 1);
      const limit = Math.min(config.pagination.maxLimit, parseInt(req.query.limit as string) || 20);
      const search = req.query.search as string;

      const where: any = { tenantId };
      const customerIdParam = req.query.customerId ? parseInt(req.query.customerId as string, 10) : undefined;
      if (customerIdParam && !isNaN(customerIdParam)) where.customerId = customerIdParam;

      if (search && search.trim()) {
        const q = search.trim();
        where.OR = [
          { code: { contains: q, mode: 'insensitive' } },
          { customer: { name: { contains: q, mode: 'insensitive' } } },
          { customer: { code: { contains: q, mode: 'insensitive' } } },
          { customer: { phone: { contains: q, mode: 'insensitive' } } },
          { order: { code: { contains: q, mode: 'insensitive' } } },
        ];
      }

      const [data, total] = await Promise.all([
        prisma.return.findMany({
          where,
          include: {
            customer: { select: { id: true, code: true, name: true, phone: true } },
            order: { select: { id: true, code: true, user: { select: { fullName: true } } } },
            _count: { select: { items: true } },
          },
          skip: (page - 1) * limit,
          take: limit,
          orderBy: { createdAt: 'desc' },
        }),
        prisma.return.count({ where }),
      ]);

      res.json({ data, total, page, limit, totalPages: Math.ceil(total / limit) });
    } catch (error) {
      next(error);
    }
  },

  // GET /api/returns/:id
  getById: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const tenantId = (req as any).tenant!.id;
      const id = Number(req.params.id);
      const returnDoc = await prisma.return.findFirst({
        where: { id, tenantId },
        include: {
          customer: true,
          order: { select: { id: true, code: true } },
          items: { include: { product: { select: { id: true, sku: true, name: true, unit: true } } } },
        },
      });
      if (!returnDoc) return res.status(404).json({ message: 'Không tìm thấy đơn trả hàng' });
      res.json(returnDoc);
    } catch (error) {
      next(error);
    }
  },

  // POST /api/returns
  create: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const body = createReturnSchema.parse(req.body);
      const returnDoc = await prisma.$transaction(async (tx) => {
        // Verify order exists in the same tenant if provided
        if (body.orderId) {
          const ord = await tx.order.findFirst({ where: { id: body.orderId, tenantId } });
          if (!ord) throw new Error('Không tìm thấy hóa đơn liên kết');
        }

        // Verify all products belong to this tenant
        const productIds = body.items.map(it => it.productId);
        const uniqueProductIds = Array.from(new Set(productIds));
        const dbProducts = await tx.product.findMany({
          where: {
            id: { in: uniqueProductIds },
            tenantId
          }
        });
        if (dbProducts.length !== uniqueProductIds.length) {
          throw new Error('Một hoặc nhiều sản phẩm không hợp lệ hoặc không thuộc cửa hàng này');
        }

        const code = await generateReturnCode(tenantId, tx);
        let total = 0;
        const itemsData = body.items.map(item => {
          const itemTotal = item.quantity * item.price;
          total += itemTotal;
          return {
            productId: item.productId,
            quantity: item.quantity,
            price: item.price,
            total: itemTotal,
          };
        });

        const returnDate = parseExcelDate(body.createdAt) || new Date();
        const newReturn = await tx.return.create({
          data: {
            code,
            orderId: body.orderId || null,
            customerId: body.customerId || null,
            total,
            discount: body.discount,
            paid: body.paid,
            reason: body.reason,
            createdAt: returnDate,
            status: 'COMPLETED',
            items: { create: itemsData },
            tenantId,
          },
          include: {
            items: { include: { product: { select: { id: true, sku: true, name: true, unit: true } } } },
            customer: { select: { id: true, code: true, name: true, phone: true } }
          }
        });

        // Hoàn lại kho
        await Promise.all(
          body.items.map(item =>
            tx.product.update({
              where: { id: item.productId },
              data: { stock: { increment: item.quantity } },
            })
          )
        );

        // Cập nhật chi tiêu & nợ khách hàng
        if (body.customerId) {
          await tx.customer.update({
            where: { id: body.customerId },
            data: { 
              totalSpent: { decrement: total },
              lastTransaction: new Date(),
            },
          });

          // nợ giảm = (tổng tiền hàng trả - phí trả hàng) - tiền thực tế trả khách
          const netRefund = total - body.discount;
          const debtReduction = netRefund - body.paid;
          if (debtReduction !== 0) {
            await tx.customer.update({
              where: { id: body.customerId },
              data: { totalDebt: { decrement: debtReduction } },
            });
          }
        }

        // Tạo phiếu chi sổ quỹ nếu thực tế có trả lại tiền mặt/chuyển khoản cho khách
        if (body.paid > 0) {
          const customerObj = body.customerId ? await tx.customer.findFirst({ where: { id: body.customerId, tenantId } }) : null;
          const cashbookCode = `TCM${String(Date.now()).slice(-6)}${Math.floor(Math.random() * 100)}`;
          
          await tx.cashbookEntry.create({
            data: {
              code: cashbookCode,
              type: 'EXPENSE',
              amount: body.paid,
              category: 'Chi tiền trả hàng', 
              partnerType: body.customerId ? 'customer' : 'other',
              customerId: body.customerId || null,
              partnerName: customerObj ? customerObj.name : 'Khách lẻ',
              paymentMethod: 'cash',
              isAccounting: true,
              status: 'completed',
              branch: 'Chi nhánh trung tâm',
              userId: req.user!.id,
              returnId: newReturn.id,
              note: `Chi trả khách trả hàng (Phiếu trả ${code})`,
              tenantId,
              createdAt: returnDate,
            }
          });
        }

        return newReturn;
      });

      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.status(201).json(returnDoc);
    } catch (error) {
      next(error);
    }
  },

  // PUT /api/returns/:id
  update: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const id = Number(req.params.id);
      const { reason } = req.body;
      const ret = await prisma.return.findFirst({ where: { id, tenantId } });
      if (!ret) return res.status(404).json({ message: 'Không tìm thấy phiếu trả hàng' });
      
      const updated = await prisma.return.update({
        where: { id },
        data: { reason },
      });
      res.json(updated);
    } catch (error) {
      next(error);
    }
  },

  // PUT /api/returns/:id/cancel
  cancel: async (req: AuthRequest, res: Response, next: NextFunction) => {
    try {
      const tenantId = req.user!.tenantId;
      const id = Number(req.params.id);
      
      const ret = await prisma.return.findFirst({
        where: { id, tenantId },
        include: { items: true },
      });
      if (!ret) return res.status(404).json({ message: 'Không tìm thấy phiếu trả hàng' });
      if (ret.status === 'CANCELLED') return res.status(400).json({ message: 'Phiếu trả hàng đã hủy trước đó' });
      
      await prisma.$transaction(async (tx) => {
        await tx.return.update({
          where: { id },
          data: { status: 'CANCELLED' },
        });
        
        // Hoàn lại kho (phiếu trả bị hủy nên phải trừ lại kho sản phẩm)
        await Promise.all(
          ret.items.map(item =>
            tx.product.update({
              where: { id: item.productId },
              data: { stock: { decrement: item.quantity } },
            })
          )
        );
        
        // Revert customer spent & debt
        if (ret.customerId) {
          const total = Number(ret.total);
          const discount = Number(ret.discount);
          const paid = Number(ret.paid);
          
          await tx.customer.update({
            where: { id: ret.customerId },
            data: { totalSpent: { increment: total } },
          });
          
          const netRefund = total - discount;
          const debtReduction = netRefund - paid;
          if (debtReduction !== 0) {
            await tx.customer.update({
              where: { id: ret.customerId },
              data: { totalDebt: { increment: debtReduction } },
            });
          }
        }
        
        // Hủy phiếu chi quỹ tương ứng
        await tx.cashbookEntry.updateMany({
          where: { tenantId, returnId: id, status: 'completed' },
          data: { status: 'cancelled', note: 'Hủy theo phiếu trả hàng bị hủy' }
        });
      });
      
      memoryCache.clearPattern(`tenant:${tenantId}:products`);
      res.json({ message: 'Đã hủy phiếu trả hàng thành công' });
    } catch (error) {
      next(error);
    }
  }
};
