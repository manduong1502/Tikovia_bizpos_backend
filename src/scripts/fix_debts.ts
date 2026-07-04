import { prisma } from '../config/database';

async function main() {
  console.log('🔄 Starting database debt sign inversion...');

  // 1. Invert Customer debts
  const customers = await prisma.customer.findMany({
    select: { id: true, code: true, name: true, totalDebt: true }
  });

  console.log(`Found ${customers.length} customers. Inverting signs...`);
  let updatedCustomers = 0;
  for (const c of customers) {
    const currentDebt = Number(c.totalDebt || 0);
    if (currentDebt !== 0) {
      const newDebt = -currentDebt;
      await prisma.customer.update({
        where: { id: c.id },
        data: { totalDebt: newDebt }
      });
      console.log(`  - Customer ${c.code} (${c.name}): ${currentDebt} ➡️ ${newDebt}`);
      updatedCustomers++;
    }
  }

  // 2. Invert Supplier debts
  const suppliers = await prisma.supplier.findMany({
    select: { id: true, code: true, name: true, totalDebt: true }
  });

  console.log(`Found ${suppliers.length} suppliers. Inverting signs...`);
  let updatedSuppliers = 0;
  for (const s of suppliers) {
    const currentDebt = Number(s.totalDebt || 0);
    if (currentDebt !== 0) {
      const newDebt = -currentDebt;
      await prisma.supplier.update({
        where: { id: s.id },
        data: { totalDebt: newDebt }
      });
      console.log(`  - Supplier ${s.code} (${s.name}): ${currentDebt} ➡️ ${newDebt}`);
      updatedSuppliers++;
    }
  }

  console.log(`\n🎉 Inversion completed! Updated ${updatedCustomers} customers and ${updatedSuppliers} suppliers.`);
}

main()
  .catch((e) => {
    console.error('❌ Inversion failed:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
