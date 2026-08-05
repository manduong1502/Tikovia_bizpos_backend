const fs = require('fs');
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
const { dashboardController } = require('./dist/controllers/dashboardController');

async function test() {
  const tenant = await prisma.tenant.findFirst();
  if (!tenant) return;

  const req = {
    tenant: { id: tenant.id },
    query: { timeRange: 'Hôm qua', timeProd: 'Tháng này', timeCust: 'Tháng này' }
  };
  const res = {
    json: (data) => {
      fs.writeFileSync('output_dash.json', JSON.stringify(data, null, 2));
      console.log('SUCCESS_DASHBOARD_WRITE');
    }
  };
  const next = (err) => {
    fs.writeFileSync('output_dash.json', JSON.stringify({ error: String(err) }, null, 2));
    console.error('DASHBOARD_ERROR_NEXT:', err);
  };

  await dashboardController.get(req, res, next);
}

test().catch(console.error).finally(() => prisma.$disconnect());
