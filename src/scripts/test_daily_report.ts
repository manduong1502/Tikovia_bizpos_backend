import path from 'path';
import * as XLSX from 'xlsx';

const dir = 'd:/Mẫn/demo web kioviet';

// Read BaoCaoBanHangTheoThoiGian
const timeFile = path.join(dir, 'BaoCaoBanHangTheoThoiGian_KV02082026-182307-882.xlsx');
const timeWb = XLSX.readFile(timeFile);
const timeRows: any[] = XLSX.utils.sheet_to_json(timeWb.Sheets[timeWb.SheetNames[0]]);

console.log('BaoCaoBanHangTheoThoiGian sample:', timeRows.slice(0, 5));

// Read BaoCaoBanHangTheoLoiNhuan
const profitFile = path.join(dir, 'BaoCaoBanHangTheoLoiNhuan_KV02082026-182134-776.xlsx');
const profitWb = XLSX.readFile(profitFile);
const profitRows: any[] = XLSX.utils.sheet_to_json(profitWb.Sheets[profitWb.SheetNames[0]]);

console.log('BaoCaoBanHangTheoLoiNhuan sample:', profitRows.slice(0, 5));
