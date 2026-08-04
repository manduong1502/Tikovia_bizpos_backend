BEGIN;

-- Remove test POS orders and cashbook entries created during development testing
DELETE FROM "CashbookEntry" WHERE code LIKE 'TTM0286%' OR code LIKE 'TCM0019%';
DELETE FROM "OrderItem" WHERE "orderId" IN (SELECT id FROM "Order" WHERE code LIKE 'HD9858%');
DELETE FROM "Order" WHERE code LIKE 'HD9858%';

COMMIT;
