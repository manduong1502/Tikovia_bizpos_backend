const fs = require('fs');
const results = JSON.parse(fs.readFileSync('d:/TikoBizpos/KH/_debt_summary.json', 'utf8'));
const seen = new Set();
const unique = results.filter(r => { if (seen.has(r.custCode)) return false; seen.add(r.custCode); return true; });
let sql = 'BEGIN;\n';
unique.forEach(r => {
  sql += `UPDATE "Customer" SET "totalDebt" = ${r.endingDebt} WHERE "code" = '${r.custCode}' AND "tenantId" = 1;\n`;
});
sql += 'COMMIT;\n';
fs.writeFileSync('d:/TikoBizpos/update_debts.sql', sql, 'utf8');
console.log(`Written ${unique.length} UPDATE statements to update_debts.sql`);
