import { PrismaClient } from '@prisma/client';
import path from 'path';
import * as XLSX from 'xlsx';

const prisma = new PrismaClient();

async function main() {
  const dir = 'd:/Mẫn/demo web kioviet';
  const repWb = XLSX.readFile(path.join(dir, 'BaoCaoBanHangTheoLoiNhuan_KV02082026-182134-776.xlsx'));
  const repRows: any[] = XLSX.utils.sheet_to_json(repWb.Sheets[repWb.SheetNames[0]]);

  const excelJulyOrders = new Map<string, number>();
  let excelJulyCostSum = 0;

  repRows.forEach(r => {
    const rawDate = r['Thời gian (theo giao dịch)'];
    const code = String(r['Mã giao dịch'] || '').trim().toLowerCase();
    const cost = Number(r['Tổng giá vốn (theo giao dịch)'] || 0);

    if (rawDate && code) {
      let dateStr = '';
      if (typeof rawDate === 'number') {
        const d = XLSX.SSF.parse_date_code(rawDate);
        if (d) dateStr = String(d.d).padStart(2, '0') + '/' + String(d.m).padStart(2, '0') + '/' + d.y;
      } else if (typeof rawDate === 'string') {
        dateStr = String(rawDate).substring(0, 10);
      }

      if (dateStr.includes('/07/2026')) {
        if (!excelJulyOrders.has(code)) {
          excelJulyOrders.set(code, cost);
          excelJulyCostSum += cost;
        }
      }
    }
  });

  console.log(`Excel July Orders count: ${excelJulyOrders.size}, Total Cost: ${excelJulyCostSum}`);

  // Query DB Orders for July 2026
  const start = new Date('2026-07-01T00:00:00.000Z');
  const end = new Date('2026-07-31T23:59:59.999Z');

  const dbJulyOrders = await prisma.order.findMany({
    where: {
      createdAt: { gte: start, lte: end },
      status: 'COMPLETED'
    },
    select: {
      code: true,
      costPrice: true,
      total: true,
      createdAt: true
    }
  });

  let dbCostSum = 0;
  let dbRevSum = 0;

  let diffCount = 0;
  dbJulyOrders.forEach(o => {
    const code = o.code.toLowerCase();
    const dbCost = Number(o.costPrice);
    const dbRev = Number(o.total);

    dbCostSum += dbCost;
    dbRevSum += dbRev;

    const excelCost = excelJulyOrders.get(code);
    if (excelCost === undefined) {
      console.log(`[EXTRA IN DB] Order ${o.code} not in July Excel! dbCost: ${dbCost}, dbRev: ${dbRev}`);
      diffCount++;
    } else if (Math.abs(dbCost - excelCost) > 1) {
      console.log(`[COST MISMATCH] Order ${o.code}: dbCost=${dbCost}, excelCost=${excelCost}`);
      diffCount++;
    }
  });

  console.log(`DB July Orders count: ${dbJulyOrders.length}`);
  console.log(`DB July Total Revenue: ${dbRevSum}`);
  console.log(`DB July Total Cost: ${dbCostSum}`);
}

main().finally(() => prisma.$disconnect());
