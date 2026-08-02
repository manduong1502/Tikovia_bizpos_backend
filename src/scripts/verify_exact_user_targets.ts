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

console.log('====================================================');
console.log('VERIFYING ALL 4 TARGET METRICS AGAINST KIOTVIET EXCEL');
console.log('====================================================\n');

// ---------------------------------------------------------
// TARGET 1: Trang Hóa Đơn - Tháng này (08/2026)
// Target: Tổng tiền hàng = 273.808.498, Khách đã trả = 57.655.050
// ---------------------------------------------------------
const invFiles = getFiles(/^DanhSachChiTietHoaDon.*\.xlsx$/i);
const augInvoices = new Map<string, { total: number; paid: number; date: string }>();

invFiles.forEach(f => {
  const wb = XLSX.readFile(f);
  const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[wb.SheetNames[wb.SheetNames.length - 1]]);
  rows.forEach(r => {
    const code = String(r['Mã hóa đơn'] || '').trim();
    if (!code || augInvoices.has(code)) return;

    const rawDate = r['Thời gian'] || r['Thời gian tạo'];
    let dateStr = '';
    if (typeof rawDate === 'number') {
      const d = XLSX.SSF.parse_date_code(rawDate);
      if (d) dateStr = String(d.d).padStart(2, '0') + '/' + String(d.m).padStart(2, '0') + '/' + d.y;
    } else if (typeof rawDate === 'string') {
      dateStr = String(rawDate).substring(0, 10);
    }

    if (dateStr.includes('/08/2026')) {
      const total = Number(r['Khách cần trả'] || r['Tổng tiền hàng'] || 0);
      const paid = Number(r['Khách đã trả'] || 0);
      augInvoices.set(code, { total, paid, date: dateStr });
    }
  });
});

let augTotal = 0;
let augPaidDirect = 0;
augInvoices.forEach(inv => {
  augTotal += inv.total;
  augPaidDirect += inv.paid;
});

console.log('🎯 TARGET 1: Trang Hóa Đơn - Tháng này (08/2026)');
console.log(`   - Tổng tiền hàng Excel: ${augTotal.toLocaleString('vi-VN')} VNĐ (Mục tiêu: 273.808.498)`);
console.log(`   - Khách đã trả trực tiếp trên hóa đơn: ${augPaidDirect.toLocaleString('vi-VN')} VNĐ (Mục tiêu: 57.655.050)`);

// ---------------------------------------------------------
// TARGET 2: Trang Khách Hàng
// Target: Nợ hiện tại = 991.117.974, Tổng bán = 57.031.747.286
// ---------------------------------------------------------
const custFile = getNewestFile(/^DanhSachKhachHang.*\.xlsx$/i);
const custWb = XLSX.readFile(custFile);
const custRows: any[] = XLSX.utils.sheet_to_json(custWb.Sheets[custWb.SheetNames[custWb.SheetNames.length - 1]]);

let custDebtSum = 0;
let custSalesSum = 0;
let custNetSalesSum = 0;

custRows.forEach(r => {
  custDebtSum += Number(r['Nợ cần thu hiện tại'] || 0);
  custSalesSum += Number(r['Tổng bán'] || 0);
  custNetSalesSum += Number(r['Tổng bán trừ trả hàng'] || 0);
});

console.log('\n🎯 TARGET 2: Trang Khách Hàng');
console.log(`   - File sử dụng: ${path.basename(custFile)}`);
console.log(`   - Nợ hiện tại Excel: ${custDebtSum.toLocaleString('vi-VN')} VNĐ (Mục tiêu: 991.117.974)`);
console.log(`   - Tổng bán Excel: ${custSalesSum.toLocaleString('vi-VN')} VNĐ (Mục tiêu: 57.031.747.286)`);
console.log(`   - Tổng bán trừ trả hàng Excel: ${custNetSalesSum.toLocaleString('vi-VN')} VNĐ (Mục tiêu: 56.916.530.711)`);

// ---------------------------------------------------------
// TARGET 3: Sổ Quỹ Tiền Mặt - Tháng này (08/2026)
// Target: Quỹ đầu kỳ = 34.303.020.927, Tổng thu = 321.458.950, Tổng chi = -169.275.268, Tồn quỹ = 34.455.204.609
// ---------------------------------------------------------
const cashFiles = getFiles(/^SoQuy.*\.xlsx$/i);
const augCashEntries = new Map<string, { code: string; type: string; amount: number; date: string }>();
const historicalCashEntries = new Map<string, { code: string; type: string; amount: number; date: string }>();

cashFiles.forEach(f => {
  const wb = XLSX.readFile(f);
  const rows: any[] = XLSX.utils.sheet_to_json(wb.Sheets[wb.SheetNames[wb.SheetNames.length - 1]]);
  rows.forEach(r => {
    const code = String(r['Mã phiếu'] || '').trim();
    if (!code) return;

    const rawDate = r['Thời gian'];
    let dateStr = '';
    if (typeof rawDate === 'number') {
      const d = XLSX.SSF.parse_date_code(rawDate);
      if (d) dateStr = String(d.d).padStart(2, '0') + '/' + String(d.m).padStart(2, '0') + '/' + d.y;
    } else if (typeof rawDate === 'string') {
      dateStr = String(rawDate).substring(0, 10);
    }

    const catType = String(r['Loại thu chi'] || '').trim();
    const isIncome = catType.toLowerCase().includes('thu');
    const rawVal = Number(r['Giá trị'] || 0);
    const amount = Math.abs(rawVal);

    if (dateStr.includes('/08/2026')) {
      if (!augCashEntries.has(code)) augCashEntries.set(code, { code, type: isIncome ? 'INCOME' : 'EXPENSE', amount, date: dateStr });
    } else {
      if (!historicalCashEntries.has(code)) historicalCashEntries.set(code, { code, type: isIncome ? 'INCOME' : 'EXPENSE', amount, date: dateStr });
    }
  });
});

let augIncome = 0;
let augExpense = 0;
augCashEntries.forEach(entry => {
  if (entry.type === 'INCOME') augIncome += entry.amount;
  else augExpense += entry.amount;
});

let openingBalance = 0;
historicalCashEntries.forEach(entry => {
  if (entry.type === 'INCOME') openingBalance += entry.amount;
  else openingBalance -= entry.amount;
});

console.log('\n🎯 TARGET 3: Sổ Quỹ Tiền Mặt - Tháng này (08/2026)');
console.log(`   - Tổng thu Excel: ${augIncome.toLocaleString('vi-VN')} VNĐ (Mục tiêu: 321.458.950)`);
console.log(`   - Tổng chi Excel: -${augExpense.toLocaleString('vi-VN')} VNĐ (Mục tiêu: -169.275.268)`);
console.log(`   - Quỹ đầu kỳ tính toán: ${openingBalance.toLocaleString('vi-VN')} VNĐ (Mục tiêu: 34.303.020.927)`);

// ---------------------------------------------------------
// TARGET 4: Báo cáo Lợi Nhuận - Tháng 07/2026
// Target: Doanh thu = 4.809.880.468, Giá vốn = 4.256.927.127, Lợi nhuận = 552.953.341
// ---------------------------------------------------------
const repFile = getNewestFile(/^BaoCaoBanHangTheoLoiNhuan.*\.xlsx$/i);
const repWb = XLSX.readFile(repFile);
const repRows: any[] = XLSX.utils.sheet_to_json(repWb.Sheets[repWb.SheetNames[0]]);

let julyRev = 0;
let julyCost = 0;
const processedJulyOrders = new Set<string>();

repRows.forEach(r => {
  const rawDate = r['Thời gian (theo giao dịch)'];
  const code = String(r['Mã giao dịch'] || '').trim().toLowerCase();
  const rev = Number(r['Doanh thu (theo giao dịch)'] || 0);
  const cost = Number(r['Tổng giá vốn (theo giao dịch)'] || 0);

  if (rawDate && code && !processedJulyOrders.has(code)) {
    let dateStr = '';
    if (typeof rawDate === 'number') {
      const d = XLSX.SSF.parse_date_code(rawDate);
      if (d) dateStr = String(d.d).padStart(2, '0') + '/' + String(d.m).padStart(2, '0') + '/' + d.y;
    } else if (typeof rawDate === 'string') {
      dateStr = String(rawDate).substring(0, 10);
    }
    if (dateStr.includes('/07/2026')) {
      processedJulyOrders.add(code);
      julyRev += rev;
      julyCost += cost;
    }
  }
});

console.log('\n🎯 TARGET 4: Báo cáo Lợi nhuận Tháng 07/2026');
console.log(`   - Doanh thu Excel: ${julyRev.toLocaleString('vi-VN')} VNĐ (Mục tiêu: 4.809.880.468)`);
console.log(`   - Giá vốn Excel: ${julyCost.toLocaleString('vi-VN')} VNĐ (Mục tiêu: 4.256.927.127)`);
console.log(`   - Lợi nhuận gộp Excel: ${(julyRev - julyCost).toLocaleString('vi-VN')} VNĐ (Mục tiêu: 552.953.341)`);
