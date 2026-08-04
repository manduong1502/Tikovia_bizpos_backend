import { prisma } from '../config/database';

async function audit() {
  console.log('====================================================');
  console.log('    SYSTEM-WIDE FINANCIAL LOGIC AUDIT REPORT       ');
  console.log('====================================================\n');

  // 1. Audit Customers Debt
  const customers = await prisma.customer.findMany();
  let custDiscrepancies = 0;
  console.log(`[1/3] AUDITING ${customers.length} CUSTOMERS DEBT LOGIC...`);

  for (const c of customers) {
    const orders = await prisma.order.findMany({
      where: { customerId: c.id, status: { not: 'CANCELLED' } }
    });
    const returns = await prisma.return.findMany({
      where: { customerId: c.id, status: { not: 'CANCELLED' } }
    });
    const cashbooks = await prisma.cashbookEntry.findMany({
      where: { customerId: c.id, status: 'completed' }
    });

    const sumOrderDebt = orders.reduce((acc: number, o: any) => acc + (Number(o.total) - Number(o.paid)), 0);
    const sumReturnDebt = returns.reduce((acc: number, r: any) => acc + Number(r.refundAmount || 0), 0);
    const sumCashbookInc = cashbooks.filter((cb: any) => cb.type === 'INCOME').reduce((acc: number, cb: any) => acc + Number(cb.amount), 0);
    const sumCashbookExp = cashbooks.filter((cb: any) => cb.type === 'EXPENSE').reduce((acc: number, cb: any) => acc + Number(cb.amount), 0);

    const calculatedDebt = Math.max(0, sumOrderDebt - sumReturnDebt - sumCashbookInc + sumCashbookExp);
    const storedDebt = Number(c.totalDebt || 0);

    if (Math.abs(calculatedDebt - storedDebt) > 1) {
      custDiscrepancies++;
      if (custDiscrepancies <= 5) {
        console.log(`  ❌ Cust #${c.code} (${c.name}): Stored = ${storedDebt.toLocaleString()}, Calculated = ${calculatedDebt.toLocaleString()}`);
      }
    }
  }
  console.log(`  -> Customer Audit Result: ${custDiscrepancies} discrepancies out of ${customers.length} customers.\n`);

  // 2. Audit Suppliers Debt
  const suppliers = await prisma.supplier.findMany();
  let suppDiscrepancies = 0;
  console.log(`[2/3] AUDITING ${suppliers.length} SUPPLIERS DEBT LOGIC...`);

  for (const s of suppliers) {
    const pos = await prisma.purchaseOrder.findMany({
      where: { supplierId: s.id, status: { not: 'CANCELLED' } }
    });
    const prs = await prisma.purchaseReturn.findMany({
      where: { supplierId: s.id, status: { not: 'CANCELLED' } }
    });
    const cbs = await prisma.cashbookEntry.findMany({
      where: { supplierId: s.id, status: 'completed' }
    });

    const sumPODebt = pos.reduce((acc: number, p: any) => acc + (Number(p.total) - Number(p.paid)), 0);
    const sumPRDebt = prs.reduce((acc: number, pr: any) => acc + Number(pr.total || 0), 0);
    const sumCBExp = cbs.filter((cb: any) => cb.type === 'EXPENSE').reduce((acc: number, cb: any) => acc + Number(cb.amount), 0);
    const sumCBInc = cbs.filter((cb: any) => cb.type === 'INCOME').reduce((acc: number, cb: any) => acc + Number(cb.amount), 0);

    const calculatedDebt = Math.max(0, sumPODebt - sumPRDebt - sumCBExp + sumCBInc);
    const storedDebt = Number(s.totalDebt || 0);

    if (Math.abs(calculatedDebt - storedDebt) > 1) {
      suppDiscrepancies++;
      if (suppDiscrepancies <= 5) {
        console.log(`  ❌ Supp #${s.code} (${s.name}): Stored = ${storedDebt.toLocaleString()}, Calculated = ${calculatedDebt.toLocaleString()}`);
      }
    }
  }
  console.log(`  -> Supplier Audit Result: ${suppDiscrepancies} discrepancies out of ${suppliers.length} suppliers.\n`);

  // 3. Audit Cashbook Balance
  const cashbooksAll = await prisma.cashbookEntry.findMany({ where: { status: 'completed' } });
  const totalIncome = cashbooksAll.filter((c: any) => c.type === 'INCOME').reduce((a: number, b: any) => a + Number(b.amount), 0);
  const totalExpense = cashbooksAll.filter((c: any) => c.type === 'EXPENSE').reduce((a: number, b: any) => a + Number(b.amount), 0);
  console.log(`[3/3] AUDITING CASHBOOK TOTALS...`);
  console.log(`  - Total Cashbook Income: ${totalIncome.toLocaleString()} VNĐ`);
  console.log(`  - Total Cashbook Expense: ${totalExpense.toLocaleString()} VNĐ`);
  console.log(`  - Cashbook Net Balance: ${(totalIncome - totalExpense).toLocaleString()} VNĐ\n`);

  console.log('====================================================');
  console.log('                 AUDIT COMPLETED                    ');
  console.log('====================================================');
}

audit().finally(() => prisma.$disconnect());
