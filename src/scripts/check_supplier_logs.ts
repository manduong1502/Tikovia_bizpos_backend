import { exec } from 'child_process';

async function main() {
  console.log('🔍 Đang lấy log container tiko-bizpos-api trong 15 phút qua...');
  
  // Chạy lệnh docker logs
  exec('docker logs tiko-bizpos-api --since 15m', (error, stdout, stderr) => {
    if (error) {
      console.error(`❌ Lỗi chạy docker logs: ${error.message}`);
      return;
    }

    const logs = stdout || stderr || '';
    const lines = logs.split('\n');
    console.log(`Tìm thấy ${lines.length} dòng log. Đang lọc các truy vấn liên quan đến Supplier...`);

    const supplierQueries = lines.filter(line => 
      line.includes('Supplier') && 
      (line.includes('UPDATE') || line.includes('SELECT') || line.includes('INSERT'))
    );

    if (supplierQueries.length === 0) {
      console.log('Không tìm thấy truy vấn nào liên quan đến Supplier trong 15 phút qua.');
    } else {
      console.log('=== TRUY VẤN SQL LIÊN QUAN ĐẾN SUPPLIER ===');
      supplierQueries.forEach((q, idx) => {
        console.log(`[${idx + 1}] ${q.trim()}`);
      });
    }
  });
}

main().catch(console.error);
