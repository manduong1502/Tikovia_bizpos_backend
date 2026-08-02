import fs from 'fs';
import path from 'path';
import * as XLSX from 'xlsx';

const dir = 'd:/Mẫn/demo web kioviet';
const reportFile = path.join(dir, 'BaoCaoBanHangTheoLoiNhuan_KV02082026-182134-776.xlsx');
const repWb = XLSX.readFile(reportFile);
const repRows: any[] = XLSX.utils.sheet_to_json(repWb.Sheets[repWb.SheetNames[0]]);

const reportOrderCostMap = new Map<string, number>();

repRows.forEach(r => {
  const orderCode = String(r['Mã giao dịch'] || r['Mã hóa đơn'] || '').trim().toLowerCase();
  const orderCost = Number(r['Tổng giá vốn (theo giao dịch)'] || 0);
  if (orderCode && orderCost > 0) {
    reportOrderCostMap.set(orderCode, orderCost);
  }
});

console.log('reportOrderCostMap size:', reportOrderCostMap.size);

// Now read 31/07 orders from DanhSachChiTietHoaDon
const invFile = path.join(dir, 'DanhSachChiTietHoaDon_KV01082026-182615-834.xlsx');
const invWb = XLSX.readFile(invFile);
const invRows: any[] = XLSX.utils.sheet_to_json(invWb.Sheets[invWb.SheetNames[invWb.SheetNames.length - 1]]);

const orders31 = new Set<string>();
invRows.forEach(r => {
  const code = String(r['Mã hóa đơn'] || '').trim();
  const rawDate = r['Thời gian'] || r['Thời gian tạo'];
  let dateStr = '';
  if (typeof rawDate === 'number') {
    const d = XLSX.SSF.parse_date_code(rawDate);
    if (d) dateStr = String(d.d).padStart(2, '0') + '/' + String(d.m).padStart(2, '0') + '/' + d.y;
  } else if (typeof rawDate === 'string') {
    dateStr = String(rawDate).substring(0, 10);
  }
  if (dateStr === '31/07/2026' && code) {
    orders31.add(code);
  }
});

console.log('Unique 31/07 orders in invoice file:', orders31.size);

let matchCount = 0;
let missedCount = 0;
let sumMatchedCost = 0;

orders31.forEach(code => {
  const lowerCode = code.toLowerCase();
  if (reportOrderCostMap.has(lowerCode)) {
    matchCount++;
    sumMatchedCost += reportOrderCostMap.get(lowerCode)!;
  } else {
    missedCount++;
    console.log('MISSED ORDER IN REPORT MAP:', code);
  }
});

console.log(`Matched: ${matchCount}, Missed: ${missedCount}`);
console.log(`Sum of Matched Order Costs for 31/07: ${sumMatchedCost}`);
