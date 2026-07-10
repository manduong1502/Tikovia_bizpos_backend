import { prisma } from '../config/database';

async function main() {
  const sup = await prisma.supplier.findFirst({
    where: { name: 'mẫn' },
    include: {
      purchaseOrders: true,
      purchaseReturns: true,
    }
  });

  if (!sup) {
    console.log('Supplier not found');
    return;
  }

  console.log('=== SUPPLIER ===');
  console.log('ID:', sup.id);
  console.log('Code:', sup.code);
  console.log('Name:', sup.name);
  console.log('Total Debt (Database):', sup.totalDebt);
  console.log('Total Spent:', sup.totalSpent);

  const cashbooks = await prisma.cashbookEntry.findMany({
    where: {
      OR: [
        { supplierId: sup.id },
        { supplier_code: sup.code }
      ]
    }
  });

  console.log('\n=== CASHBOOKS ===');
  cashbooks.forEach(cb => {
    console.log(`Code: ${cb.code}, Type: ${cb.type}, Amount: ${cb.amount}, Status: ${cb.status}, Date: ${cb.createdAt}`);
  });

  console.log('\n=== PURCHASE ORDERS ===');
  sup.purchaseOrders.forEach(po => {
    console.log(`Code: ${po.code}, Status: ${po.status}, Total: ${po.total}, Paid: ${po.paid}, Date: ${po.createdAt}`);
  });

  console.log('\n=== PURCHASE RETURNS ===');
  sup.purchaseReturns.forEach(pr => {
    console.log(`Code: ${pr.code}, Status: ${pr.status}, Total: ${pr.total}, Paid: ${pr.paid}, Date: ${pr.createdAt}`);
  });
}

main()
  .catch((e) => {
    console.error(e);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
