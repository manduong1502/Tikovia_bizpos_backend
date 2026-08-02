import path from 'path';
import * as XLSX from 'xlsx';
import fs from 'fs';

const dataDir = 'd:/Mẫn/demo web kioviet/kiotviet-backend/data';

function getFiles(pattern: RegExp) {
  return fs.readdirSync(dataDir).filter(f => pattern.test(f)).map(f => path.join(dataDir, f));
}

function getNewestFile(pattern: RegExp) {
  const files = getFiles(pattern);
  files.sort((a, b) => fs.statSync(b).mtimeMs - fs.statSync(a).mtimeMs);
  return files[0];
}

console.log('=== AUDIT COMPLETE DATA FILES ===\n');

// 1. Products
const prodFile = getNewestFile(/^DanhSachSanPham.*\.xlsx$/i);
const prodWb = XLSX.readFile(prodFile);
const prodRows = XLSX.utils.sheet_to_json(prodWb.Sheets[prodWb.SheetNames[prodWb.SheetNames.length - 1]]);
console.log(`1. Products (${path.basename(prodFile)}): ${prodRows.length} items`);

// 2. Customers
const custFile = getNewestFile(/^DanhSachKhachHang.*\.xlsx$/i);
const custWb = XLSX.readFile(custFile);
const custRows: any[] = XLSX.utils.sheet_to_json(custWb.Sheets[custWb.SheetNames[custWb.SheetNames.length - 1]]);
let totalCustDebt = 0;
let totalCustSales = 0;
custRows.forEach(r => {
  totalCustDebt += Number(r['Nợ cần thu hiện tại'] || 0);
  totalCustSales += Number(r['Tổng bán trừ trả hàng'] || r['Tổng bán'] || 0);
});
console.log(`2. Customers (${path.basename(custFile)}): ${custRows.length} customers`);
console.log(`   - Total Debt: ${totalCustDebt.toLocaleString('vi-VN')} VNĐ`);
console.log(`   - Total Sales: ${totalCustSales.toLocaleString('vi-VN')} VNĐ`);

// 3. Suppliers
const suppFile = getNewestFile(/^DanhSachNhaCungCap.*\.xlsx$/i);
const suppWb = XLSX.readFile(suppFile);
const suppRows: any[] = XLSX.utils.sheet_to_json(suppWb.Sheets[suppWb.SheetNames[suppWb.SheetNames.length - 1]]);
let totalSuppDebt = 0;
suppRows.forEach(r => {
  totalSuppDebt += Number(r['Nợ cần trả hiện tại'] || 0);
});
console.log(`3. Suppliers (${path.basename(suppFile)}): ${suppRows.length} suppliers`);
console.log(`   - Total Debt to Suppliers: ${totalSuppDebt.toLocaleString('vi-VN')} VNĐ`);

// 4. Invoices
const invFiles = getFiles(/^DanhSachChiTietHoaDon.*\.xlsx$/i);
const invMap = new Map<string, any>();
invFiles.forEach(f => {
  const wb = XLSX.readFile(f);
  const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[wb.SheetNames[wb.SheetNames.length - 1]]);
  rows.forEach(r => {
    const code = String(r['Mã hóa đơn'] || '').trim();
    if (code && !invMap.has(code)) {
      const rawDate = r['Thời gian'] || r['Thời gian tạo'];
      let dateStr = '';
      if (typeof rawDate === 'number') {
        const d = XLSX.SSF.parse_date_code(rawDate);
        if (d) dateStr = String(d.d).padStart(2, '0') + '/' + String(d.m).padStart(2, '0') + '/' + d.y;
      } else if (typeof rawDate === 'string') {
        dateStr = String(rawDate).substring(0, 10);
      }
      invMap.set(code, dateStr);
    }
  });
});
console.log(`4. Invoices: ${invFiles.length} files -> ${invMap.size} unique invoices`);
let inv0208Count = 0;
invMap.forEach(dateStr => {
  if (dateStr.includes('02/08/2026')) inv0208Count++;
});
console.log(`   - Invoices on 02/08/2026: ${inv0208Count} invoices`);

// 5. Profit Report
const repFile = getNewestFile(/^BaoCaoBanHangTheoLoiNhuan.*\.xlsx$/i);
const repWb = XLSX.readFile(repFile);
const repRows: any[] = XLSX.utils.sheet_to_json(repWb.Sheets[repWb.SheetNames[0]]);
let julyRev = 0;
let julyCost = 0;
const processedOrders = new Set<string>();
repRows.forEach(r => {
  const rawDate = r['Thời gian (theo giao dịch)'];
  const code = String(r['Mã giao dịch'] || '').trim().toLowerCase();
  const rev = Number(r['Doanh thu (theo giao dịch)'] || 0);
  const cost = Number(r['Tổng giá vốn (theo giao dịch)'] || 0);
  if (rawDate && code && !processedOrders.has(code)) {
    let dateStr = '';
    if (typeof rawDate === 'number') {
      const d = XLSX.SSF.parse_date_code(rawDate);
      if (d) dateStr = String(d.d).padStart(2, '0') + '/' + String(d.m).padStart(2, '0') + '/' + d.y;
    } else if (typeof rawDate === 'string') {
      dateStr = String(rawDate).substring(0, 10);
    }
    if (dateStr.includes('/07/2026')) {
      processedOrders.add(code);
      julyRev += rev;
      julyCost += cost;
    }
  }
});
console.log(`5. Profit Report July 2026 (${path.basename(repFile)}):`);
console.log(`   - Revenue: ${julyRev.toLocaleString('vi-VN')} VNĐ`);
console.log(`   - Total Cost: ${julyCost.toLocaleString('vi-VN')} VNĐ`);
console.log(`   - Gross Profit: ${(julyRev - julyCost).toLocaleString('vi-VN')} VNĐ`);

// 6. Cashbook
const cashFiles = getFiles(/^SoQuy.*\.xlsx$/i);
const cashMap = new Map<string, number>();
cashFiles.forEach(f => {
  const wb = XLSX.readFile(f);
  const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[wb.SheetNames[wb.SheetNames.length - 1]]);
  rows.forEach(r => {
    const code = String(r['Mã phiếu'] || '').trim();
    if (code) cashMap.set(code, Number(r['Giá trị'] || 0));
  });
});
console.log(`6. Cashbook: ${cashFiles.length} files -> ${cashMap.size} unique cashbook entries`);
