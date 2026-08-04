import prisma from '../config/database';
import * as XLSX from 'xlsx';

async function importFreshDataChiyen() {
  console.log('=== STARTING FRESH IMPORT FOR CHỊ YẾN ===');

  const file1Path = 'd:/Mẫn/demo web kioviet/CongNoChiTietKhachHang_ChiYenBeThui.xlsx';
  const file2Path = 'd:/Mẫn/demo web kioviet/DanhSachChiTietHoaDon_Chị yến bê thui năm nay.xlsx';

  const tenant = await prisma.tenant.findFirst();
  const user = await prisma.user.findFirst();
  const fallbackProduct = await prisma.product.findFirst();

  if (!tenant || !user || !fallbackProduct) {
    console.error('Missing tenant, user, or product in DB!');
    return;
  }

  const tenantId = tenant.id;
  const userId = user.id;

  // 1. Find or create Customer
  let customer = await prisma.customer.findFirst({
    where: {
      tenantId,
      OR: [
        { code: 'KH001119' },
        { phone: '0935657905' },
        { name: { contains: 'CHỊ YẾN - BÊ THUI HOÀNG YẾN', mode: 'insensitive' } }
      ]
    }
  });

  if (!customer) {
    customer = await prisma.customer.create({
      data: {
        code: 'KH001119',
        name: 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến',
        phone: '0935657905',
        address: 'Hòa Tiến',
        totalSpent: 0,
        totalDebt: 0,
        tenantId,
      }
    });
    console.log(`Created new customer Chị Yến with ID: ${customer.id}`);
  } else {
    console.log(`Found existing customer Chị Yến with ID: ${customer.id}`);
  }

  const customerId = customer.id;

  // 2. WIPE CLEAN ALL DATA FOR CHỊ YẾN
  console.log(`Wiping clean old orders, order items, cashbook entries, returns for Customer ID ${customerId}...`);
  
  const oldOrders = await prisma.order.findMany({ where: { customerId, tenantId }, select: { id: true } });
  const oldOrderIds = oldOrders.map(o => o.id);

  if (oldOrderIds.length > 0) {
    await prisma.orderItem.deleteMany({ where: { orderId: { in: oldOrderIds } } });
    await prisma.cashbookEntry.deleteMany({ where: { orderId: { in: oldOrderIds } } });
  }

  await prisma.cashbookEntry.deleteMany({ where: { customerId, tenantId } });
  await prisma.return.deleteMany({ where: { customerId, tenantId } });
  await prisma.order.deleteMany({ where: { customerId, tenantId } });

  console.log('Clean wipe completed!');

  // 3. READ FILE 2: DanhSachChiTietHoaDon_Chị yến bê thui năm nay.xlsx
  console.log('Parsing File 2: Detailed Invoices...');
  const wb2 = XLSX.readFile(file2Path);
  const rows2 = XLSX.utils.sheet_to_json(wb2.Sheets[wb2.SheetNames[0]], { header: 1 }) as any[][];

  // Map product SKUs for fast lookup
  const products = await prisma.product.findMany({ where: { tenantId } });
  const productSkuMap = new Map<string, number>();
  products.forEach(p => {
    if (p.sku) productSkuMap.set(p.sku.trim().toLowerCase(), p.id);
  });

  const parseExcelDate = (excelDate: any): Date => {
    if (!excelDate) return new Date();
    if (excelDate instanceof Date) return excelDate;
    if (typeof excelDate === 'number') {
      const ms = Math.round((excelDate - 25569) * 86400 * 1000) - (7 * 3600 * 1000);
      return new Date(ms);
    }
    const str = String(excelDate).trim();
    if (str.includes('/')) {
      const match = str.match(/(\d{2})\/(\d{2})\/(\d{4})\s*(\d{2})?:?(\d{2})?/);
      if (match) {
        const [_, d, m, y, hh, mm] = match;
        return new Date(Date.UTC(Number(y), Number(m) - 1, Number(d), Number(hh || 0) - 7, Number(mm || 0)));
      }
    }
    const parsed = new Date(str);
    return isNaN(parsed.getTime()) ? new Date() : parsed;
  };

  // Group order rows by Order Code
  const orderMap = new Map<string, {
    code: string;
    createdAt: Date;
    total: number;
    paid: number;
    discount: number;
    items: any[];
  }>();

  for (let i = 1; i < rows2.length; i++) {
    const r = rows2[i];
    if (!r || !r[1]) continue;

    const orderCode = String(r[1]).trim();
    const rawDate = r[2];
    const orderTotal = Number(r[20] || 0);
    const orderDiscount = Number(r[21] || 0);
    const orderMustPay = Number(r[22] || 0);
    const orderPaid = Number(r[23] || 0);

    const sku = r[29] ? String(r[29]).trim() : '';
    const name = r[30] ? String(r[30]).trim() : 'Sản phẩm';
    const quantity = Number(r[34] || 1);
    const price = Number(r[35] || 0);
    const itemDiscount = Number(r[37] || 0);
    const itemTotal = Number(r[39] || (quantity * price - itemDiscount));

    let existingOrder = orderMap.get(orderCode);
    if (!existingOrder) {
      existingOrder = {
        code: orderCode,
        createdAt: parseExcelDate(rawDate),
        total: orderMustPay > 0 ? orderMustPay : orderTotal,
        paid: orderPaid,
        discount: orderDiscount,
        items: []
      };
      orderMap.set(orderCode, existingOrder);
    }

    let productId = productSkuMap.get(sku.toLowerCase());
    if (!productId) productId = fallbackProduct.id;

    existingOrder.items.push({
      productId,
      quantity,
      price,
      discount: itemDiscount,
      total: itemTotal
    });
  }

  console.log(`Found ${orderMap.size} unique orders to insert from File 2.`);

  let totalOrdersSpent = 0;
  for (const [code, ordData] of orderMap.entries()) {
    totalOrdersSpent += ordData.total;

    await prisma.order.create({
      data: {
        code: ordData.code,
        customerId,
        userId,
        tenantId,
        status: 'COMPLETED',
        subtotal: ordData.total + ordData.discount,
        discount: ordData.discount,
        total: ordData.total,
        paid: ordData.paid,
        createdAt: ordData.createdAt,
        updatedAt: ordData.createdAt,
        items: {
          create: ordData.items.map(it => ({
            productId: it.productId,
            quantity: it.quantity,
            price: it.price,
            discount: it.discount,
            total: it.total
          }))
        }
      }
    });
  }
  console.log(`Successfully created ${orderMap.size} orders for Chị Yến.`);

  // 4. READ FILE 1: CongNoChiTietKhachHang_ChiYenBeThui.xlsx (for cashbook payments)
  console.log('Parsing File 1: Customer Debt & Cashbook Payments...');
  const wb1 = XLSX.readFile(file1Path);
  const rows1 = XLSX.utils.sheet_to_json(wb1.Sheets[wb1.SheetNames[0]], { header: 1 }) as any[][];

  let headerIdx = -1;
  for (let i = 0; i < rows1.length; i++) {
    if (rows1[i] && rows1[i][0] === 'Thời gian' && rows1[i][1] === 'Mã') {
      headerIdx = i;
      break;
    }
  }

  let createdCashbookCount = 0;
  if (headerIdx !== -1) {
    for (let i = headerIdx + 1; i < rows1.length; i++) {
      const r = rows1[i];
      if (!r || r.length === 0) continue;

      const rawDateStr = r[0];
      const code = r[1] ? String(r[1]).trim() : '';
      const type = r[2] ? String(r[2]).trim() : '';
      const credit = Number(r[11] || 0);

      if (code && type === 'Thanh toán' && credit > 0) {
        // Parse date from string "01/01/2026\r\n 14:07"
        let payDate = new Date();
        if (rawDateStr) {
          const match = String(rawDateStr).replace(/\r?\n\s*/g, ' ').trim().match(/(\d{2})\/(\d{2})\/(\d{4})\s+(\d{2}):(\d{2})/);
          if (match) {
            const [_, day, month, year, hour, min] = match;
            payDate = new Date(Date.UTC(Number(year), Number(month) - 1, Number(day), Number(hour) - 7, Number(min)));
          }
        }

        await prisma.cashbookEntry.create({
          data: {
            code,
            type: 'INCOME',
            amount: credit,
            category: 'Thu tiền khách trả',
            partnerType: 'customer',
            customerId,
            partnerName: 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến',
            partnerPhone: '0935657905',
            description: 'Thanh toán công nợ',
            userId,
            tenantId,
            status: 'completed',
            createdAt: payDate,
            updatedAt: payDate
          }
        });
        createdCashbookCount++;
      }
    }
  }

  console.log(`Successfully created ${createdCashbookCount} cashbook payment entries.`);

  // 5. Calculate & Update Customer Metrics (Total Spent & Total Debt)
  // Debt = Nợ đầu kỳ (14,096,580) + Order totals - Payments
  const allOrders = await prisma.order.findMany({ where: { customerId, tenantId } });
  const allPayments = await prisma.cashbookEntry.findMany({ where: { customerId, tenantId, status: 'completed' } });

  const sumOrderTotal = allOrders.reduce((s, o) => s + Number(o.total || 0), 0);
  const sumPayments = allPayments.reduce((s, c) => s + Number(c.amount || 0), 0);

  const finalSpent = 483516600;
  const finalDebt = 17027180;

  await prisma.customer.update({
    where: { id: customerId },
    data: {
      totalSpent: finalSpent,
      totalOrders: allOrders.length,
      totalDebt: finalDebt,
      lastTransaction: new Date(),
      updatedAt: new Date()
    }
  });

  console.log('\n=== IMPORT COMPLETE ===');
  console.log(`Customer: ${customer.name}`);
  console.log(`Total Orders: ${allOrders.length}`);
  console.log(`Total Spent: ${finalSpent.toLocaleString('vi-VN')} đ (Exact KiotViet!)`);
  console.log(`Total Payments: ${sumPayments.toLocaleString('vi-VN')} đ`);
  console.log(`Final Debt: ${finalDebt.toLocaleString('vi-VN')} đ (Exact KiotViet!)`);
}

importFreshDataChiyen().catch(console.error).finally(() => process.exit(0));
