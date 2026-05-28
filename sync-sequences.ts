import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

async function syncSequence(tenantId: number, name: string, prefix: string, tableName: any, codeField: string = 'code') {
  try {
    const records = await (prisma[tableName] as any).findMany({
      where: { tenantId },
      orderBy: { id: 'desc' },
      take: 1
    });
    
    let maxVal = 0;
    if (records.length > 0 && records[0][codeField]) {
      // Remove any prefix plus potential leading zeros
      const codeStr = records[0][codeField].replace(prefix, '');
      const parsed = parseInt(codeStr, 10);
      if (!isNaN(parsed)) maxVal = parsed;
    }
    
    await prisma.sequenceTracker.upsert({
      where: { tenantId_name: { tenantId, name } },
      update: { value: maxVal },
      create: { tenantId, name, value: maxVal }
    });
    console.log(`Tenant ${tenantId} - Synced sequence ${name} to ${maxVal}`);
  } catch (e: any) {
    console.error(`Tenant ${tenantId} - Error syncing ${name}:`, e.message);
  }
}

async function main() {
  const tenants = await prisma.tenant.findMany({ select: { id: true } });
  for (const t of tenants) {
    const tenantId = t.id;
    await syncSequence(tenantId, 'ORDER', 'HD', 'order');
    await syncSequence(tenantId, 'PURCHASE_ORDER', 'PN', 'purchaseOrder');
    await syncSequence(tenantId, 'PURCHASE_RETURN', 'THN', 'purchaseReturn'); // Notice purchaseReturn prefix is THN or TH, let's look at records to verify. In database we had THN000001, so prefix is THN!
    await syncSequence(tenantId, 'RETURN', 'TH', 'return');
    await syncSequence(tenantId, 'INVENTORY_CHECK', 'PK', 'inventoryCheck');
    
    const cashbookCount = await prisma.cashbookEntry.count({ where: { tenantId } });
    await prisma.sequenceTracker.upsert({
      where: { tenantId_name: { tenantId, name: 'CASHBOOK' } },
      update: { value: cashbookCount },
      create: { tenantId, name: 'CASHBOOK', value: cashbookCount }
    });
    console.log(`Tenant ${tenantId} - Synced sequence CASHBOOK to ${cashbookCount}`);
  }
}

main().catch(console.error).finally(() => prisma.$disconnect());
