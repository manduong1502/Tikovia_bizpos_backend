// Script: Update customer debts via API (production)
const fs = require('fs');
const http = require('http');

const results = JSON.parse(fs.readFileSync('d:/TikoBizpos/KH/_debt_summary.json', 'utf8'));
const seen = new Set();
const unique = results.filter(r => { if (seen.has(r.custCode)) return false; seen.add(r.custCode); return true; });

const API_BASE = 'http://116.105.163.181:3010/api';
const TENANT_ID = 'thucphamtichdaiviet';

// First get auth token
function apiRequest(method, path, body) {
  return new Promise((resolve, reject) => {
    const url = new URL(API_BASE + path);
    const options = {
      hostname: url.hostname,
      port: url.port,
      path: url.pathname + url.search,
      method,
      headers: {
        'Content-Type': 'application/json',
        'x-tenant-id': TENANT_ID,
      },
      timeout: 15000,
    };
    
    const req = http.request(options, res => {
      let data = '';
      res.on('data', chunk => data += chunk);
      res.on('end', () => {
        try { resolve({ status: res.statusCode, data: JSON.parse(data) }); }
        catch { resolve({ status: res.statusCode, data }); }
      });
    });
    req.on('error', reject);
    req.on('timeout', () => { req.destroy(); reject(new Error('timeout')); });
    if (body) req.write(JSON.stringify(body));
    req.end();
  });
}

async function main() {
  // Step 1: Login to get token
  console.log('Logging in...');
  const loginRes = await apiRequest('POST', '/auth/login', {
    username: 'admin',
    password: 'tikovia2026',
    tenantId: TENANT_ID,
  });
  
  if (!loginRes.data.token) {
    console.error('Login failed:', loginRes.data);
    process.exit(1);
  }
  const token = loginRes.data.token;
  console.log('Login OK\n');

  // Step 2: Get all customers to map code -> id
  console.log('Fetching customers...');
  const custRes = await apiRequest('GET', '/customers?limit=9999');
  // Add auth header
  const customers = custRes.data.data || custRes.data;
  
  if (!Array.isArray(customers)) {
    console.log('Need auth. Retrying with token...');
  }
  
  // Actually need to add token to requests - rebuild function
  function apiWithAuth(method, path, body) {
    return new Promise((resolve, reject) => {
      const url = new URL(API_BASE + path);
      const options = {
        hostname: url.hostname,
        port: url.port,
        path: url.pathname + url.search,
        method,
        headers: {
          'Content-Type': 'application/json',
          'x-tenant-id': TENANT_ID,
          'Authorization': `Bearer ${token}`,
        },
        timeout: 15000,
      };
      
      const req = http.request(options, res => {
        let data = '';
        res.on('data', chunk => data += chunk);
        res.on('end', () => {
          try { resolve({ status: res.statusCode, data: JSON.parse(data) }); }
          catch { resolve({ status: res.statusCode, data }); }
        });
      });
      req.on('error', reject);
      req.on('timeout', () => { req.destroy(); reject(new Error('timeout')); });
      if (body) req.write(JSON.stringify(body));
      req.end();
    });
  }

  const custRes2 = await apiWithAuth('GET', '/customers?limit=9999');
  const allCustomers = custRes2.data.data || custRes2.data;
  
  if (!Array.isArray(allCustomers)) {
    console.error('Failed to get customers:', custRes2);
    process.exit(1);
  }
  
  console.log(`Got ${allCustomers.length} customers from DB\n`);
  
  // Build code -> id map
  const codeToId = {};
  allCustomers.forEach(c => { codeToId[c.code] = c.id; });

  // Step 3: Update each customer
  let success = 0, fail = 0, notFound = 0;
  
  for (const r of unique) {
    const custId = codeToId[r.custCode];
    if (!custId) {
      console.log(`  ❌ NOT FOUND: ${r.custCode} (${r.custName})`);
      notFound++;
      continue;
    }
    
    try {
      const res = await apiWithAuth('PUT', `/customers/${custId}`, {
        totalDebt: r.endingDebt,
      });
      
      if (res.status === 200) {
        console.log(`  ✅ ${r.custCode} | totalDebt = ${r.endingDebt.toLocaleString('vi-VN')} | ${r.custName}`);
        success++;
      } else {
        console.log(`  ❌ ${r.custCode} | Status ${res.status} | ${JSON.stringify(res.data).slice(0,100)}`);
        fail++;
      }
    } catch (e) {
      console.log(`  ❌ ${r.custCode} | Error: ${e.message}`);
      fail++;
    }
  }

  console.log(`\n=== DONE ===`);
  console.log(`  Success: ${success}`);
  console.log(`  Failed: ${fail}`);
  console.log(`  Not found: ${notFound}`);
  console.log(`  Total: ${unique.length}`);
}

main().catch(e => { console.error(e); process.exit(1); });
