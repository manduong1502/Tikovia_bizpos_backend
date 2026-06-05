const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function run() {
  console.log('--- CHECK ORDER HD000425 ---');
  const orders = await prisma.order.findMany({
    where: { code: 'HD000425' },
    include: {
      customer: true
    }
  });
  console.log(JSON.stringify(orders, null, 2));
}

run()
  .catch(console.error)
  .finally(() => prisma.$disconnect());
