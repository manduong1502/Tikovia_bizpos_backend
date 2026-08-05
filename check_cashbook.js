const { execSync } = require('child_process');

console.log('=== CHECKING CASHBOOK ENTRIES FOR 1/8/2026 ===');

try {
  const cmd = `ssh -o StrictHostKeyChecking=no hoangnam@116.105.163.181 "sudo docker exec -i tiko-bizpos-db psql -U tikovia -d bizpos -c \\"SELECT id, code, type, amount, \\\\"groupName\\\\", note, \\\\"createdAt\\\\" FROM \\\\"CashbookEntry\\\\" WHERE \\\\"createdAt\\\\"::date = '2026-08-01';\\""`;
  const output = execSync(cmd, { encoding: 'utf8', timeout: 15000 });
  console.log('Cashbook entries on 1/8/2026:');
  console.log(output);
} catch (err) {
  console.error('Error:', err.stdout || err.message);
}
