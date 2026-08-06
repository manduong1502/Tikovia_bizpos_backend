// @ts-nocheck
// Script: Check and fix cashbook entries + customer debt in database
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient({
  datasources: { db: { url: 'postgresql://tikovia:tikovia_secure_2026@116.105.163.181:5432/bizpos?schema=public' } }
});

async function main() {
  const tenantId = 1; // thucphamtichdaiviet

  console.log('=== 1. CHECK TCM000514 ===');
  const tcm = await prisma.cashbookEntry.findFirst({
    where: { code: 'TCM000514', tenantId },
    include: { customer: true }
  });
  if (tcm) {
    console.log(`  Code: ${tcm.code}`);
    console.log(`  Type: ${tcm.type} (${tcm.type === 'EXPENSE' ? 'CHI - sai!' : 'THU - đúng'})`);
    console.log(`  Amount: ${Number(tcm.amount).toLocaleString('vi-VN')}`);
    console.log(`  Customer: ${tcm.customer?.name} (ID: ${tcm.customerId})`);
    console.log(`  Partner: ${tcm.partnerName}`);
    console.log(`  Category: ${tcm.category}`);
    console.log(`  CreatedAt: ${tcm.createdAt}`);
  } else {
    console.log('  TCM000514 not found!');
  }

  console.log('\n=== 2. CHECK ALL TCM entries for customers (potential wrong type) ===');
  const wrongTCMs = await prisma.cashbookEntry.findMany({
    where: {
      tenantId,
      type: 'EXPENSE',
      code: { startsWith: 'TCM' },
      partnerType: 'customer',
      customerId: { not: null },
      status: { not: 'cancelled' }
    },
    include: { customer: true },
    orderBy: { createdAt: 'desc' },
    take: 20
  });
  console.log(`  Found ${wrongTCMs.length} TCM entries linked to customers:`);
  wrongTCMs.forEach(cb => {
    console.log(`    ${cb.code} | ${cb.type} | ${Number(cb.amount).toLocaleString('vi-VN')} | ${cb.customer?.name || cb.partnerName} | ${cb.category} | ${cb.createdAt.toISOString().slice(0,10)}`);
  });

  console.log('\n=== 3. CHECK customer "222 Lê Quảng Chí" debt ===');
  const cust = await prisma.customer.findFirst({
    where: { tenantId, code: 'KH001113' }
  });
  if (cust) {
    console.log(`  Name: ${cust.name}`);
    console.log(`  totalDebt in DB: ${Number(cust.totalDebt).toLocaleString('vi-VN')}`);
    
    // Calculate actual debt from orders + cashbooks
    const orders = await prisma.order.findMany({ where: { tenantId, customerId: cust.id, status: { not: 'cancelled' } } });
    const cashbooks = await prisma.cashbookEntry.findMany({ where: { tenantId, customerId: cust.id, status: { not: 'cancelled' } } });
    
    const totalSales = orders.reduce((s, o) => s + Number(o.total), 0);
    const totalPaidOnOrders = orders.reduce((s, o) => s + Number(o.paid || 0), 0);
    const totalCashbookIncome = cashbooks.filter(cb => cb.type === 'INCOME').reduce((s, cb) => s + Number(cb.amount), 0);
    const totalCashbookExpense = cashbooks.filter(cb => cb.type === 'EXPENSE').reduce((s, cb) => s + Number(cb.amount), 0);
    
    // Calculated debt = total sales - paid on orders - cashbook income + cashbook expense
    const calculatedDebt = totalSales - totalPaidOnOrders - totalCashbookIncome + totalCashbookExpense;
    
    console.log(`  Total Sales: ${totalSales.toLocaleString('vi-VN')}`);
    console.log(`  Paid on Orders: ${totalPaidOnOrders.toLocaleString('vi-VN')}`);
    console.log(`  Cashbook INCOME (thu): ${totalCashbookIncome.toLocaleString('vi-VN')}`);
    console.log(`  Cashbook EXPENSE (chi): ${totalCashbookExpense.toLocaleString('vi-VN')}`);
    console.log(`  Calculated Debt: ${calculatedDebt.toLocaleString('vi-VN')}`);
    console.log(`  DB Debt: ${Number(cust.totalDebt).toLocaleString('vi-VN')}`);
    console.log(`  Match: ${Math.abs(calculatedDebt - Number(cust.totalDebt)) < 1 ? '✅' : '❌ MISMATCH!'}`);
  }

  // === FIX TCM000514: Change EXPENSE → INCOME and update customer debt ===
  if (tcm && tcm.type === 'EXPENSE') {
    console.log('\n=== 4. FIXING TCM000514: EXPENSE → INCOME ===');
    const amount = Number(tcm.amount);
    
    // Change type to INCOME
    await prisma.cashbookEntry.update({
      where: { id: tcm.id },
      data: { type: 'INCOME' }
    });
    console.log(`  ✅ Changed type from EXPENSE to INCOME`);

    // Update customer debt: was +amount (EXPENSE), should be -amount (INCOME)
    // Difference: -amount - (+amount) = -2*amount
    if (tcm.customerId) {
      const customer = await prisma.customer.findFirst({ where: { id: tcm.customerId } });
      if (customer) {
        const oldDebt = Number(customer.totalDebt);
        const newDebt = oldDebt - (2 * amount); // Reverse EXPENSE (+) and apply INCOME (-)
        await prisma.customer.update({
          where: { id: customer.id },
          data: { totalDebt: newDebt }
        });
        console.log(`  ✅ Customer debt: ${oldDebt.toLocaleString('vi-VN')} → ${newDebt.toLocaleString('vi-VN')} (reduced by ${(2*amount).toLocaleString('vi-VN')})`);
      }
    }
  }

  console.log('\n=== 5. VERIFY AFTER FIX ===');
  const custAfter = await prisma.customer.findFirst({ where: { tenantId, code: 'KH001113' } });
  if (custAfter) {
    console.log(`  Customer ${custAfter.name}: totalDebt = ${Number(custAfter.totalDebt).toLocaleString('vi-VN')}`);
  }
  const tcmAfter = await prisma.cashbookEntry.findFirst({ where: { code: 'TCM000514', tenantId } });
  if (tcmAfter) {
    console.log(`  TCM000514 type: ${tcmAfter.type}`);
  }
}

main()
  .catch(e => { console.error(e); process.exit(1); })
  .finally(() => prisma.$disconnect());
