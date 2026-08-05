const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function testAllReportsSum() {
  const tenantId = 1;

  // Query August 2026 orders (01/08/2026 - 31/08/2026)
  const startDate = new Date('2026-08-01T00:00:00.000+07:00');
  const endDate = new Date('2026-08-31T23:59:59.999+07:00');

  const orders = await prisma.order.findMany({
    where: { tenantId, createdAt: { gte: startDate, lte: endDate }, status: { not: 'CANCELLED' } },
    include: { items: true, customer: true }
  });

  const returns = await prisma.return.findMany({
    where: { tenantId, createdAt: { gte: startDate, lte: endDate }, status: 'COMPLETED' },
    include: { items: true, customer: true }
  });

  console.log(`August 2026 Orders count: ${orders.length}`);
  console.log(`August 2026 Returns count: ${returns.length}`);

  const totalOrderTotal = orders.reduce((sum, o) => sum + Number(o.total || 0), 0);
  const totalReturnTotal = returns.reduce((sum, r) => sum + Number(r.total || 0), 0);

  console.log(`Total Order Revenue: ${totalOrderTotal}`);
  console.log(`Total Return Amount: ${totalReturnTotal}`);
  console.log(`Net Revenue (Orders - Returns): ${totalOrderTotal - totalReturnTotal}`);

  // Sum from products items
  let prodTotalRev = 0;
  let prodTotalRet = 0;

  orders.forEach(o => {
    (o.items || []).forEach(it => {
      prodTotalRev += Number(it.total || (Number(it.price || 0) * Number(it.quantity || 0)));
    });
  });

  returns.forEach(r => {
    (r.items || []).forEach(it => {
      prodTotalRet += Number(it.total || (Number(it.price || 0) * Number(it.quantity || 0)));
    });
  });

  console.log(`Products Sum - Sold Items Total: ${prodTotalRev}`);
  console.log(`Products Sum - Return Items Total: ${prodTotalRet}`);
  console.log(`Products Sum Net: ${prodTotalRev - prodTotalRet}`);

  // Sum from customers
  let custOrdersTotal = 0;
  let custReturnsTotal = 0;
  let nullCustomerOrdersTotal = 0;

  orders.forEach(o => {
    if (o.customerId) {
      custOrdersTotal += Number(o.total || 0);
    } else {
      nullCustomerOrdersTotal += Number(o.total || 0);
    }
  });

  returns.forEach(r => {
    if (r.customerId) {
      custReturnsTotal += Number(r.total || 0);
    }
  });

  console.log(`Customers Sum (with customerId): Orders = ${custOrdersTotal}, Returns = ${custReturnsTotal}`);
  console.log(`Orders without customerId (Khách lẻ): ${nullCustomerOrdersTotal}`);
}

testAllReportsSum()
  .catch(console.error)
  .finally(() => prisma.$disconnect());
