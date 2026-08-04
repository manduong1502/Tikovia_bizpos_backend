import prisma from '../config/database';

async function main() {
  const custs = await prisma.customer.findMany({
    where: { id: { in: [615, 241, 214, 1021, 423] } },
    select: { id: true, code: true, name: true, lastTransaction: true, updatedAt: true }
  });
  console.log('--- CHECK CUSTOMERS LAST TRANSACTION ---');
  console.log(JSON.stringify(custs, null, 2));
}

main().catch(console.error).finally(() => process.exit(0));
