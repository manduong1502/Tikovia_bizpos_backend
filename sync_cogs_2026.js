const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
  const tenant = await prisma.tenant.findFirst();
  if (!tenant) return;

  console.log('=== MONTHLY FINANCIAL & COGS AUDIT FOR 2026 ===');
  
  const months = [
    { name: 'Tháng 1/2026', start: '2026-01-01', end: '2026-01-31' },
    { name: 'Tháng 2/2026', start: '2026-02-01', end: '2026-02-28' },
    { name: 'Tháng 3/2026', start: '2026-03-01', end: '2026-03-31' },
    { name: 'Tháng 4/2026', start: '2026-04-01', end: '2026-04-30' },
    { name: 'Tháng 5/2026', start: '2026-05-01', end: '2026-05-31' },
    { name: 'Tháng 6/2026', start: '2026-06-01', end: '2026-06-30' },
    { name: 'Tháng 7/2026', start: '2026-07-01', end: '2026-07-31' },
    { name: 'Tháng 8/2026', start: '2026-08-01', end: '2026-08-05' },
  ];

  for (const m of months) {
    const sDate = new Date(`${m.start}T00:00:00.000Z`);
    const eDate = new Date(`${m.end}T23:59:59.999Z`);

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

    const grossSales = orders.reduce((sum, o) => sum + Number(o.total || 0), 0);
    const returnSales = returns.reduce((sum, r) => sum + Number(r.total || 0), 0);
    const netSales = grossSales - returnSales;

    let cogsSales = 0;
    orders.forEach(o => {
      (o.items || []).forEach(it => {
        const costUnit = Number(it.costPrice) > 0 ? Number(it.costPrice) : Number(it.product?.costPrice || it.product?.cost_price || 0);
        cogsSales += costUnit * Number(it.quantity || 0);
      });
    });

    let cogsReturns = 0;
    returns.forEach(r => {
      (r.items || []).forEach(it => {
        const costUnit = Number(it.costPrice) > 0 ? Number(it.costPrice) : Number(it.product?.costPrice || it.product?.cost_price || 0);
        cogsReturns += costUnit * Number(it.quantity || 0);
      });
    });

    const netCogs = Math.max(0, cogsSales - cogsReturns);
    const grossProfit = netSales - netCogs;

    console.log(`\n--- ${m.name} ---`);
    console.log(`Orders: ${orders.length}, Returns: ${returns.length}`);
    console.log(`Gross Sales: ${grossSales.toLocaleString('vi-VN')} đ`);
    console.log(`Net Sales: ${netSales.toLocaleString('vi-VN')} đ`);
    console.log(`Net COGS: ${netCogs.toLocaleString('vi-VN')} đ`);
    console.log(`Gross Profit: ${grossProfit.toLocaleString('vi-VN')} đ`);
  }
}

main().catch(console.error).finally(() => prisma.$disconnect());
