const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
async function check() {
  const o = await prisma.order.findUnique({ where: { code: 'HD000013' } });
  console.log(o);
}
check().finally(() => prisma.$disconnect());
