const fs = require('fs');
const path = require('path');
const XLSX = require('xlsx');
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function importPricebook() {
  console.log('=== START IMPORTING PRICEBOOK EXCEL ===');
  
  const filePath = path.join(__dirname, 'BangGia_KV05082026-231835-162.xlsx');
  if (!fs.existsSync(filePath)) {
    console.error('File not found at:', filePath);
    return;
  }

  const workbook = XLSX.readFile(filePath);
  const sheetName = workbook.SheetNames[0];
  const rows = XLSX.utils.sheet_to_json(workbook.Sheets[sheetName], { defval: '' });

  console.log(`Total rows read from Excel: ${rows.length}`);

  const tenants = await prisma.tenant.findMany();
  console.log(`Found ${tenants.length} tenants in database.`);

  for (const tenant of tenants) {
    const tenantId = tenant.id;
    console.log(`Processing Tenant ID: ${tenantId} (${tenant.name || tenant.subdomain})...`);

    const categoryMap = new Map();
    const existingCats = await prisma.category.findMany({ where: { tenantId } });
    existingCats.forEach(c => categoryMap.set(c.name.trim().toLowerCase(), c.id));

    let createdCats = 0;
    let updatedProds = 0;
    let createdProds = 0;

    for (const row of rows) {
      const sku = String(row['Mã hàng'] || '').trim();
      const name = String(row['Tên hàng'] || '').trim();
      if (!sku || !name) continue;

      const unit = String(row['Đơn vị tính'] || '').trim() || 'Kg';
      const catName = String(row['Nhóm hàng'] || '').trim();
      const stock = Number(row['Tồn kho']) || 0;
      const costPrice = Number(row['Giá vốn']) || 0;
      const sellPrice = Number(row['Bảng giá chung']) || 0;

      let categoryId = null;
      if (catName) {
        const catKey = catName.toLowerCase();
        if (categoryMap.has(catKey)) {
          categoryId = categoryMap.get(catKey);
        } else {
          const newCat = await prisma.category.create({
            data: { tenantId, name: catName }
          });
          categoryId = newCat.id;
          categoryMap.set(catKey, categoryId);
          createdCats++;
        }
      }

      const existingProduct = await prisma.product.findFirst({
        where: { tenantId, sku }
      });

      if (existingProduct) {
        await prisma.product.update({
          where: { id: existingProduct.id },
          data: {
            name,
            unit,
            costPrice,
            sellPrice,
            stock,
            categoryId
          }
        });
        updatedProds++;
      } else {
        await prisma.product.create({
          data: {
            tenantId,
            sku,
            name,
            unit,
            costPrice,
            sellPrice,
            stock,
            categoryId
          }
        });
        createdProds++;
      }
    }

    console.log(`Tenant ${tenantId} summary: ${updatedProds} products updated, ${createdProds} products created, ${createdCats} categories created.`);
  }

  console.log('=== IMPORT PRICEBOOK FINISHED SUCCESSFULLY ===');
}

importPricebook()
  .catch(console.error)
  .finally(() => prisma.$disconnect());
