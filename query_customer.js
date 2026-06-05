const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
async function check() {
  const c = await prisma.customer.findFirst({
    where: {
      OR: [
        { code: 'KH001160' },
        { name: { contains: 'THANH', mode: 'insensitive' } }
      ]
    },
    include: {
      orders: {
        select: {
          code: true,
          createdAt: true
        }
      }
    }
  });
  console.log('Customer:', JSON.stringify(c, null, 2));

  // Let's also search for all customers with similar names
  const similar = await prisma.customer.findMany({
    where: {
      name: { contains: 'Thanh', mode: 'insensitive' }
    },
    select: {
      id: true,
      code: true,
      name: true,
      phone: true,
      isActive: true
    }
  });
  console.log('Similar customers:', similar);
}
check().finally(() => prisma.$disconnect());
