const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
async function check() {
  const o = await prisma.order.findFirst({
    where: { code: 'HD000416' },
    include: { items: { include: { product: true } }, customer: true }
  });
  console.log(JSON.stringify(o, null, 2));
}
check().finally(() => prisma.$disconnect());
