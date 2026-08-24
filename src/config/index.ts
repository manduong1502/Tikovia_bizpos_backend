import dotenv from 'dotenv';
dotenv.config();

export const config = {
  port: parseInt(process.env.PORT || '4001', 10),
  nodeEnv: process.env.NODE_ENV || 'development',
  jwt: {
    secret: process.env.JWT_SECRET || 'fallback-secret-change-me',
    expiresIn: process.env.JWT_EXPIRES_IN || '7d',
  },
  driverSharedSecret: process.env.DRIVER_SHARED_SECRET || 'tikovia-driver-secure-key-2026-change-me',
  cors: {
    origin: process.env.CORS_ORIGIN?.split(',') || ['http://localhost:5173', 'https://bizpos.tikovia.vn'],
  },
  smtp: {
    host: process.env.SMTP_HOST || 'smtp.gmail.com',
    port: parseInt(process.env.SMTP_PORT || '587', 10),
    secure: process.env.SMTP_SECURE === 'true',
    user: process.env.SMTP_USER || process.env.GMAIL_USER || '',
    pass: process.env.SMTP_PASS || process.env.GMAIL_PASS || '',
    from: process.env.SMTP_FROM || '"Tiko BizPOS Bảo Mật" <no-reply@tikovia.vn>',
  },
  pagination: {
    defaultPage: 1,
    defaultLimit: 20,
    maxLimit: 500000,
  },
};
