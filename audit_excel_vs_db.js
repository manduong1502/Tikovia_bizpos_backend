const fs = require('fs');
const path = require('path');
const XLSX = require('xlsx');
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function auditExcelVsDb() {
  console.log('=== STARTING DEEP AUDIT: EXCEL FILES VS DATABASE ===');

  const file1Path = path.join(__dirname, 'sản phẩm giá vốn.xlsx');
  const file2Path = path.join(__dirname, 'BangGia_KV05082026-231835-162.xlsx');

  if (!fs.existsSync(file1Path) || !fs.existsSync(file2Path)) {
    console.error('One or both Excel files missing!');
    return;
  }

  const wb1 = XLSX.readFile(file1Path);
  const rows1 = XLSX.utils.sheet_to_json(wb1.Sheets[wb1.SheetNames[0]], { defval: '' });

  const wb2 = XLSX.readFile(file2Path);
  const rows2 = XLSX.utils.sheet_to_json(wb2.Sheets[wb2.SheetNames[0]], { defval: '' });

  console.log(`File 1 (sản phẩm giá vốn.xlsx) rows: ${rows1.length}`);
  console.log(`File 2 (BangGia_KV05082026-231835-162.xlsx) rows: ${rows2.length}`);

  const tenants = await prisma.tenant.findMany();
  
  for (const tenant of tenants) {
    const tenantId = tenant.id;
    console.log(`\nAuditing Tenant ID: ${tenantId} (${tenant.name || tenant.subdomain})...`);

    const dbProducts = await prisma.product.findMany({
      where: { tenantId },
      include: { category: true }
    });

    const dbMap = new Map();
    dbProducts.forEach(p => dbMap.set(p.sku.trim().toLowerCase(), p));

    let matched = 0;
    let mismatched = 0;
    let missingInDb = 0;
    let fixedCount = 0;

    const auditResults = [];

    for (const r of rows1) {
      const sku = String(r['Mã hàng'] || '').trim();
      const name = String(r['Tên hàng'] || '').trim();
      if (!sku) continue;

      const excelCost = Number(r['Giá vốn']) || 0;
      const excelSell = Number(r['Giá bán']) || 0;
      const excelStock = Number(r['Tồn kho']) || 0;
      const excelUnit = String(r['ĐVT'] || '').trim() || 'Kg';
      const excelCat = String(r['Nhóm hàng(3 Cấp)'] || r['Nhóm hàng'] || '').trim();

      const key = sku.toLowerCase();
      const dbProd = dbMap.get(key);

      if (!dbProd) {
        missingInDb++;
        auditResults.push({ sku, status: 'MISSING_IN_DB', name });
        continue;
      }

      const dbCost = Number(dbProd.costPrice || 0);
      const dbSell = Number(dbProd.sellPrice || 0);
      const dbStock = Number(dbProd.stock || 0);
      const dbUnit = String(dbProd.unit || '').trim();
      const dbCat = String(dbProd.category?.name || '').trim();

      const isCostMatch = Math.abs(dbCost - excelCost) < 0.01;
      const isSellMatch = Math.abs(dbSell - excelSell) < 0.01;
      const isStockMatch = Math.abs(dbStock - excelStock) < 0.01;
      const isNameMatch = dbProd.name === name;

      if (isCostMatch && isSellMatch && isStockMatch && isNameMatch) {
        matched++;
      } else {
        mismatched++;
        auditResults.push({
          sku,
          name,
          diff: {
            name: !isNameMatch ? { excel: name, db: dbProd.name } : null,
            costPrice: !isCostMatch ? { excel: excelCost, db: dbCost } : null,
            sellPrice: !isSellMatch ? { excel: excelSell, db: dbSell } : null,
            stock: !isStockMatch ? { excel: excelStock, db: dbStock } : null,
          }
        });

        // Auto-heal / fix database to match Excel 100%
        await prisma.product.update({
          where: { id: dbProd.id },
          data: {
            name,
            costPrice: excelCost,
            sellPrice: excelSell,
            stock: excelStock,
            unit: excelUnit
          }
        });
        fixedCount++;
      }
    }

    console.log(`=== AUDIT SUMMARY FOR TENANT ${tenantId} ===`);
    console.log(`Total Excel Items Checked: ${rows1.length}`);
    console.log(`Matched 100% Exactly: ${matched}`);
    console.log(`Mismatches Found & Auto-fixed: ${fixedCount}`);
    console.log(`Missing in DB: ${missingInDb}`);
    
    fs.writeFileSync(
      path.join(__dirname, 'audit_report.json'),
      JSON.stringify({ total: rows1.length, matched, fixedCount, missingInDb, auditResults }, null, 2)
    );
  }

  console.log('=== AUDIT FINISHED SUCCESSFULLY ===');
}

auditExcelVsDb()
  .catch(console.error)
  .finally(() => prisma.$disconnect());
