// Script: Read all KH/*.xlsx files, extract customer code + ending debt, then update DB
const XLSX = require('xlsx');
const fs = require('fs');
const path = require('path');
const { PrismaClient } = require('@prisma/client');

const KH_DIR = 'd:/TikoBizpos/KH';

async function main() {
  // Step 1: Parse all Excel files
  const files = fs.readdirSync(KH_DIR).filter(f => f.endsWith('.xlsx'));
  console.log(`Found ${files.length} Excel files\n`);

  const results = [];
  const errors = [];

  for (const file of files) {
    try {
      const wb = XLSX.readFile(path.join(KH_DIR, file));
      const ws = wb.Sheets[wb.SheetNames[0]];
      const data = XLSX.utils.sheet_to_json(ws, { header: 1 });

      let custCode = null;
      let custName = null;
      let endingDebt = null;

      for (let i = 0; i < Math.min(data.length, 15); i++) {
        const row = data[i];
        if (!row) continue;

        // Find customer code (Mã KH row)
        if (row[0] && String(row[0]).trim() === 'Mã KH') {
          custCode = String(row[1]).trim();
        }

        // Find customer name
        if (row[0] && String(row[0]).trim() === 'Khách hàng' && row[1]) {
          custName = String(row[1]).trim();
        }

        // Find ending debt (Nợ cuối kỳ)
        if (row[9] && String(row[9]).trim() === 'Nợ cuối kỳ') {
          endingDebt = Number(row[10] || 0);
        }
      }

      if (custCode && endingDebt !== null) {
        results.push({ file, custCode, custName, endingDebt });
      } else {
        errors.push({ file, custCode, endingDebt, reason: !custCode ? 'No customer code' : 'No ending debt' });
      }
    } catch (e) {
      errors.push({ file, reason: e.message });
    }
  }

  console.log(`=== Successfully parsed: ${results.length} files ===`);
  results.forEach(r => {
    console.log(`  ${r.custCode} | ${r.endingDebt.toLocaleString('vi-VN').padStart(15)} | ${r.custName || r.file}`);
  });

  if (errors.length > 0) {
    console.log(`\n=== Errors: ${errors.length} files ===`);
    errors.forEach(e => {
      console.log(`  ${e.file} | ${e.reason}`);
    });
  }

  // Check for duplicates
  const codeMap = {};
  results.forEach(r => {
    if (!codeMap[r.custCode]) codeMap[r.custCode] = [];
    codeMap[r.custCode].push(r);
  });
  const dupes = Object.entries(codeMap).filter(([k, v]) => v.length > 1);
  if (dupes.length > 0) {
    console.log(`\n=== DUPLICATE customer codes ===`);
    dupes.forEach(([code, entries]) => {
      console.log(`  ${code}: ${entries.map(e => `${e.file}(${e.endingDebt})`).join(', ')}`);
    });
  }

  // Output summary
  const totalDebt = results.reduce((s, r) => s + r.endingDebt, 0);
  console.log(`\n=== SUMMARY ===`);
  console.log(`  Total customers: ${results.length}`);
  console.log(`  Total ending debt: ${totalDebt.toLocaleString('vi-VN')} VNĐ`);
  console.log(`  Duplicates: ${dupes.length}`);

  // Write JSON output for the update script
  const outputPath = path.join(KH_DIR, '_debt_summary.json');
  fs.writeFileSync(outputPath, JSON.stringify(results, null, 2));
  console.log(`\n  Output saved to: ${outputPath}`);
}

main().catch(e => { console.error(e); process.exit(1); });
