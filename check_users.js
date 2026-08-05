const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

async function run() {
  const users = await prisma.user.findMany({ select: { id: true, username: true, fullName: true, tenantId: true } });
  const tenants = await prisma.tenant.findMany({ select: { id: true, name: true, subdomain: true } });
  console.log('USERS:', JSON.stringify(users, null, 2));
  console.log('TENANTS:', JSON.stringify(tenants, null, 2));
}

run().catch(console.error).finally(() => prisma.$disconnect());
