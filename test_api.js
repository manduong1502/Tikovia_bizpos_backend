const jwt = require('jsonwebtoken');

const JWT_SECRET = "tiko-bizpos-jwt-secret-key-2026-change-me";

// Generate token for user id 1, username admin, role ADMIN
const token = jwt.sign({ id: 1, username: 'admin', role: 'ADMIN' }, JWT_SECRET, { expiresIn: '7d' });

console.log('Token:', token);

async function test() {
  try {
    const res = await fetch('https://api.tikovia.vn/api/orders/412', {
      headers: {
        'Authorization': `Bearer ${token}`,
        'X-Tenant-Subdomain': 'demo'
      }
    });
    console.log('API Response Status:', res.status);
    const text = await res.text();
    console.log('API Response Data:', text);
  } catch (err) {
    console.error('API Request Failed:', err.message);
  }
}

test();
