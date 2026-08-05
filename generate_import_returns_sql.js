const XLSX = require('xlsx');
const path = require('path');
const fs = require('fs');

const excelDateToISO = (serial) => {
  if (typeof serial === 'string') {
    const d = new Date(serial);
    if (!isNaN(d.getTime())) return d.toISOString();
  }
  if (typeof serial === 'number') {
    const utc_days = Math.floor(serial - 25569);
    const utc_value = utc_days * 86400;
    const date_info = new Date(utc_value * 1000);
    const fractional_day = serial - Math.floor(serial) + 0.0000001;
    let total_seconds = Math.floor(86400 * fractional_day);
    const seconds = total_seconds % 60;
    total_seconds = Math.floor(total_seconds / 60);
    const minutes = total_seconds % 60;
    const hours = Math.floor(total_seconds / 60);
    const d = new Date(Date.UTC(date_info.getFullYear(), date_info.getMonth(), date_info.getDate(), hours, minutes, seconds));
    return d.toISOString();
  }
  return new Date().toISOString();
};

function generateSql() {
  const excelPath = path.resolve(__dirname, '../DanhSachChiTietTraHang_KV05082026-153713-675.xlsx');
  console.log('Reading excel from:', excelPath);

  const wb = XLSX.readFile(excelPath);
  const ws = wb.Sheets[wb.SheetNames[0]];
  const data = XLSX.utils.sheet_to_json(ws, { header: 1 });

  const returnsMap = {};

  data.slice(1).forEach((row) => {
    const code = String(row[1] || '').trim();
    if (!code || !code.startsWith('TH')) return;
    
    const createdAtISO = excelDateToISO(row[2]);
    const orderCode = String(row[4] || '').trim();
    const customerCode = String(row[7] || '').trim();
    const customerName = String(row[8] || '').trim();
    const note = String(row[12] || '').trim();
    const totalVal = Number(row[13] || row[15] || 0);
    const paidVal = Number(row[18] || totalVal);
    const statusStr = String(row[25] || '').trim();
    const status = statusStr === 'Đã hủy' ? 'CANCELLED' : 'COMPLETED';
    
    const itemSku = String(row[26] || '').trim();
    const itemName = String(row[27] || '').trim();
    const itemQty = Number(row[31] || 0);
    const itemPrice = Number(row[35] || row[32] || 0);

    if (!returnsMap[code]) {
      returnsMap[code] = {
        code,
        createdAtISO,
        orderCode,
        customerCode,
        customerName,
        note,
        total: totalVal,
        paid: paidVal,
        status,
        items: []
      };
    }

    if (itemSku) {
      returnsMap[code].items.push({
        sku: itemSku,
        name: itemName,
        quantity: itemQty,
        price: itemPrice,
        total: itemQty * itemPrice
      });
    }
  });

  const returnCodes = Object.keys(returnsMap);
  console.log(`Found ${returnCodes.length} return tickets.`);

  let sql = `-- SQL IMPORT SALES RETURNS FROM KIOTVIET EXCEL 2026\n`;
  sql += `BEGIN;\n\n`;

  // We fetch tenant_id = 1 (or first tenant)
  sql += `DO $$\nDECLARE\n  t_id INT;\nBEGIN\n  SELECT id INTO t_id FROM "Tenant" LIMIT 1;\n\n`;

  for (const code of returnCodes) {
    const r = returnsMap[code];
    const escapedCode = r.code.replace(/'/g, "''");
    const escapedReason = (r.note || 'Trả hàng từ file Excel KiotViet').replace(/'/g, "''");
    const escapedOrderCode = r.orderCode ? r.orderCode.replace(/'/g, "''") : '';
    const escapedCustomerCode = r.customerCode ? r.customerCode.replace(/'/g, "''") : '';

    sql += `  -- Process return ${r.code}\n`;
    sql += `  DECLARE\n`;
    sql += `    o_id INT := NULL;\n`;
    sql += `    c_id INT := NULL;\n`;
    sql += `    ret_id INT := NULL;\n`;
    sql += `    p_id INT := NULL;\n`;
    sql += `  BEGIN\n`;

    if (escapedOrderCode) {
      sql += `    SELECT id INTO o_id FROM "Order" WHERE "tenantId" = t_id AND "code" = '${escapedOrderCode}' LIMIT 1;\n`;
    }
    if (escapedCustomerCode) {
      sql += `    SELECT id INTO c_id FROM "Customer" WHERE "tenantId" = t_id AND "code" = '${escapedCustomerCode}' LIMIT 1;\n`;
    }

    sql += `    -- Delete existing return if re-importing\n`;
    sql += `    DELETE FROM "Return" WHERE "tenantId" = t_id AND "code" = '${escapedCode}';\n`;

    sql += `    INSERT INTO "Return" ("tenantId", "code", "orderId", "customerId", "total", "discount", "paid", "reason", "status", "createdAt")\n`;
    sql += `    VALUES (t_id, '${escapedCode}', o_id, c_id, ${r.total}, 0, ${r.paid}, '${escapedReason}', '${r.status}', '${r.createdAtISO}'::timestamp)\n`;
    sql += `    RETURNING id INTO ret_id;\n\n`;

    for (const it of r.items) {
      const escapedSku = it.sku.replace(/'/g, "''");
      sql += `    SELECT id INTO p_id FROM "Product" WHERE "tenantId" = t_id AND "sku" = '${escapedSku}' LIMIT 1;\n`;
      sql += `    IF p_id IS NOT NULL THEN\n`;
      sql += `      INSERT INTO "ReturnItem" ("returnId", "productId", "quantity", "price", "total")\n`;
      sql += `      VALUES (ret_id, p_id, ${it.quantity}, ${it.price}, ${it.total});\n`;
      sql += `    END IF;\n`;
    }

    sql += `  END;\n\n`;
  }

  sql += `END $$;\n\n`;

  // Sync Return sequence
  sql += `SELECT setval(pg_get_serial_sequence('"Return"', 'id'), COALESCE(MAX(id), 1)) FROM "Return";\n`;
  sql += `SELECT setval(pg_get_serial_sequence('"ReturnItem"', 'id'), COALESCE(MAX(id), 1)) FROM "ReturnItem";\n`;
  sql += `COMMIT;\n`;

  const outputPath = path.resolve(__dirname, 'import_sales_returns_2026.sql');
  fs.writeFileSync(outputPath, sql, 'utf8');
  console.log('Successfully generated SQL file:', outputPath);
}

generateSql();
