const { execSync } = require('child_process');

console.log('=== DEBUGGING FINANCIAL REPORT CALCULATIONS FOR 01/08/2026 ===');

try {
  const queryOrderCosts = `ssh -o StrictHostKeyChecking=no hoangnam@116.105.163.181 "sudo docker exec -i tiko-bizpos-db psql -U tikovia -d bizpos -c \\"SELECT o.code, SUM(oi.quantity * (CASE WHEN oi.\\\\"costPrice\\\\" > 0 THEN oi.\\\\"costPrice\\\\" ELSE p.\\\\"costPrice\\\\" END)) as order_cogs FROM \\\\"Order\\\\" o JOIN \\\\"OrderItem\\\\" oi ON o.id = oi.\\\\"orderId\\\\" JOIN \\\\"Product\\\\" p ON oi.\\\\"productId\\\\" = p.id WHERE o.\\\\"status\\\\" != 'CANCELLED' AND o.\\\\"createdAt\\\\"::date = '2026-08-01' GROUP BY o.code LIMIT 20;\\""`;
  const outOrder = execSync(queryOrderCosts, { encoding: 'utf8', timeout: 15000 });
  console.log('Order COGS per order:');
  console.log(outOrder);
} catch (err) {
  console.error('Order COGS Error:', err.stdout || err.message);
}

try {
  const queryTotalCogs = `ssh -o StrictHostKeyChecking=no hoangnam@116.105.163.181 "sudo docker exec -i tiko-bizpos-db psql -U tikovia -d bizpos -c \\"SELECT SUM(oi.quantity * (CASE WHEN oi.\\\\"costPrice\\\\" > 0 THEN oi.\\\\"costPrice\\\\" ELSE p.\\\\"costPrice\\\\" END)) as total_order_cogs FROM \\\\"Order\\\\" o JOIN \\\\"OrderItem\\\\" oi ON o.id = oi.\\\\"orderId\\\\" JOIN \\\\"Product\\\\" p ON oi.\\\\"productId\\\" = p.id WHERE o.\\\\"status\\\\" != 'CANCELLED' AND o.\\\\"createdAt\\\\"::date = '2026-08-01';\\""`;
  const outTotalCogs = execSync(queryTotalCogs, { encoding: 'utf8', timeout: 15000 });
  console.log('Total Order COGS sum:');
  console.log(outTotalCogs);
} catch (err) {
  console.error('Total COGS Error:', err.stdout || err.message);
}

try {
  const queryCashbook = `ssh -o StrictHostKeyChecking=no hoangnam@116.105.163.181 "sudo docker exec -i tiko-bizpos-db psql -U tikovia -d bizpos -c \\"SELECT type, \\\\"groupName\\\\", \\\\"isBusinessExpense\\\\", SUM(amount) FROM \\\\"CashbookEntry\\\\" WHERE \\\\"createdAt\\\\"::date = '2026-08-01' GROUP BY type, \\\\"groupName\\\\", \\\\"isBusinessExpense\\\\";\\""`;
  const outCashbook = execSync(queryCashbook, { encoding: 'utf8', timeout: 15000 });
  console.log('Cashbook Breakdown:');
  console.log(outCashbook);
} catch (err) {
  console.error('Cashbook Error:', err.stdout || err.message);
}
