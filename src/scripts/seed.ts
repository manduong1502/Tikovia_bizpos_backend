import { prisma } from '../config/database';
import bcrypt from 'bcryptjs';

async function main() {
  console.log('🌱 Seeding database with Multi-Tenancy...');

  // 1. Tạo Tenant mặc định (id: 1) nếu chưa tồn tại
  let tenant = await prisma.tenant.findUnique({
    where: { subdomain: 'demo' },
  });

  if (!tenant) {
    tenant = await prisma.tenant.create({
      data: {
        id: 1,
        name: 'Cửa hàng Mẫu',
        subdomain: 'demo',
        plan: 'STANDARD',
      },
    });
    console.log(`  ✅ Created default Tenant: ${tenant.name} (${tenant.subdomain})`);
  } else {
    console.log(`  ✅ Default Tenant already exists: ${tenant.name}`);
  }

  const tenantId = tenant.id;

  // 2. Tạo default Sequence Trackers
  const sequences = ['ORDER', 'RETURN', 'PURCHASE_ORDER', 'PURCHASE_RETURN', 'INVENTORY_CHECK', 'CASHBOOK'];
  for (const seq of sequences) {
    await prisma.sequenceTracker.upsert({
      where: { tenantId_name: { tenantId, name: seq } },
      update: {},
      create: { tenantId, name: seq, value: 0 }
    });
  }
  console.log(`  ✅ Initialized sequence trackers for tenant`);

  // ─── Admin user ───
  const adminPassword = await bcrypt.hash('admin123', 12);
  const admin = await prisma.user.upsert({
    where: {
      tenantId_username: {
        tenantId,
        username: 'admin',
      },
    },
    update: {},
    create: {
      username: 'admin',
      password: adminPassword,
      fullName: 'Quản trị viên',
      email: 'admin@tikovia.vn',
      role: 'ADMIN',
      tenantId,
    },
  });
  console.log(`  ✅ Admin: ${admin.username}`);

  // ─── Staff user ───
  const staffPassword = await bcrypt.hash('staff123', 12);
  const staff = await prisma.user.upsert({
    where: {
      tenantId_username: {
        tenantId,
        username: 'nhanvien1',
      },
    },
    update: {},
    create: {
      username: 'nhanvien1',
      password: staffPassword,
      fullName: 'Nguyễn Văn A',
      phone: '0901234567',
      role: 'STAFF',
      tenantId,
    },
  });
  console.log(`  ✅ Staff: ${staff.username}`);

  // ─── Super Admin ───
  const superAdminPassword = await bcrypt.hash('Skybone7194@', 12);
  const superAdmin = await prisma.superAdmin.upsert({
    where: { username: 'tikovia' },
    update: {},
    create: {
      username: 'tikovia',
      password: superAdminPassword,
      fullName: 'Tikovia Owner',
    },
  });
  console.log(`  ✅ Super Admin: ${superAdmin.username}`);

  console.log('\n🎉 Seed completed!\n');
  console.log('📝 Tài khoản đăng nhập (Gian hàng: demo):');
  console.log('   Admin:    admin / admin123');
  console.log('   Nhân viên: nhanvien1 / staff123');
  console.log('📝 Tài khoản Super Admin:');
  console.log('   Super Admin: tikovia / Skybone7194@');
}

main()
  .catch((e) => {
    console.error('❌ Seed failed:', e);
    process.exit(1);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
