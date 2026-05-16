const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function fix() {
  const orders = await prisma.order.findMany({ where: { status: 'COMPLETED' } });
  const debts = {};
  for (const o of orders) {
    if (o.customerId && Number(o.total) > Number(o.paid)) {
      debts[o.customerId] = (debts[o.customerId] || 0) + (Number(o.total) - Number(o.paid));
    }
  }
  for (const [cId, debt] of Object.entries(debts)) {
    await prisma.customer.update({
      where: { id: Number(cId) },
      data: { totalDebt: debt }
    });
  }
  console.log('Fixed debts:', debts);
}
fix().finally(() => prisma.$disconnect());
