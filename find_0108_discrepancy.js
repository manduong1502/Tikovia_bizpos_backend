const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

function parseReportDateRange(reqQuery) {
  let startDate;
  let endDate;

  const { date, fromDate, toDate } = reqQuery;

  const parseYMD = (str, isEnd = false) => {
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
  };

  if (date) {
    const s = parseYMD(String(date), false);
    const e = parseYMD(String(date), true);
    startDate = new Date(s.getTime() - 24 * 3600 * 1000);
    endDate = new Date(e.getTime() + 24 * 3600 * 1000);
  } else if (fromDate || toDate) {
    const fStr = fromDate ? String(fromDate) : '';
    const tStr = toDate ? String(toDate) : (fromDate ? String(fromDate) : '');
    const s = parseYMD(fStr, false);
    const e = parseYMD(tStr, true);
    startDate = s.getTime() > 0 ? new Date(s.getTime() - 24 * 3600 * 1000) : new Date(0);
    endDate = new Date(e.getTime() + 24 * 3600 * 1000);
  } else {
    startDate = new Date(0);
    endDate = new Date();
  }

  return { startDate, endDate };
}

async function findDiscrepancy() {
  const tenantId = 1;
  const reqQuery = { fromDate: '1/8/2026', toDate: '1/8/2026' };
  const { startDate, endDate } = parseReportDateRange(reqQuery);

  const rawOrders = await prisma.order.findMany({
    where: { tenantId, createdAt: { gte: startDate, lte: endDate }, status: { not: 'CANCELLED' } }
  });

  console.log(`rawOrders total: ${rawOrders.length}`);

  // Sales report logic for 01/08/2026:
  const salesOrders = [];
  rawOrders.forEach(order => {
    const vnTime = new Date(new Date(order.createdAt).getTime() + 7 * 3600 * 1000);
    const dateStr = `${vnTime.getUTCFullYear()}-${String(vnTime.getUTCMonth() + 1).padStart(2, '0')}-${String(vnTime.getUTCDate()).padStart(2, '0')}`;
    if (dateStr === '2026-08-01') {
      salesOrders.push(order);
    }
  });

  const salesRev = salesOrders.reduce((sum, o) => sum + Number(o.total || 0), 0);
  console.log(`Sales Report order count: ${salesOrders.length}, Revenue: ${salesRev}`);

  // Financial report logic with toLocaleDateString:
  const getYMD = (dateInput) => {
    if (!dateInput) return '';
    const d = new Date(dateInput);
    if (isNaN(d.getTime())) return '';
    try {
      return d.toLocaleDateString('sv-SE', { timeZone: 'Asia/Ho_Chi_Minh' });
    } catch {
      const vnTime = new Date(d.getTime() + 7 * 3600 * 1000);
      return `${vnTime.getUTCFullYear()}-${String(vnTime.getUTCMonth() + 1).padStart(2, '0')}-${String(vnTime.getUTCDate()).padStart(2, '0')}`;
    }
  };

  const finOrders = rawOrders.filter(o => getYMD(o.createdAt) === '2026-08-01');
  const finRev = finOrders.reduce((sum, o) => sum + Number(o.total || 0), 0);
  console.log(`Financial Report order count: ${finOrders.length}, Revenue: ${finRev}`);

  // Check diff
  const salesSet = new Set(salesOrders.map(o => o.id));
  const finSet = new Set(finOrders.map(o => o.id));

  const diffInFin = finOrders.filter(o => !salesSet.has(o.id));
  const diffInSales = salesOrders.filter(o => !finSet.has(o.id));

  console.log(`Diff in Fin (not Sales): ${diffInFin.length}`);
  diffInFin.forEach(o => console.log(`  ID: ${o.id}, Code: ${o.code}, CreatedAt: ${o.createdAt.toISOString()}, Total: ${o.total}`));

  console.log(`Diff in Sales (not Fin): ${diffInSales.length}`);
  diffInSales.forEach(o => console.log(`  ID: ${o.id}, Code: ${o.code}, CreatedAt: ${o.createdAt.toISOString()}, Total: ${o.total}`));
}

findDiscrepancy()
  .catch(console.error)
  .finally(() => prisma.$disconnect());
