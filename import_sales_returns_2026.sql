-- SQL IMPORT SALES RETURNS FROM KIOTVIET EXCEL 2026
BEGIN;

DO $$
DECLARE
  t_id INT;
BEGIN
  SELECT id INTO t_id FROM "Tenant" LIMIT 1;

  -- Process return TH000330
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD078629' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001234' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000330';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000330', o_id, c_id, 280800, 0, 280800, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-08-05T14:38:41.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000471' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 5.85, 48000, 280800);
    END IF;
  END;

  -- Process return TH000329
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD078334' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001071' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000329';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000329', o_id, c_id, 240000, 0, 240000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-08-05T09:47:43.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000113' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 2.4, 100000, 240000);
    END IF;
  END;

  -- Process return TH000328
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD078471' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001134' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000328';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000328', o_id, c_id, 144000, 0, 144000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-08-01T14:43:44.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000445' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 3, 48000, 144000);
    END IF;
  END;

  -- Process return TH000327
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD078437' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001250' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000327';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000327', o_id, c_id, 729100, 0, 729100, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-08-01T14:10:14.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000445' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 15.62, 46000, 718520);
    END IF;
    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000445' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 0.23, 46000, 10580);
    END IF;
  END;

  -- Process return TH000325
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD078335' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH000448' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000325';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000325', o_id, c_id, 346200, 0, 346200, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-08-01T11:22:17.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000078' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 3.1, 52000, 161200);
    END IF;
    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000366' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 1, 185000, 185000);
    END IF;
  END;

  -- Process return TH000324
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD078239' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001182' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000324';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000324', o_id, c_id, 1701000, 0, 1701000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-07-30T10:48:14.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000287' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 16.2, 105000, 1701000);
    END IF;
  END;

  -- Process return TH000323
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD078138' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001086' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000323';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000323', o_id, c_id, 1475250, 0, 1475250, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-07-29T16:41:01.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000287' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 14.05, 105000, 1475250);
    END IF;
  END;

  -- Process return TH000322
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD078217' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001086' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000322';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000322', o_id, c_id, 5250000, 0, 5250000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-07-29T16:40:40.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000287' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 50, 105000, 5250000);
    END IF;
  END;

  -- Process return TH000321
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD078152' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001298' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000321';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000321', o_id, c_id, 535900, 0, 535900, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-07-29T08:14:13.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000471' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 11.65, 46000, 535900);
    END IF;
  END;

  -- Process return TH000320
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD077692.01' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001351{DEL}' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000320';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000320', o_id, c_id, 570000, 0, 570000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-07-23T09:20:03.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000110' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 10, 57000, 570000);
    END IF;
  END;

  -- Process return TH000319
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD076955' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001317' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000319';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000319', o_id, c_id, 287000, 0, 287000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-07-22T10:36:18.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000339' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 7, 41000, 287000);
    END IF;
  END;

  -- Process return TH000318
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD077562.01.01' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001086' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000318';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000318', o_id, c_id, 1810000, 0, 1810000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-07-21T15:48:20.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000287' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 18.1, 100000, 1810000.0000000002);
    END IF;
  END;

  -- Process return TH000317
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD076894' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH000781' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000317';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000317', o_id, c_id, 120400, 0, 120400, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-07-14T09:44:43.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000030' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 4.3, 28000, 120400);
    END IF;
  END;

  -- Process return TH000314
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD075302.01' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001086' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000314';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000314', o_id, c_id, 1670000, 0, 1670000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-06-25T15:06:43.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000287' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 16.7, 100000, 1670000);
    END IF;
  END;

  -- Process return TH000313
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD075201' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001086' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000313';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000313', o_id, c_id, 2000000, 0, 2000000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-06-24T16:25:14.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000344' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 20, 100000, 2000000);
    END IF;
  END;

  -- Process return TH000312
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD074049.01' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH000924' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000312';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000312', o_id, c_id, 936050, 0, 936050, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-06-11T07:52:20.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'H13' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 9.65, 97000, 936050);
    END IF;
  END;

  -- Process return TH000311
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD073277' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH000978' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000311';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000311', o_id, c_id, 425000, 0, 425000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-06-03T16:42:14.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'M45 (20 kg/T)' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 2.5, 170000, 425000);
    END IF;
  END;

  -- Process return TH000310
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD072656.01' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001035' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000310';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000310', o_id, c_id, 110725, 0, 110725, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-05-24T15:26:29.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'H15' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 1.075, 103000, 110725);
    END IF;
  END;

  -- Process return TH000309
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD070182.01.01.02.01' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001089' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000309';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000309', o_id, c_id, 568000, 0, 568000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-05-20T09:41:54.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'M45 (20 kg/T)' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 3.55, 160000, 568000);
    END IF;
  END;

  -- Process return TH000308
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD072332' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH000386' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000308';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000308', o_id, c_id, 515200, 0, 515200, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-05-19T15:20:45.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'H02' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 16.1, 32000, 515200.00000000006);
    END IF;
  END;

  -- Process return TH000307
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD072069' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH000900' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000307';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000307', o_id, c_id, 68400, 0, 68400, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-05-16T09:06:20.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'H02' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 1.8, 38000, 68400);
    END IF;
  END;

  -- Process return TH000306
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD070578' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH000711' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000306';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000306', o_id, c_id, 210000, 0, 210000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-04-28T14:55:31.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'B09' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 1, 210000, 210000);
    END IF;
  END;

  -- Process return TH000305
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD070287' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001252' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000305';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000305', o_id, c_id, 230400, 0, 230400, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-04-25T14:16:23.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000187' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 4.8, 48000, 230400);
    END IF;
  END;

  -- Process return TH000303
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD069265' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001141' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000303';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000303', o_id, c_id, 100000, 0, 100000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-04-12T17:45:29.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'G014' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 1, 100000, 100000);
    END IF;
  END;

  -- Process return TH000302
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD068510' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001120' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000302';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000302', o_id, c_id, 816000, 0, 816000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-04-01T11:08:14.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000293' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 4.8, 170000, 816000);
    END IF;
  END;

  -- Process return TH000300
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD068120' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH000900' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000300';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000300', o_id, c_id, 187000, 0, 187000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-03-26T14:41:29.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000442' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 1.1, 170000, 187000.00000000003);
    END IF;
  END;

  -- Process return TH000299
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD067156.01' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001210' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000299';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000299', o_id, c_id, 716450, 0, 716450, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-03-14T16:26:47.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'H07' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 8.05, 89000, 716450.0000000001);
    END IF;
  END;

  -- Process return TH000298
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD067167.01.01' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001120' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000298';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000298', o_id, c_id, 1120000, 0, 1120000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-03-13T14:45:04.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000293' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 7, 160000, 1120000);
    END IF;
  END;

  -- Process return TH000295
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD065930' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH000781' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000295';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000295', o_id, c_id, 1017600, 0, 1017600, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-03-04T10:11:52.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'H13' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 10.6, 96000, 1017600);
    END IF;
  END;

  -- Process return TH000294
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD065994.01' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH000900' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000294';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000294', o_id, c_id, 222750, 0, 222750, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-02-24T08:39:17.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000442' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 1.35, 165000, 222750.00000000003);
    END IF;
  END;

  -- Process return TH000293
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD065953' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001087' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000293';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000293', o_id, c_id, 1414000, 0, 1414000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-02-23T16:47:42.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000347' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 10.1, 140000, 1414000);
    END IF;
  END;

  -- Process return TH000292
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD065495.02' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001145' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000292';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000292', o_id, c_id, 24146850, 0, 24146850, '15.31 15.01 14.23
12.57 15.09 16.07
13.39 12.72 14.79
10.59 13.51 14.15
15.61 12.67 11.69
15.55 13.03 15.75
13.62', 'COMPLETED', '2026-02-14T08:12:28.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000362' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 265.35, 91000, 24146850.000000004);
    END IF;
  END;

  -- Process return TH000291
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD065641' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001068' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000291';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000291', o_id, c_id, 1101700, 0, 1101700, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-02-12T16:19:53.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000445' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 5.95, 46000, 273700);
    END IF;
    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000445' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 18, 46000, 828000);
    END IF;
  END;

  -- Process return TH000290
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD064151' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH000163' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000290';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000290', o_id, c_id, 1026000, 0, 1026000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-01-27T16:27:52.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000362' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 10.8, 95000, 1026000.0000000001);
    END IF;
  END;

  -- Process return TH000289
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD063392.01' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH000866' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000289';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000289', o_id, c_id, 1447200, 0, 1447200, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-01-20T11:26:18.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000093' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 30.15, 48000, 1447200);
    END IF;
  END;

  -- Process return TH000288
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD063538.01' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001018' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000288';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000288', o_id, c_id, 1204800, 0, 1204800, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-01-18T14:49:25.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000093' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 25.1, 48000, 1204800);
    END IF;
  END;

  -- Process return TH000287
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD063364' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001018' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000287';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000287', o_id, c_id, 388800, 0, 388800, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-01-15T07:51:38.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000093' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 8.1, 48000, 388800);
    END IF;
  END;

  -- Process return TH000286
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD063105' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001068' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000286';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000286', o_id, c_id, 370300, 0, 370300, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-01-11T16:05:51.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000471' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 8.05, 46000, 370300.00000000006);
    END IF;
  END;

  -- Process return TH000285
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD062673' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH000866' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000285';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000285', o_id, c_id, 1860000, 0, 1860000, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-01-11T11:00:45.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000093' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 38.75, 48000, 1860000);
    END IF;
  END;

  -- Process return TH000284
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD062823' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001018' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000284';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000284', o_id, c_id, 597600, 0, 597600, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-01-09T18:13:39.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000093' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 12.45, 48000, 597600);
    END IF;
  END;

  -- Process return TH000283
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD062823' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001018' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000283';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000283', o_id, c_id, 366240, 0, 366240, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-01-09T07:43:45.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000093' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 7.63, 48000, 366240);
    END IF;
  END;

  -- Process return TH000282
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD062740' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001018' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000282';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000282', o_id, c_id, 638400, 0, 638400, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-01-07T10:17:09.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000093' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 13.3, 48000, 638400);
    END IF;
  END;

  -- Process return TH000281
  DECLARE
    o_id INT := NULL;
    c_id INT := NULL;
    ret_id INT := NULL;
    p_id INT := NULL;
  BEGIN
    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = 'HD062573' LIMIT 1;
    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = 'KH001018' LIMIT 1;
    -- Delete existing return if re-importing
    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = 'TH000281';
    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")
    VALUES (t_id, 'TH000281', o_id, c_id, 376800, 0, 376800, 'Trả hàng từ file Excel KiotViet', 'COMPLETED', '2026-01-05T11:12:48.000Z'::timestamp)
    RETURNING id INTO ret_id;

    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = 'SP000093' LIMIT 1;
    IF p_id IS NOT NULL THEN
      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")
      VALUES (ret_id, p_id, 7.85, 48000, 376800);
    END IF;
  END;

END $$;

SELECT setval(pg_get_serial_sequence('"Return"', 'id'), COALESCE(MAX(id), 1)) FROM "Return";
SELECT setval(pg_get_serial_sequence('"ReturnItem"', 'id'), COALESCE(MAX(id), 1)) FROM "ReturnItem";
COMMIT;
