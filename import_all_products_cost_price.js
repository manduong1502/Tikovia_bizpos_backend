const fs = require('fs');
const path = require('path');
const XLSX = require('xlsx');
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function importAllProducts() {
  console.log('=== START IMPORTING ALL PRODUCTS WITH COST PRICE ===');

  const filePath = path.join(__dirname, 'sản phẩm giá vốn.xlsx');
  if (!fs.existsSync(filePath)) {
    console.error('Excel file not found at:', filePath);
    return;
  }

  const workbook = XLSX.readFile(filePath);
  const sheetName = workbook.SheetNames[0];
  const rows = XLSX.utils.sheet_to_json(workbook.Sheets[sheetName], { defval: '' });

  console.log(`Total rows in Excel file: ${rows.length}`);

  const tenants = await prisma.tenant.findMany();
  console.log(`Found ${tenants.length} tenant(s) in database.`);

  for (const tenant of tenants) {
    const tenantId = tenant.id;
    console.log(`Processing Tenant ID: ${tenantId} (${tenant.name || tenant.subdomain})...`);

    const categoryMap = new Map();
    const existingCats = await prisma.category.findMany({ where: { tenantId } });
    existingCats.forEach(c => categoryMap.set(c.name.trim().toLowerCase(), c.id));

    let createdCats = 0;
    let updatedProds = 0;
    let createdProds = 0;

    for (const r of rows) {
      const sku = String(r['Mã hàng'] || '').trim();
      const name = String(r['Tên hàng'] || '').trim();
      if (!sku || !name) continue;

      const catName = String(r['Nhóm hàng(3 Cấp)'] || r['Nhóm hàng'] || '').trim();
      const sellPrice = Number(r['Giá bán']) || 0;
      const costPrice = Number(r['Giá vốn']) || 0;
      const stock = Number(r['Tồn kho']) || 0;
      const minStock = Number(r['Tồn nhỏ nhất']) || 0;
      const maxStock = Number(r['Tồn lớn nhất']) || 999999999;
      const unit = String(r['ĐVT'] || '').trim() || 'Kg';
      const description = String(r['Mô tả'] || '').trim() || null;
      const note = String(r['Mẫu ghi chú'] || '').trim() || null;
      const location = String(r['Vị trí'] || '').trim() || null;

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

      const existing = await prisma.product.findFirst({
        where: { tenantId, sku }
      });

      if (existing) {
        await prisma.product.update({
          where: { id: existing.id },
          data: {
            name,
            categoryId,
            costPrice,
            sellPrice,
            stock,
            minStock,
            maxStock,
            unit,
            description,
            note,
            location
          }
        });
        updatedProds++;
      } else {
        await prisma.product.create({
          data: {
            tenantId,
            sku,
            name,
            categoryId,
            costPrice,
            sellPrice,
            stock,
            minStock,
            maxStock,
            unit,
            description,
            note,
            location
          }
        });
        createdProds++;
      }
    }

    console.log(`Tenant ${tenantId}: Updated ${updatedProds} products, Created ${createdProds} products, Created ${createdCats} categories.`);
  }

  console.log('=== IMPORT ALL PRODUCTS FINISHED SUCCESSFULLY ===');
}

importAllProducts()
  .catch(console.error)
  .finally(() => prisma.$disconnect());
