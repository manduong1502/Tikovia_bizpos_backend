import fs from 'fs';
import path from 'path';
import * as XLSX from 'xlsx';
import { prisma } from '../config/database';

function parseExcelNumber(val: any, defaultVal = 0): number {
  if (val === null || val === undefined || val === '') return defaultVal;
  if (typeof val === 'number') return isNaN(val) ? defaultVal : val;
  if (typeof val === 'boolean') return val ? 1 : 0;
  
  let str = String(val).trim();
  if (!str) return defaultVal;

  str = str.replace(/\s+/g, '');

  if (/^-?\d{1,3}(\.\d{3})*,\d+$/.test(str)) {
    str = str.replace(/\./g, '').replace(',', '.');
  } else if (/^-?\d+,\d+$/.test(str)) {
    str = str.replace(',', '.');
  } else if (/^-?\d{1,3}(,\d{3})*\.\d+$/.test(str)) {
    str = str.replace(/,/g, '');
  } else if (/^-?\d{1,3}(\.\d{3})+$/.test(str)) {
    str = str.replace(/\./g, '');
  } else if (/^-?\d{1,3}(,\d{3})+$/.test(str)) {
    str = str.replace(/,/g, '');
  } else {
    const commaCount = (str.match(/,/g) || []).length;
    const dotCount = (str.match(/\./g) || []).length;
    if (commaCount === 1 && dotCount === 0) {
      str = str.replace(',', '.');
    } else if (dotCount > 1 && commaCount === 0) {
      str = str.replace(/\./g, '');
    } else if (commaCount > 1 && dotCount === 0) {
      str = str.replace(/,/g, '');
    }
  }

  const result = parseFloat(str);
  return isNaN(result) ? defaultVal : result;
}

function parseExcelDate(val: any): Date {
  if (!val) return new Date();
  if (val instanceof Date) return isNaN(val.getTime()) ? new Date() : new Date(val.getTime() - (7 * 3600 * 1000));
  
  if (typeof val === 'number') {
    const ms = Math.round((val - 25569) * 86400 * 1000) - (7 * 3600 * 1000);
    const d = new Date(ms);
    return isNaN(d.getTime()) ? new Date() : d;
  }
  
  const str = String(val).trim();
  if (!str) return new Date();

  const parts = str.split(' ');
  const datePart = parts[0];
  const timePart = parts[1] || '00:00:00';

  if (datePart.includes('/')) {
    const dParts = datePart.split('/');
    if (dParts.length === 3) {
      const day = parseInt(dParts[0], 10);
      const month = parseInt(dParts[1], 10) - 1;
      const year = parseInt(dParts[2], 10);
      const tParts = timePart.split(':');
      const hour = parseInt(tParts[0] || '0', 10);
      const minute = parseInt(tParts[1] || '0', 10);
      const second = parseInt(tParts[2] || '0', 10);
      
      if (!isNaN(day) && !isNaN(month) && !isNaN(year)) {
        const fullYear = year < 100 ? 2000 + year : year;
        const d = new Date(Date.UTC(fullYear, month, day, hour - 7, minute, second));
        if (!isNaN(d.getTime())) return d;
      }
    }
  }

  if (datePart.includes('-')) {
    const dParts = datePart.split('-');
    if (dParts.length === 3) {
      const year = dParts[0].length === 4 ? parseInt(dParts[0], 10) : parseInt(dParts[2], 10);
      const month = parseInt(dParts[1], 10) - 1;
      const day = dParts[0].length === 4 ? parseInt(dParts[2], 10) : parseInt(dParts[0], 10);
      const tParts = timePart.split(':');
      const hour = parseInt(tParts[0] || '0', 10);
      const minute = parseInt(tParts[1] || '0', 10);
      const second = parseInt(tParts[2] || '0', 10);
      const d = new Date(Date.UTC(year, month, day, hour - 7, minute, second));
      if (!isNaN(d.getTime())) return d;
    }
  }

  const fallback = new Date(str);
  return isNaN(fallback.getTime()) ? new Date() : fallback;
}

function findAllFiles(dir: string, pattern: RegExp): string[] {
  if (!fs.existsSync(dir)) return [];
  const files = fs.readdirSync(dir);
  const matches = files.filter(f => pattern.test(f));
  return matches.map(f => path.join(dir, f));
}

function findFile(dir: string, pattern: RegExp): string | null {
  const all = findAllFiles(dir, pattern);
  if (all.length === 0) return null;
  all.sort((a, b) => fs.statSync(b).size - fs.statSync(a).size);
  return all[0];
}

async function main() {
  console.log('🚀 BẮT ĐẦU NHẬP DỮ LIỆU EXCEL KIOTVIET VÀO HỆ THỐNG...\n');

  const searchDirs = [
    path.join(__dirname, '../../data'),
    path.join(__dirname, '../data'),
    path.join(process.cwd(), 'data'),
    path.join(__dirname, '../../..'),
    path.join(__dirname, '../..'),
    process.cwd(),
    'd:/Mẫn/demo web kioviet',
    '/mnt/ssd500/tiko/bizpos-api/..'
  ];

  let searchDir = searchDirs.find(d => fs.existsSync(d) && fs.readdirSync(d).some(f => f.endsWith('.xlsx'))) || process.cwd();
  console.log(`📁 Thư mục chứa file dữ liệu: ${searchDir}\n`);

  console.log('🧹 0. Xóa sạch dữ liệu cũ trong Database...');
  try {
    await prisma.$executeRawUnsafe(`
      TRUNCATE TABLE 
        "OrderItem", "ReturnItem", "PurchaseOrderItem", "PurchaseReturnItem", "InventoryCheckItem",
        "Return", "Order", "PurchaseReturn", "PurchaseOrder", "InventoryCheck",
        "CashbookEntry", "CashbookPartner", "Product", "Category", "Brand", "Customer", "Supplier"
      RESTART IDENTITY CASCADE;
    `);
  } catch (e) {
    await prisma.orderItem.deleteMany({});
    await prisma.returnItem.deleteMany({});
    await prisma.purchaseOrderItem.deleteMany({});
    await prisma.purchaseReturnItem.deleteMany({});
    await prisma.inventoryCheckItem.deleteMany({});
    await prisma.return.deleteMany({});
    await prisma.order.deleteMany({});
    await prisma.purchaseReturn.deleteMany({});
    await prisma.purchaseOrder.deleteMany({});
    await prisma.inventoryCheck.deleteMany({});
    await prisma.cashbookEntry.deleteMany({});
    await prisma.cashbookPartner.deleteMany({});
    await prisma.product.deleteMany({});
    await prisma.category.deleteMany({});
    await prisma.brand.deleteMany({});
    await prisma.customer.deleteMany({});
    await prisma.supplier.deleteMany({});
  }
  await prisma.sequenceTracker.updateMany({ data: { value: 0 } });
  console.log('   ✅ Đã xóa sạch toàn bộ dữ liệu cũ.\n');

  let tenant = await prisma.tenant.findFirst();
  if (!tenant) {
    tenant = await prisma.tenant.create({
      data: { name: 'Cửa hàng Mẫu', subdomain: 'demo', plan: 'STANDARD' }
    });
  }
  const tenantId = tenant.id;

  let defaultCategory = await prisma.category.findFirst({ where: { tenantId } });
  if (!defaultCategory) {
    defaultCategory = await prisma.category.create({
      data: { tenantId, name: 'Hàng hóa chung' }
    });
  }

  // ─── 1. SẢN PHẨM ───
  const prodFiles = findAllFiles(searchDir, /^DanhSachSanPham.*\.xlsx$/i);
  if (prodFiles.length > 0) {
    console.log(`📦 1. Import Sản phẩm từ ${prodFiles.length} file...`);
    let prodCount = 0;
    for (const prodFile of prodFiles) {
      console.log(`   📄 Đang đọc: ${path.basename(prodFile)}`);
      const wb = XLSX.readFile(prodFile);
      const sheetName = wb.SheetNames[wb.SheetNames.length - 1];
      const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);

      for (const r of rows) {
        const sku = String(r['Mã hàng'] || r['Mã sản phẩm'] || r['Mã SKU'] || '').trim();
        const name = String(r['Tên hàng'] || r['Tên sản phẩm'] || '').trim();
        if (!sku || !name) continue;

        const barcode = String(r['Mã mã vạch'] || r['Barcode'] || '').trim() || null;
        const categoryName = String(r['Nhóm hàng'] || r['Danh mục'] || '').trim();
        const costPrice = parseExcelNumber(r['Giá vốn'] || r['Giá nhập']);
        const sellPrice = parseExcelNumber(r['Giá bán'] || r['Giá']);
        const stock = parseExcelNumber(r['Tồn kho'] || r['Số lượng tồn']);
        const unit = String(r['Đơn vị tính'] || r['ĐVT'] || '').trim() || 'Cái';

        let categoryId = defaultCategory.id;
        if (categoryName) {
          let cat = await prisma.category.findFirst({
            where: { tenantId, name: categoryName }
          });
          if (!cat) {
            cat = await prisma.category.create({
              data: { tenantId, name: categoryName }
            });
          }
          categoryId = cat.id;
        }

        try {
          await prisma.product.upsert({
            where: { tenantId_sku: { tenantId, sku } },
            update: {
              name, barcode, categoryId, costPrice, sellPrice, stock, unit, updatedAt: new Date()
            },
            create: {
              tenantId, sku, name, barcode, categoryId, costPrice, sellPrice, stock, unit
            }
          });
          prodCount++;
        } catch (err: any) {
          console.error(`   ⚠️ Lỗi sản phẩm ${sku}: ${err.message}`);
        }
      }
    }
    console.log(`   ✅ Đã import ${prodCount} sản phẩm.\n`);
  }

  // Fallback Product
  let fallbackProduct = await prisma.product.findFirst({ where: { tenantId } });
  if (!fallbackProduct) {
    fallbackProduct = await prisma.product.create({
      data: {
        tenantId,
        sku: 'SP000000',
        name: 'Sản phẩm vãng lai',
        categoryId: defaultCategory.id,
        costPrice: 0,
        sellPrice: 0,
        stock: 9999
      }
    });
  }

  // ─── 2. KHÁCH HÀNG ───
  const custFiles = findAllFiles(searchDir, /^DanhSachKhachHang.*\.xlsx$/i);
  if (custFiles.length > 0) {
    console.log(`👥 2. Import Khách hàng từ ${custFiles.length} file...`);
    let custCount = 0;
    for (const custFile of custFiles) {
      console.log(`   📄 Đang đọc: ${path.basename(custFile)}`);
      const wb = XLSX.readFile(custFile);
      const sheetName = wb.SheetNames[wb.SheetNames.length - 1];
      const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);

      for (const r of rows) {
        const code = String(r['Mã khách hàng'] || '').trim();
        const name = String(r['Tên khách hàng'] || '').trim();
        if (!code || !name) continue;

        const rawPhone = String(r['Điện thoại'] || r['Số điện thoại'] || '').trim();
        const phone = rawPhone ? rawPhone : null;
        const email = String(r['Email'] || '').trim() || null;
        const address = String(r['Địa chỉ'] || '').trim();
        const note = String(r['Ghi chú'] || '').trim();
        const totalSpent = parseExcelNumber(r['Tổng bán']);
        const totalDebt = parseExcelNumber(r['Nợ hiện tại'] || r['Nợ cần thu hiện tại']);
        const createdAt = parseExcelDate(r['Ngày tạo'] || r['Thời gian tạo']);

        try {
          await prisma.customer.upsert({
            where: { tenantId_code: { tenantId, code } },
            update: {
              name, phone, email, address, note, totalSpent, totalDebt, updatedAt: new Date()
            },
            create: {
              tenantId, code, name, phone, email, address, note, totalSpent, totalDebt, createdAt
            }
          });
          custCount++;
        } catch (err: any) {
          if (err.code === 'P2002') {
            await prisma.customer.upsert({
              where: { tenantId_code: { tenantId, code } },
              update: {
                name, phone: null, email: null, address, note, totalSpent, totalDebt, updatedAt: new Date()
              },
              create: {
                tenantId, code, name, phone: null, email: null, address, note, totalSpent, totalDebt, createdAt
              }
            });
            custCount++;
          } else {
            console.error(`   ⚠️ Lỗi khách hàng ${code}: ${err.message}`);
          }
        }
      }
    }
    console.log(`   ✅ Đã import ${custCount} khách hàng.\n`);
  }

  // ─── 3. NHÀ CUNG CẤP ───
  const suppFiles = findAllFiles(searchDir, /^DanhSachNhaCungCap.*\.xlsx$/i);
  if (suppFiles.length > 0) {
    console.log(`🏭 3. Import Nhà cung cấp từ ${suppFiles.length} file...`);
    let suppCount = 0;
    for (const suppFile of suppFiles) {
      console.log(`   📄 Đang đọc: ${path.basename(suppFile)}`);
      const wb = XLSX.readFile(suppFile);
      const sheetName = wb.SheetNames[wb.SheetNames.length - 1];
      const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);

      for (const r of rows) {
        const code = String(r['Mã nhà cung cấp'] || '').trim();
        const name = String(r['Tên nhà cung cấp'] || '').trim();
        if (!code || !name) continue;

        const rawPhone = String(r['Điện thoại'] || '').trim();
        const phone = rawPhone ? rawPhone : null;
        const email = String(r['Email'] || '').trim() || null;
        const address = String(r['Địa chỉ'] || '').trim();
        const note = String(r['Ghi chú'] || '').trim();
        const totalDebt = parseExcelNumber(r['Nợ cần trả hiện tại']);
        const createdAt = parseExcelDate(r['Ngày tạo'] || r['Thời gian tạo']);

        try {
          await prisma.supplier.upsert({
            where: { tenantId_code: { tenantId, code } },
            update: {
              name, phone, email, address, note, totalDebt, updatedAt: new Date()
            },
            create: {
              tenantId, code, name, phone, email, address, note, totalDebt, createdAt
            }
          });
          suppCount++;
        } catch (err: any) {
          if (err.code === 'P2002') {
            await prisma.supplier.upsert({
              where: { tenantId_code: { tenantId, code } },
              update: {
                name, phone: null, email: null, address, note, totalDebt, updatedAt: new Date()
              },
              create: {
                tenantId, code, name, phone: null, email: null, address, note, totalDebt, createdAt
              }
            });
            suppCount++;
          }
        }
      }
    }
    console.log(`   ✅ Đã import ${suppCount} nhà cung cấp.\n`);
  }

  // Fallback Supplier
  let fallbackSupplier = await prisma.supplier.findFirst({ where: { tenantId } });
  if (!fallbackSupplier) {
    fallbackSupplier = await prisma.supplier.create({
      data: { tenantId, code: 'NCC000000', name: 'Nhà cung cấp vãng lai' }
    });
  }

  // Lookups
  const allProducts = await prisma.product.findMany({ where: { tenantId } });
  const prodMap = new Map(allProducts.map(p => [p.sku.toLowerCase(), p]));

  const allCustomers = await prisma.customer.findMany({ where: { tenantId } });
  const custMapByCode = new Map(allCustomers.map(c => [c.code.toLowerCase(), c]));
  const custMapByName = new Map(allCustomers.map(c => [c.name.toLowerCase(), c]));

  const allSuppliers = await prisma.supplier.findMany({ where: { tenantId } });
  const suppMapByCode = new Map(allSuppliers.map(s => [s.code.toLowerCase(), s]));
  const suppMapByName = new Map(allSuppliers.map(s => [s.name.toLowerCase(), s]));

  let defaultUser = await prisma.user.findFirst({ where: { tenantId } });
  const userId = defaultUser ? defaultUser.id : 1;

  let maxOrderNum = 0;
  let maxPONum = 0;
  let maxReturnNum = 0;
  let maxPOReturnNum = 0;
  let maxPRNum = 0;
  let maxCashbookNum = 0;

  // ─── 4. HÓA ĐƠN BÁN HÀNG (Hỗ trợ đọc nhiều file theo từng tháng) ───
  const reportCostMap = new Map<string, number>();
  const reportOrderCostMap = new Map<string, number>();
  const reportFiles = findAllFiles(searchDir, /^BaoCao.*\.xlsx$/i);
  if (reportFiles.length > 0) {
    console.log(`📊 Đang đọc ${reportFiles.length} file Báo cáo để trích xuất Giá vốn lịch sử...`);
    for (const repFile of reportFiles) {
      try {
        const wb = XLSX.readFile(repFile);
        const sheetName = wb.SheetNames[0];
        const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);
        for (const r of rows) {
          const orderCode = String(r['Mã giao dịch'] || r['Mã hóa đơn'] || '').trim().toLowerCase();
          const sku = String(r['Mã hàng'] || '').trim().toLowerCase();
          const itemCost = parseExcelNumber(r['Giá vốn/SP'] || r['Đơn giá vốn'] || r['Giá vốn']);
          const orderCost = parseExcelNumber(r['Tổng giá vốn (theo giao dịch)']);
          if (orderCode && sku) {
            reportCostMap.set(`${orderCode}_${sku}`, itemCost);
          }
          if (orderCode && orderCost > 0) {
            reportOrderCostMap.set(orderCode, orderCost);
          }
        }
      } catch (e) {}
    }
    console.log(`   ✅ Đã nạp ${reportCostMap.size} bản ghi giá vốn lịch sử và ${reportOrderCostMap.size} tổng giá vốn đơn hàng từ file báo cáo.\n`);
  }

  const orderFiles = findAllFiles(searchDir, /^DanhSachChiTietHoaDon.*\.xlsx$/i);
  if (orderFiles.length > 0) {
    console.log(`🧾 4. Import Hóa đơn từ ${orderFiles.length} file...`);
    const orderGroups = new Map<string, any[]>();

    for (const orderFile of orderFiles) {
      console.log(`   📄 Đang đọc: ${path.basename(orderFile)}`);
      const wb = XLSX.readFile(orderFile);
      const sheetName = wb.SheetNames[wb.SheetNames.length - 1];
      const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);

      for (const r of rows) {
        const code = String(r['Mã hóa đơn'] || '').trim();
        if (!code) continue;
        if (!orderGroups.has(code)) orderGroups.set(code, []);
        orderGroups.get(code)!.push(r);
      }
    }

    console.log(`   Tổng cộng tìm thấy ${orderGroups.size} hóa đơn duy nhất.`);

    let orderCount = 0;
    for (const [code, items] of orderGroups.entries()) {
      const firstRow = items[0];
      const custCode = String(firstRow['Mã khách hàng'] || '').trim().toLowerCase();
      const custName = String(firstRow['Tên khách hàng'] || '').trim().toLowerCase();
      
      const customer = custMapByCode.get(custCode) || custMapByName.get(custName);
      const customerId = customer ? customer.id : undefined;

      const createdAt = parseExcelDate(firstRow['Thời gian'] || firstRow['Thời gian tạo']);
      const total = parseExcelNumber(firstRow['Khách cần trả'] || firstRow['Tổng tiền hàng']);
      const paid = parseExcelNumber(firstRow['Khách đã trả']);
      const discount = parseExcelNumber(firstRow['Giảm giá hóa đơn']);
      const note = String(firstRow['Ghi chú'] || '').trim();
      const status = String(firstRow['Trạng thái'] || '').includes('Hủy') ? 'CANCELLED' : 'COMPLETED';

      const matchNum = code.match(/(\d+)$/);
      if (matchNum) {
        const num = parseInt(matchNum[1], 10);
        if (num > maxOrderNum) maxOrderNum = num;
      }

      const existingOrder = await prisma.order.findUnique({
        where: { tenantId_code: { tenantId, code } }
      });

      let itemsCostSum = 0;
      const orderItemsData = items.map(it => {
        const sku = String(it['Mã hàng'] || '').trim().toLowerCase();
        const prod = prodMap.get(sku) || fallbackProduct;
        const qty = parseExcelNumber(it['Số lượng'], 1);
        const price = parseExcelNumber(it['Đơn giá'] || it['Giá bán']);
        const itemDiscount = parseExcelNumber(it['Giảm giá']);
        const itemTotal = parseExcelNumber(it['Thành tiền']) || (qty * price - itemDiscount);

        const repKey = `${code.toLowerCase()}_${sku}`;
        const itemCostPrice = reportCostMap.has(repKey) ? reportCostMap.get(repKey)! : (parseExcelNumber(it['Giá vốn']) || Number(prod.costPrice));
        itemsCostSum += qty * Number(itemCostPrice);

        return {
          productId: prod.id,
          quantity: qty,
          price: price,
          costPrice: itemCostPrice,
          discount: itemDiscount,
          total: itemTotal
        };
      });

      const orderCostPrice = reportOrderCostMap.has(code.toLowerCase()) 
        ? reportOrderCostMap.get(code.toLowerCase())! 
        : (reportOrderCostMap.size > 0 ? 0 : itemsCostSum);

      if (!existingOrder) {
        await prisma.order.create({
          data: {
            tenantId,
            code,
            customerId,
            userId,
            subtotal: total + discount,
            total,
            discount,
            costPrice: orderCostPrice,
            paid,
            note,
            status,
            createdAt,
            items: {
              create: orderItemsData
            }
          }
        });
        orderCount++;
      } else {
        await prisma.order.update({
          where: { id: existingOrder.id },
          data: { costPrice: orderCostPrice }
        });
      }
    }
    console.log(`   ✅ Đã import ${orderCount} hóa đơn bán hàng.\n`);
  }

  // ─── 5. ĐƠN NHẬP HÀNG ───
  const poFiles = findAllFiles(searchDir, /^DanhSachChiTietNhapHang.*\.xlsx$/i);
  if (poFiles.length > 0) {
    console.log(`📥 5. Import Đơn nhập hàng từ ${poFiles.length} file...`);
    const poGroups = new Map<string, any[]>();

    for (const poFile of poFiles) {
      console.log(`   📄 Đang đọc: ${path.basename(poFile)}`);
      const wb = XLSX.readFile(poFile);
      const sheetName = wb.SheetNames[wb.SheetNames.length - 1];
      const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);

      for (const r of rows) {
        const code = String(r['Mã nhập hàng'] || r['Mã phiếu nhập'] || r['Mã phiếu'] || '').trim();
        if (!code) continue;
        if (!poGroups.has(code)) poGroups.set(code, []);
        poGroups.get(code)!.push(r);
      }
    }

    let poCount = 0;
    for (const [code, items] of poGroups.entries()) {
      const firstRow = items[0];
      const suppCode = String(firstRow['Mã nhà cung cấp'] || '').trim().toLowerCase();
      const suppName = String(firstRow['Tên nhà cung cấp'] || '').trim().toLowerCase();

      const supplier = suppMapByCode.get(suppCode) || suppMapByName.get(suppName) || fallbackSupplier;
      const supplierId = supplier.id;

      const createdAt = parseExcelDate(firstRow['Thời gian'] || firstRow['Thời gian tạo']);
      const total = parseExcelNumber(firstRow['Cần trả NCC'] || firstRow['Cần trả nhà cung cấp'] || firstRow['Tổng tiền hàng'] || firstRow['Tổng tiền']);
      const paid = parseExcelNumber(firstRow['Tiền đã trả NCC'] || firstRow['Tiền đã trả nhà cung cấp'] || firstRow['Đã trả nhà cung cấp'] || firstRow['Đã trả NCC']);
      const note = String(firstRow['Ghi chú'] || '').trim();
      const status = String(firstRow['Trạng thái'] || '').includes('Hủy') ? 'CANCELLED' : 'COMPLETED';

      const matchNum = code.match(/(\d+)$/);
      if (matchNum) {
        const num = parseInt(matchNum[1], 10);
        if (num > maxPONum) maxPONum = num;
      }

      const existingPO = await prisma.purchaseOrder.findUnique({
        where: { tenantId_code: { tenantId, code } }
      });

      if (!existingPO) {
        const poItemsData = items.map(it => {
          const sku = String(it['Mã hàng'] || '').trim().toLowerCase();
          const prod = prodMap.get(sku) || fallbackProduct;
          const qty = parseExcelNumber(it['Số lượng'], 1);
          const price = parseExcelNumber(it['Đơn giá'] || it['Giá nhập']);
          const itemDiscount = parseExcelNumber(it['Giảm giá']);
          const itemTotal = parseExcelNumber(it['Thành tiền']) || (qty * price - itemDiscount);

          return {
            productId: prod.id,
            quantity: qty,
            price: price,
            total: itemTotal
          };
        });

        await prisma.purchaseOrder.create({
          data: {
            tenantId,
            code,
            supplierId,
            total,
            paid,
            note,
            status,
            createdAt,
            items: {
              create: poItemsData
            }
          }
        });
        poCount++;
      }
    }
    console.log(`   ✅ Đã import ${poCount} đơn nhập hàng.\n`);
  }

  // ─── 6. PHIẾU TRẢ HÀNG KHÁCH ───
  const retFiles = findAllFiles(searchDir, /^DanhSachChiTietTraHang.*\.xlsx$/i).filter(f => !f.toLowerCase().includes('trahangnhap'));
  if (retFiles.length > 0) {
    console.log(`🔄 6. Import Phiếu trả hàng từ ${retFiles.length} file...`);
    const retGroups = new Map<string, any[]>();

    for (const retFile of retFiles) {
      console.log(`   📄 Đang đọc: ${path.basename(retFile)}`);
      const wb = XLSX.readFile(retFile);
      const sheetName = wb.SheetNames[wb.SheetNames.length - 1];
      const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);

      for (const r of rows) {
        const code = String(r['Mã trả hàng'] || '').trim();
        if (!code) continue;
        if (!retGroups.has(code)) retGroups.set(code, []);
        retGroups.get(code)!.push(r);
      }
    }

    let retCount = 0;
    for (const [code, items] of retGroups.entries()) {
      const firstRow = items[0];
      const custCode = String(firstRow['Mã khách hàng'] || '').trim().toLowerCase();
      const custName = String(firstRow['Tên khách hàng'] || '').trim().toLowerCase();

      const customer = custMapByCode.get(custCode) || custMapByName.get(custName);
      const customerId = customer ? customer.id : undefined;

      const createdAt = parseExcelDate(firstRow['Thời gian'] || firstRow['Thời gian tạo']);
      const total = parseExcelNumber(firstRow['Cần trả khách'] || firstRow['Tổng tiền hàng trả'] || firstRow['Tổng sau giảm giá']);
      const paid = parseExcelNumber(firstRow['Đã trả khách'] || firstRow['Tiền mặt']);
      const discount = parseExcelNumber(firstRow['Giảm giá phiếu trả'] || firstRow['Giảm giá']);
      const note = String(firstRow['Ghi chú'] || '').trim();

      const matchNum = code.match(/(\d+)$/);
      if (matchNum) {
        const num = parseInt(matchNum[1], 10);
        if (num > maxReturnNum) maxReturnNum = num;
      }

      const existingReturn = await prisma.return.findUnique({
        where: { tenantId_code: { tenantId, code } }
      });

      if (!existingReturn) {
        const returnItemsData = items.map(it => {
          const sku = String(it['Mã hàng'] || '').trim().toLowerCase();
          const prod = prodMap.get(sku) || fallbackProduct;
          const qty = parseExcelNumber(it['Số lượng'], 1);
          const price = parseExcelNumber(it['Giá nhập lại'] || it['Giá bán'] || it['Đơn giá']);
          const itemDiscount = parseExcelNumber(it['Giảm giá']);
          const itemTotal = (qty * price) - itemDiscount;

          return {
            productId: prod.id,
            quantity: qty,
            price: price,
            total: itemTotal
          };
        });

        await prisma.return.create({
          data: {
            tenantId,
            code,
            customerId,
            total,
            discount,
            paid,
            reason: note,
            status: 'COMPLETED',
            createdAt,
            items: {
              create: returnItemsData
            }
          }
        });
        retCount++;
      }
    }
    console.log(`   ✅ Đã import ${retCount} phiếu trả hàng.\n`);
  }

  // ─── 7. SỔ QUỸ THU CHÍ ───
  const cashFiles = findAllFiles(searchDir, /^SoQuy.*\.xlsx$/i);
  if (cashFiles.length > 0) {
    console.log(`💰 7. Import Sổ quỹ từ ${cashFiles.length} file...`);
    let cashCount = 0;
    for (const cashFile of cashFiles) {
      console.log(`   📄 Đang đọc: ${path.basename(cashFile)}`);
      const wb = XLSX.readFile(cashFile);
      const sheetName = wb.SheetNames[wb.SheetNames.length - 1];
      const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);

      for (const r of rows) {
        const code = String(r['Mã phiếu'] || '').trim();
        if (!code) continue;

        const time = parseExcelDate(r['Thời gian']);
        const categoryType = String(r['Loại thu chi'] || '').trim();
        const type = (categoryType.includes('thu') || categoryType.includes('Thu')) ? 'INCOME' : 'EXPENSE';
        const partner = String(r['Người nộp/nhận'] || '').trim();
        const amount = Math.abs(parseExcelNumber(r['Giá trị']));

        const matchNum = code.match(/(\d+)$/);
        if (matchNum) {
          const num = parseInt(matchNum[1], 10);
          if (num > maxCashbookNum) maxCashbookNum = num;
        }

        const existingEntry = await prisma.cashbookEntry.findFirst({
          where: { tenantId, code }
        });

        if (!existingEntry) {
          await prisma.cashbookEntry.create({
            data: {
              tenantId,
              code,
              type,
              category: categoryType || (type === 'INCOME' ? 'Thu khác' : 'Chi khác'),
              amount,
              partnerName: partner || 'N/A',
              userId: defaultUser?.id || 1,
              createdAt: time
            }
          });
          cashCount++;
        }
      }
    }
    console.log(`   ✅ Đã import ${cashCount} phiếu thu/chi sổ quỹ.\n`);
  }

  // ─── 7c. ĐỒNG BỘ TIỀN KHÁCH ĐÃ TRẢ TỪ PHIẾU THU SỔ QUỸ (TTHD...) ───
  console.log('🔄 7c. Đồng bộ thanh toán hóa đơn từ Sổ quỹ...');
  const tthdEntries = await prisma.cashbookEntry.findMany({
    where: { tenantId, type: 'INCOME', code: { startsWith: 'TTHD' }, status: 'completed' }
  });

  const cashPaidMap = new Map<string, number>();
  for (const entry of tthdEntries) {
    const match = entry.code.match(/^TT(HD\d+)/i);
    if (match) {
      const baseCode = match[1].toUpperCase();
      const amt = Number(entry.amount || 0);
      cashPaidMap.set(baseCode, amt);
    }
  }

  let syncedOrdersCount = 0;
  for (const [baseCode, cashPaidAmt] of cashPaidMap.entries()) {
    const matchedOrders = await prisma.order.findMany({
      where: { tenantId, code: { startsWith: baseCode }, paid: 0 }
    });

    for (const order of matchedOrders) {
      if (Number(order.total) === cashPaidAmt) {
        await prisma.order.update({
          where: { id: order.id },
          data: { paid: cashPaidAmt }
        });
        syncedOrdersCount++;
      }
    }
  }
  console.log(`   ✅ Đã đồng bộ thanh toán cho ${syncedOrdersCount} hóa đơn từ phiếu thu Sổ Quỹ.\n`);

  // ─── 7b. KHỞI TẠO QUỸ ĐẦU KỲ ───
  const existingOpening = await prisma.cashbookEntry.findFirst({
    where: { tenantId, code: 'TT000000' }
  });
  if (!existingOpening) {
    await prisma.cashbookEntry.create({
      data: {
        tenantId,
        code: 'TT000000',
        type: 'INCOME',
        category: 'Quỹ đầu kỳ',
        amount: 32807129366,
        partnerName: 'Hệ thống',
        userId,
        createdAt: new Date('2020-01-01T00:00:00.000Z'),
        note: 'Quỹ đầu kỳ khởi tạo từ KiotViet'
      }
    });
    console.log('   ✅ Đã khởi tạo Quỹ đầu kỳ: 32,807,129,366 VNĐ\n');
  }

  // ─── 8. CẬP NHẬT BỘ ĐẾM MÃ CHỨNG TỪ (SEQUENCE TRACKER) ───
  console.log('🔢 8. Cập nhật bộ đếm mã chứng từ tự động...');
  const sequenceUpdates = [
    { name: 'ORDER', val: maxOrderNum },
    { name: 'RETURN', val: maxReturnNum },
    { name: 'PURCHASE_ORDER', val: maxPONum },
    { name: 'PURCHASE_RETURN', val: maxPRNum },
    { name: 'CASHBOOK', val: maxCashbookNum },
  ];

  for (const seq of sequenceUpdates) {
    if (seq.val > 0) {
      await prisma.sequenceTracker.upsert({
        where: { tenantId_name: { tenantId, name: seq.name } },
        update: { value: seq.val },
        create: { tenantId, name: seq.name, value: seq.val }
      });
      console.log(`   ✅ ${seq.name} sequence updated to max: ${seq.val}`);
    }
  }

  console.log('\n🎉 HOÀN THÀNH NHẬP TOÀN BỘ DỮ LIỆU EXCEL KIOTVIET VÀO HỆ THỐNG GIAO DỊCH!');
}

export async function importKiotvietData() {
  await main();
}

if (require.main === module) {
  importKiotvietData()
    .catch((e) => {
      console.error('❌ Thất bại khi import dữ liệu:', e);
      process.exit(1);
    })
    .finally(async () => {
      await prisma.$disconnect();
    });
}
