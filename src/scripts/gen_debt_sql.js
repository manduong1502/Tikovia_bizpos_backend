// Generate SQL to update totalDebt for each customer from KH Excel files
const fs = require('fs');
const path = require('path');

const summaryPath = 'd:/TikoBizpos/KH/_debt_summary.json';
const results = JSON.parse(fs.readFileSync(summaryPath, 'utf8'));

// Deduplicate by custCode (take first occurrence)
const seen = new Set();
const unique = results.filter(r => {
  if (seen.has(r.custCode)) return false;
  seen.add(r.custCode);
  return true;
});

console.log(`-- Update totalDebt for ${unique.length} customers (data from KiotViet as of 05/08/2026)`);
console.log(`-- Generated at: ${new Date().toISOString()}`);
console.log('BEGIN;');
console.log('');

unique.forEach(r => {
  const debt = r.endingDebt;
  const code = r.custCode;
  const name = (r.custName || '').replace(/'/g, "''");
  console.log(`-- ${name}`);
  console.log(`UPDATE "Customer" SET "totalDebt" = ${debt} WHERE "code" = '${code}' AND "tenantId" = 1;`);
  console.log('');
});

console.log('COMMIT;');
console.log(`-- Total: ${unique.length} customers updated`);
