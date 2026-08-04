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
    DELETE FROM "CashbookEntry" WHERE "customerId" = c_id;
    DELETE FROM "OrderItem" WHERE "orderId" IN (SELECT id FROM "Order" WHERE "customerId" = c_id);
    DELETE FROM "Order" WHERE "customerId" = c_id;
  END IF;

  -- Order HD078728
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD078728', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-08-04T15:05:25.473Z'::timestamp, '2026-08-04T15:05:25.473Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD078656
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD078656', c_id, u_id, t_id, 'COMPLETED', 1235000, 1235000, 1235000, '2026-08-04T07:32:44.570Z'::timestamp, '2026-08-04T07:32:44.570Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000396') AND "tenantId" = t_id LIMIT 1), p_id), 2, 160000, 320000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD078551
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD078551', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-08-02T14:22:56.463Z'::timestamp, '2026-08-02T14:22:56.463Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD078472
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD078472', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-08-01T14:54:23.703Z'::timestamp, '2026-08-01T14:54:23.703Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD078212
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD078212', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-29T15:32:14.883Z'::timestamp, '2026-07-29T15:32:14.883Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD078128
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD078128', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-28T15:04:20.817Z'::timestamp, '2026-07-28T15:04:20.817Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD078049
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD078049', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-27T14:43:04.770Z'::timestamp, '2026-07-27T14:43:04.770Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD077973
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD077973', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-26T14:23:49.223Z'::timestamp, '2026-07-26T14:23:49.223Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD077888
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD077888', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-25T14:02:44.563Z'::timestamp, '2026-07-25T14:02:44.563Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD077816
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD077816', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-24T14:45:29.617Z'::timestamp, '2026-07-24T14:45:29.617Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD077733
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD077733', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-23T16:00:24.457Z'::timestamp, '2026-07-23T16:00:24.457Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD077231
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD077231', c_id, u_id, t_id, 'COMPLETED', 1220000, 1220000, 1220000, '2026-07-17T16:48:16.093Z'::timestamp, '2026-07-17T16:48:16.093Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 20, 61000, 1220000);

  -- Order HD077145.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD077145.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-16T17:06:37.357Z'::timestamp, '2026-07-16T17:06:37.357Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD076963
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076963', c_id, u_id, t_id, 'COMPLETED', 900000, 900000, 900000, '2026-07-14T16:31:23.170Z'::timestamp, '2026-07-14T16:31:23.170Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD076887
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076887', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-13T16:48:19.333Z'::timestamp, '2026-07-13T16:48:19.333Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD076790
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076790', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-07-11T15:28:30.617Z'::timestamp, '2026-07-11T15:28:30.617Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD076699
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076699', c_id, u_id, t_id, 'COMPLETED', 1365000, 1365000, 1365000, '2026-07-10T15:29:34.847Z'::timestamp, '2026-07-10T15:29:34.847Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 10, 45000, 450000);

  -- Order HD076520
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076520', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-07-08T15:03:11.517Z'::timestamp, '2026-07-08T15:03:11.517Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD076434
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076434', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-07-07T15:47:53.443Z'::timestamp, '2026-07-07T15:47:53.443Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD076348.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076348.01', c_id, u_id, t_id, 'COMPLETED', 1815000, 1815000, 1815000, '2026-07-06T16:34:58.640Z'::timestamp, '2026-07-06T16:34:58.640Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD076253.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076253.01', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-07-05T17:47:30.687Z'::timestamp, '2026-07-05T17:47:30.687Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD076154
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076154', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-04T14:49:18.330Z'::timestamp, '2026-07-04T14:49:18.330Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD076072
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD076072', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-03T16:30:12.880Z'::timestamp, '2026-07-03T16:30:12.880Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075966
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075966', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-02T14:45:47.953Z'::timestamp, '2026-07-02T14:45:47.953Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075884
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075884', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-01T15:17:23.140Z'::timestamp, '2026-07-01T15:17:23.140Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075812
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075812', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-07-01T07:38:40.627Z'::timestamp, '2026-07-01T07:38:40.627Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075785
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075785', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-30T14:58:28.597Z'::timestamp, '2026-06-30T14:58:28.597Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075695
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075695', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-29T14:35:25.287Z'::timestamp, '2026-06-29T14:35:25.287Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075066.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075066.01', c_id, u_id, t_id, 'COMPLETED', 900000, 900000, 900000, '2026-06-28T17:36:11.763Z'::timestamp, '2026-06-28T17:36:11.763Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD075418.02
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075418.02', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-28T07:21:49.637Z'::timestamp, '2026-06-28T07:21:49.637Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075598
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075598', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-27T14:39:37.087Z'::timestamp, '2026-06-27T14:39:37.087Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD075418
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075418', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-25T16:13:11.123Z'::timestamp, '2026-06-25T16:13:11.123Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075332
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075332', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-24T15:22:12.517Z'::timestamp, '2026-06-24T15:22:12.517Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075234
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075234', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-23T15:16:30.817Z'::timestamp, '2026-06-23T15:16:30.817Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD075131
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075131', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-22T14:54:11.987Z'::timestamp, '2026-06-22T14:54:11.987Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD075066
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075066', c_id, u_id, t_id, 'COMPLETED', 900000, 900000, 900000, '2026-06-22T07:31:30.317Z'::timestamp, '2026-06-22T07:31:30.317Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD075047.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD075047.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-21T16:30:32.730Z'::timestamp, '2026-06-21T16:30:32.730Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074960
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074960', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-20T14:29:32.437Z'::timestamp, '2026-06-20T14:29:32.437Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074801
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074801', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-18T15:24:36.120Z'::timestamp, '2026-06-18T15:24:36.120Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD074693
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074693', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-17T14:01:21.870Z'::timestamp, '2026-06-17T14:01:21.870Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074619
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074619', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-16T14:21:46.473Z'::timestamp, '2026-06-16T14:21:46.473Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074541
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074541', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-06-15T14:26:48.930Z'::timestamp, '2026-06-15T14:26:48.930Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074456
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074456', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-14T14:58:02.380Z'::timestamp, '2026-06-14T14:58:02.380Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074328
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074328', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-13T07:45:30.930Z'::timestamp, '2026-06-13T07:45:30.930Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074277
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074277', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-11T15:07:40.810Z'::timestamp, '2026-06-11T15:07:40.810Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074219
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074219', c_id, u_id, t_id, 'COMPLETED', 320000, 320000, 320000, '2026-06-11T07:42:26.483Z'::timestamp, '2026-06-11T07:42:26.483Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000396') AND "tenantId" = t_id LIMIT 1), p_id), 2, 160000, 320000);

  -- Order HD074189
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074189', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-10T15:13:22.033Z'::timestamp, '2026-06-10T15:13:22.033Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD074096
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074096', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-06-09T14:39:36.983Z'::timestamp, '2026-06-09T14:39:36.983Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD074006
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD074006', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-08T15:42:36.610Z'::timestamp, '2026-06-08T15:42:36.610Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD073907
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073907', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-07T14:04:15.173Z'::timestamp, '2026-06-07T14:04:15.173Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD073824
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073824', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-06T14:17:26.837Z'::timestamp, '2026-06-06T14:17:26.837Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD073742
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073742', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-05T14:56:57.360Z'::timestamp, '2026-06-05T14:56:57.360Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD073687
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073687', c_id, u_id, t_id, 'COMPLETED', 312000, 312000, 312000, '2026-06-05T07:51:28.827Z'::timestamp, '2026-06-05T07:51:28.827Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP04') AND "tenantId" = t_id LIMIT 1), p_id), 5, 50000, 250000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000226') AND "tenantId" = t_id LIMIT 1), p_id), 1, 62000, 62000);

  -- Order HD073665
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073665', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-06-04T16:39:41.997Z'::timestamp, '2026-06-04T16:39:41.997Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD073565
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073565', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-06-03T14:56:02.760Z'::timestamp, '2026-06-03T14:56:02.760Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD073475
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073475', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-06-02T14:37:11.900Z'::timestamp, '2026-06-02T14:37:11.900Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD073269
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073269', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-05-31T14:08:22.537Z'::timestamp, '2026-05-31T14:08:22.537Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD073177.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073177.01', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-05-30T14:20:17.133Z'::timestamp, '2026-05-30T14:20:17.133Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD073141
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073141', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-29T15:01:17.963Z'::timestamp, '2026-05-29T15:01:17.963Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD073054
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD073054', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-28T14:59:10.587Z'::timestamp, '2026-05-28T14:59:10.587Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD072974
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072974', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-27T14:15:00.453Z'::timestamp, '2026-05-27T14:15:00.453Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD072885
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072885', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-26T14:09:14.337Z'::timestamp, '2026-05-26T14:09:14.337Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD072817
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072817', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-25T15:28:22.313Z'::timestamp, '2026-05-25T15:28:22.313Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD072553
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072553', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-21T14:02:28.090Z'::timestamp, '2026-05-21T14:02:28.090Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD072491
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072491', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-20T16:00:47.090Z'::timestamp, '2026-05-20T16:00:47.090Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD072383
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072383', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-05-19T14:37:36.980Z'::timestamp, '2026-05-19T14:37:36.980Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD072273
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072273', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-18T14:11:41.747Z'::timestamp, '2026-05-18T14:11:41.747Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD072195
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072195', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-17T14:19:48.487Z'::timestamp, '2026-05-17T14:19:48.487Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD072130
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD072130', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-05-16T14:40:16.277Z'::timestamp, '2026-05-16T14:40:16.277Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD071951
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071951', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-05-14T14:54:38.877Z'::timestamp, '2026-05-14T14:54:38.877Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD071927
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071927', c_id, u_id, t_id, 'COMPLETED', 607500, 607500, 607500, '2026-05-14T09:27:22.807Z'::timestamp, '2026-05-14T09:27:22.807Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000252') AND "tenantId" = t_id LIMIT 1), p_id), 12.15, 50000, 607500);

  -- Order HD071864
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071864', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-13T14:35:47.097Z'::timestamp, '2026-05-13T14:35:47.097Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD071779
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071779', c_id, u_id, t_id, 'COMPLETED', 675000, 675000, 675000, '2026-05-12T14:28:47.590Z'::timestamp, '2026-05-12T14:28:47.590Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('G005') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD071688
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071688', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-11T14:18:10.060Z'::timestamp, '2026-05-11T14:18:10.060Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD071643
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071643', c_id, u_id, t_id, 'COMPLETED', 675000, 675000, 675000, '2026-05-11T07:37:40.403Z'::timestamp, '2026-05-11T07:37:40.403Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('G005') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD071619
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071619', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-10T14:43:39.283Z'::timestamp, '2026-05-10T14:43:39.283Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD071533
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071533', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-09T14:10:55.507Z'::timestamp, '2026-05-09T14:10:55.507Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD071365
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071365', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-07T14:46:47.653Z'::timestamp, '2026-05-07T14:46:47.653Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD071282
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071282', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-06T14:29:26.420Z'::timestamp, '2026-05-06T14:29:26.420Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD071211
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071211', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-05-05T15:57:27.987Z'::timestamp, '2026-05-05T15:57:27.987Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('G005') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD071128
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071128', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-04T16:59:35.337Z'::timestamp, '2026-05-04T16:59:35.337Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD071040
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD071040', c_id, u_id, t_id, 'COMPLETED', 435000, 435000, 435000, '2026-05-03T14:42:49.440Z'::timestamp, '2026-05-03T14:42:49.440Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000451') AND "tenantId" = t_id LIMIT 1), p_id), 5, 87000, 435000);

  -- Order HD070963
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070963', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-02T15:10:50.150Z'::timestamp, '2026-05-02T15:10:50.150Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD070872
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070872', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-05-01T15:04:38.040Z'::timestamp, '2026-05-01T15:04:38.040Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD070770
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070770', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-30T07:26:06.603Z'::timestamp, '2026-04-30T07:26:06.603Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD070665
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070665', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-28T15:35:10.950Z'::timestamp, '2026-04-28T15:35:10.950Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD070569
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070569', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-27T14:39:13.820Z'::timestamp, '2026-04-27T14:39:13.820Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD070419
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070419', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-25T14:35:20.073Z'::timestamp, '2026-04-25T14:35:20.073Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD070332
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070332', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-24T15:23:50.727Z'::timestamp, '2026-04-24T15:23:50.727Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD070225
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070225', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-04-23T14:40:53.943Z'::timestamp, '2026-04-23T14:40:53.943Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000073') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD070145
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070145', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-22T15:02:29.087Z'::timestamp, '2026-04-22T15:02:29.087Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD070052
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD070052', c_id, u_id, t_id, 'COMPLETED', 900000, 900000, 900000, '2026-04-21T14:14:08.030Z'::timestamp, '2026-04-21T14:14:08.030Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD069980
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069980', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-20T14:41:50.770Z'::timestamp, '2026-04-20T14:41:50.770Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069909
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069909', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-19T15:46:21.567Z'::timestamp, '2026-04-19T15:46:21.567Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069815
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069815', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-18T14:40:38.060Z'::timestamp, '2026-04-18T14:40:38.060Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069742
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069742', c_id, u_id, t_id, 'COMPLETED', 675000, 675000, 675000, '2026-04-17T16:55:43.647Z'::timestamp, '2026-04-17T16:55:43.647Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000073') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD069651
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069651', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-16T14:21:24.383Z'::timestamp, '2026-04-16T14:21:24.383Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069592
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069592', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-15T16:14:30.470Z'::timestamp, '2026-04-15T16:14:30.470Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069500
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069500', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-14T14:42:23.850Z'::timestamp, '2026-04-14T14:42:23.850Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069387
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069387', c_id, u_id, t_id, 'COMPLETED', 936000, 936000, 936000, '2026-04-13T09:24:34.623Z'::timestamp, '2026-04-13T09:24:34.623Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000073') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000451') AND "tenantId" = t_id LIMIT 1), p_id), 3, 87000, 261000);

  -- Order HD069328
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069328', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-12T14:18:51.433Z'::timestamp, '2026-04-12T14:18:51.433Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068520.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068520.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-11T15:38:29.573Z'::timestamp, '2026-04-11T15:38:29.573Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069269
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069269', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-10T16:20:24.993Z'::timestamp, '2026-04-10T16:20:24.993Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069176
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069176', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-09T15:40:52.687Z'::timestamp, '2026-04-09T15:40:52.687Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD069076
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069076', c_id, u_id, t_id, 'COMPLETED', 1575000, 1575000, 1575000, '2026-04-08T09:33:47.923Z'::timestamp, '2026-04-08T09:33:47.923Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD069021
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD069021', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-07T14:33:38.743Z'::timestamp, '2026-04-07T14:33:38.743Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068959.01.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068959.01.01', c_id, u_id, t_id, 'COMPLETED', 1468000, 1468000, 1468000, '2026-04-06T16:21:42.250Z'::timestamp, '2026-04-06T16:21:42.250Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000213') AND "tenantId" = t_id LIMIT 1), p_id), 15, 46000, 690000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000333') AND "tenantId" = t_id LIMIT 1), p_id), 2.1, 80000, 168000);

  -- Order HD068879
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068879', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-05T15:15:42.063Z'::timestamp, '2026-04-05T15:15:42.063Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068797
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068797', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-04T14:29:28.967Z'::timestamp, '2026-04-04T14:29:28.967Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068725
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068725', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-03T14:36:16.447Z'::timestamp, '2026-04-03T14:36:16.447Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068662
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068662', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-04-02T16:59:06.627Z'::timestamp, '2026-04-02T16:59:06.627Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068520
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068520', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-31T15:45:40.883Z'::timestamp, '2026-03-31T15:45:40.883Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068439
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068439', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-03-30T15:38:41.287Z'::timestamp, '2026-03-30T15:38:41.287Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD068370
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068370', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-30T07:34:14.253Z'::timestamp, '2026-03-30T07:34:14.253Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068348
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068348', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-29T14:19:37.913Z'::timestamp, '2026-03-29T14:19:37.913Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068299
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068299', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-28T17:28:32.260Z'::timestamp, '2026-03-28T17:28:32.260Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068213
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068213', c_id, u_id, t_id, 'COMPLETED', 216000, 216000, 216000, '2026-03-27T15:21:48.483Z'::timestamp, '2026-03-27T15:21:48.483Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000135') AND "tenantId" = t_id LIMIT 1), p_id), 3, 72000, 216000);

  -- Order HD068148
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068148', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-26T15:59:50.413Z'::timestamp, '2026-03-26T15:59:50.413Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD068071
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD068071', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-25T16:27:13.400Z'::timestamp, '2026-03-25T16:27:13.400Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD067985
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067985', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-03-24T14:58:25.330Z'::timestamp, '2026-03-24T14:58:25.330Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD067841.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067841.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-22T16:27:05.503Z'::timestamp, '2026-03-22T16:27:05.503Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD067841
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067841', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-21T16:46:53.390Z'::timestamp, '2026-03-21T16:46:53.390Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD067741.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067741.01', c_id, u_id, t_id, 'COMPLETED', 802000, 802000, 802000, '2026-03-20T14:53:47.160Z'::timestamp, '2026-03-20T14:53:47.160Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000333') AND "tenantId" = t_id LIMIT 1), p_id), 2.4, 80000, 192000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD067669
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067669', c_id, u_id, t_id, 'COMPLETED', 1045000, 1045000, 1045000, '2026-03-19T16:24:30.730Z'::timestamp, '2026-03-19T16:24:30.730Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000451') AND "tenantId" = t_id LIMIT 1), p_id), 5, 87000, 435000);

  -- Order HD067524
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067524', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-17T16:52:44.100Z'::timestamp, '2026-03-17T16:52:44.100Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD067453.01.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067453.01.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-16T17:14:31.040Z'::timestamp, '2026-03-16T17:14:31.040Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD067402
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067402', c_id, u_id, t_id, 'COMPLETED', 168000, 168000, 168000, '2026-03-16T08:18:22.250Z'::timestamp, '2026-03-16T08:18:22.250Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000333') AND "tenantId" = t_id LIMIT 1), p_id), 2.1, 80000, 168000);

  -- Order HD067308
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067308', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-03-14T15:49:14.657Z'::timestamp, '2026-03-14T15:49:14.657Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD067154
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067154', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-03-12T14:17:36.610Z'::timestamp, '2026-03-12T14:17:36.610Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD067094.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD067094.01', c_id, u_id, t_id, 'COMPLETED', 1954500, 1954500, 1954500, '2026-03-11T17:07:58.557Z'::timestamp, '2026-03-11T17:07:58.557Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 11.55, 90000, 1039500);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD066953
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066953', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-03-09T16:08:55.773Z'::timestamp, '2026-03-09T16:08:55.773Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD066796.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066796.01', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-03-07T14:22:05.507Z'::timestamp, '2026-03-07T14:22:05.507Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD066776
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066776', c_id, u_id, t_id, 'COMPLETED', 250000, 250000, 250000, '2026-03-07T09:47:36.203Z'::timestamp, '2026-03-07T09:47:36.203Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('G021') AND "tenantId" = t_id LIMIT 1), p_id), 5, 50000, 250000);

  -- Order HD066722
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066722', c_id, u_id, t_id, 'COMPLETED', 915000, 915000, 915000, '2026-03-06T14:28:27.450Z'::timestamp, '2026-03-06T14:28:27.450Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);

  -- Order HD066663
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066663', c_id, u_id, t_id, 'COMPLETED', 1815000, 1815000, 1815000, '2026-03-05T16:49:19.647Z'::timestamp, '2026-03-05T16:49:19.647Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000345') AND "tenantId" = t_id LIMIT 1), p_id), 15, 61000, 915000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD066447
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066447', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-03-02T15:15:22.033Z'::timestamp, '2026-03-02T15:15:22.033Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD066340
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066340', c_id, u_id, t_id, 'COMPLETED', 176000, 176000, 176000, '2026-03-01T07:51:47.563Z'::timestamp, '2026-03-01T07:51:47.563Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000333') AND "tenantId" = t_id LIMIT 1), p_id), 2.2, 80000, 176000);

  -- Order HD066308
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066308', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-02-28T14:32:22.520Z'::timestamp, '2026-02-28T14:32:22.520Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD066175
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066175', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-02-26T14:39:46.730Z'::timestamp, '2026-02-26T14:39:46.730Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD066122
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD066122', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-02-25T17:05:02.117Z'::timestamp, '2026-02-25T17:05:02.117Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD065983
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065983', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-02-23T16:02:26.730Z'::timestamp, '2026-02-23T16:02:26.730Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD065880
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065880', c_id, u_id, t_id, 'COMPLETED', 1220000, 1220000, 1220000, '2026-02-21T08:19:00.000Z'::timestamp, '2026-02-21T08:19:00.000Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 20, 61000, 1220000);

  -- Order HD065841
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065841', c_id, u_id, t_id, 'COMPLETED', 1220000, 1220000, 1220000, '2026-02-15T08:55:14.147Z'::timestamp, '2026-02-15T08:55:14.147Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 20, 61000, 1220000);

  -- Order HD065824
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065824', c_id, u_id, t_id, 'COMPLETED', 800000, 800000, 800000, '2026-02-14T16:46:45.303Z'::timestamp, '2026-02-14T16:46:45.303Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000451') AND "tenantId" = t_id LIMIT 1), p_id), 10, 80000, 800000);

  -- Order HD065801
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065801', c_id, u_id, t_id, 'COMPLETED', 800000, 800000, 800000, '2026-02-14T10:04:21.300Z'::timestamp, '2026-02-14T10:04:21.300Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000451') AND "tenantId" = t_id LIMIT 1), p_id), 10, 80000, 800000);

  -- Order HD065774
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065774', c_id, u_id, t_id, 'COMPLETED', 1220000, 1220000, 1220000, '2026-02-14T07:19:42.953Z'::timestamp, '2026-02-14T07:19:42.953Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 20, 61000, 1220000);

  -- Order HD065728.01.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065728.01.01', c_id, u_id, t_id, 'COMPLETED', 1010000, 1010000, 1010000, '2026-02-13T17:37:39.183Z'::timestamp, '2026-02-13T17:37:39.183Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000473') AND "tenantId" = t_id LIMIT 1), p_id), 5, 80000, 400000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD065683
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065683', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-02-12T14:07:43.770Z'::timestamp, '2026-02-12T14:07:43.770Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD065565
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065565', c_id, u_id, t_id, 'COMPLETED', 900000, 900000, 900000, '2026-02-10T15:46:07.430Z'::timestamp, '2026-02-10T15:46:07.430Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD065500
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065500', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-02-09T16:31:38.690Z'::timestamp, '2026-02-09T16:31:38.690Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD065361
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065361', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-02-07T17:20:41.663Z'::timestamp, '2026-02-07T17:20:41.663Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD065263
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065263', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-02-06T15:36:53.483Z'::timestamp, '2026-02-06T15:36:53.483Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD065195.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065195.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-02-06T07:41:53.777Z'::timestamp, '2026-02-06T07:41:53.777Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD065093
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065093', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-02-04T15:25:43.507Z'::timestamp, '2026-02-04T15:25:43.507Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD065018.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD065018.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-02-03T16:53:05.037Z'::timestamp, '2026-02-03T16:53:05.037Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD064803.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD064803.01', c_id, u_id, t_id, 'COMPLETED', 782000, 782000, 782000, '2026-01-31T17:59:56.383Z'::timestamp, '2026-01-31T17:59:56.383Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000333') AND "tenantId" = t_id LIMIT 1), p_id), 2.15, 80000, 172000);

  -- Order HD064684
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD064684', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-01-30T15:15:15.560Z'::timestamp, '2026-01-30T15:15:15.560Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD064511
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD064511', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-28T14:24:36.640Z'::timestamp, '2026-01-28T14:24:36.640Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD064447
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD064447', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-01-27T16:15:46.870Z'::timestamp, '2026-01-27T16:15:46.870Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD064361.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD064361.01', c_id, u_id, t_id, 'COMPLETED', 900000, 900000, 900000, '2026-01-26T16:39:23.787Z'::timestamp, '2026-01-26T16:39:23.787Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD064258.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD064258.01', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-01-25T16:09:59.400Z'::timestamp, '2026-01-25T16:09:59.400Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD064191
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD064191', c_id, u_id, t_id, 'COMPLETED', 760000, 760000, 760000, '2026-01-24T17:34:51.473Z'::timestamp, '2026-01-24T17:34:51.473Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000333') AND "tenantId" = t_id LIMIT 1), p_id), 2, 75000, 150000);

  -- Order HD063995.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063995.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-22T14:10:41.873Z'::timestamp, '2026-01-22T14:10:41.873Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063938
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063938', c_id, u_id, t_id, 'COMPLETED', 675000, 675000, 675000, '2026-01-21T16:18:45.137Z'::timestamp, '2026-01-21T16:18:45.137Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD063935
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063935', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-21T16:02:37.490Z'::timestamp, '2026-01-21T16:02:37.490Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063795.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063795.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-20T08:05:23.797Z'::timestamp, '2026-01-20T08:05:23.797Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063762.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063762.01', c_id, u_id, t_id, 'COMPLETED', 900000, 900000, 900000, '2026-01-19T14:42:28.907Z'::timestamp, '2026-01-19T14:42:28.907Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD063700.01.02
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063700.01.02', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-01-18T18:05:14.243Z'::timestamp, '2026-01-18T18:05:14.243Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063614
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063614', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-17T14:33:01.537Z'::timestamp, '2026-01-17T14:33:01.537Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063460
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063460', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-15T16:40:22.977Z'::timestamp, '2026-01-15T16:40:22.977Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063308.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063308.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-14T07:33:18.133Z'::timestamp, '2026-01-14T07:33:18.133Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063290
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063290', c_id, u_id, t_id, 'COMPLETED', 675000, 675000, 675000, '2026-01-13T15:54:54.757Z'::timestamp, '2026-01-13T15:54:54.757Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000136') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD063224.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063224.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-12T18:10:10.537Z'::timestamp, '2026-01-12T18:10:10.537Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063114.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063114.01', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-01-11T16:58:33.203Z'::timestamp, '2026-01-11T16:58:33.203Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('G002') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD063036.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD063036.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-10T15:55:21.167Z'::timestamp, '2026-01-10T15:55:21.167Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD062950
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD062950', c_id, u_id, t_id, 'COMPLETED', 1285000, 1285000, 1285000, '2026-01-09T15:26:54.587Z'::timestamp, '2026-01-09T15:26:54.587Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('G002') AND "tenantId" = t_id LIMIT 1), p_id), 15, 45000, 675000);

  -- Order HD062859.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD062859.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-08T14:20:05.297Z'::timestamp, '2026-01-08T14:20:05.297Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD062747.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD062747.01', c_id, u_id, t_id, 'COMPLETED', 1375000, 1375000, 1375000, '2026-01-07T07:41:38.743Z'::timestamp, '2026-01-07T07:41:38.743Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000078') AND "tenantId" = t_id LIMIT 1), p_id), 15, 51000, 765000);

  -- Order HD062726.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD062726.01', c_id, u_id, t_id, 'COMPLETED', 1375000, 1375000, 1375000, '2026-01-06T15:29:08.703Z'::timestamp, '2026-01-06T15:29:08.703Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000078') AND "tenantId" = t_id LIMIT 1), p_id), 15, 51000, 765000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD062633.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD062633.01', c_id, u_id, t_id, 'COMPLETED', 1510000, 1510000, 1510000, '2026-01-05T14:51:41.417Z'::timestamp, '2026-01-05T14:51:41.417Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);
  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000113') AND "tenantId" = t_id LIMIT 1), p_id), 10, 90000, 900000);

  -- Order HD062487.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD062487.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-03T15:57:17.680Z'::timestamp, '2026-01-03T15:57:17.680Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Order HD062422.01
  INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")
  VALUES ('HD062422.01', c_id, u_id, t_id, 'COMPLETED', 610000, 610000, 610000, '2026-01-02T17:35:00.933Z'::timestamp, '2026-01-02T17:35:00.933Z'::timestamp)
  RETURNING id INTO o_id;

  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)
  VALUES (o_id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('SP000088') AND "tenantId" = t_id LIMIT 1), p_id), 10, 61000, 610000);

  -- Cashbook Payments
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD062422.01', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-02T17:35:00.000Z'::timestamp, '2026-01-02T17:35:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD062487.01', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-03T15:57:00.000Z'::timestamp, '2026-01-03T15:57:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD062633.01', 'INCOME', 1510000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-05T14:51:00.000Z'::timestamp, '2026-01-05T14:51:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD062726.01', 'INCOME', 1375000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-06T15:29:00.000Z'::timestamp, '2026-01-06T15:29:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD062747.01', 'INCOME', 1375000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-07T07:41:00.000Z'::timestamp, '2026-01-07T07:41:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD062859.01', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-08T14:20:00.000Z'::timestamp, '2026-01-08T14:20:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD063036.01', 'INCOME', 1895000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-10T15:55:00.000Z'::timestamp, '2026-01-10T15:55:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD063224.01', 'INCOME', 1895000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-12T18:10:00.000Z'::timestamp, '2026-01-12T18:10:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD063308.01', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-14T07:33:00.000Z'::timestamp, '2026-01-14T07:33:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT005977', 'INCOME', 1285000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-15T22:30:00.000Z'::timestamp, '2026-01-15T22:30:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD063700.01.02', 'INCOME', 1895000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-18T18:05:00.000Z'::timestamp, '2026-01-18T18:05:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD063762.01', 'INCOME', 900000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-19T14:42:00.000Z'::timestamp, '2026-01-19T14:42:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD063795.01', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-20T08:05:00.000Z'::timestamp, '2026-01-20T08:05:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD063938', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-21T16:18:00.000Z'::timestamp, '2026-01-21T16:18:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT006101', 'INCOME', 675000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-21T17:14:00.000Z'::timestamp, '2026-01-21T17:14:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD063995.01', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-22T14:10:00.000Z'::timestamp, '2026-01-22T14:10:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD064258.01', 'INCOME', 2045000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-25T16:09:00.000Z'::timestamp, '2026-01-25T16:09:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD064361.01', 'INCOME', 900000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-26T16:39:00.000Z'::timestamp, '2026-01-26T16:39:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT006244', 'INCOME', 1895000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-29T22:00:00.000Z'::timestamp, '2026-01-29T22:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT006268', 'INCOME', 1285000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-30T23:00:00.000Z'::timestamp, '2026-01-30T23:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD064803.01', 'INCOME', 782000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-01-31T17:59:00.000Z'::timestamp, '2026-01-31T17:59:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD065018.01', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-02-03T16:53:00.000Z'::timestamp, '2026-02-03T16:53:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD065093', 'INCOME', 1285000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-02-04T15:25:00.000Z'::timestamp, '2026-02-04T15:25:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD065195.01', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-02-06T07:41:00.000Z'::timestamp, '2026-02-06T07:41:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT006438', 'INCOME', 1510000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-02-06T18:42:00.000Z'::timestamp, '2026-02-06T18:42:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD065361', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-02-07T17:20:00.000Z'::timestamp, '2026-02-07T17:20:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT006536', 'INCOME', 1285000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-02-09T18:04:00.000Z'::timestamp, '2026-02-09T18:04:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT006597', 'INCOME', 900000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-02-10T18:02:00.000Z'::timestamp, '2026-02-10T18:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT006690', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-02-12T18:03:00.000Z'::timestamp, '2026-02-12T18:03:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT006750', 'INCOME', 3030000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-02-14T11:10:00.000Z'::timestamp, '2026-02-14T11:10:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT006813', 'INCOME', 3240000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-02-22T17:15:00.000Z'::timestamp, '2026-02-22T17:15:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT006835', 'INCOME', 1285000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-02-23T17:38:00.000Z'::timestamp, '2026-02-23T17:38:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT006904', 'INCOME', 1510000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-02-25T18:06:00.000Z'::timestamp, '2026-02-25T18:06:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT006935', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-02-27T09:11:00.000Z'::timestamp, '2026-02-27T09:11:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT006992', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-02-28T16:52:00.000Z'::timestamp, '2026-02-28T16:52:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007006', 'INCOME', 176000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-01T09:44:00.000Z'::timestamp, '2026-03-01T09:44:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007051', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-02T22:30:00.000Z'::timestamp, '2026-03-02T22:30:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007149', 'INCOME', 1815000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-05T21:30:00.000Z'::timestamp, '2026-03-05T21:30:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007175', 'INCOME', 915000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-06T23:00:00.000Z'::timestamp, '2026-03-06T23:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD066796.01', 'INCOME', 1116000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-07T14:22:00.000Z'::timestamp, '2026-03-07T14:22:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007326', 'INCOME', 915000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-10T21:00:00.000Z'::timestamp, '2026-03-10T21:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007358', 'INCOME', 1954500, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-11T17:28:00.000Z'::timestamp, '2026-03-11T17:28:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007390', 'INCOME', 915000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-12T17:21:00.000Z'::timestamp, '2026-03-12T17:21:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007499', 'INCOME', 49000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-14T23:00:00.000Z'::timestamp, '2026-03-14T23:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007503', 'INCOME', 1083000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-16T09:14:00.000Z'::timestamp, '2026-03-16T09:14:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007527', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-16T17:46:00.000Z'::timestamp, '2026-03-16T17:46:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD067524', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-17T16:52:00.000Z'::timestamp, '2026-03-17T16:52:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007636', 'INCOME', 1045000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-19T17:34:00.000Z'::timestamp, '2026-03-19T17:34:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007676', 'INCOME', 802000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-20T17:17:00.000Z'::timestamp, '2026-03-20T17:17:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007714', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-21T17:02:00.000Z'::timestamp, '2026-03-21T17:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007780', 'INCOME', 2120000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-24T17:30:00.000Z'::timestamp, '2026-03-24T17:30:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007841', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-25T23:00:00.000Z'::timestamp, '2026-03-25T23:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007868', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-26T17:14:00.000Z'::timestamp, '2026-03-26T17:14:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007936', 'INCOME', 826000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-28T17:40:00.000Z'::timestamp, '2026-03-28T17:40:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT007979', 'INCOME', 1220000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-30T09:03:00.000Z'::timestamp, '2026-03-30T09:03:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008008', 'INCOME', 1510000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-03-30T18:03:00.000Z'::timestamp, '2026-03-30T18:03:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008147', 'INCOME', 1830000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-03T17:36:00.000Z'::timestamp, '2026-04-03T17:36:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008230', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-04T23:30:00.000Z'::timestamp, '2026-04-04T23:30:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008260', 'INCOME', 2078000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-06T16:37:00.000Z'::timestamp, '2026-04-06T16:37:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008332', 'INCOME', 2185000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-08T14:54:00.000Z'::timestamp, '2026-04-08T14:54:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008389', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-09T23:30:00.000Z'::timestamp, '2026-04-09T23:30:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008420', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-10T17:55:00.000Z'::timestamp, '2026-04-10T17:55:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008485', 'INCOME', 1220000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-12T23:30:00.000Z'::timestamp, '2026-04-12T23:30:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008570', 'INCOME', 1546000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-14T17:42:00.000Z'::timestamp, '2026-04-14T17:42:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008607', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-15T18:06:00.000Z'::timestamp, '2026-04-15T18:06:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008659', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-16T23:30:00.000Z'::timestamp, '2026-04-16T23:30:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008693', 'INCOME', 675000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-18T08:48:00.000Z'::timestamp, '2026-04-18T08:48:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008721', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-18T17:39:00.000Z'::timestamp, '2026-04-18T17:39:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008798', 'INCOME', 1220000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-20T17:31:00.000Z'::timestamp, '2026-04-20T17:31:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008840', 'INCOME', 900000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-21T17:26:00.000Z'::timestamp, '2026-04-21T17:26:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008884', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-22T17:29:00.000Z'::timestamp, '2026-04-22T17:29:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008934', 'INCOME', 1285000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-23T17:50:00.000Z'::timestamp, '2026-04-23T17:50:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT008989', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-24T17:38:00.000Z'::timestamp, '2026-04-24T17:38:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT009029', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-25T17:34:00.000Z'::timestamp, '2026-04-25T17:34:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT009097', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-27T17:25:00.000Z'::timestamp, '2026-04-27T17:25:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT009144', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-04-28T17:22:00.000Z'::timestamp, '2026-04-28T17:22:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT009296', 'INCOME', 1220000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-01T23:00:00.000Z'::timestamp, '2026-05-01T23:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT009322', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-02T20:00:00.000Z'::timestamp, '2026-05-02T20:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT009405', 'INCOME', 1045000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-04T17:31:00.000Z'::timestamp, '2026-05-04T17:31:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT009452', 'INCOME', 1285000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-05T17:39:00.000Z'::timestamp, '2026-05-05T17:39:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT009503', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-06T17:23:00.000Z'::timestamp, '2026-05-06T17:23:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT009573', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-08T09:05:00.000Z'::timestamp, '2026-05-08T09:05:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT009651', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-09T17:17:00.000Z'::timestamp, '2026-05-09T17:17:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT009770', 'INCOME', 1895000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-11T19:00:00.000Z'::timestamp, '2026-05-11T19:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT009793', 'INCOME', 675000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-12T17:29:00.000Z'::timestamp, '2026-05-12T17:29:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT009893', 'INCOME', 2727500, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-14T17:24:00.000Z'::timestamp, '2026-05-14T17:24:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT009992', 'INCOME', 1510000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-17T10:07:00.000Z'::timestamp, '2026-05-17T10:07:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT010080', 'INCOME', 1220000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-19T08:54:00.000Z'::timestamp, '2026-05-19T08:54:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT010109', 'INCOME', 1285000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-19T17:11:00.000Z'::timestamp, '2026-05-19T17:11:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT010186', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-20T18:30:00.000Z'::timestamp, '2026-05-20T18:30:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT010231', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-21T21:00:00.000Z'::timestamp, '2026-05-21T21:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT010429', 'INCOME', 1220000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-27T09:52:00.000Z'::timestamp, '2026-05-27T09:52:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT010457', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-27T17:47:00.000Z'::timestamp, '2026-05-27T17:47:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT010495', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-28T17:28:00.000Z'::timestamp, '2026-05-28T17:28:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT010538', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-29T17:59:00.000Z'::timestamp, '2026-05-29T17:59:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT010566', 'INCOME', 1510000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-05-30T17:32:00.000Z'::timestamp, '2026-05-30T17:32:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT010704', 'INCOME', 1895000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-02T17:27:00.000Z'::timestamp, '2026-06-02T17:27:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT010766', 'INCOME', 1510000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-03T17:20:00.000Z'::timestamp, '2026-06-03T17:20:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT010825', 'INCOME', 1285000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-04T17:47:00.000Z'::timestamp, '2026-06-04T17:47:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT010878', 'INCOME', 922000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-05T18:18:00.000Z'::timestamp, '2026-06-05T18:18:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT010931', 'INCOME', 1285000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-07T09:32:00.000Z'::timestamp, '2026-06-07T09:32:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT011010', 'INCOME', 1220000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-08T17:35:00.000Z'::timestamp, '2026-06-08T17:35:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT011073', 'INCOME', 1510000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-09T17:10:00.000Z'::timestamp, '2026-06-09T17:10:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT011116', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-10T17:46:00.000Z'::timestamp, '2026-06-10T17:46:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT011194', 'INCOME', 2215000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-13T08:03:00.000Z'::timestamp, '2026-06-13T08:03:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT011328', 'INCOME', 2120000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-15T17:31:00.000Z'::timestamp, '2026-06-15T17:31:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT011383', 'INCOME', 1285000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-16T17:10:00.000Z'::timestamp, '2026-06-16T17:10:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT011430', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-17T17:22:00.000Z'::timestamp, '2026-06-17T17:22:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT011506', 'INCOME', 1285000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-19T09:53:00.000Z'::timestamp, '2026-06-19T09:53:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT011577', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-20T17:18:00.000Z'::timestamp, '2026-06-20T17:18:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT011640', 'INCOME', 1510000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-22T10:25:00.000Z'::timestamp, '2026-06-22T10:25:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT011668', 'INCOME', 1285000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-22T18:10:00.000Z'::timestamp, '2026-06-22T18:10:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT011713', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-23T17:40:00.000Z'::timestamp, '2026-06-23T17:40:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT011837', 'INCOME', 1895000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-26T10:51:00.000Z'::timestamp, '2026-06-26T10:51:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT011912', 'INCOME', 1285000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-27T17:45:00.000Z'::timestamp, '2026-06-27T17:45:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TTHD075418.02', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-28T07:21:00.000Z'::timestamp, '2026-06-28T07:21:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT011969', 'INCOME', 1510000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-06-29T17:45:00.000Z'::timestamp, '2026-06-29T17:45:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT012035', 'INCOME', 1285000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-01T07:37:00.000Z'::timestamp, '2026-07-01T07:37:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT012064', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-01T14:19:00.000Z'::timestamp, '2026-07-01T14:19:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT012095', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-01T17:50:00.000Z'::timestamp, '2026-07-01T17:50:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT012137', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-02T17:17:00.000Z'::timestamp, '2026-07-02T17:17:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT012185', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-03T17:06:00.000Z'::timestamp, '2026-07-03T17:06:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT012254', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-05T09:02:00.000Z'::timestamp, '2026-07-05T09:02:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT012283', 'INCOME', 915000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-05T18:23:00.000Z'::timestamp, '2026-07-05T18:23:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT012332', 'INCOME', 1815000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-06T17:33:00.000Z'::timestamp, '2026-07-06T17:33:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT012393', 'INCOME', 915000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-07T17:51:00.000Z'::timestamp, '2026-07-07T17:51:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT012447', 'INCOME', 915000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-08T18:00:00.000Z'::timestamp, '2026-07-08T18:00:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT012599', 'INCOME', 2280000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-11T17:40:00.000Z'::timestamp, '2026-07-11T17:40:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT012663', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-13T17:28:00.000Z'::timestamp, '2026-07-13T17:28:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT012717', 'INCOME', 900000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-14T17:57:00.000Z'::timestamp, '2026-07-14T17:57:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT012824', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-16T17:33:00.000Z'::timestamp, '2026-07-16T17:33:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT012885', 'INCOME', 1220000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-17T17:40:00.000Z'::timestamp, '2026-07-17T17:40:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT013188', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-23T17:21:00.000Z'::timestamp, '2026-07-23T17:21:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT013226', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-24T17:51:00.000Z'::timestamp, '2026-07-24T17:51:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT013282', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-25T17:38:00.000Z'::timestamp, '2026-07-25T17:38:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT013358', 'INCOME', 1220000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-27T17:19:00.000Z'::timestamp, '2026-07-27T17:19:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT013402', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-28T17:39:00.000Z'::timestamp, '2026-07-28T17:39:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT013459', 'INCOME', 610000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-07-29T17:40:00.000Z'::timestamp, '2026-07-29T17:40:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT013604', 'INCOME', 915000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-08-01T17:08:00.000Z'::timestamp, '2026-08-01T17:08:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT013679', 'INCOME', 1845000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-08-04T10:25:00.000Z'::timestamp, '2026-08-04T10:25:00.000Z'::timestamp);
  INSERT INTO "CashbookEntry" (code, type, amount, "partnerType", "partnerCode", "partnerName", "customerId", note, status, "tenantId", "userId", "createdAt", "updatedAt")
  VALUES ('TT013703', 'INCOME', 915000, 'customer', 'KH000049', 'CÔ LÀNH -11 bàu càu 18 bỏ hàng trong nhà ra bên chợ lấy tiền', c_id, 'Thanh toán công nợ KiotViet', 'completed', t_id, u_id, '2026-08-04T17:16:00.000Z'::timestamp, '2026-08-04T17:16:00.000Z'::timestamp);
END $$;
