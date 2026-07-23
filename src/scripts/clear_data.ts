import { prisma } from '../config/database';

async function main() {
  console.log('🧹 BẮT ĐẦU XÓA SẠCH DỮ LIỆU ĐỂ IMPORT DỮ LIỆU MỚI...\n');

  try {
    // 1. Xóa chi tiết hóa đơn, phiếu trả, phiếu nhập
    console.log('1. Xóa chi tiết hóa đơn & phiếu...');
    await prisma.orderItem.deleteMany({});
    await prisma.returnItem.deleteMany({});
    await prisma.purchaseOrderItem.deleteMany({});
    await prisma.purchaseReturnItem.deleteMany({});
    await prisma.inventoryCheckItem.deleteMany({});
    console.log('   ✅ Đã xóa toàn bộ chi tiết');

    // 2. Xóa các chứng từ giao dịch
    console.log('2. Xóa danh sách Hóa đơn, Phiếu trả, Phiếu nhập, Kiểm kho...');
    await prisma.return.deleteMany({});
    await prisma.order.deleteMany({});
    await prisma.purchaseReturn.deleteMany({});
    await prisma.purchaseOrder.deleteMany({});
    await prisma.inventoryCheck.deleteMany({});
    console.log('   ✅ Đã xóa toàn bộ chứng từ');

    // 3. Xóa Sổ quỹ & Đối tác sổ quỹ
    console.log('3. Xóa Sổ quỹ...');
    await prisma.cashbookEntry.deleteMany({});
    await prisma.cashbookPartner.deleteMany({});
    console.log('   ✅ Đã xóa Sổ quỹ');

    // 4. Xóa Hàng hóa, Nhóm hàng, Thương hiệu
    console.log('4. Xóa Hàng hóa & Nhóm hàng...');
    await prisma.product.deleteMany({});
    await prisma.category.deleteMany({});
    await prisma.brand.deleteMany({});
    console.log('   ✅ Đã xóa toàn bộ Hàng hóa & Nhóm hàng');

    // 5. Xóa Khách hàng & Nhà cung cấp
    console.log('5. Xóa Khách hàng & Nhà cung cấp...');
    await prisma.customer.deleteMany({});
    await prisma.supplier.deleteMany({});
    console.log('   ✅ Đã xóa Khách hàng & Nhà cung cấp');

    // 6. Resets bộ đếm mã chứng từ (Sequence Tracker)
    console.log('6. Reset bộ đếm mã chứng từ về 0...');
    await prisma.sequenceTracker.updateMany({
      data: { value: 0 }
    });
    console.log('   ✅ Đã reset bộ đếm mã chứng từ về 0');

    console.log('\n✨ XÓA SẠCH DỮ LIỆU THÀNH CÔNG! BẠN CÓ THỂ IMPORT DỮ LIỆU MỚI NGAY.');
  } catch (error) {
    console.error('❌ Lỗi khi xóa dữ liệu:', error);
  } finally {
    await prisma.$disconnect();
  }
}

main();
