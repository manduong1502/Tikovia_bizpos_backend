-- ==========================================================
-- FULL IMPORT SCRIPT: 23 NHÀ CUNG CẤP & 1,664 PHIẾU NHẬP HÀNG TỪ KIOTVIET
-- ==========================================================

BEGIN;

-- 1. UPDATE/INSERT 23 NHÀ CUNG CẤP
INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000080', 'tý tuyết', '0905167572', NULL, NULL, NULL, 0, 50000000, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000079', 'linh sụn', '090512345682', NULL, NULL, NULL, 0, 240150000, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000078', 'công ty Bách phúc phương', '0931999235', NULL, NULL, NULL, 0, 2961300, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000077', 'công ty Hùng Trương', '0905000000', NULL, NULL, NULL, 4350000, 25750000, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000076', 'dana food', '125050536655', NULL, NULL, NULL, 0, 45100000, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000075', 'công ty bee bee', '09999999', NULL, NULL, NULL, 0, 12017250, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000074', 'nhà phân phối mực miền Trung', '0899488838', NULL, NULL, NULL, 0, 21159000, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000073', 'thiên tín food 0902339233', '0902339233', NULL, NULL, NULL, 58661100, 1816602989, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000072', '53 lỗ giáng 24', '0974066360', NULL, NULL, NULL, 2944000, 45249000, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000071', 'thuỷ triều', '0932504805', NULL, NULL, NULL, 0, 11265690, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000070', 'Cô Trung điện hòa', '123456789', NULL, NULL, NULL, 14700000, 23240000, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000069', 'người sành ăn', '0000000001', NULL, NULL, NULL, 0, 75869122, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000068', 'Cty PHÁT THỊNH VƯỢNG', '0969112299', NULL, NULL, NULL, 0, 0, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000066', 'công ty Sáng Ngọc', '0905145787', NULL, NULL, NULL, 16414215, 1188453901, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000065', 'Cty Anh Minh Quân', '0905121456', NULL, NULL, NULL, 0, 11695000, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000063', 'công ty tnhh thực phẩm t&t', '0903968745', NULL, NULL, NULL, 37305859, 2319691608, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000062', 'an thịnh food', '02363636006', NULL, NULL, NULL, 279153815, 10029145430, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000061', 'CHỊ TRI ( Minh Quang Food)', '0355678773', NULL, NULL, NULL, 304370396, 3781975536, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000058', 'công ty Quân Bảo', '0902954917', NULL, NULL, NULL, 0, 0, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000035', '07 phạm xuân ẩn', '09051245747', NULL, NULL, NULL, 1765000, 523340206, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000018', '65 Nguyễn Hồng ánh', '0935333956', NULL, NULL, NULL, 0, 0, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000016', 'thủy sản bắc trung nam', '0000000015', NULL, NULL, NULL, 0, 0, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

INSERT INTO "Supplier" ("tenantId", "code", "name", "phone", "email", "address", "note", "totalDebt", "totalSpent", "isActive", "createdAt", "updatedAt")
VALUES (1, 'NCC000004', 'Anh Sơn - Sụn Gà', '0935232242', NULL, '47 Vũ Xuân Thiều', NULL, 14310000, 403291890, true, NOW(), NOW())
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "name" = EXCLUDED."name",
  "phone" = EXCLUDED."phone",
  "email" = EXCLUDED."email",
  "address" = EXCLUDED."address",
  "note" = EXCLUDED."note",
  "totalDebt" = EXCLUDED."totalDebt",
  "totalSpent" = EXCLUDED."totalSpent",
  "updatedAt" = NOW();

-- 2. INSERT 1,664 PHIẾU NHẬP HÀNG
INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008056', id, 6115000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-04T17:09:03.220Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008055', id, 2000000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-04T16:50:17.173Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008054', id, 4050000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-04T16:45:17.167Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008053', id, 15562500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-04T16:43:07.650Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008051', id, 4050000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-04T14:22:12.710Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008050', id, 3150000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-04T10:17:41.147Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008049', id, 3450000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-04T10:16:59.090Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008048', id, 9112500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-03T18:38:20.047Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008047', id, 3450000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-03T18:37:49.827Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008046', id, 5610000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-03T18:36:59.017Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008045', id, 11600000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-03T18:35:52.993Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008044', id, 475200, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-03T18:35:05.447Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008043', id, 4050000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-03T18:33:50.437Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008042', id, 2650000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-03T18:33:13.173Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008041', id, 660000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-03T18:26:20.217Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008040', id, 12300000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-03T18:24:34.670Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008039', id, 6500000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-03T18:20:13.483Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008038', id, 16315620, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-03T18:16:39.923Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008037', id, 360000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-02T11:07:53.047Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008036', id, 18366580, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-02T09:36:55.520Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008035', id, 10125000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-02T09:34:55.150Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008034', id, 11545780, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-01T16:15:57.193Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008033', id, 63000000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-01T16:00:39.813Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008032', id, 15187500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-01T15:29:11.813Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008031', id, 16208388, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-01T15:28:21.893Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008030', id, 6500000, 6500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-08-01T11:21:22.760Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008029', id, 1197000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-31T17:34:30.103Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008028', id, 325000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-31T16:58:01.137Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008026', id, 99000000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-31T16:12:39.340Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008025', id, 16500000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-31T16:05:54.557Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008022', id, 700000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-31T15:55:39.117Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008021', id, 3450000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-31T15:54:29.150Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008020', id, 907200, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-31T15:52:53.627Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008019', id, 14812500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-30T14:58:46.793Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008024', id, 117647580, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-30T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008023', id, 28650000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-30T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008016', id, 47749180, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-29T18:27:40.820Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008015', id, 6700000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-29T16:44:26.237Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008014', id, 17329900, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-29T16:29:45.820Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008013', id, 7113015, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-29T16:28:26.797Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008012', id, 360000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-29T16:26:25.067Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008011', id, 6900000, 6900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-29T15:46:43.370Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008010', id, 1284000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-29T10:34:25.017Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008009', id, 2175000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-29T10:33:20.403Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008008', id, 15428215, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-28T17:36:14.520Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008007', id, 146000000, 74983900, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-28T17:04:26.537Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008006', id, 4500000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-28T14:38:50.427Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008005', id, 12510000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-28T14:33:44.260Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008004', id, 3525000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-28T14:32:44.470Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008003', id, 1015000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-28T14:31:58.593Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008002', id, 720000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-28T14:29:16.753Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008001', id, 3951220, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-28T14:23:13.267Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008000', id, 6600000, 6600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-28T09:45:23.300Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008018', id, 9301200, 1787944, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-28T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007998', id, 6400000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-27T15:38:51.810Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007997', id, 14087955, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-27T15:35:16.807Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007996', id, 9300000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-27T15:33:51.230Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007995', id, 402000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-27T15:32:49.877Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007994', id, 7600000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-27T14:54:12.693Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007993', id, 8250000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-27T14:36:22.507Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007992', id, 1000000, 1000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-27T09:10:21.023Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007991', id, 27225000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-26T16:13:38.220Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007990', id, 3525000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-26T14:58:42.547Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007989', id, 12425000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-26T14:57:46.070Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007988', id, 6000000, 6000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-26T10:45:17.423Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007987', id, 5850000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-26T09:20:22.370Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007986', id, 540000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-26T09:19:06.697Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007999', id, 9700000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-26T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007985', id, 19489400, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-25T15:54:31.520Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007984', id, 2450000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-25T15:30:29.263Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007983', id, 36474100, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-25T09:35:56.893Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007982', id, 2800000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-25T09:33:32.970Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007981', id, 3525000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-25T09:32:48.383Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007980', id, 1747000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-25T09:13:39.807Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN008052', id, 175000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-25T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007979', id, 8250000, 5513135, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-24T14:55:16.343Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007978', id, 9329600, 9329600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-24T14:23:06.687Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007977', id, 3500000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-24T10:33:05.887Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007976', id, 6400000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-24T10:20:14.717Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007975', id, 14625000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-24T10:11:39.527Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007974', id, 7590000, 7590000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-24T09:25:14.393Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007973', id, 360000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-23T16:48:54.483Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007972', id, 20625000, 20625000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-23T16:09:37.300Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007971', id, 144230010, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-23T15:20:30.903Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007970', id, 2000000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-23T15:19:51.620Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007969', id, 469000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-23T15:18:42.917Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007968', id, 30000000, 20000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-23T09:35:48.310Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000081{DEL}'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007967', id, 32918280, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-23T08:57:13.800Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007966', id, 10410200, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-23T08:16:52.260Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007965', id, 7455450, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-22T16:44:11.720Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007964', id, 684000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-22T16:39:07.597Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007963', id, 22073490, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-22T15:31:34.453Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007962', id, 14625000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-22T15:28:20.573Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007961', id, 12825000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-22T15:27:00.750Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007960', id, 175000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-22T15:20:03.347Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007951', id, 79361100, 79361100, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-22T14:56:14.030Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007950', id, 3650000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-22T14:43:15.287Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007949', id, 27925000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-22T14:41:49.477Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007948', id, 15241385, 15241385, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-22T14:38:54.313Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007947', id, 1500000, 1500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-22T14:30:37.763Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007946', id, 14062500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-21T17:08:33.183Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007945', id, 2052000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-21T17:07:56.377Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007944', id, 6258400, 6258400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-21T16:04:37.457Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007943', id, 3525000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-21T16:03:19.047Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007942', id, 14250000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-21T16:02:23.500Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007941', id, 5067540, 5067540, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-21T10:06:23.487Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007940', id, 360000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-21T10:03:55.143Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007939', id, 1782000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-21T10:03:16.240Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007938', id, 17200000, 17200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-21T09:57:48.130Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007937', id, 150000000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-20T17:03:43.137Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007936', id, 7500000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-20T16:39:02.883Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007935', id, 5610000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-20T16:29:32.133Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007934', id, 15200000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-20T16:28:34.113Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007933', id, 1368000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-20T16:27:35.960Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007932', id, 88210760, 88210760, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-20T15:07:53.390Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007931', id, 2900000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-20T09:57:52.870Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007930', id, 4500000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-20T08:42:35.843Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007928', id, 8250000, 8250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-19T15:48:02.653Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007927', id, 14122380, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-19T11:04:59.687Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007926', id, 14250000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-19T11:04:15.027Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007925', id, 9700000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-19T11:02:37.917Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007924', id, 325000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-19T11:00:00.020Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007923', id, 6400000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-18T16:18:57.097Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007922', id, 2106000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-18T14:51:21.280Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007921', id, 3625000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-18T14:50:29.590Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007920', id, 920000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-18T14:47:07.203Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007919', id, 4125000, 4125000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-18T14:18:56.730Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007929', id, 129000000, 129000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-18T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007959', id, 405000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-18T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007918', id, 8662500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-17T17:29:39.890Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007917', id, 3040000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-17T16:11:09.367Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007916', id, 6080000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-17T16:09:59.927Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007915', id, 15739650, 15739650, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-17T16:00:28.047Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007914', id, 5400000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-17T10:20:37.013Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007913', id, 5670000, 5670000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-17T10:06:14.593Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007912', id, 18625000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-17T09:17:27.227Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007958', id, 405000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-17T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007911', id, 1368000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-16T15:52:16.590Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007910', id, 11550000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-16T15:50:12.583Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007909', id, 20625000, 20625000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-16T15:11:10.800Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007907', id, 6000000, 6000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-16T15:08:14.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007906', id, 6268900, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-16T15:07:21.393Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007904', id, 11157050, 11157050, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-16T10:37:22.350Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007903', id, 4647840, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-16T09:42:34.887Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007902', id, 14625000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-16T09:41:49.627Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007957', id, 270000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-16T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007901', id, 10481180, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-15T18:14:12.813Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007900', id, 1140000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-15T16:39:29.307Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007898', id, 2052000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-15T15:47:47.290Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007896', id, 14625000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-15T14:28:55.197Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007895', id, 6400000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-15T14:27:55.197Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007894', id, 45000000, 45000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-15T14:25:32.320Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007893', id, 5500000, 2200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-15T14:20:26.340Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000076'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007905', id, 7210560, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-15T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007892', id, 95010480, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-14T16:14:38.477Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007891', id, 9425900, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-14T16:13:07.313Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007890', id, 4500000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-14T16:12:22.867Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007889', id, 2725000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-14T10:45:14.163Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007888', id, 719280, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-14T10:43:59.573Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007887', id, 61369950, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-14T10:42:28.380Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007886', id, 5625000, 5032146, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-14T10:41:34.973Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007885', id, 1000000, 1000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-14T10:19:00.113Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007884', id, 15401760, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-14T08:59:58.487Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007908', id, 8250000, 8250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-14T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007956', id, 175000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-14T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007879', id, 11550000, 11550000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-13T15:52:12.810Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007878', id, 717480, 717480, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-13T15:45:23.170Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007877', id, 15333960, 15333960, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-13T15:43:54.507Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007876', id, 3990000, 3990000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-13T15:42:54.497Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007875', id, 22449100, 22449100, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-13T10:41:07.637Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007883', id, 660000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-13T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007955', id, 180000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-13T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007880', id, 41496250, 41496250, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-12T15:56:22.983Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007881', id, 5400000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-12T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007882', id, 1782000, 1782000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-12T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007952', id, 900000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-12T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007954', id, 405000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-12T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007953', id, 180000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-12T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007874', id, 36750000, 36750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-11T16:45:08.603Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007873', id, 3821200, 3821200, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-11T16:31:36.200Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007872', id, 9600000, 9600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-11T16:30:10.433Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007871', id, 11100000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-11T15:03:48.757Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007870', id, 5700000, 5700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-11T14:59:21.520Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007869', id, 8250000, 8250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-11T14:22:54.360Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007868', id, 18375000, 18375000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-11T09:32:38.560Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007867', id, 9440000, 9440000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-11T09:09:51.830Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007866', id, 15185120, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-11T08:15:24.537Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007865', id, 10832354, 10832354, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-10T16:33:08.463Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007864', id, 8550000, 8550000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-10T16:10:05.777Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007863', id, 2000000, 2000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-10T16:09:16.533Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007862', id, 1800000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-10T11:08:29.063Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007861', id, 10053733, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-10T10:06:29.033Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007860', id, 25692000, 25692000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-10T10:03:33.010Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007858', id, 12625280, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-09T17:10:43.613Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007857', id, 6400000, 6400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-09T15:15:47.003Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007856', id, 6500000, 6500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-09T14:47:13.223Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007855', id, 2280000, 2280000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-08T17:49:11.667Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007854', id, 99000000, 99000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-08T17:24:15.450Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007853', id, 14250000, 14250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-08T15:50:42.377Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007852', id, 21158800, 21158800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-08T15:47:25.640Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007851', id, 7400000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-08T15:46:06.860Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007850', id, 840000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-08T14:55:48.823Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007849', id, 8250000, 8250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-07T16:27:22.207Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007847', id, 13300020, 13300020, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-07T15:43:08.217Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007846', id, 12484480, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-07T14:51:16.083Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007845', id, 30945590, 30945590, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-07T10:51:12.743Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007844', id, 2106000, 2106000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-07T10:49:58.760Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007843', id, 7400000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-07T10:42:46.303Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007837', id, 9000000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-07T08:37:53.647Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007836', id, 9600000, 9600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-06T15:46:02.413Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007835', id, 36931660, 36931660, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-06T15:32:59.110Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007834', id, 1600000, 1600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-06T15:30:27.597Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007833', id, 6641723, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-06T15:29:16.373Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007848', id, 16500000, 16500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-06T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007842', id, 175000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-06T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007831', id, 5400000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-05T08:34:55.250Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007830', id, 12650000, 12650000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-05T08:29:37.423Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007829', id, 21678080, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-05T08:15:51.837Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007841', id, 650000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-05T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007840', id, 175000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-05T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007828', id, 15449410, 15449410, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-04T16:55:01.277Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007826', id, 152000000, 152000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-04T16:49:03.937Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007825', id, 3625000, 3625000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-04T16:47:54.277Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007824', id, 2200000, 2200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-04T15:38:26.367Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007823', id, 840000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-04T11:16:03.053Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007822', id, 14386320, 14386320, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-04T11:15:16.313Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007821', id, 6305800, 6305800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-04T11:14:34.793Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007820', id, 23525300, 23525300, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-03T16:41:55.317Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007819', id, 9700000, 9700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-03T16:39:07.487Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007818', id, 900000, 900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-03T16:32:30.620Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007817', id, 6400000, 6400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-03T14:58:31.990Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007816', id, 14250000, 14250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-03T14:55:37.400Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007815', id, 12800000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-03T10:07:44.330Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007827', id, 14250000, 14250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-03T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007814', id, 163187760, 163187760, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-02T16:15:40.973Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007812', id, 7290000, 7290000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-02T15:34:42.210Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007811', id, 12902085, 12902085, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-02T15:33:43.687Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007810', id, 810000, 810000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-02T08:58:11.010Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007809', id, 23959085, 23959085, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-02T08:56:47.753Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007897', id, 6415664, 6415664, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-02T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007839', id, 1156000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-02T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007808', id, 3900000, 3900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-01T16:44:50.797Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007807', id, 1330000, 1330000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-01T16:42:55.303Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007806', id, 4050000, 4050000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-01T16:39:57.460Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007805', id, 12753920, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-01T16:17:58.040Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007804', id, 3750000, 3750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-01T15:56:26.927Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007803', id, 900000, 7000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-01T15:11:58.040Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007802', id, 30689555, 30689555, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-01T11:04:39.710Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007813', id, 325000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-01T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007838', id, 175000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-07-01T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007801', id, 11555330, 11555330, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-30T16:40:25.730Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007800', id, 10950000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-30T15:06:54.437Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007795', id, 5400000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-30T09:35:49.090Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007793', id, 41217750, 41217750, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-29T17:12:23.627Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007792', id, 929880, 929880, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-29T15:37:26.703Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007791', id, 6385392, 6385392, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-29T15:36:46.417Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007790', id, 4042500, 4042500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-29T14:39:52.380Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007789', id, 6400000, 6400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-29T14:38:01.323Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007788', id, 16200000, 16200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-29T14:31:36.693Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007787', id, 20300000, 14200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-29T10:38:23.110Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007786', id, 17060500, 17060500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-28T16:21:32.450Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007785', id, 27951840, 9885104, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-28T16:16:09.673Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007794', id, 10862387, 10862387, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-28T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007784', id, 577500, 577500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-27T17:03:32.720Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007783', id, 1140000, 1140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-27T16:41:55.573Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007782', id, 3675000, 3675000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-27T16:41:11.583Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007781', id, 22279520, 22279520, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-27T16:32:09.523Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007780', id, 6900000, 6900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-27T15:39:47.693Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007779', id, 2310000, 2310000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-27T10:10:44.700Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007778', id, 13077925, 13077925, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-27T10:08:33.663Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007796', id, 674000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-27T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007797', id, 405000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-27T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007777', id, 4050000, 4050000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-26T15:09:50.913Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007776', id, 1626900, 1626900, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-26T15:09:01.923Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007775', id, 360000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-26T14:47:23.147Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007768', id, 5400000, 5400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-26T09:37:25.130Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007767', id, 12200000, 12200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-26T09:23:45.673Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007766', id, 5250000, 5250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-26T09:22:37.163Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007765', id, 14062500, 14062500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-26T09:21:34.063Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007764', id, 12134100, 12134100, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-26T09:18:28.067Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007763', id, 10950000, 10950000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-26T09:09:09.453Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007762', id, 3100000, 3100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-25T16:30:13.257Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007761', id, 10666580, 10666580, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-25T15:39:40.780Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007760', id, 18896640, 18896640, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-25T14:15:01.897Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007759', id, 6100000, 6100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-25T09:30:20.090Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007758', id, 2887500, 2887500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-25T09:22:48.473Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007757', id, 31170150, 31170150, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-25T09:15:52.537Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007756', id, 4050000, 4050000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-25T09:14:56.440Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007774', id, 180000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-25T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007755', id, 650000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-24T16:48:35.407Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007754', id, 469000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-24T16:46:59.810Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007753', id, 1214320, 1214320, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-24T15:48:49.997Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007752', id, 1824840, 1824840, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-24T15:48:02.953Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007751', id, 7354290, 7354290, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-24T15:05:14.380Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007750', id, 4050000, 4050000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-24T15:01:39.607Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007749', id, 9450000, 9450000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-24T11:06:29.987Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007748', id, 939600, 939600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-24T11:01:09.077Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007747', id, 7250000, 7250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-24T08:17:31.610Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007746', id, 17716860, 17716860, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-23T16:31:25.827Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007745', id, 55362420, 55362420, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-23T16:29:38.150Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007744', id, 4050000, 4050000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-23T15:01:22.730Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007743', id, 5500000, 5500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-23T10:47:37.883Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000076'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007742', id, 5400000, 5400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-23T10:36:51.007Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007741', id, 2400000, 2400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-23T09:58:55.847Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007740', id, 1995000, 1995000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-23T09:58:12.057Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007799', id, 49875000, 49875000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-23T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007739', id, 1800000, 1800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-22T17:55:37.593Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007737', id, 1330000, 1330000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-22T17:15:26.747Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007736', id, 11997730, 11997730, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-22T17:13:51.787Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007735', id, 38000000, 38000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-22T17:09:39.540Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007734', id, 6400000, 6400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-22T17:06:58.327Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007733', id, 2033190, 2033190, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-22T17:03:14.697Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007732', id, 6690600, 6690600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-22T16:57:19.073Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007731', id, 14250000, 14250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-22T14:53:20.463Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007730', id, 2725000, 2725000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-22T10:19:13.703Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007729', id, 7250000, 7250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-22T10:17:49.560Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007727', id, 9516100, 9516100, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-21T09:45:56.003Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007726', id, 840000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-21T09:45:12.100Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007738', id, 6262200, 6262200, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-21T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007725', id, 390000, 390000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-20T16:42:40.343Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007724', id, 1015000, 1015000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-20T16:28:47.803Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007723', id, 3400000, 3400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-20T16:19:41.443Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007722', id, 3750000, 3750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-20T16:17:27.690Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007721', id, 156877200, 156877200, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-20T15:39:36.627Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007720', id, 4437272, 4437272, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-20T15:38:51.580Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007719', id, 4050000, 4050000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-20T15:19:21.960Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007718', id, 7032500, 7032500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-20T15:07:14.187Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007728', id, 67500000, 67500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-20T14:41:33.397Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007717', id, 6100000, 6100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-20T13:59:44.197Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007716', id, 6920558, 6920558, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-20T09:03:38.643Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007773', id, 1250000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-20T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007715', id, 105835000, 105835000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-19T15:29:47.163Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007714', id, 1750000, 1750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-19T15:26:29.010Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007713', id, 4050000, 4050000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-19T15:25:42.580Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007712', id, 12157500, 12157500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-19T15:24:25.740Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007711', id, 9700000, 9700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-19T10:27:26.330Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007710', id, 30400000, 30400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-19T09:41:21.577Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007709', id, 26687005, 26687005, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-19T09:36:50.347Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007708', id, 724320, 724320, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-18T16:21:53.927Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007707', id, 10889077, 10889077, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-18T15:21:22.203Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007706', id, 29971425, 29971425, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-18T15:19:02.903Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007705', id, 60395000, 60395000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-18T15:18:08.910Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007704', id, 390000, 390000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-18T15:15:23.047Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007703', id, 22933323, 22933323, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-18T15:14:09.877Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007702', id, 12200000, 12200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-18T15:06:53.133Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007701', id, 2880000, 2880000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-18T15:06:08.800Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007700', id, 1140000, 1140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-18T15:02:36.913Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007699', id, 7250000, 7250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-18T10:36:51.303Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007698', id, 3325000, 3325000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-18T10:36:08.483Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007697', id, 4100000, 4100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-18T10:35:08.870Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007696', id, 900000, 900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-18T09:17:19.530Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007772', id, 175000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-18T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007695', id, 577500, 577500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-17T15:54:32.387Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007693', id, 14426480, 14426480, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-17T10:14:21.587Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007692', id, 5612500, 5612500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-17T10:12:36.433Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007691', id, 2200000, 2200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-17T10:09:59.227Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007690', id, 5491800, 5491800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-17T10:09:10.157Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007689', id, 12700160, 12700160, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-16T16:50:12.180Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007688', id, 4100000, 4100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-16T09:41:18.330Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007687', id, 2800000, 2800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-16T09:35:15.317Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007694', id, 11268075, 11268075, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-16T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007686', id, 3996000, 3996000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-15T16:42:37.537Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007685', id, 7250000, 7250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-15T15:26:06.847Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007684', id, 325000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-15T15:08:41.607Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007683', id, 15715300, 15715300, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-15T09:19:56.023Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007682', id, 6400000, 6400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-15T09:12:12.667Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007771', id, 270000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-15T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007770', id, 262500, 262500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-15T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007798', id, 262500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-15T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007681', id, 16635775, 16635775, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-14T16:02:57.780Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007680', id, 24320000, 24320000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-14T14:27:32.823Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007679', id, 4100000, 4100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-14T14:25:22.753Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007678', id, 2322000, 2322000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-14T10:16:08.360Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007677', id, 1995000, 1995000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-14T10:14:45.937Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007769', id, 350000, 0, 'liễu cơm 10*35', 'COMPLETED'::"PurchaseOrderStatus", '2026-06-14T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007676', id, 1330000, 1330000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-13T16:44:47.460Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007674', id, 1640000, 1640000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-13T16:42:01.200Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007673', id, 11460000, 11460000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-13T14:36:51.900Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007672', id, 13578000, 13578000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-13T10:16:09.877Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000074'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007671', id, 12200000, 12200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-13T09:36:24.713Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007670', id, 4575000, 4575000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-13T09:34:21.297Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007668', id, 10600000, 10600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-13T09:27:59.877Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007675', id, 111000000, 111000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-12T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007667', id, 9700000, 9700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-12T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007669', id, 1650000, 1650000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-12T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007666', id, 14568400, 14568400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-11T17:30:33.957Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007665', id, 6220500, 6220500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-11T15:36:06.473Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007664', id, 3996000, 3996000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-11T14:49:45.813Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007663', id, 6250000, 6250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-11T14:42:33.637Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007654', id, 1344000, 1344000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-10T15:37:08.767Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007653', id, 12300800, 12300800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-10T15:16:27.257Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007652', id, 6400000, 6400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-10T14:50:15.300Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007651', id, 18300000, 18300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-10T11:16:46.030Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007650', id, 1500000, 1500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-10T11:15:35.407Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007662', id, 27520000, 27520000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-10T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007649', id, 5800000, 5800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-09T17:34:36.267Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007648', id, 2250000, 2250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-09T15:51:35.227Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007647', id, 27450000, 27450000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-09T15:49:59.423Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007646', id, 11145195, 11145195, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-09T15:49:05.820Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007645', id, 15440000, 15440000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-09T14:49:47.427Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007644', id, 8785240, 8785240, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-09T14:47:11.230Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007643', id, 12881900, 12881900, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-09T10:18:37.640Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007642', id, 570000, 570000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-09T10:14:24.640Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007641', id, 2280000, 2280000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-09T10:14:07.680Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007640', id, 1995000, 1995000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-09T10:13:27.420Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007639', id, 1344000, 1344000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-09T10:12:28.820Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007638', id, 6500000, 6500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-09T09:38:12.963Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007637', id, 8100000, 8100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-08T17:44:13.763Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007636', id, 15400000, 15400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-08T16:43:01.653Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007635', id, 15087800, 15087800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-08T10:02:18.987Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007631', id, 49500000, 49500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-07T16:38:00.613Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007630', id, 900000, 12150000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-07T10:08:03.057Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007629', id, 12200000, 12200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-07T09:28:54.960Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007628', id, 3900000, 3900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-07T09:26:51.017Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007627', id, 1140000, 2280000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-07T09:01:32.370Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007626', id, 5994000, 5994000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-07T08:53:29.877Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007634', id, 8437500, 8437500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-07T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007632', id, 2900000, 2900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-07T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007633', id, 2725000, 2725000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-07T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007661', id, 405000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-07T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007625', id, 10000000, 10000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-06T16:44:29.750Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007624', id, 2464000, 2464000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-06T16:10:45.443Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007623', id, 2200000, 2200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-06T16:07:42.613Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007622', id, 952560, 952560, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-06T16:07:07.180Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007621', id, 2106000, 2106000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-06T16:06:26.603Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007620', id, 3117800, 3117800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-06T16:05:54.707Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007619', id, 21886850, 21886850, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-06T16:03:24.353Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007618', id, 3900000, 3900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-06T09:52:41.377Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007660', id, 350000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-06T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007617', id, 3500000, 3500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-05T15:05:21.753Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007616', id, 2138400, 2138400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-05T15:04:46.093Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007615', id, 6400000, 6400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-05T15:03:49.847Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007614', id, 24551450, 24551450, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-05T15:02:08.830Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007613', id, 6500000, 6500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-05T14:23:19.150Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007612', id, 1140000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-05T09:41:09.273Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007611', id, 11460000, 11460000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-05T08:20:41.230Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007659', id, 775000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-05T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007610', id, 18682510, 18682510, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-04T15:39:34.520Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007609', id, 5705000, 5705000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-04T15:29:06.333Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007608', id, 53466000, 53466000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-04T15:27:35.367Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007607', id, 16750000, 5500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-04T15:00:24.913Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007606', id, 2660000, 2660000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-04T09:33:08.743Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007605', id, 1195000, 1195000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-04T09:32:41.157Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007604', id, 6048000, 6048000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-04T09:13:54.663Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007603', id, 3900000, 3900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-04T08:53:09.893Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007602', id, 9700000, 9700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-03T17:16:06.383Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007601', id, 19000000, 19000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-03T17:02:06.647Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007599', id, 98632060, 98632060, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-03T16:50:11.353Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007598', id, 55500000, 55500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-03T16:49:12.853Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007597', id, 12200000, 12200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-03T16:19:57.873Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007596', id, 2250000, 2250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-03T16:17:08.820Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007595', id, 254997445, 254997445, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-03T15:26:06.917Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007594', id, 11340000, 11340000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-03T15:15:38.903Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007592', id, 32848160, 32848160, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-03T10:42:37.260Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007591', id, 9421800, 9421800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-03T10:41:04.027Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007658', id, 357500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-03T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007590', id, 6252500, 6252500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-02T18:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007589', id, 939600, 939600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-02T15:38:10.057Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007588', id, 1500000, 1500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-02T15:35:30.880Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007587', id, 3900000, 3900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-02T15:21:16.040Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007586', id, 325000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-02T14:54:57.157Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007585', id, 6160000, 6160000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-02T09:28:38.383Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007584', id, 3440800, 3440800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-02T09:27:55.123Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007583', id, 5500000, 5500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-02T07:59:40.630Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000076'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007657', id, 175000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-02T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007582', id, 150000000, 150000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-01T16:10:15.070Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007581', id, 18922400, 18922400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-01T16:08:55.447Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007580', id, 2725000, 2725000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-01T15:39:08.050Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007579', id, 14300000, 14300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-01T15:01:22.893Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007578', id, 3900000, 3900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-01T11:20:49.363Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007593', id, 34991375, 34991375, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-06-01T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007577', id, 8100000, 8100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-31T15:58:08.820Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007576', id, 12200000, 12200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-31T09:29:50.243Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007575', id, 2850000, 2850000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-31T09:27:44.293Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007600', id, 19950000, 19950000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-30T17:30:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007574', id, 13257685, 13257685, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-30T16:37:41.650Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007573', id, 9700000, 9700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-30T16:11:24.103Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007571', id, 20258931, 20258931, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-30T15:44:10.057Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007570', id, 6092600, 6092600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-30T15:43:10.547Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007569', id, 6400000, 6400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-30T15:40:33.207Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007568', id, 1140000, 1140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-30T15:39:29.867Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007567', id, 900000, 900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-30T15:39:09.987Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007566', id, 8100000, 8100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-29T17:09:09.270Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007564', id, 5375000, 5375000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-29T15:53:58.610Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007563', id, 16128574, 16128574, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-29T14:51:34.920Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007562', id, 4575000, 4575000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-29T14:50:22.443Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007561', id, 3450000, 3500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-29T14:49:12.213Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007560', id, 5127360, 5127360, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-29T14:48:09.063Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007559', id, 27000000, 27000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-29T09:34:27.593Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007558', id, 6160000, 6160000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-28T15:24:06.980Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007557', id, 140000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-28T15:06:52.173Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007556', id, 2423136, 2423136, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-28T09:49:03.253Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007555', id, 18000000, 18000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-28T08:54:09.960Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007554', id, 14325000, 14325000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-27T15:20:28.800Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007553', id, 57000000, 57000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-27T15:08:14.560Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007552', id, 3500000, 3500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-27T14:52:57.837Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007551', id, 9557450, 9557450, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-27T09:41:58.700Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007565', id, 8709072, 8709072, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-27T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007550', id, 4032000, 4032000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-26T16:39:15.470Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007549', id, 900000, 900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-26T15:47:55.807Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007548', id, 1344000, 1344000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-26T15:10:44.057Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007547', id, 3075000, 3075000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-26T15:04:16.393Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007546', id, 10557850, 10557850, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-26T15:02:27.627Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007545', id, 780000, 780000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-26T09:50:14.617Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007544', id, 28084134, 28084134, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-26T09:33:59.590Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007656', id, 810000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-26T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007543', id, 8959236, 8959236, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-25T16:10:56.780Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007542', id, 24660827, 24660827, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-25T15:51:20.030Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007540', id, 2800000, 2800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-25T14:35:51.510Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007539', id, 6400000, 6400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-25T14:34:40.720Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007538', id, 19980000, 19980000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-25T10:41:53.660Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007537', id, 2593536, 2593536, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-25T10:27:29.293Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007536', id, 12200000, 12200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-25T09:23:14.450Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007535', id, 3075000, 3075000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-25T09:22:20.100Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007655', id, 135000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-25T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007534', id, 5040000, 5040000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-24T15:42:43.520Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007533', id, 3546600, 3546600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-24T09:49:58.580Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007532', id, 6700000, 6700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-24T09:49:04.227Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007526', id, 18375000, 18375000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-23T08:42:21.503Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007525', id, 20775000, 20775000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-23T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007528', id, 13425000, 13425000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-23T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007541', id, 12150000, 12150000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-23T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007530', id, 7500000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-23T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007527', id, 2940000, 2940000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-23T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007531', id, 2900000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-23T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007529', id, 2343936, 2343936, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-23T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007524', id, 240000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-22T16:16:09.720Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007521', id, 24670663, 24670663, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-22T16:00:31.967Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007520', id, 3000000, 3000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-22T15:56:49.570Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007519', id, 10763135, 10763135, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-22T14:53:05.077Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007517', id, 64660050, 64660050, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-21T17:04:16.330Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007516', id, 9700000, 9700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-21T15:55:51.537Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007515', id, 92745000, 92745000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-21T15:53:55.657Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007514', id, 3000000, 3000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-21T15:42:12.637Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007513', id, 1140000, 1140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-21T10:27:37.390Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007512', id, 175000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-21T09:55:31.973Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007511', id, 6160000, 6160000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-21T09:41:57.140Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007510', id, 25800000, 25800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-21T09:41:17.107Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007509', id, 10580000, 10580000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-21T09:39:42.560Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007523', id, 270000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-21T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007522', id, 240000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-21T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007508', id, 45050000, 45050000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-20T16:06:13.113Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007507', id, 16401947, 16401947, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-20T16:03:22.600Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007506', id, 110000000, 110000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-20T16:02:34.643Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007505', id, 5124330, 5124330, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-20T15:54:36.010Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007504', id, 6750000, 4650000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-20T15:53:18.360Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007503', id, 3825000, 3825000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-20T15:30:39.040Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007502', id, 3000000, 3000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-20T14:58:13.897Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007501', id, 2327616, 2327616, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-20T10:01:22.700Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007500', id, 638400, 638400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-20T10:00:45.943Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007499', id, 17200000, 17200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-20T09:33:34.013Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007498', id, 10507800, 10507800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-20T09:32:05.863Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007497', id, 22357041, 22357041, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-19T16:20:06.880Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007495', id, 12200000, 12200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-19T15:06:10.977Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007494', id, 5777310, 5777310, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-19T15:05:31.993Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007493', id, 8710540, 8710540, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-19T14:48:23.947Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007492', id, 6481440, 6481440, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-19T09:16:41.903Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007491', id, 2138400, 2138400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-19T09:08:37.960Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007518', id, 82855000, 82855000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-19T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007490', id, 12200000, 12200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-18T18:06:26.780Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007489', id, 5994000, 5994000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-18T17:03:52.007Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007488', id, 3000000, 3000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-18T15:57:03.787Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007487', id, 5994000, 5994000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-18T15:16:31.173Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007486', id, 19941041, 19941041, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-18T10:07:16.267Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007485', id, 9125000, 9125000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-18T10:05:23.197Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007484', id, 7599541, 7599541, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-18T10:01:03.087Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007496', id, 80002480, 80002480, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-18T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007481', id, 20015560, 20015560, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-17T14:48:51.980Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007480', id, 16423535, 16423535, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-17T10:48:53.753Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007479', id, 4440000, 4440000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-17T09:57:48.293Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007478', id, 12200000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-17T09:56:39.407Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC lẻ'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007477', id, 7200000, 7200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-17T09:55:02.147Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007476', id, 9700000, 9700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-17T08:18:47.540Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007475', id, 3234000, 3234000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-16T16:53:57.067Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007474', id, 3000000, 3000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-16T16:52:35.213Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007473', id, 5500000, 5500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-16T16:10:07.083Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000076'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007472', id, 960000, 960000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-16T15:48:51.623Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007471', id, 11600000, 11600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-16T15:01:26.043Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007470', id, 10800000, 10800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-16T09:56:10.713Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007469', id, 6160000, 6160000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-16T09:53:18.620Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007468', id, 9249240, 9249240, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-16T09:52:38.620Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007483', id, 675000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-16T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007467', id, 3650000, 3650000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-15T15:49:29.473Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007466', id, 15700000, 15700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-15T15:48:43.030Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007465', id, 3075000, 3075000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-15T15:48:05.220Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007464', id, 2106000, 2106000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-15T15:45:41.563Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007463', id, 5375000, 5375000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-15T15:42:28.623Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007462', id, 2149056, 2149056, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-15T15:13:33.833Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007461', id, 400000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-14T15:48:30.767Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007460', id, 5832210, 5832210, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-14T15:45:44.793Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007459', id, 8994000, 8994000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-14T15:43:14.823Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007458', id, 21946245, 21946245, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-14T15:41:56.630Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007457', id, 3650000, 3650000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-14T15:41:15.273Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007456', id, 25800000, 25800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-14T15:40:25.143Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007455', id, 2280000, 2280000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-14T15:39:48.373Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007482', id, 175000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-14T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007453', id, 6600000, 13200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-13T17:22:06.853Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007452', id, 16499680, 16499680, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-13T16:42:01.613Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007451', id, 450000, 450000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-13T16:39:01.393Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007450', id, 1188000, 1188000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-13T16:38:12.927Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007449', id, 19450000, 19450000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-13T10:58:54.270Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007448', id, 1293600, 1293600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-13T10:57:55.393Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007447', id, 3221400, 3221400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-13T10:57:19.610Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007445', id, 630000, 630000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-12T15:46:37.673Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007444', id, 150000, 150000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-12T15:27:35.533Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007443', id, 3150000, 3150000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-12T15:26:55.900Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007442', id, 3600000, 3600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-12T15:25:24.967Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007441', id, 11300000, 11300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-12T15:24:45.620Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007440', id, 87750000, 87750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-12T15:07:46.477Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007439', id, 17550000, 17550000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-12T15:06:59.823Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007438', id, 2262336, 2262336, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-12T09:57:37.187Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007437', id, 325000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-12T09:52:06.680Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007436', id, 2825000, 2825000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-12T09:51:25.663Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007435', id, 21024891, 21024891, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-12T09:50:09.653Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007434', id, 16697107, 16697107, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-11T17:35:02.317Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007433', id, 3300000, 3300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-11T15:39:04.913Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007432', id, 11116090, 11116090, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-11T15:38:18.127Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007431', id, 18720800, 18720800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-11T15:36:46.207Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007430', id, 9075000, 9075000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-11T09:47:23.980Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007427', id, 10250000, 10250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-10T09:44:12.977Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007426', id, 1650000, 1650000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-10T09:43:24.453Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007425', id, 9400000, 9400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-10T09:42:24.557Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007424', id, 89100000, 89100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-10T08:30:58.403Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007423', id, 1232000, 1232000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-09T16:28:57.823Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007422', id, 3700000, 3700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-09T15:00:55.130Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007421', id, 2138400, 2138400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-09T14:59:32.483Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007420', id, 2378496, 2378496, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-09T10:15:33.943Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007419', id, 1140000, 1140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-09T09:43:39.193Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007418', id, 14550000, 14550000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-09T08:40:44.220Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007428', id, 600000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-09T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007429', id, 405000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-09T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007416', id, 1188000, 1188000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-08T16:08:09.400Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007415', id, 4928000, 4928000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-08T15:07:56.493Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007414', id, 3000000, 3000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-08T15:07:11.307Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007413', id, 6190000, 6190000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-08T15:05:19.493Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007412', id, 4300000, 4300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-08T15:04:15.937Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007411', id, 2085000, 2085000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-08T15:03:21.173Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007410', id, 5301120, 5301120, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-08T10:11:52.257Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007408', id, 3267600, 3267600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-07T16:09:01.277Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007407', id, 2920000, 2920000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-07T16:02:05.267Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007406', id, 5280000, 5280000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-07T16:01:06.360Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007405', id, 61667005, 61667005, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-07T16:00:15.463Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007404', id, 3238200, 3238200, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-07T15:59:00.393Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007403', id, 1750000, 1750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-07T15:57:05.643Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007402', id, 10751360, 10751360, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-07T15:53:33.320Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007401', id, 35224128, 35224128, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-07T09:59:38.640Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007399', id, 15994735, 15994735, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-07T09:58:00.373Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007398', id, 3650000, 3650000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-07T09:57:16.213Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007417', id, 1320000, 1320000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-07T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007409', id, 592500, 592500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-06T18:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007396', id, 3140000, 3140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-06T17:12:07.583Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007395', id, 16684547, 16684547, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-06T16:21:23.937Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007394', id, 2962500, 2962500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-06T16:20:10.923Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007393', id, 5840000, 5840000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-06T16:19:15.857Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007392', id, 6600000, 6600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-06T16:18:28.127Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007391', id, 25650000, 25650000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-06T09:51:20.633Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007390', id, 29978208, 29978208, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-06T09:50:38.873Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007389', id, 2442336, 2442336, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-06T08:23:42.640Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007454', id, 6600000, 6600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-06T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007388', id, 1950000, 1950000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-05T16:43:44.850Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007387', id, 3945102, 3945102, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-05T16:42:16.973Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007386', id, 4793878, 4793878, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-05T16:32:55.683Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007385', id, 3280000, 3280000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-05T15:05:19.137Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007384', id, 2322000, 2322000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-05T10:08:59.043Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007383', id, 17100000, 17100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-05T10:08:04.247Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007376', id, 21573760, 21573760, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-04T16:11:31.310Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007375', id, 140000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-04T15:18:27.573Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007374', id, 750000, 750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-04T15:09:38.647Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007373', id, 208500000, 208500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-04T15:08:42.290Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007372', id, 37696485, 37696485, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-04T15:07:16.250Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007371', id, 2250000, 2250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-04T15:06:06.593Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007370', id, 1750000, 1750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-04T15:04:31.713Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007369', id, 19980000, 19980000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-04T11:10:19.173Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007368', id, 54450000, 54450000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-04T11:03:18.910Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007367', id, 19448340, 19448340, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-04T09:04:08.883Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007366', id, 3246600, 3246600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-04T08:57:11.057Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007382', id, 87500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-04T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007365', id, 12375000, 12375000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-03T09:31:59.303Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007381', id, 445000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-03T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007364', id, 14625000, 14625000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-02T16:07:07.220Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007363', id, 14179400, 14179400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-02T15:40:09.320Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007362', id, 952560, 952560, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-02T15:38:51.113Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007361', id, 7906350, 7906350, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-02T09:28:57.410Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007360', id, 1750000, 1750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-02T09:27:22.920Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007380', id, 350000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-02T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007359', id, 14600000, 14600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-01T15:48:54.153Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007358', id, 2450000, 2450000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-01T14:41:06.830Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007379', id, 175000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-05-01T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007357', id, 5000000, 5000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-30T17:01:30.070Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007378', id, 900000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-30T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007356', id, 1140000, 1140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-29T16:37:59.800Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007355', id, 50925000, 50925000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-29T16:07:25.877Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007354', id, 71335000, 71335000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-29T16:04:41.320Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007353', id, 22534132, 22534132, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-29T15:34:06.403Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007352', id, 570000, 570000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-29T15:33:10.637Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007351', id, 10585210, 10585210, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-29T15:32:24.900Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007350', id, 8480000, 8480000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-29T15:31:38.610Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007349', id, 2120000, 2120000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-29T15:31:17.233Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007348', id, 16095640, 16095640, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-29T15:30:36.920Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007347', id, 7200000, 7200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-29T15:29:32.627Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007346', id, 6160000, 6160000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-29T14:59:46.903Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007345', id, 1762200, 1762200, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-29T14:59:04.117Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000071'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007344', id, 1380000, 1380000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-28T15:37:55.137Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007343', id, 960000, 960000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-28T15:35:54.100Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007342', id, 9990000, 9990000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-28T14:51:56.453Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007341', id, 6160000, 6160000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-28T09:47:24.580Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007377', id, 175000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-28T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007340', id, 800000, 800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-27T16:08:20.213Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007339', id, 37200000, 37200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-27T16:06:42.930Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007338', id, 6896600, 6896600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-27T15:33:58.363Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007337', id, 13500000, 13500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-27T15:32:35.933Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007328', id, 6600000, 11100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-27T15:15:30.550Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007327', id, 3300000, 3300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-27T15:06:03.840Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000076'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007326', id, 1305000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-27T14:53:12.653Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007322', id, 3650000, 3650000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-27T09:35:21.103Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007321', id, 5625000, 5625000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-27T09:32:22.920Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007320', id, 51237840, 51237840, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-27T09:29:40.877Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007319', id, 14500000, 14500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-26T15:05:27.750Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007318', id, 39925900, 39925900, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-26T08:35:40.840Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007325', id, 240000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-26T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007317', id, 40543240, 40543240, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-25T15:42:56.097Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007316', id, 28392000, 28392000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-25T15:33:16.900Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007315', id, 6700000, 6700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-25T15:32:19.003Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007314', id, 15000000, 15000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-25T15:31:31.620Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007313', id, 19463160, 19463160, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-25T15:18:45.417Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007312', id, 4345350, 4345350, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-25T14:55:35.850Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007311', id, 1617000, 1617000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-25T14:54:36.380Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000071'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007310', id, 16000000, 16000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-25T14:53:50.893Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000080'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007323', id, 535000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-25T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007324', id, 270000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-25T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007309', id, 5184000, 5184000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-24T16:25:31.143Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007308', id, 510000, 510000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-24T16:24:42.703Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007307', id, 2850000, 2850000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-24T09:32:13.357Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007306', id, 6688656, 6688656, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-24T09:30:41.280Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007305', id, 6600000, 6600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-23T17:09:13.957Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007304', id, 8495980, 8495980, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-23T15:31:24.950Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007303', id, 3700000, 3700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-23T15:27:38.803Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007302', id, 2311296, 2311296, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-23T15:26:42.140Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007301', id, 1950000, 1950000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-23T15:22:52.240Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007300', id, 952560, 952560, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-23T15:21:19.820Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007299', id, 8125000, 8125000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-23T15:20:23.780Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007298', id, 1140000, 1140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-23T15:19:40.923Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007297', id, 3400000, 3400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-23T15:19:03.503Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007296', id, 14757400, 14757400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-22T16:02:08.227Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007295.01', id, 325000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-22T15:25:15.877Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007294', id, 16877560, 16877560, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-22T15:01:26.490Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007293', id, 12875000, 12875000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-22T10:15:28.610Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007292', id, 91125000, 91125000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-21T16:21:22.777Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007291', id, 3221400, 3221400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-21T16:18:59.203Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007290', id, 34000000, 34000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-21T15:54:07.653Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000080'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007289', id, 6250000, 6250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-21T15:52:50.077Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007288', id, 5154240, 5154240, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-21T15:33:20.547Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007286', id, 8125000, 8125000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-21T15:12:20.963Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007285', id, 7905480, 7905480, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-21T15:11:38.093Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007284', id, 7976630, 7976630, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-21T15:10:50.707Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007283', id, 917150, 917150, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-21T10:24:33.350Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007282', id, 6160000, 6160000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-21T09:28:19.460Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007336', id, 540000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-21T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007281', id, 11225000, 11225000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-20T16:08:16.357Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007280', id, 10879880, 10879880, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-20T15:43:23.437Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007279', id, 150000000, 150000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-20T15:42:24.653Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007278', id, 1617000, 1617000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-20T15:14:09.053Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000071'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007277', id, 11110490, 11110490, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-20T14:59:55.807Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007276', id, 2106000, 3480000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-20T14:55:58.860Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007275', id, 50925000, 50925000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-20T14:54:01.993Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007274', id, 2568096, 2568096, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-20T10:48:49.443Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007273', id, 12375000, 12375000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-20T09:48:00.517Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007272', id, 16525000, 16525000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-20T09:46:57.080Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007335', id, 270000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-20T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007334', id, 87500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-20T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007271', id, 24784000, 24784000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-19T14:24:57.540Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007333', id, 775000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-19T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007270', id, 140000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-18T16:31:36.267Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007269', id, 23444310, 23444310, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-18T15:35:15.330Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007268', id, 1710720, 1710720, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-18T15:33:59.437Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007267', id, 2409696, 2409696, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-18T09:50:07.447Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007266', id, 9337500, 9337500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-18T09:47:20.737Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007265', id, 2120000, 2120000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-18T09:46:26.757Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007264', id, 8480000, 8480000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-18T09:46:02.333Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007263', id, 3480000, 3480000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-18T09:45:07.127Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007262', id, 25075000, 25075000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-18T09:43:13.113Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007261', id, 17000000, 17000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-17T15:44:00.020Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007260', id, 11635890, 11635890, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-17T15:32:18.763Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007259', id, 1140000, 2280000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-17T11:16:37.480Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007258', id, 2800000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-17T11:01:51.883Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007257', id, 3238200, 3238200, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-17T09:07:40.077Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007256', id, 3650000, 3650000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-17T09:06:49.117Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007255', id, 61083360, 61083360, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-16T16:40:22.397Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007254', id, 190000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-16T16:37:08.360Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007253', id, 960000, 960000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-16T15:34:06.030Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007252', id, 13915165, 13915165, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-16T15:33:15.593Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007251', id, 12625000, 12625000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-16T15:32:15.453Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007250', id, 6500000, 6500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-16T15:31:28.347Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007249', id, 5475000, 5475000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-16T15:30:28.583Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007248', id, 8800000, 8800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-16T10:59:40.633Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007247', id, 440000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-15T16:49:15.797Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007246', id, 12716610, 12716610, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-15T16:35:07.010Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007245', id, 4928000, 4928000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-15T15:32:30.410Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007244', id, 800000, 800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-15T15:31:51.210Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007243', id, 37200000, 37200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-15T15:00:41.357Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007242', id, 59097940, 59097940, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-15T14:59:32.693Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007241', id, 14500000, 14500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-15T10:11:08.120Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007240', id, 3733020, 3733020, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-15T10:09:52.197Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007239', id, 917460, 917460, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-15T10:09:26.473Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007238', id, 2322336, 2322336, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-15T10:08:01.830Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007332', id, 87500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-15T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007237', id, 3700000, 3700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-14T17:00:09.153Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007236', id, 9642400, 9642400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-14T16:59:35.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007235', id, 1140000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-14T15:59:33.220Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007233', id, 3225600, 3225600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-14T15:54:45.087Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007232', id, 7575000, 7575000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-14T15:53:37.143Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007231', id, 16086720, 16086720, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-14T09:33:55.230Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007230', id, 6300000, 6300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-14T09:32:42.920Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007331', id, 135000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-14T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007229', id, 6058800, 6058800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-13T16:30:29.560Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007228', id, 1594080, 1594080, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-13T16:30:02.103Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007227', id, 2140000, 2140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-13T16:27:37.357Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007225', id, 1750000, 1750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-13T10:53:32.663Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007224', id, 78308880, 78308880, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-13T10:51:58.810Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007223', id, 2800000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-13T10:51:13.910Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007222', id, 2460000, 2460000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-13T10:47:56.070Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007234', id, 3300000, 3300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-13T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000076'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007330', id, 580000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-13T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007220', id, 3246600, 3246600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-12T10:45:38.680Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007219', id, 2403456, 2403456, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-12T10:31:59.203Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007218', id, 3700000, 3700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-12T09:49:08.030Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007217', id, 17425000, 17425000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-12T09:47:52.190Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007215', id, 939600, 939600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-11T09:04:06.893Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007226', id, 169370000, 169370000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-11T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007211', id, 11275000, 11275000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-11T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007221', id, 8432460, 8432460, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-11T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007212', id, 8250000, 8250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-11T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007213', id, 7300000, 7300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-11T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007216', id, 6000000, 6000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-11T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007214', id, 2160000, 2160000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-11T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007210', id, 500000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-11T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007329', id, 270000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-11T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007209', id, 150000000, 150000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-10T17:26:21.447Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007208', id, 3242400, 3242400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-10T17:25:26.193Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007207', id, 1069200, 1069200, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-10T17:24:41.640Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007206', id, 712800, 712800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-10T17:24:06.083Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007205', id, 440000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-10T16:04:56.847Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007204', id, 11126400, 11126400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-10T15:52:36.463Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007203', id, 800000, 800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-10T15:50:28.963Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007202', id, 10095680, 10095680, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-10T14:57:29.003Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007201', id, 18787500, 18787500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-10T09:33:24.660Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007200', id, 87500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-09T17:38:21.353Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007199', id, 5550000, 5550000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-09T15:54:58.633Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007198', id, 6225000, 6225000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-09T15:52:58.900Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007197', id, 6300000, 6300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-09T15:52:20.937Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007196', id, 7862400, 7862400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-09T15:51:38.040Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007195', id, 12871872, 12871872, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-09T15:51:15.313Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007194', id, 8700000, 8700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-09T15:43:52.160Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007193', id, 2106000, 2106000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-09T11:14:35.583Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007192', id, 6930000, 6930000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-09T11:13:33.880Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007191', id, 7500000, 7500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-08T14:52:08.573Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007190', id, 9000000, 9000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-08T14:31:42.190Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007189', id, 3700000, 3700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-08T11:12:40.820Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007188', id, 59250000, 59250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-08T11:08:39.517Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007186', id, 1032750, 1032750, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-08T09:38:30.477Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007185', id, 1140000, 1140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-08T09:17:47.763Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007184', id, 5855850, 5855850, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-08T09:15:50.057Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007183', id, 16500000, 16500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-08T08:50:14.440Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007182', id, 8820000, 8820000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-07T16:42:50.610Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000079'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007181', id, 1925000, 1925000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-07T15:26:22.867Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007180', id, 375000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-07T15:00:05.310Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007179', id, 9450000, 9450000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-07T09:43:20.607Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007178', id, 6360000, 6360000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-07T09:42:36.483Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007177', id, 4240000, 4240000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-07T09:42:20.740Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007176', id, 2750000, 2750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-07T09:41:23.313Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007175', id, 3253600, 3253600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-07T09:40:39.500Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007174', id, 2516736, 2516736, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-07T09:40:07.900Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007173', id, 643250, 643250, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-07T09:39:22.577Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007187', id, 10834890, 10834890, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-07T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007172', id, 415000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-06T17:40:06.693Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007171', id, 49499580, 49499580, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-06T17:18:26.090Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007170', id, 3700000, 3700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-06T17:04:14.597Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007169', id, 800000, 800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-06T16:59:55.053Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007168', id, 6300000, 6300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-06T16:57:27.713Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007167', id, 1750000, 1750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-06T16:56:36.340Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007166', id, 5906250, 5906250, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-06T16:55:17.300Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007165', id, 12750000, 12750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-06T16:54:21.447Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007164', id, 3050000, 3050000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-06T09:42:05.110Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007163', id, 402500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-05T16:01:05.940Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007152', id, 20825610, 20825610, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-05T14:49:03.757Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007151', id, 6930000, 6930000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-05T10:23:04.960Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007150', id, 296000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-05T09:59:44.003Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007149', id, 12375000, 12375000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-05T09:04:27.363Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007148', id, 10558180, 10558180, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-05T09:01:44.107Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007147', id, 10925280, 10925280, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-05T08:59:40.430Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007146', id, 2143296, 2143296, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-04T17:26:50.240Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007145', id, 5704920, 5704920, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-04T16:58:31.380Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007144', id, 415000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-04T16:10:24.637Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007143', id, 2350000, 2350000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-04T15:55:16.577Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007142', id, 11474550, 11474550, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-04T15:11:11.643Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007141', id, 1750000, 1750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-04T09:18:18.103Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007140', id, 9225000, 9225000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-04T09:17:50.573Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007138', id, 6579190, 6579190, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-03T15:03:15.173Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007137', id, 3700000, 3700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-03T15:00:48.887Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007136', id, 400000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-03T14:55:31.277Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007135', id, 1140000, 1140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-03T10:47:32.223Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007134', id, 415000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-03T10:23:26.490Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007133', id, 11034630, 11034630, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-03T10:22:38.053Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007132', id, 9450000, 9450000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-03T10:19:00.160Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007131', id, 3000000, 3000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-03T10:18:10.033Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007130', id, 6150000, 6150000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-03T10:00:30.477Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007162', id, 415000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-03T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007129.01', id, 325000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-02T17:00:30.223Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007128', id, 6300000, 6300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-02T16:25:13.533Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007127', id, 6000000, 6000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-02T15:03:04.833Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007126', id, 6160000, 6160000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-02T15:02:29.243Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007125', id, 6300000, 6300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-02T15:01:05.937Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007124', id, 16500000, 16500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-02T14:14:20.027Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007123', id, 28312500, 28312500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-02T09:45:42.917Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007122', id, 5668900, 5668900, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-02T09:41:33.187Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007121', id, 2360736, 2360736, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-02T09:29:57.483Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007139', id, 1261600, 1261600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-02T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007161', id, 270000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-02T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007120', id, 3599100, 3599100, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-01T17:39:21.487Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007119', id, 3341555, 3341555, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-01T17:37:44.393Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007118', id, 5371765, 5371765, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-01T16:45:38.520Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007117', id, 2517435, 2517435, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-01T16:43:49.980Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007116', id, 1440000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-01T10:59:58.783Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007115', id, 210000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-01T10:59:01.950Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007114', id, 5550690, 5550690, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-01T09:55:59.513Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007113', id, 3120000, 3120000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-01T09:36:22.737Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007112', id, 1750000, 1750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-01T09:35:14.990Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007111', id, 1140000, 2280000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-04-01T09:20:39.843Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007110', id, 630000, 630000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-31T15:59:01.970Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007109', id, 10281160, 10281160, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-31T14:56:41.533Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007107', id, 620000, 620000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-31T09:26:39.550Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007106', id, 18862500, 18862500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-31T09:25:27.530Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007105', id, 939600, 939600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-31T09:24:33.517Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007104', id, 4000000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-31T08:55:24.320Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007103', id, 6930000, 6930000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-31T08:11:48.920Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007160', id, 2450000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-31T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007102', id, 3212100, 3212100, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-30T17:01:46.013Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007101', id, 8390590, 8390590, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-30T14:54:19.090Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007100', id, 2527776, 2527776, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-30T10:34:15.287Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007099', id, 7504650, 7504650, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-30T09:59:51.367Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007098', id, 415000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-30T09:59:08.313Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007108', id, 3300000, 3300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-30T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000076'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007159', id, 350000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-30T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007097', id, 16000000, 16000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-29T16:25:49.530Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007096', id, 730000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-29T14:33:38.573Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007095', id, 15375000, 15375000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-29T09:19:44.210Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007094', id, 3150000, 3150000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-29T09:18:54.847Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007093', id, 1750000, 1750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-29T09:17:57.860Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007092', id, 10100000, 10100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-29T08:53:45.413Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007091', id, 18832100, 18832100, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-28T17:22:07.187Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007090', id, 5019840, 5019840, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-28T15:49:38.410Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007089', id, 1782000, 1782000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-28T15:19:35.737Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007088', id, 3696000, 3696000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-28T15:18:30.100Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007087', id, 2464000, 2464000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-28T15:16:56.727Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007086', id, 16500000, 16500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-28T15:09:42.933Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007085', id, 5311250, 5311250, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-28T15:08:49.753Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007084', id, 17500000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-28T14:56:28.630Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007083', id, 400000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-28T10:52:15.923Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007082', id, 1140000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-28T09:28:48.810Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007081', id, 9811965, 9811965, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-28T09:27:58.940Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007079', id, 360000, 360000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-28T09:19:49.363Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007158', id, 87500, 0, '2.5*35= 87', 'COMPLETED'::"PurchaseOrderStatus", '2026-03-28T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007078', id, 880000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-27T16:37:29.533Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007077', id, 637500, 637500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-27T16:35:40.043Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007076', id, 11881170, 11881170, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-27T15:15:33.933Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007075', id, 101325000, 101325000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-27T14:44:57.803Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007074', id, 7659360, 7659360, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-27T14:39:45.423Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007073', id, 4662940, 4662940, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-27T14:38:40.807Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007072', id, 2438976, 2438976, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-27T09:47:56.117Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007071', id, 6150000, 6150000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-27T09:30:10.900Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007069', id, 3850000, 3850000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-27T07:42:13.957Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007156', id, 405000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-27T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007157', id, 87500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-27T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007068', id, 3200000, 3200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-26T14:57:15.430Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007067', id, 2400000, 2400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-26T14:56:32.153Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007066', id, 8645000, 8645000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-26T14:55:46.883Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007064', id, 2000000, 2000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-26T10:07:35.847Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007070', id, 22458110, 22458110, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-26T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007155', id, 175000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-26T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007063', id, 140000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-25T17:37:31.070Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007062', id, 62984200, 62984200, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-25T16:04:53.617Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007061', id, 15375000, 15375000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-25T15:52:02.430Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007059', id, 2400000, 2400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-25T10:16:35.863Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007065', id, 3850000, 3850000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-25T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007154', id, 567500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-25T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007058', id, 580000, 580000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-24T17:22:17.017Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007057', id, 615000, 615000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-24T17:19:47.247Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007056', id, 7646700, 7646700, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-24T16:17:50.673Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007055', id, 15375000, 15375000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-24T16:16:35.263Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007054', id, 3150000, 3150000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-24T16:15:53.500Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007053', id, 20222840, 20222840, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-24T16:15:07.520Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007052', id, 1140000, 1140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-24T10:06:26.300Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007051', id, 11555440, 11555440, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-24T09:49:20.687Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007050', id, 2320000, 2320000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-24T09:48:31.030Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007049', id, 2573000, 2573000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-24T09:47:51.500Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007048', id, 2411616, 2411616, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-24T09:46:48.060Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007047', id, 643250, 643250, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-24T09:45:57.030Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007044', id, 16500000, 16500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-24T08:07:30.837Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007042', id, 2875000, 2875000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-23T15:31:47.360Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007041', id, 7700000, 7700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-23T15:30:56.780Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007040', id, 7700000, 7700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-23T14:50:31.967Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007039', id, 10750000, 10750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-23T11:10:50.220Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007038', id, 7520220, 7520220, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-23T10:25:23.157Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007037', id, 2450000, 2450000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-22T16:10:48.933Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007036', id, 17200000, 17200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-22T14:57:07.587Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007035', id, 14278500, 14278500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-22T14:55:41.207Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007043', id, 20399940, 20399940, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-22T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007034', id, 19150000, 19150000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-21T16:31:15.550Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007032', id, 2547936, 2547936, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-21T14:49:34.753Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007031', id, 1140000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-21T14:42:41.583Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007030', id, 400000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-21T14:42:02.597Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007029', id, 337500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-21T14:41:42.373Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007153', id, 270000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-21T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007027', id, 30930420, 30930420, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-20T16:11:48.063Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007026', id, 775000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-20T16:05:13.083Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007020', id, 10317500, 10317500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-20T15:33:46.877Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007019', id, 460000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-20T14:40:13.513Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007018', id, 6900000, 6900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-20T10:45:13.710Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007017', id, 5875000, 5875000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-20T09:30:38.687Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007016', id, 27600000, 27600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-20T09:23:55.903Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007015', id, 1782000, 1782000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-20T09:20:58.820Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007060', id, 127800000, 127800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-20T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007033', id, 8065110, 8065110, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-20T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007028', id, 3300000, 3300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-20T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000076'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007014', id, 1140000, 1140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-19T16:39:25.693Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007013', id, 8145000, 8145000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-19T15:51:02.533Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007012', id, 5351400, 5351400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-19T15:49:53.160Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000075'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007011', id, 5875000, 5875000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-19T15:49:02.497Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007010', id, 12977590, 12977590, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-19T09:18:11.960Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007009', id, 7721730, 7721730, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-19T09:15:36.187Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007046', id, 106569619, 106569619, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-19T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007008', id, 78007670, 78007670, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-18T15:23:33.297Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007007', id, 196000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-18T15:20:38.303Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007006', id, 4800000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-18T11:07:34.773Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007005', id, 11500000, 11500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-18T09:50:43.417Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007004', id, 20490960, 20490960, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-18T09:39:16.937Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007003', id, 16500000, 16500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-18T09:32:18.670Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007002', id, 3775000, 3775000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-17T16:51:22.540Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007000', id, 10045620, 10045620, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-17T15:51:37.280Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006999', id, 15562500, 15562500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-17T10:42:48.487Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006998', id, 2106000, 2106000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-17T09:36:23.217Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006996', id, 7300000, 7300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-17T09:10:40.893Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006995', id, 1175000, 1175000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-17T08:23:00.703Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006994', id, 11500000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-16T17:27:42.283Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006993', id, 27263935, 27263935, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-16T17:10:12.153Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006992', id, 2437056, 2437056, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-16T09:54:57.383Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006991', id, 26162500, 26162500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-16T09:45:26.570Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006990', id, 140000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-16T09:31:19.203Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007001', id, 13725000, 13725000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-16T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007025', id, 87500, 0, 'liễu cơm 2.5*35=87', 'COMPLETED'::"PurchaseOrderStatus", '2026-03-16T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006989', id, 1440000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-15T10:44:05.770Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006988', id, 630800, 630800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-15T10:08:18.463Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006987', id, 1942200, 1942200, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-15T10:07:56.523Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006986', id, 8250000, 8250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-14T16:08:55.463Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006985', id, 3776100, 3776100, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-14T10:06:52.427Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006984', id, 9564030, 9564030, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-14T09:45:30.583Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006983', id, 5710300, 5710300, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-14T09:33:37.293Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006982', id, 3775000, 3775000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-14T09:32:03.330Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006997', id, 26456640, 26456640, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-14T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007024', id, 350000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-14T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006981', id, 1100000, 1100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-13T17:01:34.780Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006980', id, 6007500, 6007500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-13T16:29:56.510Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006979', id, 40421150, 40421150, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-13T15:56:15.930Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006978', id, 21798270, 21798270, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-13T15:30:23.010Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006977', id, 7872000, 9179000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-13T15:21:14.103Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006976', id, 6300000, 6300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-13T14:59:28.603Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006975', id, 10036260, 10036260, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-13T14:54:57.447Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006974', id, 29800000, 29800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-13T10:13:12.480Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006973', id, 2475936, 2475936, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-13T10:10:08.253Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006972', id, 580000, 580000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-13T09:34:59.123Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006971', id, 15562500, 15562500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-13T09:27:38.307Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007023', id, 360000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-13T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006970', id, 19384940, 19384940, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-12T17:10:16.543Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006969', id, 720000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-12T16:21:42.517Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006968', id, 53265000, 53265000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-12T16:11:19.760Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006967', id, 8800000, 8800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-12T15:31:05.990Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006966', id, 3724700, 3724700, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-12T14:56:29.370Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006965', id, 1782000, 1782000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-12T14:55:02.453Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006964', id, 3357900, 3357900, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-12T14:54:22.340Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006963', id, 2880000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-12T14:44:05.707Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006962', id, 18225000, 18225000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-12T08:54:13.337Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006961', id, 8200000, 8200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-12T08:52:49.533Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006960', id, 390000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-12T08:52:15.450Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007022', id, 1710000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-12T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006957', id, 27210485, 27210485, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-11T17:25:27.550Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006956', id, 14317500, 14317500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-11T17:11:56.427Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006955', id, 460000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-11T17:11:15.063Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006954', id, 18889000, 18889000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-11T10:13:53.987Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006953', id, 8200000, 8200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-11T10:11:18.997Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006952', id, 19699650, 19699650, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-11T10:06:40.960Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006951', id, 1140000, 1140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-11T10:04:20.003Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006959', id, 1480000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-11T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007021', id, 502500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-11T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006950', id, 1245000, 1245000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-10T16:27:34.557Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006949', id, 3775000, 3775000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-10T15:11:24.540Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006948', id, 1867500, 1867500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-10T15:10:40.103Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006947', id, 13458690, 13458690, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-10T15:09:18.350Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006946', id, 8200000, 8200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-10T10:08:45.953Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006945', id, 15375000, 15375000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-10T10:07:04.310Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006944', id, 11529530, 11529530, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-10T10:05:15.113Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006943', id, 2723616, 2723616, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-10T10:01:33.427Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006942', id, 432000, 432000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-09T17:14:56.127Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006941', id, 615000, 615000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-09T17:11:08.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006940', id, 10010550, 10010550, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-09T16:34:40.790Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006939', id, 8200000, 8200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-09T15:47:09.377Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006938', id, 3180000, 3180000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-09T15:45:16.343Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006937', id, 2160000, 2160000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-09T15:43:22.497Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006936', id, 2475000, 2475000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-09T15:42:08.963Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006935', id, 4434240, 4434240, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-09T14:27:26.733Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006934', id, 580000, 580000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-09T10:11:50.680Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006933', id, 37600090, 37600090, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-09T10:09:47.823Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006838.02', id, 156000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-08T15:41:21.277Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006930', id, 357500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-08T10:06:09.443Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006927', id, 9425000, 65547000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-08T09:59:18.327Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006926', id, 12720000, 12720000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-08T09:57:55.230Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006925', id, 5215650, 5215650, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-07T16:12:29.803Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006924', id, 7934320, 7934320, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-07T15:12:09.750Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006923', id, 2191296, 2191296, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-07T10:48:27.583Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006922', id, 27000000, 27000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-07T09:03:47.067Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006931', id, 8250000, 8250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-07T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006958', id, 1480000, 1480000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-07T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006928', id, 900000, 0, 'n', 'COMPLETED'::"PurchaseOrderStatus", '2026-03-07T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006929', id, 667500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-07T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006920', id, 5550000, 5550000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-06T14:52:10.557Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006919', id, 8200000, 8200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-06T14:47:51.427Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006918', id, 2250000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-06T14:40:52.090Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000077'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006917', id, 885600, 885600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-06T14:34:55.113Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006916', id, 22720000, 22720000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-06T11:21:49.397Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000069'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006915', id, 9225000, 9225000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-06T09:28:19.710Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006913', id, 337500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-05T17:38:08.303Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006912', id, 5028683, 5028683, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-05T15:45:55.633Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006910', id, 14350000, 14350000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-05T15:13:33.557Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006909', id, 580000, 580000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-05T15:10:51.377Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006908', id, 17505000, 17505000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-05T11:01:25.377Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006907', id, 14674000, 14674000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-05T11:00:13.857Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006906', id, 12961993, 12961993, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-05T10:58:28.050Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006905', id, 6300000, 6300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-05T10:47:08.830Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006914', id, 140120000, 140120000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-05T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006921', id, 12607100, 12607100, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-05T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006904', id, 2593536, 2593536, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-04T16:20:45.773Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006903', id, 43682835, 43682835, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-04T16:19:25.433Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006902', id, 6510670, 6510670, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-04T16:15:17.773Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006901', id, 2880000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-04T15:25:22.907Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006900', id, 9720000, 9720000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-04T15:01:05.257Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006899', id, 270000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-04T14:59:01.837Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006891', id, 8214225, 8214225, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-04T14:27:47.953Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006890', id, 104520000, 104520000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-04T11:13:35.123Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006889', id, 1100000, 1100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-04T09:34:10.003Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006888', id, 2475000, 2475000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-04T08:59:55.570Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006887', id, 8025000, 8025000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-04T08:59:03.433Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006886', id, 2940000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-03T16:14:40.667Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006885', id, 232500, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-03T16:14:07.147Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006884', id, 6000000, 2090235, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-03T16:12:07.243Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006883', id, 17031600, 17031600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-03T16:08:32.307Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006882', id, 3068595, 3068595, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-03T16:05:15.370Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006881', id, 3250000, 3250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-03T16:04:35.030Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006880', id, 10400000, 10400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-03T16:03:46.333Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006879', id, 10221600, 10221600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-03T16:02:54.457Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006878', id, 1782000, 1782000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-03T16:02:15.683Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006877', id, 29537500, 29537500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-03T16:00:51.223Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006876', id, 5088533, 5088533, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-03T15:59:31.420Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006838.01', id, 225000, 225000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-02T16:52:39.253Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006874', id, 25004245, 25004245, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-02T16:49:02.053Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006873', id, 2050000, 2050000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-02T15:24:32.533Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006872', id, 2106000, 2106000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-02T15:23:55.377Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006871', id, 15187500, 15187500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-02T15:23:15.913Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006870', id, 600000, 600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-02T09:25:16.117Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006869', id, 8150000, 8150000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-02T09:21:48.150Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006868', id, 21889033, 21889033, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-02T09:17:19.270Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006875', id, 3300000, 3300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-02T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000076'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006897', id, 350000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-02T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006898', id, 240000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-02T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006867', id, 460000, 460000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-01T17:36:23.673Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006866', id, 9211340, 9211340, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-01T15:28:27.797Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006865', id, 1100000, 1100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-01T11:10:44.643Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006864', id, 1640000, 1640000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-01T10:37:13.227Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006863', id, 400000, 400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-01T10:35:57.533Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006862', id, 800000, 800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-01T10:35:32.987Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006861', id, 9900000, 9900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-01T09:26:18.097Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006896', id, 270000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-01T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006932', id, 360, 360, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-03-01T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006860', id, 11010000, 11010000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-28T17:12:51.793Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006858', id, 5829770, 5829770, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-28T15:56:15.073Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006857', id, 6764185, 6764185, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-28T15:55:09.410Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006856', id, 6600000, 6600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-28T15:53:54.077Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006855', id, 4555650, 4555650, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-28T15:53:11.333Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006854', id, 2244480, 2244480, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-28T10:42:23.047Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006853', id, 90000000, 90000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-28T10:00:03.453Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006852', id, 8416200, 8416200, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-27T17:36:09.777Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006851', id, 3075000, 3075000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-27T16:34:08.960Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006850', id, 1782000, 1782000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-27T15:19:25.300Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006849', id, 7482360, 7482360, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-27T11:19:51.390Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006848', id, 15187500, 15187500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-27T11:18:59.697Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006847', id, 15039240, 15039240, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-27T11:18:28.633Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006846', id, 18875000, 18875000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-27T10:49:29.520Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006845', id, 2330496, 2330496, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-27T09:49:44.900Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006844', id, 9900000, 9900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-27T09:42:19.350Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006859', id, 8250000, 8250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-27T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006843', id, 7500000, 7500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-26T16:58:04.153Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006842', id, 8384660, 8384660, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-26T15:56:22.930Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006841', id, 18732590, 18732590, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-26T15:45:46.797Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006839', id, 122000000, 122000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-26T15:32:42.113Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006838', id, 233000, 233000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-26T10:45:09.800Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006837', id, 71400000, 71400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-26T09:57:38.887Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006895', id, 270000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-26T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006836', id, 2442336, 2442336, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-25T17:28:11.430Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006835', id, 230000, 230000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-25T17:19:06.423Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006834', id, 5319470, 5319470, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-25T15:22:49.367Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006833', id, 8129020, 8129020, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-25T15:18:49.677Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006832', id, 8700000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-25T15:16:34.817Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000070'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006831', id, 11381826, 11381826, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-25T15:14:04.003Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006830', id, 14864050, 14864050, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-25T09:05:32.003Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006840', id, 26674255, 26674255, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-25T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006894', id, 240000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-25T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006828', id, 75244040, 75244040, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-24T17:16:16.650Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006827', id, 6537024, 6537024, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-24T17:15:04.847Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006826', id, 86000000, 86000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-24T15:02:38.560Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006825', id, 8363080, 8363080, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-24T14:36:33.947Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006824', id, 2083428, 2083428, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-24T09:38:33.237Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006823', id, 11700000, 11700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-24T09:37:49.103Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006822', id, 17137500, 17137500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-24T09:35:56.420Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006821', id, 4102230, 4102230, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-24T08:12:16.383Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006820', id, 4050000, 4050000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-23T17:13:24.340Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006819', id, 42200000, 42200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-23T16:44:41.093Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006818', id, 7251678, 7251678, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-23T16:43:29.380Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006817', id, 21847240, 21847240, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-23T15:46:48.283Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006816', id, 7800000, 7800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-23T15:44:08.507Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006815', id, 2800000, 2800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-23T15:43:08.980Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006814', id, 140000, 140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-23T14:47:57.597Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006813', id, 15336210, 15336210, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-23T14:32:21.753Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006812', id, 8150000, 8150000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-23T09:52:53.523Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006811', id, 9623625, 9623625, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-23T09:49:35.930Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006810', id, 16360355, 16360355, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-23T09:40:41.533Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006809', id, 1100000, 1100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-23T08:40:37.890Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006893', id, 270000, 0, 'Tích', 'COMPLETED'::"PurchaseOrderStatus", '2026-02-23T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006807', id, 12000000, 12000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-22T15:51:05.780Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006806', id, 835000, 835000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-22T15:50:15.450Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006805', id, 8605440, 8605440, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-22T10:42:17.793Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006804', id, 3763650, 3763650, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-22T10:12:42.147Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006803', id, 28687500, 28687500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-22T10:06:56.033Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006808', id, 18596635, 18596635, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-22T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN007446', id, 3333700, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-22T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006892', id, 360000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-22T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006801', id, 2800000, 2800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-14T14:11:00.967Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006800', id, 12000000, 12000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-14T09:13:20.137Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006799', id, 3075000, 3075000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-14T08:52:47.847Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006798', id, 7700000, 7700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-14T08:45:26.287Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006802', id, 14250000, 14250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-14T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006797', id, 200000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-13T17:40:42.170Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006794', id, 714000, 714000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-13T17:32:01.200Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006793', id, 8100000, 8100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-13T17:27:16.313Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006792', id, 8149830, 8149830, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-13T14:47:40.447Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006791', id, 1650000, 1650000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-13T09:15:47.723Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006790', id, 420000, 420000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-12T17:03:58.777Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006789', id, 400000, 400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-12T17:03:15.160Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006788', id, 140000, 140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-12T17:00:12.150Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006787', id, 10618428, 10618428, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-12T16:26:05.813Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006786', id, 14200000, 14200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-12T15:51:22.913Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006785', id, 30603400, 30603400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-12T15:16:03.260Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006782', id, 6250000, 9000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-12T10:05:17.127Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006781', id, 4377510, 4377510, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-12T08:47:32.437Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006780', id, 2377440, 2377440, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-11T17:27:05.437Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006779', id, 1782000, 22600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-11T17:21:28.977Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006778', id, 1959398, 1959398, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-11T17:19:43.153Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006777', id, 1588470, 11050000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-11T16:54:52.640Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006783', id, 4381000, 4381000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-11T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006796', id, 100000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-11T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006776', id, 730000, 730000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-10T17:08:56.990Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006775', id, 2921400, 2921400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-10T15:53:00.550Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000075'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006774', id, 1095000, 56900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-10T15:12:47.903Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006773', id, 27153400, 27153400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-10T15:09:28.607Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006764', id, 4069680, 4069680, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-10T10:15:25.307Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006763', id, 3937500, 20635000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-10T09:49:36.910Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006762', id, 4772500, 4772500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-10T09:29:05.807Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006784', id, 14706000, 14706000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-10T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006795', id, 270000, 0, 'ê 2*135= 270k', 'COMPLETED'::"PurchaseOrderStatus", '2026-02-10T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006760', id, 2481408, 2481408, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-09T17:39:19.593Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006759', id, 19871950, 19871950, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-09T17:37:08.063Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006758', id, 16687500, 16687500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-09T17:36:02.880Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006757', id, 15187500, 15187500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-09T17:35:16.993Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006756', id, 1560000, 1560000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-09T17:32:42.353Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006755', id, 26099230, 26099230, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-09T10:45:36.353Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006761.01', id, 54615900, 54615900, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-09T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006772', id, 600000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-09T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006753', id, 10533690, 10533690, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-08T16:59:57.353Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006752', id, 6513910, 6513910, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-08T16:59:13.507Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006751', id, 1066065, 1066065, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-08T16:56:01.463Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006750', id, 51376130, 51376130, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-08T16:49:57.480Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006771', id, 100000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-08T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006748', id, 44055805, 44055805, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-07T17:18:03.477Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006747', id, 6960000, 6960000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-07T17:15:03.837Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006746', id, 2293248, 2293248, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-07T17:09:00.883Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006745', id, 23200000, 23200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-07T17:07:40.110Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006744', id, 23412500, 23412500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-07T17:06:17.283Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006742', id, 5253670, 5253670, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-07T17:04:53.733Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006741', id, 10976900, 10976900, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-07T17:03:35.247Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006740', id, 869715, 869715, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-07T17:02:02.590Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006738', id, 135000, 135000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-07T15:46:28.360Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006736', id, 65702028, 65702028, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-07T10:54:38.003Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006749', id, 3300000, 3300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-07T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000076'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006770', id, 270000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-07T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006735', id, 18625000, 18625000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-06T18:59:21.697Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006734', id, 8187500, 18650000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-06T17:03:06.290Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006733', id, 4640000, 4640000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-06T16:50:50.060Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006732', id, 2201138, 2201138, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-06T16:47:06.337Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006731', id, 1782000, 1782000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-06T16:41:40.813Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006730', id, 7400000, 7400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-06T16:32:29.167Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006729', id, 4159425, 4159425, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-06T16:29:00.720Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006728', id, 2106000, 2106000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-06T09:54:11.793Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006727', id, 3937500, 3937500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-06T09:39:49.620Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006754', id, 7500000, 7500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-06T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006768', id, 3070000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-06T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006737', id, 400000, 400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-06T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006769', id, 200000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-06T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006726', id, 1250000, 1250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-05T17:31:44.360Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006725', id, 1604070, 1604070, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-05T17:31:01.280Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006724', id, 6250000, 6250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-05T17:25:44.040Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006723', id, 2231230, 2231230, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-05T17:25:12.163Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006722', id, 148000, 148000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-05T17:19:41.207Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006721', id, 140000, 140000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-05T17:15:13.920Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006720', id, 31600000, 31600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-05T15:51:59.797Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006719', id, 8463010, 8463010, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-05T15:28:46.087Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006718', id, 2250690, 2250690, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-05T15:26:49.670Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006717', id, 12951550, 12951550, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-05T15:24:39.120Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006715', id, 26227500, 26227500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-05T10:07:12.670Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006767', id, 405000, 0, '\', 'COMPLETED'::"PurchaseOrderStatus", '2026-02-05T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006714', id, 1822500, 59090016, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-04T17:38:22.570Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006713', id, 2425728, 2425728, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-04T17:37:39.680Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006710', id, 3075000, 3075000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-04T15:05:08.130Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006709', id, 8125000, 8125000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-04T15:03:45.077Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006708', id, 20434400, 20434400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-04T10:24:54.877Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006716', id, 12923800, 12923800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-04T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006707', id, 14695632, 14695632, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-03T16:05:48.060Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006706', id, 15633000, 19000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-03T16:04:51.293Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006705', id, 6405730, 6405730, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-03T16:03:53.613Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006704', id, 341500, 341500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-03T11:25:33.337Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006703', id, 11358480, 11358480, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-03T11:24:32.397Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006702', id, 7146945, 7146945, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-03T11:23:28.700Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006701', id, 2200000, 2200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-03T11:22:49.587Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006700', id, 12000000, 12000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-03T10:08:19.340Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006699', id, 22233960, 22233960, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-03T08:40:35.560Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006766', id, 240000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-03T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006698', id, 1254600, 1254600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-02T18:12:41.637Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006697', id, 2100000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-02T16:23:31.003Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000077'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006696', id, 18192888, 18192888, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-02T15:18:11.660Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006695', id, 8062500, 13500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-02T15:15:52.657Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006694', id, 87200000, 87200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-02T15:03:07.037Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006693', id, 4015374, 4015374, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-02T10:10:19.267Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006692', id, 1890100, 36000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-02T10:01:50.503Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006691', id, 10800000, 10800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-02T10:00:24.997Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006765', id, 540000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-02T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006686', id, 6571500, 6571500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-01T21:28:38.850Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006685', id, 7400000, 7400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-01T11:40:11.887Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006684', id, 14688785, 25781623, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-01T10:33:18.990Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006683', id, 3937500, 3937500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-01T10:03:37.907Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006682', id, 360000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-01T08:42:33.537Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006678', id, 42796709, 42796709, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-01T07:55:29.803Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006687', id, 15187500, 15187500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-01T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006688.01', id, 11600000, 11600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-01T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006690', id, 3915000, 3915000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-01T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006689', id, 2442816, 2442816, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-02-01T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006677', id, 1782000, 16300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-31T17:04:45.143Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006676', id, 10849760, 10849760, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-31T15:35:04.350Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006675', id, 1600000, 1600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-31T15:34:08.157Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006674', id, 9849600, 9849600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-31T15:31:48.140Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006673', id, 7513740, 7513740, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-31T10:27:35.843Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006672', id, 11736000, 11736000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-31T10:26:47.423Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006681', id, 900000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-31T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006680', id, 200000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-31T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006671', id, 6571500, 6571500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T17:14:26.220Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006670', id, 8000000, 8000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T17:11:16.823Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006669', id, 2214816, 2214816, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T17:09:34.673Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006668', id, 48120000, 48120000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T17:08:28.267Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006667', id, 2460000, 2460000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T17:06:48.557Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006666', id, 615000, 615000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T17:06:29.350Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006665', id, 3814800, 3814800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T17:04:30.863Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006664', id, 3351575, 3351575, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T17:03:38.217Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006663', id, 15187500, 15187500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T17:01:53.163Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006662', id, 10750000, 10750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T17:01:05.690Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006661', id, 14462500, 14462500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T16:59:35.080Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006660', id, 1950000, 1950000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T16:58:35.363Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006659', id, 14100000, 14100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T16:57:51.953Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006658', id, 6300000, 6300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T16:51:51.450Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006657', id, 47400000, 47400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T16:49:31.683Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006656', id, 1100000, 1100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T10:30:35.120Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006739', id, 3230000, 3230000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006679', id, 200000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-30T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006655', id, 2961300, 2961300, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-29T17:01:23.713Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000078'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006654', id, 100000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-29T16:45:06.820Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006650', id, 14371500, 14371500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-29T16:39:57.650Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006649', id, 10693388, 13700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-29T16:18:37.200Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006648', id, 4238475, 9045000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-29T10:42:17.980Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006647', id, 11600000, 11600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-29T10:40:55.653Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006646', id, 16000000, 16000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-29T10:40:01.610Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006645', id, 11761605, 11761605, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-29T10:37:42.083Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006644', id, 227000, 227000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-29T09:05:02.290Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006711', id, 12241800, 12241800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-29T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006643', id, 3800000, 3800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-28T17:12:27.567Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006642', id, 754400, 754400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-28T17:07:30.550Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006641', id, 75543500, 75543500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-28T17:06:48.140Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006640', id, 2738976, 2738976, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-28T17:05:30.697Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006639', id, 15187500, 15187500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-28T17:04:38.113Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006630', id, 3157000, 3157000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-28T15:29:38.017Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006629', id, 11475000, 11475000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-28T14:35:41.877Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006628', id, 7500000, 7500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-28T14:33:10.490Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006653', id, 100000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-28T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006624', id, 634320, 60130500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-27T18:01:52.193Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006623', id, 1782000, 35899000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-27T18:00:41.687Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006622', id, 11287500, 11287500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-27T17:59:10.677Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006621', id, 770800, 770800, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-27T17:56:30.360Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006620', id, 1035000, 1035000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-27T17:55:21.463Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006619', id, 3937500, 3937500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-27T17:53:07.217Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006618', id, 6930000, 6930000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-27T17:50:09.813Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006613', id, 11006630, 11006630, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-27T17:24:16.657Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006610', id, 11900000, 11900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-27T17:17:45.227Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006608', id, 42561775, 42561775, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-27T16:52:52.310Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006607', id, 6900000, 25755000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-27T16:46:32.820Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006606', id, 18855000, 18855000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-27T16:45:15.550Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006605', id, 840000, 840000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-27T14:30:16.243Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006631', id, 12181000, 12181000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-27T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006652', id, 270000, 0, 'dồi dê 2*135', 'COMPLETED'::"PurchaseOrderStatus", '2026-01-27T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006604', id, 690000, 690000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-26T17:54:36.680Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006603', id, 1900000, 1900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-26T17:51:32.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006602', id, 615000, 615000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-26T17:50:39.763Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006601', id, 13312500, 13312500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-26T17:48:30.913Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006600', id, 15187500, 15187500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-26T17:44:47.270Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006599', id, 23198490, 23198490, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-26T17:35:18.720Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006598', id, 37683472, 37683472, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-26T17:25:54.307Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006597', id, 4480000, 4480000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-26T17:24:48.733Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006596', id, 9170700, 9170700, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-26T17:23:48.930Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006595', id, 2460000, 2460000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-26T17:23:17.217Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006626', id, 119993890, 119993890, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-26T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006638', id, 2100000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-26T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000077'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006592', id, 6011795, 22797000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-25T16:26:26.667Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006591', id, 5250000, 5250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-25T16:22:21.877Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006590', id, 7436340, 27830000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-25T15:50:03.853Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006588', id, 100000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-25T10:09:17.400Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006627', id, 18200000, 18200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-25T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006593', id, 615000, 615000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-25T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006625', id, 276000, 276000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-25T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006651', id, 270000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-25T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006568', id, 3873875, 3873875, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-24T16:59:18.370Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006567', id, 607500, 607500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-24T16:55:45.963Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006566', id, 2456448, 2456448, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-24T16:54:35.790Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006565', id, 1950000, 1950000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-24T16:53:28.610Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006564', id, 2800000, 2800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-24T16:52:51.590Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006563', id, 14580000, 14580000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-24T16:51:55.030Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006562', id, 4819075, 4819075, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-24T16:50:32.283Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006561', id, 8060700, 8060700, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-24T16:49:35.683Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006560', id, 34200000, 34200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-24T15:31:00.617Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006557', id, 8100000, 19670000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-24T09:55:20.800Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006556', id, 4700000, 4700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-24T08:10:38.357Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006589', id, 3052500, 3052500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-24T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006587', id, 360000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-24T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006555', id, 2769900, 2769900, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-23T17:08:05.253Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006552', id, 772560, 772560, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-23T16:55:07.473Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006551', id, 8062500, 32100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-23T16:53:02.703Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006550', id, 32345440, 32345440, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-23T16:51:02.660Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006549', id, 13700000, 13700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-23T16:49:31.770Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006548', id, 5250000, 5250000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-23T16:48:35.267Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006547', id, 4700000, 4700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-23T16:47:44.023Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006546', id, 8125000, 8125000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-23T16:46:39.070Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006559', id, 25750000, 25750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-23T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006558', id, 3300000, 3300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-23T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000076'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006586', id, 100000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-23T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006545', id, 4700000, 9000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-22T16:46:51.240Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006544', id, 1927000, 1927000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-22T16:46:19.417Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006543', id, 780000, 780000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-22T16:45:13.060Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006542', id, 21274350, 21274350, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-22T16:44:06.960Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006541', id, 3806250, 3806250, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-22T16:43:13.753Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006540', id, 8621900, 8621900, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-22T16:40:26.927Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006539', id, 3937500, 3937500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-22T16:37:25.700Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006538', id, 23857500, 23857500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-22T16:35:55.533Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006537', id, 11900000, 11900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-22T16:34:00.660Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006536', id, 23800000, 23800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-22T16:18:05.893Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006535', id, 1100000, 1100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-22T09:28:18.063Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006554', id, 15800000, 15800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-22T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006534', id, 2353728, 29700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-21T17:01:40.117Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006533', id, 5033860, 23000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-21T15:37:17.043Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006532', id, 400000, 400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-21T15:18:38.977Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006530', id, 1782000, 1782000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-21T11:14:25.240Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006529', id, 2214000, 2214000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-21T11:13:23.753Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006553', id, 12835000, 12835000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-21T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006585', id, 100000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-21T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006527', id, 6590000, 6590000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-20T15:13:59.157Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006525', id, 15187500, 15187500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-20T09:42:25.513Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006524', id, 7968550, 7968550, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-20T09:41:36.697Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006523', id, 54000, 54000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-20T08:52:38.910Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006531', id, 85243370, 85243370, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-20T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006528', id, 31978060, 31978060, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-20T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006584', id, 405000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-20T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006519', id, 3937500, 12000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-19T17:25:06.650Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006518', id, 6180300, 10000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-19T17:24:21.167Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006517', id, 10281970, 10281970, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-19T17:23:32.073Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006515', id, 13094668, 21242000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-19T17:18:21.760Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006513', id, 4670925, 9000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-19T17:15:51.497Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006526', id, 13428250, 13428250, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-19T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006512', id, 17100000, 17100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-18T15:04:24.757Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006511', id, 8150000, 8150000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-18T14:53:10.360Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006510', id, 8080100, 8080100, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-18T10:17:46.813Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006509', id, 4700000, 4700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-18T10:16:54.930Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006508', id, 9310950, 9310950, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-18T10:10:04.290Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006507', id, 19025000, 19025000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-18T10:08:02.800Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006522', id, 46220320, 46220320, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-18T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006520', id, 2348256, 2348256, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-18T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006637', id, 2100000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-18T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000077'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006583', id, 480000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-18T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006506', id, 940000, 940000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-17T17:45:46.273Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006505', id, 13400000, 25100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-17T16:15:35.960Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006504', id, 13796030, 41500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-17T16:01:25.783Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006503', id, 337500, 337500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-17T09:38:48.717Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006502', id, 1950000, 1950000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-17T09:24:14.970Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006501', id, 8055000, 8055000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-17T09:23:16.743Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006498', id, 2802350, 2802350, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-17T08:08:38.420Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006521', id, 65544745, 65544745, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-17T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006582', id, 500000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-17T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006497', id, 800000, 800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-16T17:30:19.340Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006495', id, 1100000, 1100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-16T10:17:15.970Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006494', id, 3750000, 3750000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-16T10:04:04.080Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006493', id, 8002500, 8002500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-16T09:51:31.597Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006492', id, 23287500, 23287500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-16T09:26:04.803Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006491', id, 885600, 885600, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-16T09:22:30.420Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006500', id, 22786500, 22786500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-16T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006636', id, 2100000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-16T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000077'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006490', id, 2503488, 2503488, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-15T17:02:14.033Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006489', id, 1230000, 1230000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-15T17:00:44.343Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006488', id, 5400000, 5400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-15T16:58:20.607Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006487', id, 7455000, 7455000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-15T16:56:52.923Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006486', id, 17875000, 17875000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-15T16:55:46.233Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006485', id, 10350000, 10350000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-15T16:54:49.567Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006484', id, 160000, 160000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-15T16:32:05.090Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006483', id, 8592023, 8592023, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-15T15:18:42.233Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006482', id, 3744450, 3744450, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-15T15:14:18.900Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000075'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006481', id, 16500000, 16500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-15T09:49:51.067Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006499', id, 19246760, 19246760, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-15T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006480', id, 25406500, 25406500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-14T17:11:11.810Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006479', id, 9459450, 9459450, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-14T17:05:55.090Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006478', id, 12353712, 12353712, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-14T16:50:57.427Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006477', id, 24000000, 24000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-14T16:48:12.803Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006476', id, 733320, 733320, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-14T16:44:09.857Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006475', id, 143000, 143000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-14T11:01:52.060Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006474', id, 10012500, 10012500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-14T10:29:56.380Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006473', id, 4700000, 9700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-14T10:29:04.963Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006472', id, 22371500, 22371500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-13T17:24:39.547Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006470', id, 1825000, 52995165, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-13T17:21:58.120Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006469', id, 2650000, 2650000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-13T16:55:20.933Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006468', id, 17294222, 17294222, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-13T16:13:37.290Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006467', id, 11762520, 12285000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-13T16:11:22.820Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006466', id, 3000000, 3000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-13T16:10:25.567Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006465', id, 2725000, 2725000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-13T16:09:42.933Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006464', id, 8322700, 8322700, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-13T14:48:07.837Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006463', id, 25700000, 25700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-13T11:20:08.180Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006462', id, 4700000, 21492000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-13T10:34:36.793Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006461', id, 8036450, 14700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-13T10:33:31.650Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006460', id, 6000000, 6000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-13T10:32:57.117Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006581', id, 270000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-13T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006458', id, 2587766, 2587766, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-12T18:22:35.257Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006457', id, 12400000, 12400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-12T16:41:03.290Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006456', id, 2800000, 18585000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-12T15:38:28.463Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006455', id, 2106000, 2106000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-12T15:37:36.057Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006454', id, 5617500, 5617500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-12T15:29:44.843Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006453', id, 4050000, 4050000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-12T15:29:04.113Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006452', id, 224000, 224000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-12T15:27:53.737Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006451', id, 7141000, 7141000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-12T15:25:57.507Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006450', id, 7000000, 16500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-12T15:21:48.393Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000070'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006471', id, 28514000, 28514000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-12T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006580', id, 436000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-12T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006449', id, 15800000, 15800000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-11T18:06:07.750Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006448', id, 290000, 290000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-11T15:33:47.163Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006447', id, 5300000, 5300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-11T15:08:06.837Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006446', id, 13400000, 13400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-11T10:25:28.130Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006445', id, 7606813, 7606813, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-11T10:24:30.517Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006444', id, 15055200, 15055200, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-11T10:22:56.423Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006459', id, 615000, 615000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-11T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006443', id, 12642900, 12642900, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-10T17:04:13.670Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006441', id, 1737000, 1737000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-10T16:51:10.987Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006440', id, 4700000, 4700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-10T16:32:55.557Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006439', id, 7350000, 13500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-10T16:13:17.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006438', id, 3334590, 3334590, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-10T15:25:20.107Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006437', id, 10491250, 10491250, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-10T15:20:23.423Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006436', id, 8051000, 8051000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-10T14:25:51.830Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006435', id, 8842313, 8842313, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-10T10:05:05.810Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006579', id, 820000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-10T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006433', id, 2531328, 2531328, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-09T17:00:37.620Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006432', id, 17100000, 17100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-09T16:41:25.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006430', id, 470000, 470000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-09T16:29:30.437Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006429', id, 19040000, 19040000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-09T15:16:42.850Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006428', id, 2725000, 27990000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-09T15:15:54.063Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006442', id, 25339900, 25339900, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-09T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006434', id, 7581000, 7581000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-09T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000074'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006578', id, 100000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-09T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006427', id, 1827000, 1827000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-08T16:56:43.057Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006426', id, 7424813, 7424813, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-08T16:10:45.997Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006425', id, 8055850, 9300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-08T15:29:55.073Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006424', id, 5585400, 11000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-08T15:21:42.113Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006423', id, 28848000, 28848000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-08T14:56:03.977Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006422', id, 11285017, 11285017, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-08T14:54:45.210Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006421', id, 7900000, 7900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-08T11:29:13.533Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006420', id, 300500, 300500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-08T11:26:02.667Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006419', id, 11125000, 11125000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-08T11:23:49.540Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006431', id, 5300000, 5300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-08T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006414', id, 4700000, 4700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-07T16:39:47.793Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006413', id, 1100000, 4440000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-07T15:59:50.057Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006412', id, 4230000, 4230000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-07T15:36:49.220Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006411', id, 3275000, 3275000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-07T15:36:08.257Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006410', id, 1330000, 1330000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-07T15:32:58.700Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006409', id, 11889192, 11889192, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-07T15:32:08.743Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006407', id, 8150000, 28900000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-07T09:20:13.453Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006635', id, 2100000, 850000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-07T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000077'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006406', id, 6480000, 6480000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-06T17:17:15.863Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006405', id, 660000, 660000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-06T17:16:17.113Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006404', id, 6350000, 6350000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-06T17:15:26.537Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006403', id, 4012500, 4012500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-06T16:08:31.073Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006401', id, 1100000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-06T16:04:56.013Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006399', id, 600000, 600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-06T15:53:24.173Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006398', id, 6557275, 10500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-06T15:03:02.633Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006397', id, 6127500, 6127500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-06T09:52:08.433Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006417', id, 6071400, 6071400, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-06T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006634', id, 5450000, 13000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-06T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000077'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006577', id, 270000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-06T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006394', id, 12561444, 12561444, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-05T16:08:25.787Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006393', id, 2050000, 2050000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-05T15:20:30.370Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006392', id, 2600000, 2600000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-05T15:19:28.943Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006390', id, 10000000, 10000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-05T15:00:04.530Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006389', id, 2814650, 18210000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-05T11:29:19.980Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006388', id, 36825000, 36825000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-05T09:45:37.267Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006387', id, 660000, 660000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-05T09:44:19.350Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006386', id, 270000, 270000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-05T09:37:37.413Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006385', id, 12071650, 12071650, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-05T08:28:15.913Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006418', id, 24014375, 24014375, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-05T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006633', id, 2100000, 2100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-05T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000077'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006576', id, 100000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-05T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006383', id, 6463100, 6463100, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-04T16:16:25.857Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000069'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006382', id, 25800000, 66555000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-04T14:50:16.790Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006575', id, 270000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-04T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006378', id, 5879410, 23200000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-03T15:20:39.523Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006377', id, 11761848, 11761848, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-03T15:19:43.300Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006376', id, 4700000, 4700000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-03T15:15:24.187Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006375', id, 15375000, 15375000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-03T10:54:32.020Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006374', id, 1140000, 40000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-03T09:53:24.947Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006416', id, 9570500, 9570500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-03T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006632', id, 5450000, 5450000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-03T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000077'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006380', id, 5300000, 5300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-03T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006384', id, 5241325, 5241325, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-03T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000066'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006381', id, 940000, 940000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-03T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006368', id, 1330000, 1330000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-02T18:24:54.010Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006367', id, 13343070, 13343070, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-02T18:23:59.890Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006366', id, 1782000, 1782000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-02T18:22:10.590Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006365', id, 1100000, 1100000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-02T18:21:47.767Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000072'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006364', id, 12000000, 12000000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-02T18:21:15.770Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000073'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006363', id, 12400000, 12400000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-02T14:41:39.157Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006362', id, 13300000, 13300000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-02T10:00:48.610Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006361', id, 1950000, 1950000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-02T10:00:06.610Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006360', id, 24112500, 24112500, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-02T09:51:14.457Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006415', id, 23929291, 23929291, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-02T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006372', id, 12123322, 12123322, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-02T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000069'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006573', id, 900000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-02T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006574', id, 430000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-02T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006379', id, 323000, 323000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-02T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000035'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006829', id, 95, 95, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-01T17:20:20.997Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000062'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006359', id, 12400000, 14500000, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-01T14:57:19.260Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000063'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006371', id, 13847100, 13847100, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-01T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000061'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006571', id, 1170000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-01T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

INSERT INTO "PurchaseOrder" ("tenantId", "code", "supplierId", "total", "paid", "note", "status", "createdAt", "updatedAt")
SELECT 1, 'PN006572', id, 100000, 0, NULL, 'COMPLETED'::"PurchaseOrderStatus", '2026-01-01T00:00:00.000Z', NOW()
FROM "Supplier" WHERE "tenantId" = 1 AND "code" = 'NCC000004'
ON CONFLICT ("tenantId", "code") DO UPDATE SET
  "total" = EXCLUDED."total",
  "paid" = EXCLUDED."paid",
  "note" = EXCLUDED."note",
  "status" = EXCLUDED."status",
  "updatedAt" = NOW();

COMMIT;
