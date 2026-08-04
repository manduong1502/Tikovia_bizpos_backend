import { PrismaClient } from '@prisma/client';
import * as XLSX from 'xlsx';
import * as path from 'path';
import * as fs from 'fs';

const prisma = new PrismaClient();

async function importYenDebt() {
  const filePath = 'C:/Users/ADMIN/Downloads/CongNoChiTietKhachHang_KH001119_KV04082026-091009-843.xlsx';
  if (!fs.existsSync(filePath)) {
    console.error('File not found:', filePath);
    process.exit(1);
  }

  const wb = XLSX.readFile(filePath);
  const sheet = wb.Sheets[wb.SheetNames[0]];
  const rows: any[][] = XLSX.utils.sheet_to_json(sheet, { header: 1 });

  let headerIdx = -1;
  for (let i = 0; i < rows.length; i++) {
    if (rows[i] && rows[i][0] === 'Thời gian' && rows[i][1] === 'Mã') {
      headerIdx = i;
      break;
    }
  }

  if (headerIdx === -1) {
    console.error('Header row not found in Excel!');
    process.exit(1);
  }

  // Parse tenant & user
  const tenant = await prisma.tenant.findFirst();
  if (!tenant) {
    console.error('No tenant found!');
    process.exit(1);
  }
  const user = await prisma.user.findFirst({ where: { tenantId: tenant.id } });
  if (!user) {
    console.error('No user found!');
    process.exit(1);
  }

  // Find or create customer Sister Yến
  let customer = await prisma.customer.findFirst({
    where: { tenantId: tenant.id, code: 'KH001119' }
  });

  if (!customer) {
    customer = await prisma.customer.create({
      data: {
        tenantId: tenant.id,
        code: 'KH001119',
        name: 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến',
        phone: '0935657905',
        totalSpent: 485796600,
        totalDebt: 17027180,
      }
    });
  }

  console.log(`Customer Sister Yến ID: ${customer.id}`);

  // Clean old orders & cashbooks for KH001119
  await prisma.cashbookEntry.deleteMany({
    where: { tenantId: tenant.id, customerId: customer.id }
  });
  await prisma.orderItem.deleteMany({
    where: { order: { customerId: customer.id } }
  });
  await prisma.order.deleteMany({
    where: { tenantId: tenant.id, customerId: customer.id }
  });

  console.log('Cleaned old records for Sister Yến.');

  let ordersToInsert: any[] = [];
  let cashbooksToInsert: any[] = [];
  let currentOrder: any = null;

  // Helper date parser: "01/01/2026\r\n      14:07" or "01/01/2026 14:07"
  const parseDate = (str: any) => {
    if (!str) return new Date();
    const clean = String(str).replace(/\r?\n\s*/g, ' ').trim();
    const match = clean.match(/(\d{2})\/(\d{2})\/(\d{4})\s+(\d{2}):(\d{2})/);
    if (match) {
      const [_, day, month, year, hour, min] = match;
      return new Date(Date.UTC(Number(year), Number(month) - 1, Number(day), Number(hour) - 7, Number(min)));
    }
    return new Date();
  };

  for (let i = headerIdx + 1; i < rows.length; i++) {
    const r = rows[i];
    if (!r || r.length === 0) continue;

    const rawDate = r[0];
    const code = r[1];
    const type = r[2];
    const debit = r[10]; // Ghi nợ
    const credit = r[11]; // Ghi có

    if (code && type === 'Bán hàng') {
      if (currentOrder) ordersToInsert.push(currentOrder);
      currentOrder = {
        code: String(code).trim(),
        date: parseDate(rawDate),
        total: Number(debit || 0),
        items: []
      };
    } else if (code && type === 'Thanh toán') {
      if (currentOrder) { ordersToInsert.push(currentOrder); currentOrder = null; }
      cashbooksToInsert.push({
        code: String(code).trim(),
        date: parseDate(rawDate),
        amount: Number(credit || 0),
        type: 'INCOME',
        category: 'Thu tiền khách trả',
        partnerType: 'customer',
        customerId: customer.id,
        partnerName: customer.name,
        partnerPhone: customer.phone,
        description: 'Thanh toán công nợ'
      });
    } else if (currentOrder && r[1] && r[2]) {
      // Sub item row
      currentOrder.items.push({
        sku: String(r[1]).trim(),
        name: String(r[2]).trim(),
        unit: r[3] ? String(r[3]).trim() : '',
        quantity: Number(r[4] || 1),
        price: Number(r[5] || 0),
        subtotal: Number(r[9] || 0)
      });
    }
  }
  if (currentOrder) ordersToInsert.push(currentOrder);

  console.log(`Parsed ${ordersToInsert.length} orders, ${cashbooksToInsert.length} cashbooks.`);

  // Load products map by SKU
  const products = await prisma.product.findMany({ where: { tenantId: tenant.id } });
  const productMapBySku = new Map<string, number>();
  products.forEach(p => productMapBySku.set(p.sku.toLowerCase(), p.id));
  const defaultProductId = products[0]?.id || 1;

  // Insert Orders
  for (const o of ordersToInsert) {
    const createdOrder = await prisma.order.create({
      data: {
        tenantId: tenant.id,
        code: o.code,
        customerId: customer.id,
        userId: user.id,
        status: 'COMPLETED',
        total: o.total,
        paid: o.total,
        subtotal: o.total,
        createdAt: o.date,
        updatedAt: o.date,
        items: {
          create: o.items.map((it: any) => ({
            productId: productMapBySku.get(it.sku.toLowerCase()) || defaultProductId,
            quantity: it.quantity,
            price: it.price,
            total: it.subtotal
          }))
        }
      }
    });
  }

  console.log('Inserted all Orders!');

  // Insert Cashbooks
  for (const cb of cashbooksToInsert) {
    await prisma.cashbookEntry.create({
      data: {
        tenantId: tenant.id,
        code: cb.code,
        type: 'INCOME',
        amount: cb.amount,
        category: 'Thu tiền khách trả',
        partnerType: 'customer',
        customerId: customer.id,
        partnerName: cb.partnerName,
        partnerPhone: cb.partnerPhone,
        description: cb.description,
        userId: user.id,
        createdAt: cb.date,
        updatedAt: cb.date
      }
    });
  }

  console.log('Inserted all Cashbooks!');

  // Update Sister Yến customer totals
  await prisma.customer.update({
    where: { id: customer.id },
    data: {
      totalSpent: 485796600,
      totalDebt: 17027180,
    }
  });

  console.log('Successfully updated Sister Yến debt to 17.027.180!');
}

importYenDebt()
  .catch(e => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
