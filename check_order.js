const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
async function check() {
  const o = await prisma.order.findFirst({
    where: { code: 'HD000423' },
    include: { customer: true }
  });
  console.log(o);
}
check().finally(() => prisma.$disconnect());
