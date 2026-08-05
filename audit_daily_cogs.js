const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function run() {
  console.log('=== CHECKING DAILY COGS CALCULATION ===');
  
  const tenant = await prisma.tenant.findFirst();
  if (!tenant) return;

  // Query order items for 01/08/2026
  const sDate = new Date('2026-08-01T00:00:00.000+07:00');
  const eDate = new Date('2026-08-01T23:59:59.999+07:00');

  const orders = await prisma.order.findMany({
    where: {
      tenantId: tenant.id,
      createdAt: { gte: sDate, lte: eDate },
      status: { not: 'CANCELLED' }
    },
    include: { items: { include: { product: true } } }
  });

  const returns = await prisma.return.findMany({
    where: {
      tenantId: tenant.id,
      createdAt: { gte: sDate, lte: eDate },
      status: 'COMPLETED'
    },
    include: { items: { include: { product: true } } }
  });

  let sumOrderItemCost = 0;
  let sumProductCurrentCost = 0;

  orders.forEach(o => {
    (o.items || []).forEach(it => {
      const oiCost = Number(it.costPrice || 0);
      const pCost = Number(it.product?.costPrice || it.product?.cost_price || 0);
      sumOrderItemCost += oiCost * Number(it.quantity || 0);
      sumProductCurrentCost += pCost * Number(it.quantity || 0);
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

  console.log(`01/08/2026 Sum using OrderItem.costPrice strictly: ${sumOrderItemCost.toLocaleString('vi-VN')} VNĐ`);
  console.log(`01/08/2026 Sum using Product.costPrice fallback: ${sumProductCurrentCost.toLocaleString('vi-VN')} VNĐ`);
  console.log(`01/08/2026 Return COGS: ${sumReturnItemCost.toLocaleString('vi-VN')} VNĐ`);
  console.log(`01/08/2026 Net COGS with Product.costPrice: ${(sumProductCurrentCost - sumReturnItemCost).toLocaleString('vi-VN')} VNĐ`);
  console.log(`KiotViet Target COGS for 01/08/2026: 109.457.429 VNĐ`);
}

run().catch(console.error).finally(() => prisma.$disconnect());
