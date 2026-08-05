const { PrismaClient } = require('@prisma/client');
const XLSX = require('xlsx');
const path = require('path');

const prisma = new PrismaClient();

const excelDateToJSDate = (serial) => {
  if (typeof serial === 'string') {
    const d = new Date(serial);
    if (!isNaN(d.getTime())) return d;
  }
  if (typeof serial === 'number') {
    const utc_days = Math.floor(serial - 25569);
    const utc_value = utc_days * 86400;
    const date_info = new Date(utc_value * 1000);
    const fractional_day = serial - Math.floor(serial) + 0.0000001;
    let total_seconds = Math.floor(86400 * fractional_day);
    const seconds = total_seconds % 60;
    total_seconds = Math.floor(total_seconds / 60);
    const minutes = total_seconds % 60;
    const hours = Math.floor(total_seconds / 60);
    return new Date(date_info.getFullYear(), date_info.getMonth(), date_info.getDate(), hours, minutes, seconds);
  }
  return new Date();
};

async function run() {
  console.log('=== STARTING SALES RETURNS IMPORT ===');
  
  const tenant = await prisma.tenant.findFirst();
  if (!tenant) {
    console.error('No tenant found in DB!');
    return;
  }
  const tenantId = tenant.id;
  console.log('Using tenantId:', tenantId);

  // Read excel file
  const excelPath = path.resolve(__dirname, '../DanhSachChiTietTraHang_KV05082026-153713-675.xlsx');
  console.log('Reading excel from:', excelPath);

  const wb = XLSX.readFile(excelPath);
  const ws = wb.Sheets[wb.SheetNames[0]];
  const data = XLSX.utils.sheet_to_json(ws, { header: 1 });

  // Map products by SKU
  const products = await prisma.product.findMany({ where: { tenantId } });
  const productSkuMap = {};
  products.forEach(p => {
    productSkuMap[p.sku.trim()] = p.id;
  });

  // Map customers by code
  const customers = await prisma.customer.findMany({ where: { tenantId } });
  const customerCodeMap = {};
  customers.forEach(c => {
    customerCodeMap[c.code.trim()] = c.id;
  });

  // Map orders by code
  const orders = await prisma.order.findMany({ where: { tenantId } });
  const orderCodeMap = {};
  orders.forEach(o => {
    if (o.code) orderCodeMap[o.code.trim()] = o.id;
  });

  // Parse returns from excel
  const returnsMap = {};

  data.slice(1).forEach((row) => {
    const code = String(row[1] || '').trim();
    if (!code || !code.startsWith('TH')) return;
    
    const dateObj = excelDateToJSDate(row[2]);
    const orderCode = String(row[4] || '').trim();
    const customerCode = String(row[7] || '').trim();
    const customerName = String(row[8] || '').trim();
    const note = String(row[12] || '').trim();
    const totalVal = Number(row[13] || row[15] || 0);
    const paidVal = Number(row[18] || totalVal);
    const statusStr = String(row[25] || '').trim();
    const status = statusStr === 'Đã hủy' ? 'CANCELLED' : 'COMPLETED';
    
    const itemSku = String(row[26] || '').trim();
    const itemName = String(row[27] || '').trim();
    const itemQty = Number(row[31] || 0);
    const itemPrice = Number(row[35] || row[32] || 0);

    if (!returnsMap[code]) {
      returnsMap[code] = {
        code,
        createdAt: dateObj,
        orderCode,
        customerCode,
        customerName,
        note,
        total: totalVal,
        paid: paidVal,
        status,
        items: []
      };
    }

    if (itemSku) {
      returnsMap[code].items.push({
        sku: itemSku,
        name: itemName,
        quantity: itemQty,
        price: itemPrice,
        total: itemQty * itemPrice
      });
    }
  });

  const returnCodes = Object.keys(returnsMap);
  console.log(`Found ${returnCodes.length} return tickets to import/update.`);

  let importedCount = 0;
  let updatedCount = 0;
  let totalImportedSum = 0;

  for (const code of returnCodes) {
    const rData = returnsMap[code];
    const orderId = rData.orderCode ? (orderCodeMap[rData.orderCode] || null) : null;
    const customerId = rData.customerCode ? (customerCodeMap[rData.customerCode] || null) : null;

    // Build return items with matched productId
    const itemsToCreate = [];
    for (const it of rData.items) {
      const pId = productSkuMap[it.sku];
      if (pId) {
        itemsToCreate.push({
          productId: pId,
          quantity: it.quantity,
          price: it.price,
          total: it.total
        });
      } else {
        console.warn(`Product SKU [${it.sku}] not found in database for return ${code}`);
      }
    }

    // Check if return ticket already exists
    const existing = await prisma.return.findFirst({
      where: { tenantId, code: rData.code }
    });

    if (existing) {
      // Update existing return
      await prisma.return.update({
        where: { id: existing.id },
        data: {
          orderId,
          customerId,
          total: rData.total,
          paid: rData.paid,
          reason: rData.note || 'Trả hàng từ file Excel KiotViet',
          status: rData.status,
          createdAt: rData.createdAt,
          items: {
            deleteMany: {},
            create: itemsToCreate
          }
        }
      });
      updatedCount++;
    } else {
      // Create new return
      await prisma.createReturn(tenantId, rData, orderId, customerId, itemsToCreate);
      importedCount++;
    }

    totalImportedSum += rData.total;
  }

  console.log(`=== IMPORT SUMMARY ===`);
  console.log(`Created new: ${importedCount}`);
  console.log(`Updated existing: ${updatedCount}`);
  console.log(`Total return tickets processed: ${returnCodes.length}`);
  console.log(`Grand total return sum: ${totalImportedSum.toLocaleString('vi-VN')} VNĐ`);
}

// Helper to create return ticket cleanly
prisma.createReturn = async function(tenantId, rData, orderId, customerId, itemsToCreate) {
  return prisma.return.create({
    data: {
      tenantId,
      code: rData.code,
      orderId,
      customerId,
      total: rData.total,
      discount: 0,
      paid: rData.paid,
      reason: rData.note || 'Trả hàng từ file Excel KiotViet',
      status: rData.status,
      createdAt: rData.createdAt,
      items: {
        create: itemsToCreate
      }
    }
  });
};

run()
  .catch(console.error)
  .finally(async () => {
    await prisma.$disconnect();
  });
