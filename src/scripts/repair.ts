import prisma from '../config/database';

async function main() {
  console.log('Starting cashbook database repair...');
  
  // Find all purchase orders
  const pos = await prisma.purchaseOrder.findMany({
    include: {
      supplier: true
    }
  });

  for (const po of pos) {
    // Get all cashbook entries for this PO, including cancelled ones
    const entries = await prisma.cashbookEntry.findMany({
      where: { purchaseOrderId: po.id }
    });

    if (entries.length === 0) continue;

    console.log(`Checking PO ${po.code}...`);

    // Find the cancelled checkout payment if it exists
    const cancelledCheckout = entries.find(
      e => e.status === 'cancelled' && e.note === 'Hủy thanh toán theo phiếu nhập cập nhật'
    );

    // Find the cumulative update payment
    const cumulativeUpdate = entries.find(
      e => e.status === 'completed' && e.note && e.note.includes('(Cập nhật)')
    );

    if (cancelledCheckout && cumulativeUpdate) {
      console.log(`Fixing PO ${po.code}:`);
      console.log(`- Reverting cancelled checkout entry ${cancelledCheckout.code} (amount: ${cancelledCheckout.amount}) to completed.`);
      console.log(`- Fixing cumulative update entry ${cumulativeUpdate.code} amount from ${cumulativeUpdate.amount} to ${cumulativeUpdate.amount.toNumber() - cancelledCheckout.amount.toNumber()}.`);

      const actualDiff = cumulativeUpdate.amount.toNumber() - cancelledCheckout.amount.toNumber();

      await prisma.$transaction([
        // 1. Revert checkout payment to completed
        prisma.cashbookEntry.update({
          where: { id: cancelledCheckout.id },
          data: {
            status: 'completed',
            note: `Trả tiền nhập hàng ${po.code}`
          }
        }),
        // 2. Adjust update payment to be only the difference
        prisma.cashbookEntry.update({
          where: { id: cumulativeUpdate.id },
          data: {
            amount: actualDiff,
            note: `Trả tiền nhập hàng ${po.code} (Cập nhật)`
          }
        })
      ]);

      console.log(`Successfully fixed PO ${po.code}!`);
    }
  }

  console.log('Database repair completed!');
}

main()
  .catch(e => {
    console.error('Error during repair:', e);
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
