const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
async function check() {
  const cats = await prisma.category.findMany({ select: { id: true, name: true, parentId: true } });
  console.log(JSON.stringify(cats, null, 2));
}
check().finally(() => prisma.$disconnect());
