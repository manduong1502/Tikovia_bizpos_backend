import prisma from '../config/database';

async function main() {
  const startDate = new Date('2026-07-01T00:00:00.000Z');
  const endDate = new Date('2026-07-31T23:59:59.999Z');

  const tenant = await prisma.tenant.findFirst();
  if (!tenant) return;

  const orders = await prisma.order.findMany({
    where: { tenantId: tenant.id, createdAt: { gte: startDate, lte: endDate }, status: { not: 'CANCELLED' } },
    include: { items: { include: { product: true } } }
  });

  const returns = await prisma.return.findMany({
    where: { tenantId: tenant.id, createdAt: { gte: startDate, lte: endDate } },
    include: { items: { include: { product: true } } }
  });

  const cashbook = await prisma.cashbookEntry.findMany({
    where: { tenantId: tenant.id, createdAt: { gte: startDate, lte: endDate }, isAccounting: true, status: { not: 'cancelled' } }
  });

  const totalOrderAmount = orders.reduce((sum: number, o: any) => sum + Number(o.total || 0), 0);
  const totalOrderDiscount = orders.reduce((sum: number, o: any) => sum + Number(o.discount || 0), 0);
  const totalSubtotal = orders.reduce((sum: number, o: any) => sum + Number(o.subtotal || o.total || 0), 0);

  console.log('--- TEST JULY 2026 CALCULATIONS ---');
  console.log('sum(Order.total):', totalOrderAmount.toLocaleString('vi-VN'));
  console.log('sum(Order.discount):', totalOrderDiscount.toLocaleString('vi-VN'));
  console.log('sum(Order.subtotal):', totalSubtotal.toLocaleString('vi-VN'));
  console.log('sum(Order.total + Order.discount):', (totalOrderAmount + totalOrderDiscount).toLocaleString('vi-VN'));

  const isSupplierPayment = (c: any) => {
    if (c.supplierId || c.partnerType === 'supplier') return true;
    const cat = (c.category || '').toLowerCase();
    if (cat.includes('nhà cung cấp') || cat.includes('ncc') || cat.includes('trả nợ') || cat.includes('tiền trả')) return true;
    return false;
  };

  const operatingExpenses = cashbook
    .filter((c: any) => c.type === 'EXPENSE' && !isSupplierPayment(c))
    .reduce((sum: number, c: any) => sum + Number(c.amount || 0), 0);

  console.log('\n--- OPERATING EXPENSES (AFTER FILTERING SUPPLIER PAYMENTS) ---');
  console.log('Chi phí (6):', operatingExpenses.toLocaleString('vi-VN'));
}

main().catch(console.error).finally(() => process.exit(0));
