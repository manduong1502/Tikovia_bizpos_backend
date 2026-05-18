import { PrismaClient } from '@prisma/client';
const prisma = new PrismaClient();

async function syncSequence(name: string, prefix: string, tableName: any, codeField: string = 'code') {
  try {
    const records = await (prisma[tableName] as any).findMany({
      orderBy: { id: 'desc' },
      take: 1
    });
    
    let maxVal = 0;
    if (records.length > 0 && records[0][codeField]) {
      const codeStr = records[0][codeField].replace(prefix, '');
      const parsed = parseInt(codeStr, 10);
      if (!isNaN(parsed)) maxVal = parsed;
    }
    
    await prisma.sequenceTracker.upsert({
      where: { name },
      update: { value: maxVal },
      create: { name, value: maxVal }
    });
    console.log(`Synced sequence ${name} to ${maxVal}`);
  } catch (e: any) {
    console.error(`Error syncing ${name}:`, e.message);
  }
}

async function main() {
  await syncSequence('ORDER', 'HD', 'order');
  await syncSequence('PURCHASE_ORDER', 'PN', 'purchaseOrder');
  await syncSequence('PURCHASE_RETURN', 'TH', 'purchaseReturn');
  await syncSequence('RETURN', 'TH', 'return');
  await syncSequence('INVENTORY_CHECK', 'PK', 'inventoryCheck');
  // Cashbook uses PT and PC, which is generated dynamically, so it's a bit harder to max. Let's just do count.
  const cashbookCount = await prisma.cashbookEntry.count();
  await prisma.sequenceTracker.upsert({
    where: { name: 'CASHBOOK' },
    update: { value: cashbookCount },
    create: { name: 'CASHBOOK', value: cashbookCount }
  });
  console.log(`Synced sequence CASHBOOK to ${cashbookCount}`);
}

main().catch(console.error).finally(() => prisma.$disconnect());
