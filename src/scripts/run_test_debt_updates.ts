import { prisma } from '../config/database';

async function main() {
  console.log('🔄 Đang chạy mô phỏng cập nhật công nợ...');

  const supplierId = 31;
  const s0 = await prisma.supplier.findUnique({ where: { id: supplierId } });
  console.log(`[Bước 0] Nợ hiện tại trong DB: ${s0?.totalDebt.toString()}`);

  // 1. Đặt lại nợ về 25000
  await prisma.supplier.update({
    where: { id: supplierId },
    data: { totalDebt: 25000 }
  });
  const s1 = await prisma.supplier.findUnique({ where: { id: supplierId } });
  console.log(`[Bước 1] Đặt lại nợ về 25000. Nợ trong DB: ${s1?.totalDebt.toString()}`);

  // 2. Mô phỏng Nhập hàng đơn PN000062 giá trị 990000
  const importDebt = 990000; // total - paid (990000 - 0)
  await prisma.supplier.update({
    where: { id: supplierId },
    data: { totalDebt: { increment: importDebt } }
  });
  const s2 = await prisma.supplier.findUnique({ where: { id: supplierId } });
  console.log(`[Bước 2] Sau khi cộng nợ nhập hàng (+990.000). Nợ trong DB: ${s2?.totalDebt.toString()}`);

  // 3. Mô phỏng Thanh toán 1000000
  const paymentAmount = 1000000;
  const debtChange = -paymentAmount; // EXPENSE
  const newDebt = Number(s2?.totalDebt || 0) + debtChange;
  await prisma.supplier.update({
    where: { id: supplierId },
    data: { totalDebt: newDebt }
  });
  const s3 = await prisma.supplier.findUnique({ where: { id: supplierId } });
  console.log(`[Bước 3] Sau khi trừ nợ thanh toán (-1.000.000). Nợ trong DB: ${s3?.totalDebt.toString()}`);
}

main()
  .catch(console.error)
  .finally(async () => {
    await prisma.$disconnect();
  });
