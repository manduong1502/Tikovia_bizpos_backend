const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function run() {
  console.log('=== AUDITING JULY 2026 COGS IN DATABASE ===');
  
  const tenant = await prisma.tenant.findFirst();
  if (!tenant) return;

  const startDate = new Date('2026-07-01T00:00:00.000Z');
  const endDate = new Date('2026-07-31T23:59:59.999Z');

  const orders = await prisma.order.findMany({
    where: {
      tenantId: tenant.id,
      createdAt: { gte: startDate, lte: endDate },
      status: { not: 'CANCELLED' }
    },
    include: {
      items: { include: { product: true } }
    }
  });

  const returns = await prisma.return.findMany({
    where: {
      tenantId: tenant.id,
      createdAt: { gte: startDate, lte: endDate },
      status: 'COMPLETED'
    },
    include: {
      items: { include: { product: true } }
    }
  });

  let sumOrderItemCost = 0;
  let sumProductCurrentCost = 0;
  let totalOrderItems = 0;
  let itemsUsingProductFallback = 0;

  orders.forEach(o => {
    (o.items || []).forEach(it => {
      totalOrderItems++;
      const oiCost = Number(it.costPrice || 0);
      const pCost = Number(it.product?.costPrice || it.product?.cost_price || 0);
      sumOrderItemCost += oiCost * Number(it.quantity || 0);
      sumProductCurrentCost += pCost * Number(it.quantity || 0);

      if (oiCost <= 0) itemsUsingProductFallback++;
    });
  });

  let sumReturnItemCost = 0;
  returns.forEach(r => {
    (r.items || []).forEach(it => {
      const oiCost = Number(it.costPrice || 0);
      const pCost = Number(it.product?.costPrice || it.product?.cost_price || 0);
      const actualCost = oiCost > 0 ? oiCost : pCost;
      sumReturnItemCost += actualCost * Number(it.quantity || 0);
    });
  });

  console.log(`July Orders count: ${orders.length}`);
  console.log(`Total Order Items: ${totalOrderItems}`);
  console.log(`Items using Product Fallback: ${itemsUsingProductFallback}`);
  console.log(`Sum using OrderItem.costPrice strictly: ${sumOrderItemCost.toLocaleString('vi-VN')} VNĐ`);
  console.log(`Sum using Product.costPrice strictly: ${sumProductCurrentCost.toLocaleString('vi-VN')} VNĐ`);
  console.log(`Return COGS sum: ${sumReturnItemCost.toLocaleString('vi-VN')} VNĐ`);
  console.log(`Net COGS (OrderItem.costPrice - Return COGS): ${(sumOrderItemCost - sumReturnItemCost).toLocaleString('vi-VN')} VNĐ`);
  console.log(`Net COGS (Product.costPrice - Return COGS): ${(sumProductCurrentCost - sumReturnItemCost).toLocaleString('vi-VN')} VNĐ`);
  console.log(`KiotViet Target COGS for July 2026: 4.256.927.127 VNĐ`);
}

run().catch(console.error).finally(() => prisma.$disconnect());
