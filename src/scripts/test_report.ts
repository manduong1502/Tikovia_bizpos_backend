import prisma from '../config/database';

async function main() {
  const startDate = new Date('2026-07-01T00:00:00.000Z');
  const endDate = new Date('2026-07-31T23:59:59.999Z');
  const tenant = await prisma.tenant.findFirst();
  if (!tenant) {
    console.log('No tenant');
    return;
  }
  const orders = await prisma.order.findMany({
    where: { tenantId: tenant.id, createdAt: { gte: startDate, lte: endDate }, status: { not: 'CANCELLED' } },
    include: { items: { include: { product: true } } }
  });
  const returns = await prisma.return.findMany({
    where: { tenantId: tenant.id, createdAt: { gte: startDate, lte: endDate } },
    include: { items: { include: { product: true } } }
  });

  let grossRev = 0;
  let soldCogs = 0;
  orders.forEach((o: any) => {
    grossRev += Number(o.total || 0);
    o.items.forEach((item: any) => {
      const c = Number(item.costPrice || item.product?.costPrice || item.product?.cost_price || 0);
      soldCogs += c * Number(item.quantity || 0);
    });
  });

  let retTotal = 0;
  let retCogs = 0;
  returns.forEach((r: any) => {
    retTotal += Number(r.total || 0);
    r.items.forEach((item: any) => {
      const c = Number(item.costPrice || item.product?.costPrice || item.product?.cost_price || 0);
      retCogs += c * Number(item.quantity || 0);
    });
  });

  const netRev = grossRev - retTotal;
  const netCogs = soldCogs - retCogs;
  const grossProfit = netRev - netCogs;

  console.log('--- CHI TIẾT BÁO CÁO THÁNG 7/2026 ---');
  console.log('(1) Doanh thu bán hàng:', grossRev.toLocaleString('vi-VN'));
  console.log('(2) Giảm trừ doanh thu:', retTotal.toLocaleString('vi-VN'));
  console.log('(3) Doanh thu thuần:', netRev.toLocaleString('vi-VN'));
  console.log('(4) Giá vốn hàng bán (COGS):', netCogs.toLocaleString('vi-VN'));
  console.log('(5) Lợi nhuận gộp:', grossProfit.toLocaleString('vi-VN'));
}

main().catch(console.error).finally(() => process.exit(0));
