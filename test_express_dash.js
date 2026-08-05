const fs = require('fs');
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();
const { dashboardController } = require('./dist/controllers/dashboardController');

async function run() {
  const tenant = await prisma.tenant.findFirst();
  const req = {
    tenant: { id: tenant.id },
    query: { timeRange: 'Hôm qua', timeProd: 'Tháng này', timeCust: 'Tháng này' }
  };
  const res = {
    json: (data) => {
      fs.writeFileSync('/tmp/express_out.txt', 'SUCCESS 200:\n' + JSON.stringify(data, null, 2));
    }
  };
  const next = (err) => {
    fs.writeFileSync('/tmp/express_out.txt', 'ERROR NEXT:\n' + (err.stack || err));
  };

  await dashboardController.get(req, res, next);
}

run()
  .catch(err => fs.writeFileSync('/tmp/express_out.txt', 'CATCH ERR:\n' + (err.stack || err)))
  .finally(() => {
    prisma.$disconnect();
    process.exit(0);
  });
