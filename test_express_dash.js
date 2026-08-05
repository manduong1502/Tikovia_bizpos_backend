const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
const { dashboardController } = require('./dist/controllers/dashboardController');

async function run() {
  const tenant = await prisma.tenant.findFirst();
  console.log('Found tenant ID:', tenant?.id);
  const req = {
    tenant: { id: tenant.id },
    query: { timeRange: 'Hôm qua', timeProd: 'Tháng này', timeCust: 'Tháng này' }
  };
  const res = {
    json: (data) => {
      console.log('DASHBOARD CONTROLLER RETURNED 200 SUCCESS!');
      console.log('todayStats:', data.todayStats);
      console.log('periodStats:', data.periodStats);
    }
  };
  const next = (err) => console.error('EXPRESS NEXT ERROR:', err);

  await dashboardController.get(req, res, next);
}

run().catch(console.error).finally(() => prisma.$disconnect());
