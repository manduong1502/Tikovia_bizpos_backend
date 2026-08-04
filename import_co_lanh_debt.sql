-- Clean old records for Cô Lành (KH000049)
DO $$
DECLARE c_id INT; t_id INT; u_id INT; p_id INT; o_id INT;
BEGIN
  SELECT id INTO t_id FROM "Tenant" LIMIT 1;
  SELECT id INTO u_id FROM "User" LIMIT 1;
  SELECT id INTO p_id FROM "Product" LIMIT 1;
  SELECT id INTO c_id FROM "Customer" WHERE code = 'KH000049' AND "tenantId" = t_id;
  IF c_id IS NULL THEN
    INSERT INTO "Customer" (code, name, phone, "totalSpent", "totalDebt", "tenantId", "updatedAt")
    VALUES ('KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 152067000, 0, t_id, NOW())
    RETURNING id INTO c_id;
  ELSE
    UPDATE "Customer" SET "totalSpent" = 152067000, "totalDebt" = 0 WHERE id = c_id;
    DELETE FROM "CashbookEntry" WHERE "customerId" = c_id OR "partnerPhone" = '0357853938';
    DELETE FROM "OrderItem" WHERE "orderId" IN (SELECT id FROM "Order" WHERE "customerId" = c_id);
    DELETE FROM "Order" WHERE "customerId" = c_id;
  END IF;

  -- Order HD078728
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD078728', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-08-04T08:05:25.473Z'::timestamp, '2026-08-04T08:05:25.473Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD078656
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD078656', c_id, u_id, t_id, 'COMPLETED', 1235000, 1235000, 1235000, '2026-08-04T00:32:44.569Z'::timestamp, '2026-08-04T00:32:44.569Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000396') AND "tenantId" = t_id LIMIT 1), p_id), 2, 160000, 320000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD078551
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD078551', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-08-02T07:22:56.462Z'::timestamp, '2026-08-02T07:22:56.462Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD078472
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD078472', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-08-01T07:54:23.703Z'::timestamp, '2026-08-01T07:54:23.703Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD078212
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD078212', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-29T08:32:14.883Z'::timestamp, '2026-07-29T08:32:14.883Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD078128
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD078128', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-28T08:04:20.817Z'::timestamp, '2026-07-28T08:04:20.817Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD078049
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD078049', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-27T07:43:04.770Z'::timestamp, '2026-07-27T07:43:04.770Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD077973
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD077973', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-26T07:23:49.223Z'::timestamp, '2026-07-26T07:23:49.223Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD077888
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD077888', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-25T07:02:44.563Z'::timestamp, '2026-07-25T07:02:44.563Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD077816
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD077816', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-24T07:45:29.616Z'::timestamp, '2026-07-24T07:45:29.616Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD077733
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD077733', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-23T09:00:24.456Z'::timestamp, '2026-07-23T09:00:24.456Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD077231
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD077231', c_id, u_id, t_id, 'COMPLETED', 1220000, 1220000, 1220000, '2026-07-17T09:48:16.093Z'::timestamp, '2026-07-17T09:48:16.093Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 20, 61000, 1220000);

  -- Order HD077145.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD077145.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-16T10:06:37.356Z'::timestamp, '2026-07-16T10:06:37.356Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD076963
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076963', c_id, u_id, t_id, 'COMPLETED', 900000, 900000, 900000, '2026-07-14T09:31:23.170Z'::timestamp, '2026-07-14T09:31:23.170Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD076887
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076887', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-13T09:48:19.333Z'::timestamp, '2026-07-13T09:48:19.333Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD076790
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076790', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-07-11T08:28:30.617Z'::timestamp, '2026-07-11T08:28:30.617Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD076699
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076699', c_id, u_id, t_id, 'COMPLETED', 1365000, 1365000, 1365000, '2026-07-10T08:29:34.846Z'::timestamp, '2026-07-10T08:29:34.846Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 10, 45000, 450000);

  -- Order HD076520
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076520', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-07-08T08:03:11.517Z'::timestamp, '2026-07-08T08:03:11.517Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD076434
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076434', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-07-07T08:47:53.442Z'::timestamp, '2026-07-07T08:47:53.442Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD076348.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076348.01', c_id, u_id, t_id, 'COMPLETED', 1815000, 1815000, 1815000, '2026-07-06T09:34:58.640Z'::timestamp, '2026-07-06T09:34:58.640Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD076253.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076253.01', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-07-05T10:47:30.686Z'::timestamp, '2026-07-05T10:47:30.686Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD076154
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076154', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-04T07:49:18.330Z'::timestamp, '2026-07-04T07:49:18.330Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD076072
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076072', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-03T09:30:12.880Z'::timestamp, '2026-07-03T09:30:12.880Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075966
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075966', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-02T07:45:47.953Z'::timestamp, '2026-07-02T07:45:47.953Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075884
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075884', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-01T08:17:23.139Z'::timestamp, '2026-07-01T08:17:23.139Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075812
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075812', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-01T00:38:40.626Z'::timestamp, '2026-07-01T00:38:40.626Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075785
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075785', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-30T07:58:28.597Z'::timestamp, '2026-06-30T07:58:28.597Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075695
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075695', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-29T07:35:25.287Z'::timestamp, '2026-06-29T07:35:25.287Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075066.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075066.01', c_id, u_id, t_id, 'COMPLETED', 900000, 900000, 900000, '2026-06-28T10:36:11.762Z'::timestamp, '2026-06-28T10:36:11.762Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD075418.02
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075418.02', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-28T00:21:49.637Z'::timestamp, '2026-06-28T00:21:49.637Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075598
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075598', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-27T07:39:37.087Z'::timestamp, '2026-06-27T07:39:37.087Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD075418
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075418', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-25T09:13:11.123Z'::timestamp, '2026-06-25T09:13:11.123Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075332
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075332', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-24T08:22:12.516Z'::timestamp, '2026-06-24T08:22:12.516Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075234
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075234', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-23T08:16:30.817Z'::timestamp, '2026-06-23T08:16:30.817Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075131
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075131', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-22T07:54:11.987Z'::timestamp, '2026-06-22T07:54:11.987Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD075066
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075066', c_id, u_id, t_id, 'COMPLETED', 900000, 900000, 900000, '2026-06-22T00:31:30.317Z'::timestamp, '2026-06-22T00:31:30.317Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD075047.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075047.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-21T09:30:32.730Z'::timestamp, '2026-06-21T09:30:32.730Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074960
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074960', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-20T07:29:32.436Z'::timestamp, '2026-06-20T07:29:32.436Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074801
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074801', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-18T08:24:36.120Z'::timestamp, '2026-06-18T08:24:36.120Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD074693
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074693', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-17T07:01:21.869Z'::timestamp, '2026-06-17T07:01:21.869Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074619
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074619', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-16T07:21:46.473Z'::timestamp, '2026-06-16T07:21:46.473Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074541
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074541', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-06-15T07:26:48.929Z'::timestamp, '2026-06-15T07:26:48.929Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074456
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074456', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-14T07:58:02.380Z'::timestamp, '2026-06-14T07:58:02.380Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074328
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074328', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-13T00:45:30.930Z'::timestamp, '2026-06-13T00:45:30.930Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074277
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074277', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-11T08:07:40.810Z'::timestamp, '2026-06-11T08:07:40.810Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074219
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074219', c_id, u_id, t_id, 'COMPLETED', 320000, 320000, 320000, '2026-06-11T00:42:26.483Z'::timestamp, '2026-06-11T00:42:26.483Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000396') AND "tenantId" = t_id LIMIT 1), p_id), 2, 160000, 320000);

  -- Order HD074189
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074189', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-10T08:13:22.033Z'::timestamp, '2026-06-10T08:13:22.033Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074096
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074096', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-06-09T07:39:36.982Z'::timestamp, '2026-06-09T07:39:36.982Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD074006
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074006', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-08T08:42:36.610Z'::timestamp, '2026-06-08T08:42:36.610Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD073907
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073907', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-07T07:04:15.173Z'::timestamp, '2026-06-07T07:04:15.173Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD073824
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073824', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-06T07:17:26.837Z'::timestamp, '2026-06-06T07:17:26.837Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD073742
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073742', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-05T07:56:57.360Z'::timestamp, '2026-06-05T07:56:57.360Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD073687
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073687', c_id, u_id, t_id, 'COMPLETED', 312000, 312000, 312000, '2026-06-05T00:51:28.827Z'::timestamp, '2026-06-05T00:51:28.827Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP04') AND "tenantId" = t_id LIMIT 1), p_id), 5, 50000, 250000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000226') AND "tenantId" = t_id LIMIT 1), p_id), 1, 62000, 62000);

  -- Order HD073665
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073665', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-04T09:39:41.996Z'::timestamp, '2026-06-04T09:39:41.996Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD073565
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073565', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-06-03T07:56:02.759Z'::timestamp, '2026-06-03T07:56:02.759Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD073475
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073475', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-02T07:37:11.900Z'::timestamp, '2026-06-02T07:37:11.900Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD073269
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073269', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-05-31T07:08:22.537Z'::timestamp, '2026-05-31T07:08:22.537Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD073177.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073177.01', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-05-30T07:20:17.133Z'::timestamp, '2026-05-30T07:20:17.133Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD073141
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073141', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-29T08:01:17.963Z'::timestamp, '2026-05-29T08:01:17.963Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD073054
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073054', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-28T07:59:10.587Z'::timestamp, '2026-05-28T07:59:10.587Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD072974
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072974', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-27T07:15:00.453Z'::timestamp, '2026-05-27T07:15:00.453Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD072885
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072885', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-26T07:09:14.337Z'::timestamp, '2026-05-26T07:09:14.337Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD072817
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072817', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-25T08:28:22.313Z'::timestamp, '2026-05-25T08:28:22.313Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD072553
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072553', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-21T07:02:28.090Z'::timestamp, '2026-05-21T07:02:28.090Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD072491
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072491', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-20T09:00:47.089Z'::timestamp, '2026-05-20T09:00:47.089Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD072383
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072383', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-05-19T07:37:36.980Z'::timestamp, '2026-05-19T07:37:36.980Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD072273
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072273', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-18T07:11:41.746Z'::timestamp, '2026-05-18T07:11:41.746Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD072195
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072195', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-17T07:19:48.487Z'::timestamp, '2026-05-17T07:19:48.487Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD072130
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072130', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-05-16T07:40:16.277Z'::timestamp, '2026-05-16T07:40:16.277Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD071951
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071951', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-05-14T07:54:38.877Z'::timestamp, '2026-05-14T07:54:38.877Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD071927
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071927', c_id, u_id, t_id, 'COMPLETED', 607500, 607500, 607500, '2026-05-14T02:27:22.806Z'::timestamp, '2026-05-14T02:27:22.806Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000252') AND "tenantId" = t_id LIMIT 1), p_id), 12.15, 50000, 607500);

  -- Order HD071864
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071864', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-13T07:35:47.097Z'::timestamp, '2026-05-13T07:35:47.097Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD071779
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071779', c_id, u_id, t_id, 'COMPLETED', 675000, 675000, 675000, '2026-05-12T07:28:47.589Z'::timestamp, '2026-05-12T07:28:47.589Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('G005') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD071688
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071688', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-11T07:18:10.060Z'::timestamp, '2026-05-11T07:18:10.060Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD071643
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071643', c_id, u_id, t_id, 'COMPLETED', 675000, 675000, 675000, '2026-05-11T00:37:40.403Z'::timestamp, '2026-05-11T00:37:40.403Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('G005') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD071619
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071619', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-10T07:43:39.283Z'::timestamp, '2026-05-10T07:43:39.283Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD071533
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071533', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-09T07:10:55.507Z'::timestamp, '2026-05-09T07:10:55.507Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD071365
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071365', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-07T07:46:47.653Z'::timestamp, '2026-05-07T07:46:47.653Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD071282
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071282', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-06T07:29:26.420Z'::timestamp, '2026-05-06T07:29:26.420Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD071211
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071211', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-05-05T08:57:27.986Z'::timestamp, '2026-05-05T08:57:27.986Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('G005') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD071128
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071128', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-04T09:59:35.337Z'::timestamp, '2026-05-04T09:59:35.337Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD071040
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071040', c_id, u_id, t_id, 'COMPLETED', 435000, 435000, 435000, '2026-05-03T07:42:49.440Z'::timestamp, '2026-05-03T07:42:49.440Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000451') AND "tenantId" = t_id LIMIT 1), p_id), 5, 87000, 435000);

  -- Order HD070963
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070963', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-02T08:10:50.150Z'::timestamp, '2026-05-02T08:10:50.150Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD070872
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070872', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-01T08:04:38.040Z'::timestamp, '2026-05-01T08:04:38.040Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD070770
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070770', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-30T00:26:06.602Z'::timestamp, '2026-04-30T00:26:06.602Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD070665
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070665', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-28T08:35:10.950Z'::timestamp, '2026-04-28T08:35:10.950Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD070569
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070569', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-27T07:39:13.820Z'::timestamp, '2026-04-27T07:39:13.820Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD070419
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070419', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-25T07:35:20.073Z'::timestamp, '2026-04-25T07:35:20.073Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD070332
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070332', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-24T08:23:50.727Z'::timestamp, '2026-04-24T08:23:50.727Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD070225
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070225', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-04-23T07:40:53.943Z'::timestamp, '2026-04-23T07:40:53.943Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000073') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD070145
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070145', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-22T08:02:29.087Z'::timestamp, '2026-04-22T08:02:29.087Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD070052
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070052', c_id, u_id, t_id, 'COMPLETED', 900000, 900000, 900000, '2026-04-21T07:14:08.030Z'::timestamp, '2026-04-21T07:14:08.030Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD069980
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069980', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-20T07:41:50.769Z'::timestamp, '2026-04-20T07:41:50.769Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069909
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069909', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-19T08:46:21.567Z'::timestamp, '2026-04-19T08:46:21.567Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069815
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069815', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-18T07:40:38.060Z'::timestamp, '2026-04-18T07:40:38.060Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069742
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069742', c_id, u_id, t_id, 'COMPLETED', 675000, 675000, 675000, '2026-04-17T09:55:43.647Z'::timestamp, '2026-04-17T09:55:43.647Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000073') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD069651
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069651', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-16T07:21:24.383Z'::timestamp, '2026-04-16T07:21:24.383Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069592
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069592', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-15T09:14:30.469Z'::timestamp, '2026-04-15T09:14:30.469Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069500
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069500', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-14T07:42:23.849Z'::timestamp, '2026-04-14T07:42:23.849Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069387
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069387', c_id, u_id, t_id, 'COMPLETED', 936000, 936000, 936000, '2026-04-13T02:24:34.623Z'::timestamp, '2026-04-13T02:24:34.623Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000073') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000451') AND "tenantId" = t_id LIMIT 1), p_id), 3, 87000, 261000);

  -- Order HD069328
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069328', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-12T07:18:51.433Z'::timestamp, '2026-04-12T07:18:51.433Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068520.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068520.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-11T08:38:29.573Z'::timestamp, '2026-04-11T08:38:29.573Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069269
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069269', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-10T09:20:24.993Z'::timestamp, '2026-04-10T09:20:24.993Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069176
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069176', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-09T08:40:52.687Z'::timestamp, '2026-04-09T08:40:52.687Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069076
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069076', c_id, u_id, t_id, 'COMPLETED', 1575000, 1575000, 1575000, '2026-04-08T02:33:47.923Z'::timestamp, '2026-04-08T02:33:47.923Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD069021
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069021', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-07T07:33:38.743Z'::timestamp, '2026-04-07T07:33:38.743Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068959.01.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068959.01.01', c_id, u_id, t_id, 'COMPLETED', 1468000, 1468000, 1468000, '2026-04-06T09:21:42.249Z'::timestamp, '2026-04-06T09:21:42.249Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 46000, 690000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000333') AND "tenantId" = t_id LIMIT 1), p_id), 2.1, 80000, 168000);

  -- Order HD068879
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068879', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-05T08:15:42.063Z'::timestamp, '2026-04-05T08:15:42.063Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068797
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068797', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-04T07:29:28.967Z'::timestamp, '2026-04-04T07:29:28.967Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068725
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068725', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-03T07:36:16.446Z'::timestamp, '2026-04-03T07:36:16.446Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068662
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068662', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-02T09:59:06.627Z'::timestamp, '2026-04-02T09:59:06.627Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068520
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068520', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-31T08:45:40.883Z'::timestamp, '2026-03-31T08:45:40.883Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068439
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068439', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-03-30T08:38:41.287Z'::timestamp, '2026-03-30T08:38:41.287Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD068370
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068370', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-30T00:34:14.253Z'::timestamp, '2026-03-30T00:34:14.253Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068348
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068348', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-29T07:19:37.912Z'::timestamp, '2026-03-29T07:19:37.912Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068299
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068299', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-28T10:28:32.259Z'::timestamp, '2026-03-28T10:28:32.259Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068213
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068213', c_id, u_id, t_id, 'COMPLETED', 216000, 216000, 216000, '2026-03-27T08:21:48.483Z'::timestamp, '2026-03-27T08:21:48.483Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000135') AND "tenantId" = t_id LIMIT 1), p_id), 3, 72000, 216000);

  -- Order HD068148
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068148', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-26T08:59:50.413Z'::timestamp, '2026-03-26T08:59:50.413Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068071
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068071', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-25T09:27:13.400Z'::timestamp, '2026-03-25T09:27:13.400Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD067985
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067985', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-03-24T07:58:25.330Z'::timestamp, '2026-03-24T07:58:25.330Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD067841.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067841.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-22T09:27:05.503Z'::timestamp, '2026-03-22T09:27:05.503Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD067841
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067841', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-21T09:46:53.389Z'::timestamp, '2026-03-21T09:46:53.389Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD067741.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067741.01', c_id, u_id, t_id, 'COMPLETED', 802000, 802000, 802000, '2026-03-20T07:53:47.159Z'::timestamp, '2026-03-20T07:53:47.159Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000333') AND "tenantId" = t_id LIMIT 1), p_id), 2.4, 80000, 192000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD067669
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067669', c_id, u_id, t_id, 'COMPLETED', 1045000, 1045000, 1045000, '2026-03-19T09:24:30.730Z'::timestamp, '2026-03-19T09:24:30.730Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000451') AND "tenantId" = t_id LIMIT 1), p_id), 5, 87000, 435000);

  -- Order HD067524
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067524', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-17T09:52:44.100Z'::timestamp, '2026-03-17T09:52:44.100Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD067453.01.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067453.01.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-16T10:14:31.040Z'::timestamp, '2026-03-16T10:14:31.040Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD067402
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067402', c_id, u_id, t_id, 'COMPLETED', 168000, 168000, 168000, '2026-03-16T01:18:22.250Z'::timestamp, '2026-03-16T01:18:22.250Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000333') AND "tenantId" = t_id LIMIT 1), p_id), 2.1, 80000, 168000);

  -- Order HD067308
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067308', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-03-14T08:49:14.656Z'::timestamp, '2026-03-14T08:49:14.656Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD067154
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067154', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-03-12T07:17:36.609Z'::timestamp, '2026-03-12T07:17:36.609Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD067094.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067094.01', c_id, u_id, t_id, 'COMPLETED', 1954500, 1954500, 1954500, '2026-03-11T10:07:58.557Z'::timestamp, '2026-03-11T10:07:58.557Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 11.55, 90000, 1039500);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD066953
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066953', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-03-09T09:08:55.773Z'::timestamp, '2026-03-09T09:08:55.773Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD066796.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066796.01', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-03-07T07:22:05.506Z'::timestamp, '2026-03-07T07:22:05.506Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD066776
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066776', c_id, u_id, t_id, 'COMPLETED', 250000, 250000, 250000, '2026-03-07T02:47:36.203Z'::timestamp, '2026-03-07T02:47:36.203Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('G021') AND "tenantId" = t_id LIMIT 1), p_id), 5, 50000, 250000);

  -- Order HD066722
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066722', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-03-06T07:28:27.450Z'::timestamp, '2026-03-06T07:28:27.450Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD066663
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066663', c_id, u_id, t_id, 'COMPLETED', 1815000, 1815000, 1815000, '2026-03-05T09:49:19.646Z'::timestamp, '2026-03-05T09:49:19.646Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD066447
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066447', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-02T08:15:22.033Z'::timestamp, '2026-03-02T08:15:22.033Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD066340
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066340', c_id, u_id, t_id, 'COMPLETED', 176000, 176000, 176000, '2026-03-01T00:51:47.563Z'::timestamp, '2026-03-01T00:51:47.563Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000333') AND "tenantId" = t_id LIMIT 1), p_id), 2.2, 80000, 176000);

  -- Order HD066308
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066308', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-02-28T07:32:22.519Z'::timestamp, '2026-02-28T07:32:22.519Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD066175
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066175', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-02-26T07:39:46.729Z'::timestamp, '2026-02-26T07:39:46.729Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD066122
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066122', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-02-25T10:05:02.117Z'::timestamp, '2026-02-25T10:05:02.117Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD065983
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065983', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-02-23T09:02:26.730Z'::timestamp, '2026-02-23T09:02:26.730Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD065880
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065880', c_id, u_id, t_id, 'COMPLETED', 1220000, 1220000, 1220000, '2026-02-21T01:19:00.000Z'::timestamp, '2026-02-21T01:19:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 20, 61000, 1220000);

  -- Order HD065841
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065841', c_id, u_id, t_id, 'COMPLETED', 1220000, 1220000, 1220000, '2026-02-15T01:55:14.146Z'::timestamp, '2026-02-15T01:55:14.146Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 20, 61000, 1220000);

  -- Order HD065824
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065824', c_id, u_id, t_id, 'COMPLETED', 800000, 800000, 800000, '2026-02-14T09:46:45.303Z'::timestamp, '2026-02-14T09:46:45.303Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000451') AND "tenantId" = t_id LIMIT 1), p_id), 10, 80000, 800000);

  -- Order HD065801
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065801', c_id, u_id, t_id, 'COMPLETED', 800000, 800000, 800000, '2026-02-14T03:04:21.300Z'::timestamp, '2026-02-14T03:04:21.300Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000451') AND "tenantId" = t_id LIMIT 1), p_id), 10, 80000, 800000);

  -- Order HD065774
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065774', c_id, u_id, t_id, 'COMPLETED', 1220000, 1220000, 1220000, '2026-02-14T00:19:42.952Z'::timestamp, '2026-02-14T00:19:42.952Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 20, 61000, 1220000);

  -- Order HD065728.01.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065728.01.01', c_id, u_id, t_id, 'COMPLETED', 1010000, 1010000, 1010000, '2026-02-13T10:37:39.183Z'::timestamp, '2026-02-13T10:37:39.183Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000473') AND "tenantId" = t_id LIMIT 1), p_id), 5, 80000, 400000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD065683
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065683', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-02-12T07:07:43.770Z'::timestamp, '2026-02-12T07:07:43.770Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD065565
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065565', c_id, u_id, t_id, 'COMPLETED', 900000, 900000, 900000, '2026-02-10T08:46:07.429Z'::timestamp, '2026-02-10T08:46:07.429Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD065500
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065500', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-02-09T09:31:38.689Z'::timestamp, '2026-02-09T09:31:38.689Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD065361
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065361', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-02-07T10:20:41.662Z'::timestamp, '2026-02-07T10:20:41.662Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD065263
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065263', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-02-06T08:36:53.483Z'::timestamp, '2026-02-06T08:36:53.483Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD065195.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065195.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-02-06T00:41:53.777Z'::timestamp, '2026-02-06T00:41:53.777Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD065093
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065093', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-02-04T08:25:43.507Z'::timestamp, '2026-02-04T08:25:43.507Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD065018.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065018.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-02-03T09:53:05.037Z'::timestamp, '2026-02-03T09:53:05.037Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD064803.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD064803.01', c_id, u_id, t_id, 'COMPLETED', 782000, 782000, 782000, '2026-01-31T10:59:56.383Z'::timestamp, '2026-01-31T10:59:56.383Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000333') AND "tenantId" = t_id LIMIT 1), p_id), 2.15, 80000, 172000);

  -- Order HD064684
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD064684', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-01-30T08:15:15.560Z'::timestamp, '2026-01-30T08:15:15.560Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD064511
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD064511', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-28T07:24:36.639Z'::timestamp, '2026-01-28T07:24:36.639Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD064447
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD064447', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-01-27T09:15:46.869Z'::timestamp, '2026-01-27T09:15:46.869Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD064361.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD064361.01', c_id, u_id, t_id, 'COMPLETED', 900000, 900000, 900000, '2026-01-26T09:39:23.787Z'::timestamp, '2026-01-26T09:39:23.787Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD064258.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD064258.01', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-01-25T09:09:59.399Z'::timestamp, '2026-01-25T09:09:59.399Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD064191
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD064191', c_id, u_id, t_id, 'COMPLETED', 760000, 760000, 760000, '2026-01-24T10:34:51.473Z'::timestamp, '2026-01-24T10:34:51.473Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000333') AND "tenantId" = t_id LIMIT 1), p_id), 2, 75000, 150000);

  -- Order HD063995.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063995.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-22T07:10:41.872Z'::timestamp, '2026-01-22T07:10:41.872Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063938
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063938', c_id, u_id, t_id, 'COMPLETED', 675000, 675000, 675000, '2026-01-21T09:18:45.137Z'::timestamp, '2026-01-21T09:18:45.137Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD063935
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063935', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-21T09:02:37.490Z'::timestamp, '2026-01-21T09:02:37.490Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063795.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063795.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-20T01:05:23.797Z'::timestamp, '2026-01-20T01:05:23.797Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063762.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063762.01', c_id, u_id, t_id, 'COMPLETED', 900000, 900000, 900000, '2026-01-19T07:42:28.907Z'::timestamp, '2026-01-19T07:42:28.907Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD063700.01.02
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063700.01.02', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-01-18T11:05:14.242Z'::timestamp, '2026-01-18T11:05:14.242Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063614
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063614', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-17T07:33:01.536Z'::timestamp, '2026-01-17T07:33:01.536Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063460
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063460', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-15T09:40:22.977Z'::timestamp, '2026-01-15T09:40:22.977Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063308.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063308.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-14T00:33:18.133Z'::timestamp, '2026-01-14T00:33:18.133Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063290
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063290', c_id, u_id, t_id, 'COMPLETED', 675000, 675000, 675000, '2026-01-13T08:54:54.757Z'::timestamp, '2026-01-13T08:54:54.757Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD063224.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063224.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-12T11:10:10.536Z'::timestamp, '2026-01-12T11:10:10.536Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063114.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063114.01', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-01-11T09:58:33.203Z'::timestamp, '2026-01-11T09:58:33.203Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('G002') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063036.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063036.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-10T08:55:21.167Z'::timestamp, '2026-01-10T08:55:21.167Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD062950
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD062950', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-01-09T08:26:54.587Z'::timestamp, '2026-01-09T08:26:54.587Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('G002') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD062859.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD062859.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-08T07:20:05.297Z'::timestamp, '2026-01-08T07:20:05.297Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD062747.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD062747.01', c_id, u_id, t_id, 'COMPLETED', 1375000, 1375000, 1375000, '2026-01-07T00:41:38.743Z'::timestamp, '2026-01-07T00:41:38.743Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000078') AND "tenantId" = t_id LIMIT 1), p_id), 15, 51000, 765000);

  -- Order HD062726.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD062726.01', c_id, u_id, t_id, 'COMPLETED', 1375000, 1375000, 1375000, '2026-01-06T08:29:08.702Z'::timestamp, '2026-01-06T08:29:08.702Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000078') AND "tenantId" = t_id LIMIT 1), p_id), 15, 51000, 765000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD062633.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD062633.01', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-01-05T07:51:41.416Z'::timestamp, '2026-01-05T07:51:41.416Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD062487.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD062487.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-03T08:57:17.679Z'::timestamp, '2026-01-03T08:57:17.679Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD062422.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD062422.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-02T10:35:00.933Z'::timestamp, '2026-01-02T10:35:00.933Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    "customerId" = c_id,
    total = EXCLUDED.total,
    paid = EXCLUDED.paid,
    subtotal = EXCLUDED.subtotal,
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW()
  RETURNING id INTO o_id;

  DELETE FROM "OrderItem" WHERE "orderId" = o_id;
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Cashbook Payments
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD062422.01', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-02T10:35:00.000Z'::timestamp, '2026-01-02T10:35:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD062487.01', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-03T08:57:00.000Z'::timestamp, '2026-01-03T08:57:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD062633.01', 'INCOME', 1510000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-05T07:51:00.000Z'::timestamp, '2026-01-05T07:51:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD062726.01', 'INCOME', 1375000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-06T08:29:00.000Z'::timestamp, '2026-01-06T08:29:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD062747.01', 'INCOME', 1375000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-07T00:41:00.000Z'::timestamp, '2026-01-07T00:41:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD062859.01', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-08T07:20:00.000Z'::timestamp, '2026-01-08T07:20:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063036.01', 'INCOME', 1895000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-10T08:55:00.000Z'::timestamp, '2026-01-10T08:55:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063224.01', 'INCOME', 1895000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-12T11:10:00.000Z'::timestamp, '2026-01-12T11:10:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063308.01', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-14T00:33:00.000Z'::timestamp, '2026-01-14T00:33:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT005977', 'INCOME', 1285000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-15T15:30:00.000Z'::timestamp, '2026-01-15T15:30:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063700.01.02', 'INCOME', 1895000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-18T11:05:00.000Z'::timestamp, '2026-01-18T11:05:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063762.01', 'INCOME', 900000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-19T07:42:00.000Z'::timestamp, '2026-01-19T07:42:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063795.01', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-20T01:05:00.000Z'::timestamp, '2026-01-20T01:05:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063938', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-21T09:18:00.000Z'::timestamp, '2026-01-21T09:18:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT006101', 'INCOME', 675000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-21T10:14:00.000Z'::timestamp, '2026-01-21T10:14:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD063995.01', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-22T07:10:00.000Z'::timestamp, '2026-01-22T07:10:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD064258.01', 'INCOME', 2045000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-25T09:09:00.000Z'::timestamp, '2026-01-25T09:09:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD064361.01', 'INCOME', 900000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-26T09:39:00.000Z'::timestamp, '2026-01-26T09:39:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT006244', 'INCOME', 1895000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-29T15:00:00.000Z'::timestamp, '2026-01-29T15:00:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT006268', 'INCOME', 1285000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-30T16:00:00.000Z'::timestamp, '2026-01-30T16:00:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD064803.01', 'INCOME', 782000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-01-31T10:59:00.000Z'::timestamp, '2026-01-31T10:59:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065018.01', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-03T09:53:00.000Z'::timestamp, '2026-02-03T09:53:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065093', 'INCOME', 1285000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-04T08:25:00.000Z'::timestamp, '2026-02-04T08:25:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065195.01', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-06T00:41:00.000Z'::timestamp, '2026-02-06T00:41:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT006438', 'INCOME', 1510000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-06T11:42:00.000Z'::timestamp, '2026-02-06T11:42:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD065361', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-07T10:20:00.000Z'::timestamp, '2026-02-07T10:20:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT006536', 'INCOME', 1285000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-09T11:04:00.000Z'::timestamp, '2026-02-09T11:04:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT006597', 'INCOME', 900000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-10T11:02:00.000Z'::timestamp, '2026-02-10T11:02:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT006690', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-12T11:03:00.000Z'::timestamp, '2026-02-12T11:03:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT006750', 'INCOME', 3030000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-14T04:10:00.000Z'::timestamp, '2026-02-14T04:10:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT006813', 'INCOME', 3240000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-22T10:15:00.000Z'::timestamp, '2026-02-22T10:15:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT006835', 'INCOME', 1285000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-23T10:38:00.000Z'::timestamp, '2026-02-23T10:38:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT006904', 'INCOME', 1510000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-25T11:06:00.000Z'::timestamp, '2026-02-25T11:06:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT006935', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-27T02:11:00.000Z'::timestamp, '2026-02-27T02:11:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT006992', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-02-28T09:52:00.000Z'::timestamp, '2026-02-28T09:52:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007006', 'INCOME', 176000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-01T02:44:00.000Z'::timestamp, '2026-03-01T02:44:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007051', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-02T15:30:00.000Z'::timestamp, '2026-03-02T15:30:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007149', 'INCOME', 1815000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-05T14:30:00.000Z'::timestamp, '2026-03-05T14:30:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007175', 'INCOME', 915000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-06T16:00:00.000Z'::timestamp, '2026-03-06T16:00:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD066796.01', 'INCOME', 1116000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-07T07:22:00.000Z'::timestamp, '2026-03-07T07:22:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007326', 'INCOME', 915000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-10T14:00:00.000Z'::timestamp, '2026-03-10T14:00:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007358', 'INCOME', 1954500, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-11T10:28:00.000Z'::timestamp, '2026-03-11T10:28:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007390', 'INCOME', 915000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-12T10:21:00.000Z'::timestamp, '2026-03-12T10:21:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007499', 'INCOME', 49000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-14T16:00:00.000Z'::timestamp, '2026-03-14T16:00:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007503', 'INCOME', 1083000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-16T02:14:00.000Z'::timestamp, '2026-03-16T02:14:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007527', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-16T10:46:00.000Z'::timestamp, '2026-03-16T10:46:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD067524', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-17T09:52:00.000Z'::timestamp, '2026-03-17T09:52:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007636', 'INCOME', 1045000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-19T10:34:00.000Z'::timestamp, '2026-03-19T10:34:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007676', 'INCOME', 802000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-20T10:17:00.000Z'::timestamp, '2026-03-20T10:17:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007714', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-21T10:02:00.000Z'::timestamp, '2026-03-21T10:02:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007780', 'INCOME', 2120000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-24T10:30:00.000Z'::timestamp, '2026-03-24T10:30:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007841', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-25T16:00:00.000Z'::timestamp, '2026-03-25T16:00:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007868', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-26T10:14:00.000Z'::timestamp, '2026-03-26T10:14:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007936', 'INCOME', 826000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-28T10:40:00.000Z'::timestamp, '2026-03-28T10:40:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT007979', 'INCOME', 1220000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-30T02:03:00.000Z'::timestamp, '2026-03-30T02:03:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008008', 'INCOME', 1510000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-03-30T11:03:00.000Z'::timestamp, '2026-03-30T11:03:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008147', 'INCOME', 1830000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-03T10:36:00.000Z'::timestamp, '2026-04-03T10:36:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008230', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-04T16:30:00.000Z'::timestamp, '2026-04-04T16:30:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008260', 'INCOME', 2078000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-06T09:37:00.000Z'::timestamp, '2026-04-06T09:37:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008332', 'INCOME', 2185000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-08T07:54:00.000Z'::timestamp, '2026-04-08T07:54:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008389', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-09T16:30:00.000Z'::timestamp, '2026-04-09T16:30:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008420', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-10T10:55:00.000Z'::timestamp, '2026-04-10T10:55:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008485', 'INCOME', 1220000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-12T16:30:00.000Z'::timestamp, '2026-04-12T16:30:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008570', 'INCOME', 1546000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-14T10:42:00.000Z'::timestamp, '2026-04-14T10:42:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008607', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-15T11:06:00.000Z'::timestamp, '2026-04-15T11:06:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008659', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-16T16:30:00.000Z'::timestamp, '2026-04-16T16:30:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008693', 'INCOME', 675000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-18T01:48:00.000Z'::timestamp, '2026-04-18T01:48:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008721', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-18T10:39:00.000Z'::timestamp, '2026-04-18T10:39:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008798', 'INCOME', 1220000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-20T10:31:00.000Z'::timestamp, '2026-04-20T10:31:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008840', 'INCOME', 900000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-21T10:26:00.000Z'::timestamp, '2026-04-21T10:26:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008884', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-22T10:29:00.000Z'::timestamp, '2026-04-22T10:29:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008934', 'INCOME', 1285000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-23T10:50:00.000Z'::timestamp, '2026-04-23T10:50:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT008989', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-24T10:38:00.000Z'::timestamp, '2026-04-24T10:38:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT009029', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-25T10:34:00.000Z'::timestamp, '2026-04-25T10:34:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT009097', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-27T10:25:00.000Z'::timestamp, '2026-04-27T10:25:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT009144', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-04-28T10:22:00.000Z'::timestamp, '2026-04-28T10:22:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT009296', 'INCOME', 1220000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-01T16:00:00.000Z'::timestamp, '2026-05-01T16:00:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT009322', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-02T13:00:00.000Z'::timestamp, '2026-05-02T13:00:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT009405', 'INCOME', 1045000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-04T10:31:00.000Z'::timestamp, '2026-05-04T10:31:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT009452', 'INCOME', 1285000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-05T10:39:00.000Z'::timestamp, '2026-05-05T10:39:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT009503', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-06T10:23:00.000Z'::timestamp, '2026-05-06T10:23:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT009573', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-08T02:05:00.000Z'::timestamp, '2026-05-08T02:05:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT009651', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-09T10:17:00.000Z'::timestamp, '2026-05-09T10:17:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT009770', 'INCOME', 1895000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-11T12:00:00.000Z'::timestamp, '2026-05-11T12:00:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT009793', 'INCOME', 675000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-12T10:29:00.000Z'::timestamp, '2026-05-12T10:29:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT009893', 'INCOME', 2727500, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-14T10:24:00.000Z'::timestamp, '2026-05-14T10:24:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT009992', 'INCOME', 1510000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-17T03:07:00.000Z'::timestamp, '2026-05-17T03:07:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT010080', 'INCOME', 1220000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-19T01:54:00.000Z'::timestamp, '2026-05-19T01:54:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT010109', 'INCOME', 1285000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-19T10:11:00.000Z'::timestamp, '2026-05-19T10:11:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT010186', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-20T11:30:00.000Z'::timestamp, '2026-05-20T11:30:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT010231', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-21T14:00:00.000Z'::timestamp, '2026-05-21T14:00:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT010429', 'INCOME', 1220000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-27T02:52:00.000Z'::timestamp, '2026-05-27T02:52:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT010457', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-27T10:47:00.000Z'::timestamp, '2026-05-27T10:47:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT010495', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-28T10:28:00.000Z'::timestamp, '2026-05-28T10:28:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT010538', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-29T10:59:00.000Z'::timestamp, '2026-05-29T10:59:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT010566', 'INCOME', 1510000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-05-30T10:32:00.000Z'::timestamp, '2026-05-30T10:32:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT010704', 'INCOME', 1895000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-02T10:27:00.000Z'::timestamp, '2026-06-02T10:27:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT010766', 'INCOME', 1510000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-03T10:20:00.000Z'::timestamp, '2026-06-03T10:20:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT010825', 'INCOME', 1285000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-04T10:47:00.000Z'::timestamp, '2026-06-04T10:47:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT010878', 'INCOME', 922000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-05T11:18:00.000Z'::timestamp, '2026-06-05T11:18:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT010931', 'INCOME', 1285000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-07T02:32:00.000Z'::timestamp, '2026-06-07T02:32:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011010', 'INCOME', 1220000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-08T10:35:00.000Z'::timestamp, '2026-06-08T10:35:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011073', 'INCOME', 1510000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-09T10:10:00.000Z'::timestamp, '2026-06-09T10:10:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011116', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-10T10:46:00.000Z'::timestamp, '2026-06-10T10:46:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011194', 'INCOME', 2215000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-13T01:03:00.000Z'::timestamp, '2026-06-13T01:03:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011328', 'INCOME', 2120000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-15T10:31:00.000Z'::timestamp, '2026-06-15T10:31:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011383', 'INCOME', 1285000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-16T10:10:00.000Z'::timestamp, '2026-06-16T10:10:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011430', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-17T10:22:00.000Z'::timestamp, '2026-06-17T10:22:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011506', 'INCOME', 1285000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-19T02:53:00.000Z'::timestamp, '2026-06-19T02:53:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011577', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-20T10:18:00.000Z'::timestamp, '2026-06-20T10:18:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011640', 'INCOME', 1510000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-22T03:25:00.000Z'::timestamp, '2026-06-22T03:25:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011668', 'INCOME', 1285000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-22T11:10:00.000Z'::timestamp, '2026-06-22T11:10:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011713', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-23T10:40:00.000Z'::timestamp, '2026-06-23T10:40:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011837', 'INCOME', 1895000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-26T03:51:00.000Z'::timestamp, '2026-06-26T03:51:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011912', 'INCOME', 1285000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-27T10:45:00.000Z'::timestamp, '2026-06-27T10:45:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TTHD075418.02', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-28T00:21:00.000Z'::timestamp, '2026-06-28T00:21:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT011969', 'INCOME', 1510000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-06-29T10:45:00.000Z'::timestamp, '2026-06-29T10:45:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012035', 'INCOME', 1285000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-01T00:37:00.000Z'::timestamp, '2026-07-01T00:37:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012064', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-01T07:19:00.000Z'::timestamp, '2026-07-01T07:19:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012095', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-01T10:50:00.000Z'::timestamp, '2026-07-01T10:50:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012137', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-02T10:17:00.000Z'::timestamp, '2026-07-02T10:17:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012185', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-03T10:06:00.000Z'::timestamp, '2026-07-03T10:06:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012254', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-05T02:02:00.000Z'::timestamp, '2026-07-05T02:02:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012283', 'INCOME', 915000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-05T11:23:00.000Z'::timestamp, '2026-07-05T11:23:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012332', 'INCOME', 1815000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-06T10:33:00.000Z'::timestamp, '2026-07-06T10:33:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012393', 'INCOME', 915000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-07T10:51:00.000Z'::timestamp, '2026-07-07T10:51:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012447', 'INCOME', 915000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-08T11:00:00.000Z'::timestamp, '2026-07-08T11:00:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012599', 'INCOME', 2280000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-11T10:40:00.000Z'::timestamp, '2026-07-11T10:40:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012663', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-13T10:28:00.000Z'::timestamp, '2026-07-13T10:28:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012717', 'INCOME', 900000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-14T10:57:00.000Z'::timestamp, '2026-07-14T10:57:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012824', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-16T10:33:00.000Z'::timestamp, '2026-07-16T10:33:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT012885', 'INCOME', 1220000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-17T10:40:00.000Z'::timestamp, '2026-07-17T10:40:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT013188', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-23T10:21:00.000Z'::timestamp, '2026-07-23T10:21:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT013226', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-24T10:51:00.000Z'::timestamp, '2026-07-24T10:51:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT013282', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-25T10:38:00.000Z'::timestamp, '2026-07-25T10:38:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT013358', 'INCOME', 1220000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-27T10:19:00.000Z'::timestamp, '2026-07-27T10:19:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT013402', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-28T10:39:00.000Z'::timestamp, '2026-07-28T10:39:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT013459', 'INCOME', 610000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-07-29T10:40:00.000Z'::timestamp, '2026-07-29T10:40:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT013604', 'INCOME', 915000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-08-01T10:08:00.000Z'::timestamp, '2026-08-01T10:08:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT013679', 'INCOME', 1845000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-08-04T03:25:00.000Z'::timestamp, '2026-08-04T03:25:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")
  VALUES ('TT013703', 'INCOME', 915000, 'Thu tiền khách trả', 'customer', c_id, 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', '0357853938', 'Thanh toán công nợ', u_id, t_id, 'completed', '2026-08-04T10:16:00.000Z'::timestamp, '2026-08-04T10:16:00.000Z'::timestamp)
  ON CONFLICT ("tenantId", code) DO UPDATE SET
    amount = EXCLUDED.amount,
    "customerId" = c_id,
    "partnerName" = EXCLUDED."partnerName",
    "partnerPhone" = EXCLUDED."partnerPhone",
    status = 'completed',
    "createdAt" = EXCLUDED."createdAt",
    "updatedAt" = NOW();
END $$;
