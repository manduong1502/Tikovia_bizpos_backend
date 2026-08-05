const { execSync } = require('child_process');

console.log('=== AUDITING JULY 2026 COGS DISCREPANCY ===');

try {
  const query = `ssh -o StrictHostKeyChecking=no hoangnam@116.105.163.181 "sudo docker exec -i tiko-bizpos-db psql -U tikovia -d bizpos -c \\"SELECT count(1) as total_items, count(CASE WHEN oi.\\\\"costPrice\\\\" > 0 THEN 1 END) as items_with_cost, count(CASE WHEN oi.\\\\"costPrice\\\\" = 0 THEN 1 END) as items_zero_cost, SUM(oi.quantity * oi.\\\\"costPrice\\\\") as sum_oi_cost, SUM(oi.quantity * p.\\\\"costPrice\\\\") as sum_product_cost FROM \\\\"Order\\\\" o JOIN \\\\"OrderItem\\\\" oi ON o.id = oi.\\\\"orderId\\\\" JOIN \\\\"Product\\\\" p ON oi.\\\\"productId\\\\" = p.id WHERE o.\\\\"status\\\\" != 'CANCELLED' AND o.\\\\"createdAt\\\\"::date >= '2026-07-01' AND o.\\\\"createdAt\\\\"::date <= '2026-07-31';\\""`;
  const output = execSync(query, { encoding: 'utf8', timeout: 15000 });
  console.log('July 2026 Order Items Cost Breakdown:');
  console.log(output);
} catch (err) {
  console.error('Audit Error:', err.stdout || err.message);
}
