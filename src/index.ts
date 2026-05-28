import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import morgan from 'morgan';
import compression from 'compression';
import { createServer } from 'http';
import { config } from './config';
import routes from './routes';
import { errorHandler, notFoundHandler } from './middlewares/errorHandler';
import { tenantResolver } from './middlewares/tenant';
import { initSocket } from './services/socket';

const app = express();
const server = createServer(app);
const io = initSocket(server);
app.set('io', io);

// ─── Security ───
app.use(helmet());

// ─── CORS ───
app.use(cors({
  origin: config.cors.origin,
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization', 'X-Tenant-Subdomain'],
}));

// ─── Performance ───
app.use(compression());

// ─── Logging ───
app.use(morgan(config.nodeEnv === 'production' ? 'combined' : 'dev'));

// ─── Body parsing ───
app.use(express.json({ limit: '10mb' }));
app.use(express.urlencoded({ extended: true }));

// ─── Health check ───
app.get('/health', (req, res) => {
  res.json({ status: 'ok', timestamp: new Date().toISOString() });
});

// ─── API Routes ───
app.use('/api', tenantResolver, routes);


// ─── Error handling ───
app.use(notFoundHandler);
app.use(errorHandler);

// ─── Start server ───
server.listen(config.port, '0.0.0.0', () => {
  console.log(`
  🚀 Tiko BizPOS Backend đang chạy!
  📍 Port: ${config.port}
  🌐 URL: http://localhost:${config.port}
  🔧 Env: ${config.nodeEnv}
  `);
});

export default app;
