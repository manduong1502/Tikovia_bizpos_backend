const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

function parseYMD(str, isEnd = false) {
  if (!str) return isEnd ? new Date() : new Date(0);
  const clean = str.split('T')[0].trim();
  let y = 0, m = 0, d = 0;
  if (clean.includes('/')) {
    const parts = clean.split('/');
    d = parseInt(parts[0], 10);
    m = parseInt(parts[1], 10);
    y = parseInt(parts[2], 10);
  } else if (clean.includes('-')) {
    const parts = clean.split('-');
    if (parts[0].length === 4) {
      y = parseInt(parts[0], 10);
      m = parseInt(parts[1], 10);
      d = parseInt(parts[2], 10);
    } else {
      d = parseInt(parts[0], 10);
      m = parseInt(parts[1], 10);
      y = parseInt(parts[2], 10);
    }
  }

  if (y && m && d) {
    const sy = String(y).padStart(4, '0');
    const sm = String(m).padStart(2, '0');
    const sd = String(d).padStart(2, '0');
    return isEnd ? new Date(`${sy}-${sm}-${sd}T23:59:59.999+07:00`) : new Date(`${sy}-${sm}-${sd}T00:00:00.000+07:00`);
  }
  return isEnd ? new Date() : new Date(0);
}

async function debugDiscrepancy() {
  const tenantId = 1;
  const reqQuery = { fromDate: '1/8/2026', toDate: '1/8/2026' };

  const s = parseYMD('1/8/2026', false);
  const e = parseYMD('1/8/2026', true);
  const startDate = new Date(s.getTime() - 24 * 3600 * 1000);
  const endDate = new Date(e.getTime() + 24 * 3600 * 1000);

  const rawOrders = await prisma.order.findMany({
    where: { tenantId, createdAt: { gte: startDate, lte: endDate }, status: { not: 'CANCELLED' } },
    include: { items: { include: { product: true } } }
  });

  const rawReturns = await prisma.return.findMany({
    where: { tenantId, createdAt: { gte: startDate, lte: endDate }, status: 'COMPLETED' },
    include: { items: { include: { product: true } } }
  });

  console.log(`rawOrders count: ${rawOrders.length}`);
  console.log(`rawReturns count: ${rawReturns.length}`);

  // 1. Sales report logic
  const salesOrders = [];
  rawOrders.forEach(o => {
    const vnTime = new Date(new Date(o.createdAt).getTime() + 7 * 3600 * 1000);
    const dateStr = `${vnTime.getUTCFullYear()}-${String(vnTime.getUTCMonth() + 1).padStart(2, '0')}-${String(vnTime.getUTCDate()).padStart(2, '0')}`;
    if (dateStr === '2026-08-01') {
      salesOrders.push(o);
    }
  });

  const salesRev = salesOrders.reduce((sum, o) => sum + Number(o.total || 0), 0);
  console.log(`Sales Report logic orders count: ${salesOrders.length}, Total Gross Sales: ${salesRev}`);

  // 2. Financial report filter logic
  const getYMD = (dateInput) => {
    if (!dateInput) return '';
    const d = new Date(dateInput);
    if (isNaN(d.getTime())) return '';
    const vnTime = new Date(d.getTime() + 7 * 3600 * 1000);
    const year = vnTime.getUTCFullYear();
    const month = String(vnTime.getUTCMonth() + 1).padStart(2, '0');
    const day = String(vnTime.getUTCDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
  };

  const finOrders = rawOrders.filter(o => getYMD(o.createdAt) === '2026-08-01');
  const finRev = finOrders.reduce((sum, o) => sum + Number(o.total || 0), 0);
  console.log(`Financial Report filter logic orders count: ${finOrders.length}, Total Gross Sales: ${finRev}`);

  // Compare diff between salesOrders and finOrders
  const salesIds = new Set(salesOrders.map(o => o.id));
  const finIds = new Set(finOrders.map(o => o.id));

  const inFinNotSales = finOrders.filter(o => !salesIds.has(o.id));
  const inSalesNotFin = salesOrders.filter(o => !finIds.has(o.id));

  console.log(`In Financial but NOT Sales count: ${inFinNotSales.length}`);
  inFinNotSales.forEach(o => console.log(`  Order ID: ${o.id}, Code: ${o.code}, CreatedAt: ${o.createdAt.toISOString()}, Total: ${o.total}`));

  console.log(`In Sales but NOT Financial count: ${inSalesNotFin.length}`);
  inSalesNotFin.forEach(o => console.log(`  Order ID: ${o.id}, Code: ${o.code}, CreatedAt: ${o.createdAt.toISOString()}, Total: ${o.total}`));
}

debugDiscrepancy()
  .catch(console.error)
  .finally(() => prisma.$disconnect());
