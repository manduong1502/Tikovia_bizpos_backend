import fs from 'fs';
import path from 'path';
import * as XLSX from 'xlsx';
import { prisma } from '../config/database';

function parseExcelDate(val: any): Date {
  if (!val) return new Date();
  if (val instanceof Date) return val;
  if (typeof val === 'number') {
    const ms = Math.round((val - 25569) * 86400 * 1000);
    return new Date(ms);
  }
  if (typeof val === 'string') {
    const d = new Date(val);
    if (!isNaN(d.getTime())) return d;
    const num = parseFloat(val);
    if (!isNaN(num) && num > 30000) {
      const ms = Math.round((num - 25569) * 86400 * 1000);
      return new Date(ms);
    }
  }
  return new Date();
}

function findFile(dir: string, pattern: RegExp): string | null {
  if (!fs.existsSync(dir)) return null;
  const files = fs.readdirSync(dir);
  const match = files.find(f => pattern.test(f));
  return match ? path.join(dir, match) : null;
}

async function main() {
  console.log('🚀 BẮT ĐẦU NHẬP DỮ LIỆU EXCEL KIOTVIET VÀO HỆ THỐNG...\n');

  const searchDirs = [
    path.join(__dirname, '../../..'),
    path.join(__dirname, '../..'),
    process.cwd(),
    'd:/Mẫn/demo web kioviet',
    '/mnt/ssd500/tiko/bizpos-api/..'
  ];

  let searchDir = searchDirs.find(d => fs.existsSync(d) && fs.readdirSync(d).some(f => f.endsWith('.xlsx'))) || process.cwd();
  console.log(`📁 Thư mục chứa file dữ liệu: ${searchDir}\n`);

  let tenant = await prisma.tenant.findFirst();
  if (!tenant) {
    tenant = await prisma.tenant.create({
      data: { name: 'Cửa hàng Mẫu', subdomain: 'demo', plan: 'STANDARD' }
    });
  }
  const tenantId = tenant.id;

  let adminUser = await prisma.user.findFirst({ where: { tenantId, role: 'ADMIN' } });
  if (!adminUser) {
    adminUser = await prisma.user.findFirst({ where: { tenantId } });
  }
  const userId = adminUser ? adminUser.id : 1;

  let maxOrderNum = 0;
  let maxReturnNum = 0;
  let maxPONum = 0;
  let maxPRNum = 0;
  let maxCashbookNum = 0;

  // ─── 1. HÀNG HÓA & NHÓM HÀNG ───
  const prodFile = findFile(searchDir, /^DanhSachSanPham.*\.xlsx$/i);
  if (prodFile) {
    console.log(`📦 1. Import Hàng hóa từ: ${path.basename(prodFile)}`);
    const wb = XLSX.readFile(prodFile);
    const sheetName = wb.SheetNames[wb.SheetNames.length - 1];
    const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);

    console.log(`   Đã đọc ${rows.length} dòng hàng hóa.`);

    const categoryMap = new Map<string, number>();
    for (const r of rows) {
      const catName = (r['Nhóm hàng(3 Cấp)'] || r['Nhóm hàng'] || 'Chưa phân loại').trim();
      if (catName && !categoryMap.has(catName)) {
        const cat = await prisma.category.upsert({
          where: { tenantId_name: { tenantId, name: catName } },
          update: {},
          create: { tenantId, name: catName }
        });
        categoryMap.set(catName, cat.id);
      }
    }

    let prodCount = 0;
    for (const r of rows) {
      const sku = String(r['Mã hàng'] || '').trim();
      const name = String(r['Tên hàng'] || '').trim();
      if (!sku || !name) continue;

      const catName = (r['Nhóm hàng(3 Cấp)'] || r['Nhóm hàng'] || 'Chưa phân loại').trim();
      const categoryId = categoryMap.get(catName) || null;

      const sellPrice = Math.max(0, parseFloat(r['Giá bán']) || 0);
      const costPrice = Math.max(0, parseFloat(r['Giá vốn']) || 0);
      const stock = parseFloat(r['Tồn kho']) || 0;
      const unit = String(r['ĐVT'] || r['Đơn vị tính'] || '').trim();
      const isActive = String(r['Đang kinh doanh']) === '1' || r['Đang kinh doanh'] === 1 || r['Đang kinh doanh'] === 'Có';
      const createdAt = parseExcelDate(r['Thời gian tạo']);

      await prisma.product.upsert({
        where: { tenantId_sku: { tenantId, sku } },
        update: {
          name, categoryId, sellPrice, costPrice, stock, unit, isActive, updatedAt: new Date()
        },
        create: {
          tenantId, sku, name, categoryId, sellPrice, costPrice, stock, unit, isActive, createdAt
        }
      });
      prodCount++;
    }
    console.log(`   ✅ Đã import ${prodCount} sản phẩm & ${categoryMap.size} nhóm hàng.\n`);
  }

  // Ensure default fallback product exists
  let fallbackProduct = await prisma.product.findFirst({ where: { tenantId } });
  if (!fallbackProduct) {
    fallbackProduct = await prisma.product.create({
      data: { tenantId, sku: 'SP000000', name: 'Hàng hóa tự do', sellPrice: 0, costPrice: 0, stock: 9999 }
    });
  }

  // ─── 2. KHÁCH HÀNG ───
  const custFile = findFile(searchDir, /^DanhSachKhachHang.*\.xlsx$/i);
  if (custFile) {
    console.log(`👥 2. Import Khách hàng từ: ${path.basename(custFile)}`);
    const wb = XLSX.readFile(custFile);
    const sheetName = wb.SheetNames[wb.SheetNames.length - 1];
    const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);
    console.log(`   Đã đọc ${rows.length} dòng khách hàng.`);

    let custCount = 0;
    for (const r of rows) {
      const code = String(r['Mã khách hàng'] || '').trim();
      const name = String(r['Tên khách hàng'] || '').trim();
      if (!code || !name) continue;

      const rawPhone = String(r['Điện thoại'] || '').trim();
      const phone = rawPhone ? rawPhone : null;
      const address = String(r['Địa chỉ'] || '').trim();
      const note = String(r['Ghi chú'] || '').trim();
      const totalDebt = parseFloat(r['Nợ cần thu hiện tại'] || r['Nợ cần trả hiện tại']) || 0;
      const createdAt = parseExcelDate(r['Ngày tạo'] || r['Thời gian tạo']);

      try {
        await prisma.customer.upsert({
          where: { tenantId_code: { tenantId, code } },
          update: {
            name, phone, address, note, totalDebt, updatedAt: new Date()
          },
          create: {
            tenantId, code, name, phone, address, note, totalDebt, createdAt
          }
        });
        custCount++;
      } catch (err: any) {
        // If phone unique constraint failed, try setting phone null
        if (err.code === 'P2002') {
          await prisma.customer.upsert({
            where: { tenantId_code: { tenantId, code } },
            update: {
              name, phone: null, address, note, totalDebt, updatedAt: new Date()
            },
            create: {
              tenantId, code, name, phone: null, address, note, totalDebt, createdAt
            }
          });
          custCount++;
        } else {
          console.error(`   ⚠️ Không thể import KH ${code} (${name}): ${err.message}`);
        }
      }
    }
    console.log(`   ✅ Đã import ${custCount} khách hàng.\n`);
  }

  // ─── 3. NHÀ CUNG CẤP ───
  const suppFile = findFile(searchDir, /^DanhSachNhaCungCap.*\.xlsx$/i);
  if (suppFile) {
    console.log(`🏭 3. Import Nhà cung cấp từ: ${path.basename(suppFile)}`);
    const wb = XLSX.readFile(suppFile);
    const sheetName = wb.SheetNames[wb.SheetNames.length - 1];
    const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);
    console.log(`   Đã đọc ${rows.length} dòng nhà cung cấp.`);

    let suppCount = 0;
    for (const r of rows) {
      const code = String(r['Mã nhà cung cấp'] || '').trim();
      const name = String(r['Tên nhà cung cấp'] || '').trim();
      if (!code || !name) continue;

      const rawPhone = String(r['Điện thoại'] || '').trim();
      const phone = rawPhone ? rawPhone : null;
      const email = String(r['Email'] || '').trim() || null;
      const address = String(r['Địa chỉ'] || '').trim();
      const note = String(r['Ghi chú'] || '').trim();
      const totalDebt = parseFloat(r['Nợ cần trả hiện tại']) || 0;
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
        } else {
          console.error(`   ⚠️ Không thể import NCC ${code} (${name}): ${err.message}`);
        }
      }
    }
    console.log(`   ✅ Đã import ${suppCount} nhà cung cấp.\n`);
  }

  // Ensure default fallback supplier exists
  let fallbackSupplier = await prisma.supplier.findFirst({ where: { tenantId } });
  if (!fallbackSupplier) {
    fallbackSupplier = await prisma.supplier.create({
      data: { tenantId, code: 'NCC000000', name: 'Nhà cung cấp vãng lai' }
    });
  }

  // Build lookups
  const allProducts = await prisma.product.findMany({ where: { tenantId } });
  const prodMap = new Map(allProducts.map(p => [p.sku.toLowerCase(), p]));

  const allCustomers = await prisma.customer.findMany({ where: { tenantId } });
  const custMapByCode = new Map(allCustomers.map(c => [c.code.toLowerCase(), c]));
  const custMapByName = new Map(allCustomers.map(c => [c.name.toLowerCase(), c]));

  const allSuppliers = await prisma.supplier.findMany({ where: { tenantId } });
  const suppMapByCode = new Map(allSuppliers.map(s => [s.code.toLowerCase(), s]));
  const suppMapByName = new Map(allSuppliers.map(s => [s.name.toLowerCase(), s]));

  // ─── 4. HÓA ĐƠN BÁN HÀNG ───
  const orderFile = findFile(searchDir, /^DanhSachChiTietHoaDon.*\.xlsx$/i);
  if (orderFile) {
    console.log(`🧾 4. Import Hóa đơn từ: ${path.basename(orderFile)}`);
    const wb = XLSX.readFile(orderFile);
    const sheetName = wb.SheetNames[wb.SheetNames.length - 1];
    const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);
    console.log(`   Đã đọc ${rows.length} dòng chi tiết hóa đơn.`);

    const orderGroups = new Map<string, any[]>();
    for (const r of rows) {
      const code = String(r['Mã hóa đơn'] || '').trim();
      if (!code) continue;
      if (!orderGroups.has(code)) orderGroups.set(code, []);
      orderGroups.get(code)!.push(r);
    }

    let orderCount = 0;
    for (const [code, items] of orderGroups.entries()) {
      const firstRow = items[0];
      const custCode = String(firstRow['Mã khách hàng'] || '').trim().toLowerCase();
      const custName = String(firstRow['Tên khách hàng'] || '').trim().toLowerCase();
      
      const customer = custMapByCode.get(custCode) || custMapByName.get(custName);
      const customerId = customer ? customer.id : undefined;

      const createdAt = parseExcelDate(firstRow['Thời gian'] || firstRow['Thời gian tạo']);
      const total = parseFloat(firstRow['Khách cần trả'] || firstRow['Tổng tiền hàng']) || 0;
      const paid = parseFloat(firstRow['Khách đã trả']) || 0;
      const discount = parseFloat(firstRow['Giảm giá hóa đơn']) || 0;
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

      if (!existingOrder) {
        const orderItemsData = items.map(it => {
          const sku = String(it['Mã hàng'] || '').trim().toLowerCase();
          const prod = prodMap.get(sku) || fallbackProduct;
          const qty = parseFloat(it['Số lượng']) || 1;
          const price = parseFloat(it['Đơn giá'] || it['Giá bán']) || 0;
          const itemDiscount = parseFloat(it['Giảm giá']) || 0;
          const itemTotal = parseFloat(it['Thành tiền']) || (qty * price - itemDiscount);

          return {
            productId: prod.id,
            quantity: qty,
            price: price,
            discount: itemDiscount,
            total: itemTotal
          };
        });

        await prisma.order.create({
          data: {
            tenantId,
            code,
            customerId,
            userId,
            total,
            discount,
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
      }
    }
    console.log(`   ✅ Đã import ${orderCount} hóa đơn bán hàng.\n`);
  }

  // ─── 5. ĐƠN NHẬP HÀNG ───
  const poFile = findFile(searchDir, /^DanhSachChiTietNhapHang.*\.xlsx$/i);
  if (poFile) {
    console.log(`📥 5. Import Đơn nhập hàng từ: ${path.basename(poFile)}`);
    const wb = XLSX.readFile(poFile);
    const sheetName = wb.SheetNames[wb.SheetNames.length - 1];
    const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);
    console.log(`   Đã đọc ${rows.length} dòng chi tiết nhập hàng.`);

    const poGroups = new Map<string, any[]>();
    for (const r of rows) {
      const code = String(r['Mã phiếu nhập'] || '').trim();
      if (!code) continue;
      if (!poGroups.has(code)) poGroups.set(code, []);
      poGroups.get(code)!.push(r);
    }

    let poCount = 0;
    for (const [code, items] of poGroups.entries()) {
      const firstRow = items[0];
      const suppCode = String(firstRow['Mã nhà cung cấp'] || '').trim().toLowerCase();
      const suppName = String(firstRow['Tên nhà cung cấp'] || '').trim().toLowerCase();

      const supplier = suppMapByCode.get(suppCode) || suppMapByName.get(suppName) || fallbackSupplier;
      const supplierId = supplier.id;

      const createdAt = parseExcelDate(firstRow['Thời gian'] || firstRow['Thời gian tạo']);
      const total = parseFloat(firstRow['Cần trả nhà cung cấp'] || firstRow['Tổng tiền hàng'] || firstRow['Tổng tiền']) || 0;
      const paid = parseFloat(firstRow['Tiền đã trả nhà cung cấp'] || firstRow['Đã trả nhà cung cấp'] || firstRow['Đã trả NCC']) || 0;
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
          const qty = parseFloat(it['Số lượng']) || 1;
          const price = parseFloat(it['Đơn giá'] || it['Giá nhập']) || 0;
          const itemDiscount = parseFloat(it['Giảm giá']) || 0;
          const itemTotal = parseFloat(it['Thành tiền']) || (qty * price - itemDiscount);

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
  const retFile = findFile(searchDir, /^DanhSachChiTietTraHang_[^N].*\.xlsx$/i) || findFile(searchDir, /^DanhSachChiTietTraHang_.*\.xlsx$/i);
  if (retFile && !retFile.toLowerCase().includes('trahangnhap')) {
    console.log(`🔄 6. Import Phiếu trả hàng từ: ${path.basename(retFile)}`);
    const wb = XLSX.readFile(retFile);
    const sheetName = wb.SheetNames[wb.SheetNames.length - 1];
    const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);
    console.log(`   Đã đọc ${rows.length} dòng chi tiết trả hàng.`);

    const retGroups = new Map<string, any[]>();
    for (const r of rows) {
      const code = String(r['Mã trả hàng'] || '').trim();
      if (!code) continue;
      if (!retGroups.has(code)) retGroups.set(code, []);
      retGroups.get(code)!.push(r);
    }

    let retCount = 0;
    for (const [code, items] of retGroups.entries()) {
      const firstRow = items[0];
      const custCode = String(firstRow['Mã khách hàng'] || '').trim().toLowerCase();
      const custName = String(firstRow['Tên khách hàng'] || '').trim().toLowerCase();

      const customer = custMapByCode.get(custCode) || custMapByName.get(custName);
      const customerId = customer ? customer.id : undefined;

      const createdAt = parseExcelDate(firstRow['Thời gian'] || firstRow['Thời gian tạo']);
      const total = parseFloat(firstRow['Cần trả khách'] || firstRow['Tổng tiền hàng trả'] || firstRow['Tổng sau giảm giá']) || 0;
      const paid = parseFloat(firstRow['Đã trả khách'] || firstRow['Tiền mặt']) || 0;
      const discount = parseFloat(firstRow['Giảm giá phiếu trả'] || firstRow['Giảm giá']) || 0;
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
          const qty = parseFloat(it['Số lượng']) || 1;
          const price = parseFloat(it['Giá nhập lại'] || it['Giá bán'] || it['Đơn giá']) || 0;
          const itemDiscount = parseFloat(it['Giảm giá']) || 0;
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
  const cashFile = findFile(searchDir, /^SoQuy.*\.xlsx$/i);
  if (cashFile) {
    console.log(`💰 7. Import Sổ quỹ từ: ${path.basename(cashFile)}`);
    const wb = XLSX.readFile(cashFile);
    const sheetName = wb.SheetNames[wb.SheetNames.length - 1];
    const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[sheetName]);
    console.log(`   Đã đọc ${rows.length} dòng phiếu thu/chi.`);

    let cashCount = 0;
    for (const r of rows) {
      const code = String(r['Mã phiếu'] || '').trim();
      if (!code) continue;

      const time = parseExcelDate(r['Thời gian']);
      const categoryType = String(r['Loại thu chi'] || '').trim();
      const type = (categoryType.includes('thu') || categoryType.includes('Thu')) ? 'INCOME' : 'EXPENSE';
      const partner = String(r['Người nộp/nhận'] || '').trim();
      const amount = Math.abs(parseFloat(r['Giá trị']) || 0);

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
            userId,
            createdAt: time
          }
        });
        cashCount++;
      }
    }
    console.log(`   ✅ Đã import ${cashCount} phiếu thu/chi sổ quỹ.\n`);
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

main()
  .catch((e) => {
    console.error('❌ Thất bại khi import dữ liệu:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
