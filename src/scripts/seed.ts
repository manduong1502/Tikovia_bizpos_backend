import { prisma } from '../config/database';
import bcrypt from 'bcryptjs';

async function main() {
  console.log('🌱 Seeding database...');

  // ─── Admin user ───
  const adminPassword = await bcrypt.hash('admin123', 12);
  const admin = await prisma.user.upsert({
    where: { username: 'admin' },
    update: {},
    create: {
      username: 'admin',
      password: adminPassword,
      fullName: 'Quản trị viên',
      email: 'admin@tikovia.vn',
      role: 'ADMIN',
    },
  });
  console.log(`  ✅ Admin: ${admin.username}`);

  // ─── Staff user ───
  const staffPassword = await bcrypt.hash('staff123', 12);
  const staff = await prisma.user.upsert({
    where: { username: 'nhanvien1' },
    update: {},
    create: {
      username: 'nhanvien1',
      password: staffPassword,
      fullName: 'Nguyễn Văn A',
      phone: '0901234567',
      role: 'STAFF',
    },
  });
  console.log(`  ✅ Staff: ${staff.username}`);

  // ─── Categories ───
  const categories = await Promise.all([
    prisma.category.upsert({ where: { name: 'Đồ uống' }, update: {}, create: { name: 'Đồ uống' } }),
    prisma.category.upsert({ where: { name: 'Thực phẩm' }, update: {}, create: { name: 'Thực phẩm' } }),
    prisma.category.upsert({ where: { name: 'Gia dụng' }, update: {}, create: { name: 'Gia dụng' } }),
    prisma.category.upsert({ where: { name: 'Điện tử' }, update: {}, create: { name: 'Điện tử' } }),
    prisma.category.upsert({ where: { name: 'Văn phòng phẩm' }, update: {}, create: { name: 'Văn phòng phẩm' } }),
  ]);
  console.log(`  ✅ ${categories.length} nhóm hàng`);

  // ─── Products ───
  const sampleProducts = [
    { sku: 'SP001', name: 'Coca Cola 330ml', barcode: '8935049500100', categoryId: categories[0].id, costPrice: 7000, sellPrice: 10000, stock: 200, unit: 'Lon' },
    { sku: 'SP002', name: 'Pepsi 330ml', barcode: '8935049500200', categoryId: categories[0].id, costPrice: 7000, sellPrice: 10000, stock: 150, unit: 'Lon' },
    { sku: 'SP003', name: 'Nước suối Aquafina 500ml', barcode: '8935049500300', categoryId: categories[0].id, costPrice: 3000, sellPrice: 5000, stock: 300, unit: 'Chai' },
    { sku: 'SP004', name: 'Mì Hảo Hảo tôm chua cay', barcode: '8935049500400', categoryId: categories[1].id, costPrice: 3500, sellPrice: 5000, stock: 500, unit: 'Gói' },
    { sku: 'SP005', name: 'Snack Oishi tôm', barcode: '8935049500500', categoryId: categories[1].id, costPrice: 5000, sellPrice: 8000, stock: 100, unit: 'Gói' },
    { sku: 'SP006', name: 'Bột giặt OMO 3kg', barcode: '8935049500600', categoryId: categories[2].id, costPrice: 65000, sellPrice: 85000, stock: 30, unit: 'Bịch' },
    { sku: 'SP007', name: 'Nước rửa chén Sunlight', barcode: '8935049500700', categoryId: categories[2].id, costPrice: 25000, sellPrice: 35000, stock: 50, unit: 'Chai' },
    { sku: 'SP008', name: 'Pin AA Panasonic (vỉ 4)', barcode: '8935049500800', categoryId: categories[3].id, costPrice: 20000, sellPrice: 30000, stock: 80, unit: 'Vỉ' },
    { sku: 'SP009', name: 'Bút bi Thiên Long TL-027', barcode: '8935049500900', categoryId: categories[4].id, costPrice: 3000, sellPrice: 5000, stock: 200, unit: 'Cây' },
    { sku: 'SP010', name: 'Vở Campus 200 trang', barcode: '8935049501000', categoryId: categories[4].id, costPrice: 10000, sellPrice: 15000, stock: 150, unit: 'Cuốn' },
  ];

  for (const p of sampleProducts) {
    await prisma.product.upsert({
      where: { sku: p.sku },
      update: {},
      create: p,
    });
  }
  console.log(`  ✅ ${sampleProducts.length} sản phẩm`);

  // ─── Customers ───
  const customers = [
    { code: 'KH001', name: 'Trần Thị B', phone: '0912345678', address: 'Q.1, TP.HCM' },
    { code: 'KH002', name: 'Lê Văn C', phone: '0923456789', address: 'Q.3, TP.HCM' },
    { code: 'KH003', name: 'Phạm Thị D', phone: '0934567890', address: 'Q.7, TP.HCM' },
  ];
  for (const c of customers) {
    await prisma.customer.upsert({ where: { code: c.code }, update: {}, create: c });
  }
  console.log(`  ✅ ${customers.length} khách hàng`);

  // ─── Suppliers ───
  const suppliers = [
    { code: 'NCC001', name: 'Công ty TNHH Phân phối ABC', phone: '0281234567', address: 'Q.Bình Tân, TP.HCM' },
    { code: 'NCC002', name: 'Đại lý XYZ', phone: '0282345678', address: 'Q.Tân Phú, TP.HCM' },
  ];
  for (const s of suppliers) {
    await prisma.supplier.upsert({ where: { code: s.code }, update: {}, create: s });
  }
  console.log(`  ✅ ${suppliers.length} nhà cung cấp`);

  console.log('\n🎉 Seed completed!\n');
  console.log('📝 Tài khoản đăng nhập:');
  console.log('   Admin:    admin / admin123');
  console.log('   Nhân viên: nhanvien1 / staff123');
}

main()
  .catch((e) => {
    console.error('❌ Seed failed:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
