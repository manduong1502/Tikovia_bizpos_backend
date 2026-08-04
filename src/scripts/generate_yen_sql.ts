import * as XLSX from 'xlsx';
import * as fs from 'fs';

function generateSql() {
  const filePath = 'C:/Users/ADMIN/Downloads/CongNoChiTietKhachHang_KH001119_KV04082026-091009-843.xlsx';
  const wb = XLSX.readFile(filePath);
  const sheet = wb.Sheets[wb.SheetNames[0]];
  const rows: any[][] = XLSX.utils.sheet_to_json(sheet, { header: 1 });

  let headerIdx = -1;
  for (let i = 0; i < rows.length; i++) {
    if (rows[i] && rows[i][0] === 'Thời gian' && rows[i][1] === 'Mã') {
      headerIdx = i;
      break;
    }
  }

  const parseDate = (str: any) => {
    if (!str) return new Date().toISOString();
    const clean = String(str).replace(/\r?\n\s*/g, ' ').trim();
    const match = clean.match(/(\d{2})\/(\d{2})\/(\d{4})\s+(\d{2}):(\d{2})/);
    if (match) {
      const [_, day, month, year, hour, min] = match;
      const d = new Date(Date.UTC(Number(year), Number(month) - 1, Number(day), Number(hour) - 7, Number(min)));
      return d.toISOString();
    }
    return new Date().toISOString();
  };

  let sqlStatements: string[] = [];

  sqlStatements.push(`-- Clean old records for Sister Yến KH001119`);
  sqlStatements.push(`DO $$`);
  sqlStatements.push(`DECLARE c_id INT; t_id INT; u_id INT; p_id INT;`);
  sqlStatements.push(`BEGIN`);
  sqlStatements.push(`  SELECT id INTO t_id FROM "Tenant" LIMIT 1;`);
  sqlStatements.push(`  SELECT id INTO u_id FROM "User" LIMIT 1;`);
  sqlStatements.push(`  SELECT id INTO p_id FROM "Product" LIMIT 1;`);
  sqlStatements.push(`  SELECT id INTO c_id FROM "Customer" WHERE code = 'KH001119' AND "tenantId" = t_id;`);
  sqlStatements.push(`  IF c_id IS NULL THEN`);
  sqlStatements.push(`    INSERT INTO "Customer" (code, name, phone, "totalSpent", "totalDebt", "tenantId", "updatedAt")`);
  sqlStatements.push(`    VALUES ('KH001119', 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 485796600, 17027180, t_id, NOW())`);
  sqlStatements.push(`    RETURNING id INTO c_id;`);
  sqlStatements.push(`  ELSE`);
  sqlStatements.push(`    UPDATE "Customer" SET "totalSpent" = 485796600, "totalDebt" = 17027180 WHERE id = c_id;`);
  sqlStatements.push(`    DELETE FROM "CashbookEntry" WHERE "customerId" = c_id;`);
  sqlStatements.push(`    DELETE FROM "OrderItem" WHERE "orderId" IN (SELECT id FROM "Order" WHERE "customerId" = c_id);`);
  sqlStatements.push(`    DELETE FROM "Order" WHERE "customerId" = c_id;`);
  sqlStatements.push(`  END IF;`);

  let orders: any[] = [];
  let cashbooks: any[] = [];
  let currentOrder: any = null;

  for (let i = headerIdx + 1; i < rows.length; i++) {
    const r = rows[i];
    if (!r || r.length === 0) continue;

    const rawDate = r[0];
    const code = r[1];
    const type = r[2];
    const debit = r[10];
    const credit = r[11];

    if (code && type === 'Bán hàng') {
      if (currentOrder) orders.push(currentOrder);
      currentOrder = {
        code: String(code).trim().replace(/'/g, "''"),
        date: parseDate(rawDate),
        total: Number(debit || 0),
        items: []
      };
    } else if (code && type === 'Thanh toán') {
      if (currentOrder) { orders.push(currentOrder); currentOrder = null; }
      cashbooks.push({
        code: String(code).trim().replace(/'/g, "''"),
        date: parseDate(rawDate),
        amount: Number(credit || 0)
      });
    } else if (currentOrder && r[1] && r[2]) {
      currentOrder.items.push({
        sku: String(r[1]).trim().replace(/'/g, "''"),
        name: String(r[2]).trim().replace(/'/g, "''"),
        quantity: Number(r[4] || 1),
        price: Number(r[5] || 0),
        subtotal: Number(r[9] || 0)
      });
    }
  }
  if (currentOrder) orders.push(currentOrder);

  // Insert orders via PL/pgSQL loop
  orders.forEach((o, oIdx) => {
    sqlStatements.push(`  -- Order ${o.code}`);
    sqlStatements.push(`  WITH new_ord AS (`);
    sqlStatements.push(`    INSERT INTO "Order" (code, "customerId", "userId", "tenantId", status, total, paid, subtotal, "createdAt", "updatedAt")`);
    sqlStatements.push(`    VALUES ('${o.code}', c_id, u_id, t_id, 'COMPLETED', ${o.total}, ${o.total}, ${o.total}, '${o.date}'::timestamp, '${o.date}'::timestamp)`);
    sqlStatements.push(`    RETURNING id`);
    sqlStatements.push(`  )`);
    if (o.items.length > 0) {
      o.items.forEach((it: any) => {
        sqlStatements.push(`  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)`);
        sqlStatements.push(`  SELECT id, COALESCE((SELECT id FROM "Product" WHERE LOWER(sku) = LOWER('${it.sku}') AND "tenantId" = t_id LIMIT 1), p_id), ${it.quantity}, ${it.price}, ${it.subtotal} FROM new_ord;`);
      });
    } else {
      sqlStatements.push(`  INSERT INTO "OrderItem" ("orderId", "productId", quantity, price, total)`);
      sqlStatements.push(`  SELECT id, p_id, 1, ${o.total}, ${o.total} FROM new_ord;`);
    }
  });

  // Insert cashbooks
  cashbooks.forEach((cb) => {
    sqlStatements.push(`  INSERT INTO "CashbookEntry" (code, type, amount, category, "partnerType", "customerId", "partnerName", "partnerPhone", description, "userId", "tenantId", status, "createdAt", "updatedAt")`);
    sqlStatements.push(`  VALUES ('${cb.code}', 'INCOME', ${cb.amount}, 'Thu tiền khách trả', 'customer', c_id, 'CHỊ YẾN - BÊ THUI HOÀNG YẾN - Hòa Tiến', '0935657905', 'Thanh toán công nợ', u_id, t_id, 'completed', '${cb.date}'::timestamp, '${cb.date}'::timestamp);`);
  });

  sqlStatements.push(`END $$;`);

  fs.writeFileSync('d:/Mẫn/demo web kioviet/kiotviet-backend/import_yen_debt.sql', sqlStatements.join('\n'), 'utf-8');
  console.log('Generated import_yen_debt.sql successfully!');
}

generateSql();
