const fs = require('fs');
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
const { dashboardController } = require('./dist/controllers/dashboardController');

async function test() {
  const req = {
    tenant: { id: 1 },
    query: { timeRange: 'Hôm qua', timeProd: 'Tháng này', timeCust: 'Tháng này' }
  };
  const res = {
    json: (data) => fs.writeFileSync('/tmp/dash_res.txt', 'SUCCESS:\n' + JSON.stringify(data, null, 2))
  };
  const next = (err) => {
    fs.writeFileSync('/tmp/dash_res.txt', 'ERROR STACK:\n' + (err.stack || err));
  };

  await dashboardController.get(req, res, next);
}

test().catch(e => fs.writeFileSync('/tmp/dash_res.txt', 'CATCH STACK:\n' + (e.stack || e))).finally(() => prisma.$disconnect());
