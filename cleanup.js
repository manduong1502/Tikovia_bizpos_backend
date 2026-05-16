const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
async function cleanup() {
  // Delete test categories
  await prisma.category.deleteMany({ where: { name: { in: ['D', 'Test Child'] } } });
  console.log('Cleaned up test categories');
}
cleanup().finally(() => prisma.$disconnect());
