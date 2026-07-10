import { prisma } from '../config/database';

async function main() {
  console.log('🔍 Tra cứu lịch sử nhà cung cấp ID 31...');
  const s = await prisma.supplier.findUnique({
    where: { id: 31 },
    include: {
      purchaseOrders: true,
      purchaseReturns: true,
      cashbookEntries: true,
    }
  });

  if (!s) {
    console.log('❌ Không tìm thấy nhà cung cấp ID 31');
    return;
  }

  console.log('=== CHI TIẾT NHÀ CUNG CẤP ===');
  console.log(JSON.stringify(s, null, 2));
}

main()
  .catch((e) => {
    console.error(e);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
