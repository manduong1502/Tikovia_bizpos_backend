import { prisma } from '../config/database';

async function main() {
  console.log('🔍 Kiểm tra nhà cung cấp mẫn...');
  const s = await prisma.supplier.findFirst({
    where: { code: 'NCC19590' },
    include: {
      purchaseOrders: {
        include: { items: true }
      },
      cashbookEntries: true,
      purchaseReturns: true
    }
  });

  if (!s) {
    console.log('❌ Không tìm thấy nhà cung cấp NCC19590');
    return;
  }

  console.log('\n=== THÔNG TIN NHÀ CUNG CẤP ===');
  console.log('ID:', s.id);
  console.log('Mã:', s.code);
  console.log('Tên:', s.name);
  console.log('Tổng nợ (database):', s.totalDebt.toString());

  console.log('\n=== DANH SÁCH ĐƠN NHẬP HÀNG ===');
  s.purchaseOrders.forEach(po => {
    console.log(`- Mã đơn: ${po.code} | Trạng thái: ${po.status} | Tổng tiền: ${po.total.toString()} | Đã trả: ${po.paid.toString()}`);
  });

  console.log('\n=== DANH SÁCH PHIẾU THU/CHI ===');
  s.cashbookEntries.forEach(cb => {
    console.log(`- Mã phiếu: ${cb.code} | Loại: ${cb.type} | Số tiền: ${cb.amount.toString()} | Trạng thái: ${cb.status}`);
  });
}

main()
  .catch((e) => {
    console.error('❌ Lỗi:', e);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
