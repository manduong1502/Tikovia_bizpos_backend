const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
const { dashboardController } = require('./dist/controllers/dashboardController');

async function test() {
  console.log('=== TESTING DASHBOARD CONTROLLER LOCALLY ===');
  const tenant = await prisma.tenant.findFirst();
  if (!tenant) return;

  const req = {
    tenant: { id: tenant.id },
    query: { timeRange: 'Hôm qua', timeProd: 'Tháng này', timeCust: 'Tháng này' }
  };
  const res = {
    json: (data) => console.log('DASHBOARD SUCCESS OUTPUT:', JSON.stringify(data, null, 2))
  };
  const next = (err) => console.error('DASHBOARD ERROR CAUGHT:', err);

  await dashboardController.get(req, res, next);
}

test().catch(console.error).finally(() => prisma.$disconnect());
