import { prisma } from '../config/database';

async function main() {
  console.log('🔄 Đang sửa lại công nợ nhà cung cấp mẫn...');
  const s = await prisma.supplier.findFirst({
    where: { code: 'NCC19590' }
  });

  if (!s) {
    console.log('❌ Không tìm thấy nhà cung cấp NCC19590');
    return;
  }

  // Đặt lại nợ chuẩn: 525.000 (đơn 1) + 2.080.000 (đơn 2) - 2.080.000 (trả đơn 2) - 500.000 (trả tay) = 25.000
  const correctDebt = 15000;
  await prisma.supplier.update({
    where: { id: s.id },
    data: { totalDebt: correctDebt }
  });

  console.log(`✅ Đã sửa công nợ nhà cung cấp ${s.name} (${s.code}): ${s.totalDebt.toString()} ➡️ ${correctDebt}`);
}

main()
  .catch((e) => {
    console.error(e);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
