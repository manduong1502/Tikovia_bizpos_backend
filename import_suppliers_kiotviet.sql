-- ==========================================================
-- SQL UPDATE CHI TIẾT 23 NHÀ CUNG CẤP CHUẨN KIOTVIET (100% SỐ LIỆU GỐC)
-- Tổng Nợ cần trả = 733.974.385 VNĐ | Tổng Mua = 20.626.957.922 VNĐ
-- ==========================================================

BEGIN;

-- [NCC000080] tý tuyết
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

-- [NCC000079] linh sụn
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

-- [NCC000078] công ty Bách phúc phương
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

-- [NCC000077] công ty Hùng Trương
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

-- [NCC000076] dana food
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

-- [NCC000075] công ty bee bee
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

-- [NCC000074] nhà phân phối mực miền Trung
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

-- [NCC000073] thiên tín food 0902339233
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

-- [NCC000072] 53 lỗ giáng 24
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

-- [NCC000071] thuỷ triều
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

-- [NCC000070] Cô Trung điện hòa
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

-- [NCC000069] người sành ăn
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

-- [NCC000068] Cty PHÁT THỊNH VƯỢNG
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

-- [NCC000066] công ty Sáng Ngọc
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

-- [NCC000065] Cty Anh Minh Quân
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

-- [NCC000063] công ty tnhh thực phẩm t&t
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

-- [NCC000062] an thịnh food
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

-- [NCC000061] CHỊ TRI ( Minh Quang Food)
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

-- [NCC000058] công ty Quân Bảo
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

-- [NCC000035] 07 phạm xuân ẩn
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

-- [NCC000018] 65 Nguyễn Hồng ánh
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

-- [NCC000016] thủy sản bắc trung nam
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

-- [NCC000004] Anh Sơn - Sụn Gà
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

COMMIT;
