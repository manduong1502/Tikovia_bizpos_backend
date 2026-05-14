const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function main() {
  const today = new Date();
  today.setHours(0, 0, 0, 0);
  const tomorrow = new Date(today);
  tomorrow.setDate(tomorrow.getDate() + 1);

  const startOfMonth = new Date(today.getFullYear(), today.getMonth(), 1);
  const endOfMonth = new Date(today.getFullYear(), today.getMonth() + 1, 0, 23, 59, 59, 999);

  const monthlyRevenueAggr = await prisma.order.aggregate({
    where: { createdAt: { gte: startOfMonth, lte: endOfMonth }, status: 'COMPLETED' },
    _sum: { total: true },
  });

  const topProductsDb = await prisma.orderItem.groupBy({
    by: ['productId', 'productName'],
    where: { order: { createdAt: { gte: startOfMonth, lte: endOfMonth }, status: 'COMPLETED' } },
    _sum: { quantity: true, total: true },
    orderBy: { _sum: { quantity: 'desc' } },
    take: 5,
  });

  console.log("Monthly Rev:", monthlyRevenueAggr._sum.total);
  console.log("Top Products:", topProductsDb);
}
main().catch(console.error).finally(() => prisma.$disconnect());
