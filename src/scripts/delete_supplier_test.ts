import { prisma } from '../config/database';

async function main() {
  console.log('🔄 Bắt đầu xóa dữ liệu của nhà cung cấp test "min" / "mẫn"...');

  // Tìm nhà cung cấp theo mã NCC hoặc tên
  const suppliers = await prisma.supplier.findMany({
    where: {
      OR: [
        { code: 'NCC25370' },
        { name: { equals: 'min', mode: 'insensitive' } },
        { name: { equals: 'mẫn', mode: 'insensitive' } }
      ]
    }
  });

  if (suppliers.length === 0) {
    console.log('❌ Không tìm thấy nhà cung cấp nào khớp với yêu cầu.');
    return;
  }

  for (const s of suppliers) {
    console.log(`\n==================================================`);
    console.log(`🗑️ Đang xóa dữ liệu đối tác: ID ${s.id} | Mã: ${s.code} | Tên: "${s.name}"`);

    // Lấy danh sách ID đơn nhập hàng của nhà cung cấp này
    const pos = await prisma.purchaseOrder.findMany({
      where: { supplierId: s.id },
      select: { id: true }
    });
    const poIds = pos.map(po => po.id);
    console.log(`  - Tìm thấy ${poIds.length} đơn nhập hàng.`);

    // 1. Xóa các phiếu thu/chi trong sổ quỹ liên quan đến nhà cung cấp này hoặc liên quan đến các đơn nhập hàng của họ
    const cbDeleted = await prisma.cashbookEntry.deleteMany({
      where: {
        OR: [
          { supplierId: s.id },
          { purchaseOrderId: { in: poIds } }
        ]
      }
    });
    console.log(`  - Đã xóa ${cbDeleted.count} phiếu thu/chi liên quan trong sổ quỹ.`);

    // 2. Xóa các đơn trả hàng nhập (Prisma tự cascade xóa PurchaseReturnItem)
    const prDeleted = await prisma.purchaseReturn.deleteMany({
      where: { supplierId: s.id }
    });
    console.log(`  - Đã xóa ${prDeleted.count} đơn trả hàng nhập.`);

    // 3. Xóa các đơn nhập hàng (Prisma tự cascade xóa PurchaseOrderItem)
    const poDeleted = await prisma.purchaseOrder.deleteMany({
      where: { supplierId: s.id }
    });
    console.log(`  - Đã xóa ${poDeleted.count} đơn nhập hàng.`);

    // 4. Cập nhật các sản phẩm đang liên kết với nhà cung cấp này về null (SetNull)
    const prodUpdated = await prisma.product.updateMany({
      where: { supplierId: s.id },
      data: { supplierId: null }
    });
    console.log(`  - Đã gỡ liên kết nhà cung cấp khỏi ${prodUpdated.count} sản phẩm.`);

    // 5. Xóa bản ghi nhà cung cấp
    await prisma.supplier.delete({
      where: { id: s.id }
    });
    console.log(`  - Đã xóa thành công nhà cung cấp khỏi hệ thống.`);
  }

  console.log('\n🎉 Hoàn thành quá trình dọn dẹp dữ liệu nhà cung cấp test!');
}

main()
  .catch((e) => {
    console.error('❌ Lỗi khi thực hiện dọn dẹp:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
