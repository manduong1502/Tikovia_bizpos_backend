import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

async function main() {
  const count = await prisma.order.count();
  console.log('Total Orders in DB:', count);

  const sample = await prisma.order.findMany({
    take: 5,
    select: { code: true, costPrice: true, total: true, createdAt: true }
  });
  console.log('Sample Orders:', sample);

  // Check 31/07/2026 total cost in DB
  const start = new Date('2026-07-31T00:00:00.000Z');
  const end = new Date('2026-07-31T23:59:59.999Z');

  const july31Orders = await prisma.order.findMany({
    where: { createdAt: { gte: start, lte: end }, status: 'COMPLETED' },
    select: { code: true, costPrice: true, total: true }
  });

  const totalCost = july31Orders.reduce((sum, o) => sum + Number(o.costPrice), 0);
  const totalRev = july31Orders.reduce((sum, o) => sum + Number(o.total), 0);

  console.log(`July 31 Orders in DB: ${july31Orders.length}`);
  console.log(`July 31 Total Rev in DB: ${totalRev}`);
  console.log(`July 31 Total Cost in DB: ${totalCost}`);
}

main().finally(() => prisma.$disconnect());
