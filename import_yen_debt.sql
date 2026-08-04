-- Clean old records for Sister Yến KH001119
DO $$
DECLARE c_id INT; t_id INT; u_id INT; p_id INT;
BEGIN
  SELECT id INTO t_id FROM "Tenant" LIMIT 1;
  SELECT id INTO u_id FROM "User" LIMIT 1;
  SELECT id INTO p_id FROM "Product" LIMIT 1;
  SELECT id INTO c_id FROM "Customer" WHERE code = 'KH001119' AND "tenantId" = t_id;
  IF c_id IS NULL THEN
    INSERT INTO "Customer" (code, name, phone, "totalSpent", "totalDebt", "tenantId", "updatedAt")
    VALUES ('KH001119', 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 485796600, 17027180, t_id, NOW())
    RETURNING id INTO c_id;
  ELSE
    UPDATE "Customer" SET "totalSpent" = 485796600, "totalDebt" = 17027180 WHERE id = c_id;
    DELETE FROM "CashbookEntry" WHERE "customerId" = c_id;
    DELETE FROM "OrderItem" WHERE "orderId" IN (SELECT id FROM "Order" WHERE "customerId" = c_id);
    DELETE FROM "Order" WHERE "customerId" = c_id;
  END IF;
  -- Order HD062322.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD062322.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-01T07:07:00.000Z'::timestamp, '2026-01-01T07:07:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD062397.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD062397.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-02T07:02:00.000Z'::timestamp, '2026-01-02T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD062474.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD062474.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-03T07:26:00.000Z'::timestamp, '2026-01-03T07:26:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  -- Order HD062545.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD062545.01', c_id, u_id, t_id, 'COMPLETED', 1740000, 1740000, 1740000, '2026-01-04T07:14:00.000Z'::timestamp, '2026-01-04T07:14:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD062620.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD062620.01', c_id, u_id, t_id, 'COMPLETED', 1740000, 1740000, 1740000, '2026-01-05T07:07:00.000Z'::timestamp, '2026-01-05T07:07:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD062708.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD062708.01', c_id, u_id, t_id, 'COMPLETED', 1740000, 1740000, 1740000, '2026-01-06T07:12:00.000Z'::timestamp, '2026-01-06T07:12:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD062783.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD062783.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-07T07:03:00.000Z'::timestamp, '2026-01-07T07:03:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD062855.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD062855.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-08T07:11:00.000Z'::timestamp, '2026-01-08T07:11:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD062930.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD062930.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-09T07:08:00.000Z'::timestamp, '2026-01-09T07:08:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD063012.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD063012.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-10T06:55:00.000Z'::timestamp, '2026-01-10T06:55:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD063101.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD063101.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-11T07:11:00.000Z'::timestamp, '2026-01-11T07:11:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD063190.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD063190.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-12T07:16:00.000Z'::timestamp, '2026-01-12T07:16:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD063276.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD063276.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-13T07:10:00.000Z'::timestamp, '2026-01-13T07:10:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD063363.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD063363.01', c_id, u_id, t_id, 'COMPLETED', 1740000, 1740000, 1740000, '2026-01-14T07:20:00.000Z'::timestamp, '2026-01-14T07:20:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD063436.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD063436.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-15T07:02:00.000Z'::timestamp, '2026-01-15T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD063514.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD063514.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-16T07:05:00.000Z'::timestamp, '2026-01-16T07:05:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD063599.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD063599.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-17T07:06:00.000Z'::timestamp, '2026-01-17T07:06:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD063671.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD063671.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-18T07:07:00.000Z'::timestamp, '2026-01-18T07:07:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD063748.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD063748.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-19T07:05:00.000Z'::timestamp, '2026-01-19T07:05:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD063843.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD063843.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-20T07:36:00.000Z'::timestamp, '2026-01-20T07:36:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD063922.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD063922.01', c_id, u_id, t_id, 'COMPLETED', 1740000, 1740000, 1740000, '2026-01-21T07:14:00.000Z'::timestamp, '2026-01-21T07:14:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD063993.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD063993.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-22T07:09:00.000Z'::timestamp, '2026-01-22T07:09:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD064079.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD064079.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-23T07:05:00.000Z'::timestamp, '2026-01-23T07:05:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD064169.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD064169.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-24T07:19:00.000Z'::timestamp, '2026-01-24T07:19:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  -- Order HD064231.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD064231.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-25T07:05:00.000Z'::timestamp, '2026-01-25T07:05:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD064325.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD064325.01', c_id, u_id, t_id, 'COMPLETED', 1740000, 1740000, 1740000, '2026-01-26T07:05:00.000Z'::timestamp, '2026-01-26T07:05:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD064426.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD064426.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-27T07:17:00.000Z'::timestamp, '2026-01-27T07:17:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  -- Order HD064501.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD064501.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-28T03:53:00.000Z'::timestamp, '2026-01-28T03:53:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD064582.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD064582.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-29T07:02:00.000Z'::timestamp, '2026-01-29T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD064657.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD064657.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-01-30T07:07:00.000Z'::timestamp, '2026-01-30T07:07:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD064775.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD064775.01', c_id, u_id, t_id, 'COMPLETED', 3861600, 3861600, 3861600, '2026-01-31T07:15:00.000Z'::timestamp, '2026-01-31T07:15:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000303') AND "tenantId" = t_id LIMIT 1), p_id), 17.68, 120000, 2121600 FROM new_ord;
  -- Order HD064657.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD064657.01.02', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-02-01T08:46:00.000Z'::timestamp, '2026-02-01T08:46:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD064900.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD064900.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-02-02T07:26:00.000Z'::timestamp, '2026-02-02T07:26:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD064986.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD064986.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-02-03T07:13:00.000Z'::timestamp, '2026-02-03T07:13:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD065068.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD065068.01', c_id, u_id, t_id, 'COMPLETED', 1740000, 1740000, 1740000, '2026-02-04T07:02:00.000Z'::timestamp, '2026-02-04T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD065146.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD065146.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-02-05T03:11:00.000Z'::timestamp, '2026-02-05T03:11:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD065240.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD065240.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-02-06T07:06:00.000Z'::timestamp, '2026-02-06T07:06:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD065333.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD065333.01', c_id, u_id, t_id, 'COMPLETED', 1740000, 1740000, 1740000, '2026-02-07T07:08:00.000Z'::timestamp, '2026-02-07T07:08:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD065403.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD065403.01', c_id, u_id, t_id, 'COMPLETED', 1740000, 1740000, 1740000, '2026-02-08T06:57:00.000Z'::timestamp, '2026-02-08T06:57:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD065476.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD065476.01', c_id, u_id, t_id, 'COMPLETED', 1740000, 1740000, 1740000, '2026-02-09T03:42:00.000Z'::timestamp, '2026-02-09T03:42:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD065549.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD065549.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-02-10T07:07:00.000Z'::timestamp, '2026-02-10T07:07:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD065621.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD065621.01', c_id, u_id, t_id, 'COMPLETED', 1740000, 1740000, 1740000, '2026-02-11T07:01:00.000Z'::timestamp, '2026-02-11T07:01:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD065682.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD065682.01', c_id, u_id, t_id, 'COMPLETED', 1740000, 1740000, 1740000, '2026-02-12T07:06:00.000Z'::timestamp, '2026-02-12T07:06:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD065745.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD065745.01', c_id, u_id, t_id, 'COMPLETED', 1740000, 1740000, 1740000, '2026-02-13T07:05:00.000Z'::timestamp, '2026-02-13T07:05:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD065817.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD065817.01', c_id, u_id, t_id, 'COMPLETED', 1740000, 1740000, 1740000, '2026-02-14T08:04:00.000Z'::timestamp, '2026-02-14T08:04:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD065916.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD065916.02', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-02-22T10:03:00.000Z'::timestamp, '2026-02-22T10:03:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  -- Order HD065959.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD065959.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-02-23T07:03:00.000Z'::timestamp, '2026-02-23T07:03:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD066042.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD066042.01', c_id, u_id, t_id, 'COMPLETED', 2280000, 2280000, 2280000, '2026-02-24T07:23:00.000Z'::timestamp, '2026-02-24T07:23:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 87000, 1740000 FROM new_ord;
  -- Order HD066097.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD066097.01', c_id, u_id, t_id, 'COMPLETED', 540000, 540000, 540000, '2026-02-25T07:19:00.000Z'::timestamp, '2026-02-25T07:19:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  -- Order HD066167.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD066167.01', c_id, u_id, t_id, 'COMPLETED', 2320000, 2320000, 2320000, '2026-02-26T07:06:00.000Z'::timestamp, '2026-02-26T07:06:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 89000, 1780000 FROM new_ord;
  -- Order HD066232.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD066232.01', c_id, u_id, t_id, 'COMPLETED', 1780000, 1780000, 1780000, '2026-02-27T07:06:00.000Z'::timestamp, '2026-02-27T07:06:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 89000, 1780000 FROM new_ord;
  -- Order HD066302.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD066302.01', c_id, u_id, t_id, 'COMPLETED', 2320000, 2320000, 2320000, '2026-02-28T07:09:00.000Z'::timestamp, '2026-02-28T07:09:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 89000, 1780000 FROM new_ord;
  -- Order HD066370.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD066370.01', c_id, u_id, t_id, 'COMPLETED', 2320000, 2320000, 2320000, '2026-03-01T08:53:00.000Z'::timestamp, '2026-03-01T08:53:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP00016255,650') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 89000, 1780000 FROM new_ord;
  -- Order HD066520.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD066520.01', c_id, u_id, t_id, 'COMPLETED', 4180000, 4180000, 4180000, '2026-03-03T08:56:00.000Z'::timestamp, '2026-03-03T08:56:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000413') AND "tenantId" = t_id LIMIT 1), p_id), 20, 120000, 2400000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 89000, 1780000 FROM new_ord;
  -- Order HD066570.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD066570.01', c_id, u_id, t_id, 'COMPLETED', 2320000, 2320000, 2320000, '2026-03-04T07:15:00.000Z'::timestamp, '2026-03-04T07:15:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 20, 89000, 1780000 FROM new_ord;
  -- Order HD066637.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD066637.01', c_id, u_id, t_id, 'COMPLETED', 1780000, 1780000, 1780000, '2026-03-05T07:23:00.000Z'::timestamp, '2026-03-05T07:23:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 89000, 1780000 FROM new_ord;
  -- Order HD066730.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD066730.01', c_id, u_id, t_id, 'COMPLETED', 2320000, 2320000, 2320000, '2026-03-06T08:09:00.000Z'::timestamp, '2026-03-06T08:09:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 89000, 1780000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  -- Order HD066792.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD066792.01', c_id, u_id, t_id, 'COMPLETED', 2320000, 2320000, 2320000, '2026-03-07T07:12:00.000Z'::timestamp, '2026-03-07T07:12:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000331') AND "tenantId" = t_id LIMIT 1), p_id), 20, 89000, 1780000 FROM new_ord;
  -- Order HD066853.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD066853.01', c_id, u_id, t_id, 'COMPLETED', 2320000, 2320000, 2320000, '2026-03-08T07:09:00.000Z'::timestamp, '2026-03-08T07:09:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 20, 89000, 1780000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  -- Order HD066937.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD066937.01', c_id, u_id, t_id, 'COMPLETED', 2320000, 2320000, 2320000, '2026-03-09T07:17:00.000Z'::timestamp, '2026-03-09T07:17:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 20, 89000, 1780000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  -- Order HD067011.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD067011.02', c_id, u_id, t_id, 'COMPLETED', 1780000, 1780000, 1780000, '2026-03-10T07:09:00.000Z'::timestamp, '2026-03-10T07:09:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 20, 89000, 1780000 FROM new_ord;
  -- Order HD067074.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD067074.01', c_id, u_id, t_id, 'COMPLETED', 2320000, 2320000, 2320000, '2026-03-11T07:11:00.000Z'::timestamp, '2026-03-11T07:11:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 20, 89000, 1780000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  -- Order HD067169.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD067169.01', c_id, u_id, t_id, 'COMPLETED', 2320000, 2320000, 2320000, '2026-03-12T09:27:00.000Z'::timestamp, '2026-03-12T09:27:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 89000, 1780000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  -- Order HD067214.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD067214.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-03-13T07:13:00.000Z'::timestamp, '2026-03-13T07:13:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD067289.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD067289.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-03-14T07:09:00.000Z'::timestamp, '2026-03-14T07:09:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  -- Order HD067354.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD067354.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-03-15T07:02:00.000Z'::timestamp, '2026-03-15T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD067425.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD067425.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-03-16T06:59:00.000Z'::timestamp, '2026-03-16T06:59:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD067500.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD067500.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-03-17T07:02:00.000Z'::timestamp, '2026-03-17T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  -- Order HD067579.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD067579.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-03-18T07:11:00.000Z'::timestamp, '2026-03-18T07:11:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD067579.03
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD067579.03', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-03-19T07:09:00.000Z'::timestamp, '2026-03-19T07:09:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD067809.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD067809.02', c_id, u_id, t_id, 'COMPLETED', 3020000, 3020000, 3020000, '2026-03-21T07:04:00.000Z'::timestamp, '2026-03-21T07:04:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 20, 54000, 1080000 FROM new_ord;
  -- Order HD067809.02.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD067809.02.02', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-03-22T07:51:00.000Z'::timestamp, '2026-03-22T07:51:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  -- Order HD067898.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD067898.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-03-23T07:12:00.000Z'::timestamp, '2026-03-23T07:12:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD067967.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD067967.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-03-24T03:51:00.000Z'::timestamp, '2026-03-24T03:51:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD068049.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD068049.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-03-25T07:52:00.000Z'::timestamp, '2026-03-25T07:52:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD068131.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD068131.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-03-26T07:14:00.000Z'::timestamp, '2026-03-26T07:14:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD068194.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD068194.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-03-27T07:04:00.000Z'::timestamp, '2026-03-27T07:04:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD068270.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD068270.01', c_id, u_id, t_id, 'COMPLETED', 540000, 540000, 540000, '2026-03-28T03:49:00.000Z'::timestamp, '2026-03-28T03:49:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  -- Order HD068332.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD068332.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-03-29T03:10:00.000Z'::timestamp, '2026-03-29T03:10:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD068419.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD068419.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-03-30T07:08:00.000Z'::timestamp, '2026-03-30T07:08:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD068505.01.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD068505.01.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-03-31T10:12:00.000Z'::timestamp, '2026-03-31T10:12:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD068575.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD068575.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-04-01T07:13:00.000Z'::timestamp, '2026-04-01T07:13:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD068636.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD068636.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-04-02T07:01:00.000Z'::timestamp, '2026-04-02T07:01:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD068709.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD068709.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-04-03T07:08:00.000Z'::timestamp, '2026-04-03T07:08:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD068788.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD068788.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-04-04T07:06:00.000Z'::timestamp, '2026-04-04T07:06:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD068864.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD068864.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-04-05T08:10:00.000Z'::timestamp, '2026-04-05T08:10:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD068939.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD068939.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-04-06T07:09:00.000Z'::timestamp, '2026-04-06T07:09:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD069007.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD069007.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-04-07T07:09:00.000Z'::timestamp, '2026-04-07T07:09:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD069084.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD069084.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-04-08T07:06:00.000Z'::timestamp, '2026-04-08T07:06:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD069164.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD069164.02', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-04-09T08:34:00.000Z'::timestamp, '2026-04-09T08:34:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD069243.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD069243.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-04-10T07:18:00.000Z'::timestamp, '2026-04-10T07:18:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD069243.01.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD069243.01.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-04-11T08:37:00.000Z'::timestamp, '2026-04-11T08:37:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD069324.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD069324.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-04-12T07:13:00.000Z'::timestamp, '2026-04-12T07:13:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD069409.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD069409.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-04-13T07:17:00.000Z'::timestamp, '2026-04-13T07:17:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD069485.03
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD069485.03', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-04-14T07:06:00.000Z'::timestamp, '2026-04-14T07:06:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD069565.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD069565.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-04-15T07:07:00.000Z'::timestamp, '2026-04-15T07:07:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD069648.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD069648.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-04-16T07:18:00.000Z'::timestamp, '2026-04-16T07:18:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD069721.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD069721.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-04-17T07:16:00.000Z'::timestamp, '2026-04-17T07:16:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD069804.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD069804.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-04-18T07:03:00.000Z'::timestamp, '2026-04-18T07:03:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD069883.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD069883.01', c_id, u_id, t_id, 'COMPLETED', 2480000, 2480000, 2480000, '2026-04-19T07:01:00.000Z'::timestamp, '2026-04-19T07:01:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 54000, 540000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD069968.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD069968.01', c_id, u_id, t_id, 'COMPLETED', 2500000, 2500000, 2500000, '2026-04-20T07:04:00.000Z'::timestamp, '2026-04-20T07:04:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 56000, 560000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD070047.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD070047.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-04-21T07:07:00.000Z'::timestamp, '2026-04-21T07:07:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD070133.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD070133.01', c_id, u_id, t_id, 'COMPLETED', 2500000, 2500000, 2500000, '2026-04-22T07:09:00.000Z'::timestamp, '2026-04-22T07:09:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 56000, 560000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD070209.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD070209.01', c_id, u_id, t_id, 'COMPLETED', 2500000, 2500000, 2500000, '2026-04-23T07:02:00.000Z'::timestamp, '2026-04-23T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 56000, 560000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD070313.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD070313.01', c_id, u_id, t_id, 'COMPLETED', 2500000, 2500000, 2500000, '2026-04-24T07:12:00.000Z'::timestamp, '2026-04-24T07:12:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 56000, 560000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD070407.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD070407.01', c_id, u_id, t_id, 'COMPLETED', 2500000, 2500000, 2500000, '2026-04-25T07:08:00.000Z'::timestamp, '2026-04-25T07:08:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 56000, 560000 FROM new_ord;
  -- Order HD070473.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD070473.01', c_id, u_id, t_id, 'COMPLETED', 2500000, 2500000, 2500000, '2026-04-26T07:09:00.000Z'::timestamp, '2026-04-26T07:09:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 56000, 560000 FROM new_ord;
  -- Order HD070555.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD070555.01', c_id, u_id, t_id, 'COMPLETED', 560000, 560000, 560000, '2026-04-27T07:04:00.000Z'::timestamp, '2026-04-27T07:04:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 56000, 560000 FROM new_ord;
  -- Order HD070645.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD070645.01', c_id, u_id, t_id, 'COMPLETED', 2500000, 2500000, 2500000, '2026-04-28T07:02:00.000Z'::timestamp, '2026-04-28T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000238') AND "tenantId" = t_id LIMIT 1), p_id), 10, 56000, 560000 FROM new_ord;
  -- Order HD070734.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD070734.01', c_id, u_id, t_id, 'COMPLETED', 3060000, 3060000, 3060000, '2026-04-29T07:02:00.000Z'::timestamp, '2026-04-29T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000238') AND "tenantId" = t_id LIMIT 1), p_id), 20, 56000, 1120000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD070808.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD070808.01', c_id, u_id, t_id, 'COMPLETED', 2500000, 2500000, 2500000, '2026-04-30T07:01:00.000Z'::timestamp, '2026-04-30T07:01:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000238') AND "tenantId" = t_id LIMIT 1), p_id), 10, 56000, 560000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD070856.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD070856.01', c_id, u_id, t_id, 'COMPLETED', 2500000, 2500000, 2500000, '2026-05-01T07:01:00.000Z'::timestamp, '2026-05-01T07:01:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000238') AND "tenantId" = t_id LIMIT 1), p_id), 10, 56000, 560000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD070947.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD070947.01', c_id, u_id, t_id, 'COMPLETED', 2500000, 2500000, 2500000, '2026-05-02T07:06:00.000Z'::timestamp, '2026-05-02T07:06:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000238') AND "tenantId" = t_id LIMIT 1), p_id), 10, 56000, 560000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD071026.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD071026.01', c_id, u_id, t_id, 'COMPLETED', 2500000, 2500000, 2500000, '2026-05-03T07:07:00.000Z'::timestamp, '2026-05-03T07:07:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000238') AND "tenantId" = t_id LIMIT 1), p_id), 10, 56000, 560000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD071104.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD071104.01', c_id, u_id, t_id, 'COMPLETED', 2500000, 2500000, 2500000, '2026-05-04T07:04:00.000Z'::timestamp, '2026-05-04T07:04:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000238') AND "tenantId" = t_id LIMIT 1), p_id), 10, 56000, 560000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD071191.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD071191.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-05-05T07:17:00.000Z'::timestamp, '2026-05-05T07:17:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD071269.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD071269.01', c_id, u_id, t_id, 'COMPLETED', 2500000, 2500000, 2500000, '2026-05-06T07:01:00.000Z'::timestamp, '2026-05-06T07:01:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000238') AND "tenantId" = t_id LIMIT 1), p_id), 10, 56000, 560000 FROM new_ord;
  -- Order HD071431.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD071431.02', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-05-08T07:38:00.000Z'::timestamp, '2026-05-08T07:38:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD071767.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD071767.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-05-12T07:03:00.000Z'::timestamp, '2026-05-12T07:03:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD071849.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD071849.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-05-13T07:02:00.000Z'::timestamp, '2026-05-13T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD071939.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD071939.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-05-14T07:02:00.000Z'::timestamp, '2026-05-14T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD072027.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD072027.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-05-15T07:03:00.000Z'::timestamp, '2026-05-15T07:03:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD072112.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD072112.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-05-16T06:59:00.000Z'::timestamp, '2026-05-16T06:59:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD072190.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD072190.01', c_id, u_id, t_id, 'COMPLETED', 2590000, 2590000, 2590000, '2026-05-17T07:12:00.000Z'::timestamp, '2026-05-17T07:12:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 65000, 650000 FROM new_ord;
  -- Order HD072275.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD072275.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-05-18T07:12:00.000Z'::timestamp, '2026-05-18T07:12:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD072363.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD072363.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-05-19T03:48:00.000Z'::timestamp, '2026-05-19T03:48:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD072467.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD072467.01', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-05-20T07:00:00.000Z'::timestamp, '2026-05-20T07:00:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD072552.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD072552.01', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-05-21T07:02:00.000Z'::timestamp, '2026-05-21T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD072637.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD072637.01', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-05-22T07:06:00.000Z'::timestamp, '2026-05-22T07:06:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD072637.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD072637.01.02', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-05-23T08:07:00.000Z'::timestamp, '2026-05-23T08:07:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD072637.01.02.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD072637.01.02.02', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-05-24T07:05:00.000Z'::timestamp, '2026-05-24T07:05:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD072800.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD072800.02', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-05-25T07:01:00.000Z'::timestamp, '2026-05-25T07:01:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD072878.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD072878.01', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-05-26T07:01:00.000Z'::timestamp, '2026-05-26T07:01:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD072966.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD072966.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-05-27T07:03:00.000Z'::timestamp, '2026-05-27T07:03:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD073040.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD073040.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-05-28T07:03:00.000Z'::timestamp, '2026-05-28T07:03:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD073122.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD073122.01', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-05-29T07:01:00.000Z'::timestamp, '2026-05-29T07:01:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD073176.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD073176.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-05-30T07:02:00.000Z'::timestamp, '2026-05-30T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD073295.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD073295.01', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-05-31T10:03:00.000Z'::timestamp, '2026-05-31T10:03:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD073360.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD073360.01', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-06-01T07:01:00.000Z'::timestamp, '2026-06-01T07:01:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD073467.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD073467.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-06-02T07:20:00.000Z'::timestamp, '2026-06-02T07:20:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD073549.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD073549.01', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-06-03T06:56:00.000Z'::timestamp, '2026-06-03T06:56:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD073635.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD073635.01', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-06-04T06:56:00.000Z'::timestamp, '2026-06-04T06:56:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD073736.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD073736.01', c_id, u_id, t_id, 'COMPLETED', 4970000, 4970000, 4970000, '2026-06-05T07:13:00.000Z'::timestamp, '2026-06-05T07:13:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000413') AND "tenantId" = t_id LIMIT 1), p_id), 20, 120000, 2400000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD073814.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD073814.01', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-06-06T07:02:00.000Z'::timestamp, '2026-06-06T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD073905.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD073905.01', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-06-07T07:02:00.000Z'::timestamp, '2026-06-07T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD073905.03
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD073905.03', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-06-08T07:03:00.000Z'::timestamp, '2026-06-08T07:03:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD074089.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD074089.02', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-06-09T07:12:00.000Z'::timestamp, '2026-06-09T07:12:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD074089.03
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD074089.03', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-06-10T07:08:00.000Z'::timestamp, '2026-06-10T07:08:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD074089.01.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD074089.01.01', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-06-11T07:03:00.000Z'::timestamp, '2026-06-11T07:03:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD074089.01.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD074089.01.01.02', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-06-12T07:10:00.000Z'::timestamp, '2026-06-12T07:10:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD074089.01.01.02.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD074089.01.01.02.01.02', c_id, u_id, t_id, 'COMPLETED', 3200000, 3200000, 3200000, '2026-06-13T07:50:00.000Z'::timestamp, '2026-06-13T07:50:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 20, 63000, 1260000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD074089.01.01.02.01.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD074089.01.01.02.01.01.02', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-06-14T07:01:00.000Z'::timestamp, '2026-06-14T07:01:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD074089.01.01.02.01.01.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD074089.01.01.02.01.01.01.02', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-06-15T06:54:00.000Z'::timestamp, '2026-06-15T06:54:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD074605.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD074605.01', c_id, u_id, t_id, 'COMPLETED', 1940000, 1940000, 1940000, '2026-06-16T06:59:00.000Z'::timestamp, '2026-06-16T06:59:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD074692.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD074692.01', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-06-17T07:00:00.000Z'::timestamp, '2026-06-17T07:00:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD074778.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD074778.01', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-06-18T07:05:00.000Z'::timestamp, '2026-06-18T07:05:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD074868.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD074868.01', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-06-19T07:01:00.000Z'::timestamp, '2026-06-19T07:01:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD074868.03
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD074868.03', c_id, u_id, t_id, 'COMPLETED', 2570000, 2570000, 2570000, '2026-06-20T07:01:00.000Z'::timestamp, '2026-06-20T07:01:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 97000, 1940000 FROM new_ord;
  -- Order HD075036.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD075036.01', c_id, u_id, t_id, 'COMPLETED', 2630000, 2630000, 2630000, '2026-06-21T07:09:00.000Z'::timestamp, '2026-06-21T07:09:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 100000, 2000000 FROM new_ord;
  -- Order HD075115.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD075115.01', c_id, u_id, t_id, 'COMPLETED', 2630000, 2630000, 2630000, '2026-06-22T07:02:00.000Z'::timestamp, '2026-06-22T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 100000, 2000000 FROM new_ord;
  -- Order HD075220.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD075220.01', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-06-23T07:13:00.000Z'::timestamp, '2026-06-23T07:13:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD075303.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD075303.01', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-06-24T07:01:00.000Z'::timestamp, '2026-06-24T07:01:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD075407.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD075407.01', c_id, u_id, t_id, 'COMPLETED', 2500000, 2500000, 2500000, '2026-06-25T07:06:00.000Z'::timestamp, '2026-06-25T07:06:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD075491.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD075491.02', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-06-26T06:58:00.000Z'::timestamp, '2026-06-26T06:58:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD075491.03
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD075491.03', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-06-27T07:02:00.000Z'::timestamp, '2026-06-27T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD075659.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD075659.02', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-06-29T02:42:00.000Z'::timestamp, '2026-06-29T02:42:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD075659.03
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD075659.03', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-06-30T07:05:00.000Z'::timestamp, '2026-06-30T07:05:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD075659.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD075659.01.02', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-01T06:57:00.000Z'::timestamp, '2026-07-01T06:57:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD075659.01.02.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD075659.01.02.02', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-02T07:32:00.000Z'::timestamp, '2026-07-02T07:32:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD075659.01.02.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD075659.01.02.01.02', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-03T06:55:00.000Z'::timestamp, '2026-07-03T06:55:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD075659.01.02.01.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD075659.01.02.01.01.02', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-04T07:01:00.000Z'::timestamp, '2026-07-04T07:01:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD075659.01.02.01.01.02.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD075659.01.02.01.01.02.02', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-05T07:17:00.000Z'::timestamp, '2026-07-05T07:17:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD075659.01.02.01.01.02.02.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD075659.01.02.01.01.02.02.01', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-06T07:01:00.000Z'::timestamp, '2026-07-06T07:01:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD076406.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD076406.01', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-07T06:58:00.000Z'::timestamp, '2026-07-07T06:58:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD076519.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD076519.02', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-08T07:55:00.000Z'::timestamp, '2026-07-08T07:55:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD076590.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD076590.02', c_id, u_id, t_id, 'COMPLETED', 630000, 630000, 630000, '2026-07-09T09:00:00.000Z'::timestamp, '2026-07-09T09:00:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD076681.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD076681.02', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-10T07:06:00.000Z'::timestamp, '2026-07-10T07:06:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD076681.04
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD076681.04', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-11T06:57:00.000Z'::timestamp, '2026-07-11T06:57:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD075659.03.05
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD075659.03.05', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-12T07:12:00.000Z'::timestamp, '2026-07-12T07:12:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  -- Order HD076863.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD076863.02', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-13T06:55:00.000Z'::timestamp, '2026-07-13T06:55:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD076863.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD076863.01.02', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-15T06:59:00.000Z'::timestamp, '2026-07-15T06:59:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD076863.01.01.02.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD076863.01.01.02.02', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-16T01:40:00.000Z'::timestamp, '2026-07-16T01:40:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD076863.01.01.02.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD076863.01.01.02.01.02', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-17T07:02:00.000Z'::timestamp, '2026-07-17T07:02:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD076863.01.01.02.01.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD076863.01.01.02.01.01.02', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-18T07:03:00.000Z'::timestamp, '2026-07-18T07:03:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD076863.01.01.02.01.01.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD076863.01.01.02.01.01.01.02', c_id, u_id, t_id, 'COMPLETED', 3130000, 3130000, 3130000, '2026-07-19T06:59:00.000Z'::timestamp, '2026-07-19T06:59:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 100000, 2500000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD077547.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD077547.02', c_id, u_id, t_id, 'COMPLETED', 2650000, 2650000, 2650000, '2026-07-21T10:36:00.000Z'::timestamp, '2026-07-21T10:36:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 101000, 2020000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD077547.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD077547.01.02', c_id, u_id, t_id, 'COMPLETED', 2650000, 2650000, 2650000, '2026-07-22T07:00:00.000Z'::timestamp, '2026-07-22T07:00:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 101000, 2020000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD077547.01.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD077547.01.01.02', c_id, u_id, t_id, 'COMPLETED', 2650000, 2650000, 2650000, '2026-07-23T06:55:00.000Z'::timestamp, '2026-07-23T06:55:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 101000, 2020000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD077547.01.01.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD077547.01.01.01.02', c_id, u_id, t_id, 'COMPLETED', 2650000, 2650000, 2650000, '2026-07-24T07:09:00.000Z'::timestamp, '2026-07-24T07:09:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 101000, 2020000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD077547.01.01.01.01.01.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD077547.01.01.01.01.01.01.02', c_id, u_id, t_id, 'COMPLETED', 2965000, 2965000, 2965000, '2026-07-25T10:23:00.000Z'::timestamp, '2026-07-25T10:23:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 101000, 2020000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 15, 63000, 945000 FROM new_ord;
  -- Order HD077547.01.01.01.01.01.01.01.01.04
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD077547.01.01.01.01.01.01.01.01.04', c_id, u_id, t_id, 'COMPLETED', 2730000, 2730000, 2730000, '2026-07-26T07:16:00.000Z'::timestamp, '2026-07-26T07:16:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 105000, 2100000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 10, 63000, 630000 FROM new_ord;
  -- Order HD077547.01.01.01.01.01.01.01.01.03.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD077547.01.01.01.01.01.01.01.01.03.01', c_id, u_id, t_id, 'COMPLETED', 3045000, 3045000, 3045000, '2026-07-27T07:41:00.000Z'::timestamp, '2026-07-27T07:41:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 105000, 2100000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 15, 63000, 945000 FROM new_ord;
  -- Order HD078113.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD078113.01', c_id, u_id, t_id, 'COMPLETED', 2100000, 2100000, 2100000, '2026-07-28T06:56:00.000Z'::timestamp, '2026-07-28T06:56:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000344') AND "tenantId" = t_id LIMIT 1), p_id), 20, 105000, 2100000 FROM new_ord;
  -- Order HD078196.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD078196.02', c_id, u_id, t_id, 'COMPLETED', 3570000, 3570000, 3570000, '2026-07-29T06:58:00.000Z'::timestamp, '2026-07-29T06:58:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 15, 63000, 945000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 105000, 2625000 FROM new_ord;
  -- Order HD078196.03
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD078196.03', c_id, u_id, t_id, 'COMPLETED', 3570000, 3570000, 3570000, '2026-07-30T06:58:00.000Z'::timestamp, '2026-07-30T06:58:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 15, 63000, 945000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 105000, 2625000 FROM new_ord;
  -- Order HD078196.01.02
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD078196.01.02', c_id, u_id, t_id, 'COMPLETED', 3570000, 3570000, 3570000, '2026-07-31T07:00:00.000Z'::timestamp, '2026-07-31T07:00:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 15, 63000, 945000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 105000, 2625000 FROM new_ord;
  -- Order HD078465.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD078465.01', c_id, u_id, t_id, 'COMPLETED', 945000, 945000, 945000, '2026-08-01T07:03:00.000Z'::timestamp, '2026-08-01T07:03:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 15, 63000, 945000 FROM new_ord;
  -- Order HD078545.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD078545.01', c_id, u_id, t_id, 'COMPLETED', 3570000, 3570000, 3570000, '2026-08-02T07:04:00.000Z'::timestamp, '2026-08-02T07:04:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 15, 63000, 945000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 105000, 2625000 FROM new_ord;
  -- Order HD078641.01
  WITH new_ord AS (
    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
    VALUES ('HD078641.01', c_id, u_id, t_id, 'COMPLETED', 3570000, 3570000, 3570000, '2026-08-03T01:38:00.000Z'::timestamp, '2026-08-03T01:38:00.000Z'::timestamp)
    RETURNING id
  )
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000287') AND "tenantId" = t_id LIMIT 1), p_id), 25, 105000, 2625000 FROM new_ord;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000456') AND "tenantId" = t_id LIMIT 1), p_id), 15, 63000, 945000 FROM new_ord;
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD062322.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-01T07:07:00.000Z'::timestamp, '2026-01-01T07:07:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD062397.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-02T07:02:00.000Z'::timestamp, '2026-01-02T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD062474.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-03T07:26:00.000Z'::timestamp, '2026-01-03T07:26:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD062545.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-04T07:14:00.000Z'::timestamp, '2026-01-04T07:14:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD062620.01', 'INCOME', 1740000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-05T07:07:00.000Z'::timestamp, '2026-01-05T07:07:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD062708.01', 'INCOME', 1740000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-06T07:12:00.000Z'::timestamp, '2026-01-06T07:12:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD062783.01', 'INCOME', 1740000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-07T07:03:00.000Z'::timestamp, '2026-01-07T07:03:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD062855.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-08T07:11:00.000Z'::timestamp, '2026-01-08T07:11:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD062930.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-09T07:08:00.000Z'::timestamp, '2026-01-09T07:08:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063012.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-10T06:55:00.000Z'::timestamp, '2026-01-10T06:55:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063101.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-11T07:11:00.000Z'::timestamp, '2026-01-11T07:11:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063190.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-12T07:16:00.000Z'::timestamp, '2026-01-12T07:16:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063276.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-13T07:10:00.000Z'::timestamp, '2026-01-13T07:10:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063363.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-14T07:20:00.000Z'::timestamp, '2026-01-14T07:20:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063436.01', 'INCOME', 2100000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-15T07:02:00.000Z'::timestamp, '2026-01-15T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063514.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-16T07:05:00.000Z'::timestamp, '2026-01-16T07:05:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063599.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-17T07:06:00.000Z'::timestamp, '2026-01-17T07:06:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063671.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-18T07:07:00.000Z'::timestamp, '2026-01-18T07:07:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063748.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-19T07:05:00.000Z'::timestamp, '2026-01-19T07:05:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063843.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-20T07:36:00.000Z'::timestamp, '2026-01-20T07:36:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063922.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-21T07:14:00.000Z'::timestamp, '2026-01-21T07:14:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063993.01', 'INCOME', 1740000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-22T07:09:00.000Z'::timestamp, '2026-01-22T07:09:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD064079.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-23T07:05:00.000Z'::timestamp, '2026-01-23T07:05:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD064169.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-24T07:19:00.000Z'::timestamp, '2026-01-24T07:19:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD064231.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-25T07:05:00.000Z'::timestamp, '2026-01-25T07:05:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD064325.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-26T07:05:00.000Z'::timestamp, '2026-01-26T07:05:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD064426.01', 'INCOME', 1740000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-27T07:17:00.000Z'::timestamp, '2026-01-27T07:17:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD064501.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-28T03:53:00.000Z'::timestamp, '2026-01-28T03:53:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD064582.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-29T07:02:00.000Z'::timestamp, '2026-01-29T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD064657.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-30T07:07:00.000Z'::timestamp, '2026-01-30T07:07:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD064775.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-31T07:15:00.000Z'::timestamp, '2026-01-31T07:15:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD064657.01.02', 'INCOME', 3861000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-01T08:46:00.000Z'::timestamp, '2026-02-01T08:46:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD064900.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-02T07:26:00.000Z'::timestamp, '2026-02-02T07:26:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD064986.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-03T07:13:00.000Z'::timestamp, '2026-02-03T07:13:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065068.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-04T07:02:00.000Z'::timestamp, '2026-02-04T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065146.01', 'INCOME', 1740000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-05T03:11:00.000Z'::timestamp, '2026-02-05T03:11:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065240.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-06T07:06:00.000Z'::timestamp, '2026-02-06T07:06:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065333.01', 'INCOME', 2300000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-07T07:08:00.000Z'::timestamp, '2026-02-07T07:08:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065403.01', 'INCOME', 1740000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-08T06:57:00.000Z'::timestamp, '2026-02-08T06:57:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065476.01', 'INCOME', 1740000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-09T03:42:00.000Z'::timestamp, '2026-02-09T03:42:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065549.01', 'INCOME', 1740000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-10T07:07:00.000Z'::timestamp, '2026-02-10T07:07:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065621.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-11T07:01:00.000Z'::timestamp, '2026-02-11T07:01:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065682.01', 'INCOME', 1740000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-12T07:06:00.000Z'::timestamp, '2026-02-12T07:06:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065745.01', 'INCOME', 1740000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-13T07:05:00.000Z'::timestamp, '2026-02-13T07:05:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065817.01', 'INCOME', 1740000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-14T08:04:00.000Z'::timestamp, '2026-02-14T08:04:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065916.02', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-22T10:03:00.000Z'::timestamp, '2026-02-22T10:03:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065959.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-23T07:03:00.000Z'::timestamp, '2026-02-23T07:03:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD066042.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-24T07:23:00.000Z'::timestamp, '2026-02-24T07:23:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD066097.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-25T07:19:00.000Z'::timestamp, '2026-02-25T07:19:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD066167.01', 'INCOME', 540000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-26T07:06:00.000Z'::timestamp, '2026-02-26T07:06:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD066232.01', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-27T07:06:00.000Z'::timestamp, '2026-02-27T07:06:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD066302.01', 'INCOME', 1780000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-28T07:09:00.000Z'::timestamp, '2026-02-28T07:09:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD066370.01', 'INCOME', 2360000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-01T08:53:00.000Z'::timestamp, '2026-03-01T08:53:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD066520.01', 'INCOME', 2320000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-03T08:56:00.000Z'::timestamp, '2026-03-03T08:56:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD066570.01', 'INCOME', 4180000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-04T07:15:00.000Z'::timestamp, '2026-03-04T07:15:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD066637.01', 'INCOME', 2320000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-05T07:23:00.000Z'::timestamp, '2026-03-05T07:23:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD066730.01', 'INCOME', 1780000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-06T08:09:00.000Z'::timestamp, '2026-03-06T08:09:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD066792.01', 'INCOME', 2320000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-07T07:12:00.000Z'::timestamp, '2026-03-07T07:12:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD066853.01', 'INCOME', 2320000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-08T07:09:00.000Z'::timestamp, '2026-03-08T07:09:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD066937.01', 'INCOME', 2320000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-09T07:17:00.000Z'::timestamp, '2026-03-09T07:17:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD067011.02', 'INCOME', 2320000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-10T07:09:00.000Z'::timestamp, '2026-03-10T07:09:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD067074.01', 'INCOME', 1780000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-11T07:11:00.000Z'::timestamp, '2026-03-11T07:11:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD067169.01', 'INCOME', 2320000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-12T09:27:00.000Z'::timestamp, '2026-03-12T09:27:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD067214.01', 'INCOME', 2320000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-13T07:13:00.000Z'::timestamp, '2026-03-13T07:13:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD067289.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-14T07:09:00.000Z'::timestamp, '2026-03-14T07:09:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD067354.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-15T07:02:00.000Z'::timestamp, '2026-03-15T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD067425.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-16T06:59:00.000Z'::timestamp, '2026-03-16T06:59:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD067500.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-17T07:02:00.000Z'::timestamp, '2026-03-17T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD067579.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-18T07:11:00.000Z'::timestamp, '2026-03-18T07:11:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD067579.03', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-19T07:09:00.000Z'::timestamp, '2026-03-19T07:09:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD067809.02', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-21T07:04:00.000Z'::timestamp, '2026-03-21T07:04:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD067809.02.02', 'INCOME', 3020000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-22T07:51:00.000Z'::timestamp, '2026-03-22T07:51:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD067898.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-23T07:12:00.000Z'::timestamp, '2026-03-23T07:12:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD067967.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-24T03:51:00.000Z'::timestamp, '2026-03-24T03:51:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD068049.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-25T07:52:00.000Z'::timestamp, '2026-03-25T07:52:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD068131.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-26T07:14:00.000Z'::timestamp, '2026-03-26T07:14:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD068194.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-27T07:04:00.000Z'::timestamp, '2026-03-27T07:04:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD068270.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-28T03:49:00.000Z'::timestamp, '2026-03-28T03:49:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD068332.01', 'INCOME', 540000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-29T03:10:00.000Z'::timestamp, '2026-03-29T03:10:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD068419.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-30T07:08:00.000Z'::timestamp, '2026-03-30T07:08:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD068505.01.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-31T10:12:00.000Z'::timestamp, '2026-03-31T10:12:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD068575.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-01T07:13:00.000Z'::timestamp, '2026-04-01T07:13:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD068636.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-02T07:01:00.000Z'::timestamp, '2026-04-02T07:01:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD068709.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-03T07:08:00.000Z'::timestamp, '2026-04-03T07:08:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD068788.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-04T07:06:00.000Z'::timestamp, '2026-04-04T07:06:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD068864.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-05T08:10:00.000Z'::timestamp, '2026-04-05T08:10:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD068939.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-06T07:09:00.000Z'::timestamp, '2026-04-06T07:09:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD069007.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-07T07:09:00.000Z'::timestamp, '2026-04-07T07:09:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD069084.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-08T07:06:00.000Z'::timestamp, '2026-04-08T07:06:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD069164.02', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-09T08:34:00.000Z'::timestamp, '2026-04-09T08:34:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD069243.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-10T07:18:00.000Z'::timestamp, '2026-04-10T07:18:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD069243.01.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-11T08:37:00.000Z'::timestamp, '2026-04-11T08:37:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD069324.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-12T07:13:00.000Z'::timestamp, '2026-04-12T07:13:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD069409.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-13T07:17:00.000Z'::timestamp, '2026-04-13T07:17:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD069485.03', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-14T07:06:00.000Z'::timestamp, '2026-04-14T07:06:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD069565.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-15T07:07:00.000Z'::timestamp, '2026-04-15T07:07:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD069648.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-16T07:18:00.000Z'::timestamp, '2026-04-16T07:18:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD069721.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-17T07:16:00.000Z'::timestamp, '2026-04-17T07:16:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD069804.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-18T07:03:00.000Z'::timestamp, '2026-04-18T07:03:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD069883.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-19T07:01:00.000Z'::timestamp, '2026-04-19T07:01:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD069968.01', 'INCOME', 2480000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-20T07:04:00.000Z'::timestamp, '2026-04-20T07:04:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD070047.01', 'INCOME', 2500000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-21T07:07:00.000Z'::timestamp, '2026-04-21T07:07:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD070133.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-22T07:09:00.000Z'::timestamp, '2026-04-22T07:09:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD070209.01', 'INCOME', 2500000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-23T07:02:00.000Z'::timestamp, '2026-04-23T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD070313.01', 'INCOME', 2500000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-24T07:12:00.000Z'::timestamp, '2026-04-24T07:12:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD070407.01', 'INCOME', 2500000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-25T07:08:00.000Z'::timestamp, '2026-04-25T07:08:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD070473.01', 'INCOME', 2500000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-26T07:09:00.000Z'::timestamp, '2026-04-26T07:09:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD070555.01', 'INCOME', 2500000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-27T07:04:00.000Z'::timestamp, '2026-04-27T07:04:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD070645.01', 'INCOME', 560000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-28T07:02:00.000Z'::timestamp, '2026-04-28T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD070734.01', 'INCOME', 2500000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-29T07:02:00.000Z'::timestamp, '2026-04-29T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD070808.01', 'INCOME', 3060000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-30T07:01:00.000Z'::timestamp, '2026-04-30T07:01:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD070856.01', 'INCOME', 2500000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-01T07:01:00.000Z'::timestamp, '2026-05-01T07:01:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD070947.01', 'INCOME', 2500000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-02T07:06:00.000Z'::timestamp, '2026-05-02T07:06:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD071026.01', 'INCOME', 2500000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-03T07:07:00.000Z'::timestamp, '2026-05-03T07:07:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD071104.01', 'INCOME', 2500000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-04T07:04:00.000Z'::timestamp, '2026-05-04T07:04:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD071191.01', 'INCOME', 2500000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-05T07:17:00.000Z'::timestamp, '2026-05-05T07:17:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD071269.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-06T07:01:00.000Z'::timestamp, '2026-05-06T07:01:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD071431.02', 'INCOME', 2500000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-08T07:38:00.000Z'::timestamp, '2026-05-08T07:38:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD071767.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-12T07:03:00.000Z'::timestamp, '2026-05-12T07:03:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD071849.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-13T07:02:00.000Z'::timestamp, '2026-05-13T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD071939.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-14T07:02:00.000Z'::timestamp, '2026-05-14T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD072027.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-15T07:03:00.000Z'::timestamp, '2026-05-15T07:03:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD072112.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-16T06:59:00.000Z'::timestamp, '2026-05-16T06:59:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD072190.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-17T07:12:00.000Z'::timestamp, '2026-05-17T07:12:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD072275.01', 'INCOME', 2600000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-18T07:12:00.000Z'::timestamp, '2026-05-18T07:12:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD072363.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-19T03:48:00.000Z'::timestamp, '2026-05-19T03:48:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD072467.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-20T07:00:00.000Z'::timestamp, '2026-05-20T07:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD072552.01', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-21T07:02:00.000Z'::timestamp, '2026-05-21T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD072637.01', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-22T07:06:00.000Z'::timestamp, '2026-05-22T07:06:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD072637.01.02', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-23T08:07:00.000Z'::timestamp, '2026-05-23T08:07:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD072637.01.02.02', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-24T07:05:00.000Z'::timestamp, '2026-05-24T07:05:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD072800.02', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-25T07:01:00.000Z'::timestamp, '2026-05-25T07:01:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD072878.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-26T07:01:00.000Z'::timestamp, '2026-05-26T07:01:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD072966.01', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-27T07:03:00.000Z'::timestamp, '2026-05-27T07:03:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD073040.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-28T07:03:00.000Z'::timestamp, '2026-05-28T07:03:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD073122.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-29T07:01:00.000Z'::timestamp, '2026-05-29T07:01:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD073176.01', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-30T07:02:00.000Z'::timestamp, '2026-05-30T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD073295.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-31T10:03:00.000Z'::timestamp, '2026-05-31T10:03:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD073360.01', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-01T07:01:00.000Z'::timestamp, '2026-06-01T07:01:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD073467.01', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-02T07:20:00.000Z'::timestamp, '2026-06-02T07:20:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD073549.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-03T06:56:00.000Z'::timestamp, '2026-06-03T06:56:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD073635.01', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-04T06:56:00.000Z'::timestamp, '2026-06-04T06:56:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD073736.01', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-05T07:13:00.000Z'::timestamp, '2026-06-05T07:13:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD073814.01', 'INCOME', 4970000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-06T07:02:00.000Z'::timestamp, '2026-06-06T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD073905.01', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-07T07:02:00.000Z'::timestamp, '2026-06-07T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD073905.03', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-08T07:03:00.000Z'::timestamp, '2026-06-08T07:03:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD074089.02', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-09T07:12:00.000Z'::timestamp, '2026-06-09T07:12:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD074089.03', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-10T07:08:00.000Z'::timestamp, '2026-06-10T07:08:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD074089.01.01.02', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-12T07:10:00.000Z'::timestamp, '2026-06-12T07:10:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011220', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-13T02:30:00.000Z'::timestamp, '2026-06-13T02:30:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD074089.01.01.02.01.02', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-13T07:50:00.000Z'::timestamp, '2026-06-13T07:50:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011288', 'INCOME', 630000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-13T15:30:00.000Z'::timestamp, '2026-06-13T15:30:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD074089.01.01.02.01.01.02', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-14T07:01:00.000Z'::timestamp, '2026-06-14T07:01:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD074089.01.01.02.01.01.01.02', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-15T06:54:00.000Z'::timestamp, '2026-06-15T06:54:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD074605.01', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-16T06:59:00.000Z'::timestamp, '2026-06-16T06:59:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD074692.01', 'INCOME', 1940000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-17T07:00:00.000Z'::timestamp, '2026-06-17T07:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD074778.01', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-18T07:05:00.000Z'::timestamp, '2026-06-18T07:05:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD074868.01', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-19T07:01:00.000Z'::timestamp, '2026-06-19T07:01:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD074868.03', 'INCOME', 2570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-20T07:01:00.000Z'::timestamp, '2026-06-20T07:01:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD075036.01', 'INCOME', 2630000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-21T07:09:00.000Z'::timestamp, '2026-06-21T07:09:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD075115.01', 'INCOME', 2630000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-22T07:02:00.000Z'::timestamp, '2026-06-22T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD075220.01', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-23T07:13:00.000Z'::timestamp, '2026-06-23T07:13:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD075303.01', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-24T07:01:00.000Z'::timestamp, '2026-06-24T07:01:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD075407.01', 'INCOME', 2500000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-25T07:06:00.000Z'::timestamp, '2026-06-25T07:06:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD075491.02', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-26T06:58:00.000Z'::timestamp, '2026-06-26T06:58:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD075491.03', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-27T07:02:00.000Z'::timestamp, '2026-06-27T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD075659.02', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-29T02:42:00.000Z'::timestamp, '2026-06-29T02:42:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD075659.03', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-30T07:05:00.000Z'::timestamp, '2026-06-30T07:05:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD075659.01.02', 'INCOME', 750000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-01T06:57:00.000Z'::timestamp, '2026-07-01T06:57:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012129', 'INCOME', 2380000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-02T07:00:00.000Z'::timestamp, '2026-07-02T07:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD075659.01.02.02', 'INCOME', 2000000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-02T07:32:00.000Z'::timestamp, '2026-07-02T07:32:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012186', 'INCOME', 1130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-03T06:30:00.000Z'::timestamp, '2026-07-03T06:30:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD075659.01.02.01.02', 'INCOME', 1800000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-03T06:55:00.000Z'::timestamp, '2026-07-03T06:55:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012209', 'INCOME', 1330000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-04T02:00:00.000Z'::timestamp, '2026-07-04T02:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD075659.01.02.01.01.02', 'INCOME', 3180000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-04T07:01:00.000Z'::timestamp, '2026-07-04T07:01:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD075659.01.02.01.01.02.02', 'INCOME', 2830000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-05T07:17:00.000Z'::timestamp, '2026-07-05T07:17:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012321', 'INCOME', 250000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-06T04:30:00.000Z'::timestamp, '2026-07-06T04:30:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012351', 'INCOME', 250000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-07T01:16:00.000Z'::timestamp, '2026-07-07T01:16:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012371', 'INCOME', 2880000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-07T06:56:00.000Z'::timestamp, '2026-07-07T06:56:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD076406.01', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-07T06:58:00.000Z'::timestamp, '2026-07-07T06:58:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD076519.02', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-08T07:55:00.000Z'::timestamp, '2026-07-08T07:55:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD076590.02', 'INCOME', 630000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-09T09:00:00.000Z'::timestamp, '2026-07-09T09:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD076681.02', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-10T07:06:00.000Z'::timestamp, '2026-07-10T07:06:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD076681.04', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-11T06:57:00.000Z'::timestamp, '2026-07-11T06:57:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD075659.03.05', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-12T07:12:00.000Z'::timestamp, '2026-07-12T07:12:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD076863.02', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-13T06:55:00.000Z'::timestamp, '2026-07-13T06:55:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD076863.01.02', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-15T06:59:00.000Z'::timestamp, '2026-07-15T06:59:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD076863.01.01.02.02', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-16T01:40:00.000Z'::timestamp, '2026-07-16T01:40:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD076863.01.01.02.01.02', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-17T07:02:00.000Z'::timestamp, '2026-07-17T07:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD076863.01.01.02.01.01.02', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-18T07:03:00.000Z'::timestamp, '2026-07-18T07:03:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD076863.01.01.02.01.01.01.02', 'INCOME', 3130000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-19T06:59:00.000Z'::timestamp, '2026-07-19T06:59:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD077547.02', 'INCOME', 2650000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-21T10:36:00.000Z'::timestamp, '2026-07-21T10:36:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD077547.01.02', 'INCOME', 2650000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-22T07:00:00.000Z'::timestamp, '2026-07-22T07:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD077547.01.01.02', 'INCOME', 2650000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-23T06:55:00.000Z'::timestamp, '2026-07-23T06:55:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD077547.01.01.01.02', 'INCOME', 2650000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-24T07:09:00.000Z'::timestamp, '2026-07-24T07:09:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD077547.01.01.01.01.01.01.02', 'INCOME', 2965000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-25T10:23:00.000Z'::timestamp, '2026-07-25T10:23:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD077547.01.01.01.01.01.01.01.01.04', 'INCOME', 2730000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-26T07:16:00.000Z'::timestamp, '2026-07-26T07:16:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT013394', 'INCOME', 3045000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-28T00:30:00.000Z'::timestamp, '2026-07-28T00:30:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD078113.01', 'INCOME', 2100000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-28T06:56:00.000Z'::timestamp, '2026-07-28T06:56:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD078196.02', 'INCOME', 3570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-29T06:58:00.000Z'::timestamp, '2026-07-29T06:58:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD078196.03', 'INCOME', 3570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-30T06:58:00.000Z'::timestamp, '2026-07-30T06:58:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD078196.01.02', 'INCOME', 3570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-31T07:00:00.000Z'::timestamp, '2026-07-31T07:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD078465.01', 'INCOME', 945000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-08-01T07:03:00.000Z'::timestamp, '2026-08-01T07:03:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD078545.01', 'INCOME', 3570000, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-08-02T07:04:00.000Z'::timestamp, '2026-08-02T07:04:00.000Z'::timestamp);
END $$;