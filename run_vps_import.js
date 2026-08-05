const { execSync } = require('child_process');

console.log('=== EXECUTING SALES RETURNS SQL IMPORT ON VPS ===');

try {
  const cmd = `ssh -o StrictHostKeyChecking=no hoangnam@116.105.163.181 "cd /mnt/ssd500/tiko/bizpos-api; sudo git fetch --all; sudo git reset --hard origin/main; sudo docker exec -i tiko-bizpos-db psql -U postgres -d bizpos < /mnt/ssd500/tiko/bizpos-api/import_sales_returns_2026.sql"`;
  const output = execSync(cmd, { encoding: 'utf8', timeout: 30000 });
  console.log('VPS SQL Output:');
  console.log(output);
} catch (err) {
  console.error('Execution Error:', err.stdout || err.message);
}

try {
  console.log('=== AUDITING RETURN COUNT & TOTAL SUM IN DATABASE ===');
  const auditCmd = `ssh -o StrictHostKeyChecking=no hoangnam@116.105.163.181 "sudo docker exec -i tiko-bizpos-db psql -U postgres -d bizpos -c \\"SELECT count(1) as total_tickets, SUM(total) as total_amount FROM \\\\"Return\\\\";\\""`;
  const auditOutput = execSync(auditCmd, { encoding: 'utf8', timeout: 15000 });
  console.log('Audit Result:');
  console.log(auditOutput);
} catch (err) {
  console.error('Audit Error:', err.stdout || err.message);
}
