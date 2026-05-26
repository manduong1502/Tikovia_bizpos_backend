const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
async function check() {
  const c = await prisma.customer.findFirst({
    where: { code: 'KH879644' },
    include: {
      orders: true
    }
  });
  console.log('Customer:', JSON.stringify(c, null, 2));

  const allOrders = await prisma.order.findMany({
    where: { customerId: c ? c.id : -1 }
  });
  console.log('Orders found by customerId:', allOrders);
}
check().finally(() => prisma.$disconnect());
