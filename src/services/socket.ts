import { Server as HTTPServer } from 'http';
import { Server, Socket } from 'socket.io';
import jwt from 'jsonwebtoken';
import { config } from '../config';
import prisma from '../config/database';

let io: Server | null = null;

export const initSocket = (server: HTTPServer) => {
  io = new Server(server, {
    cors: {
      origin: config.cors.origin,
      credentials: true,
      methods: ['GET', 'POST', 'PUT', 'PATCH', 'DELETE', 'OPTIONS'],
      allowedHeaders: ['Content-Type', 'Authorization', 'X-Tenant-Subdomain'],
    }
  });

  io.use(async (socket: Socket, next) => {
    try {
      // Allow token to be passed via query handshake or auth header/object
      const token = socket.handshake.query.token as string || socket.handshake.auth.token as string;
      if (!token) {
        return next(new Error('Authentication error: Token missing'));
      }

      const decoded = jwt.verify(token, config.jwt.secret) as { id: number; username: string; role: string };
      const user = await prisma.user.findUnique({ where: { id: decoded.id } });
      if (!user || !user.isActive) {
        return next(new Error('Authentication error: User not found or inactive'));
      }

      socket.data = {
        userId: user.id,
        tenantId: user.tenantId,
        username: user.username,
        role: user.role
      };
      next();
    } catch (err) {
      return next(new Error('Authentication error: Invalid token'));
    }
  });

  io.on('connection', (socket: Socket) => {
    const tenantId = socket.data.tenantId;
    const roomName = `tenant_${tenantId}`;
    socket.join(roomName);
    console.log(`🔌 Client connected to Socket.io: user ${socket.data.username} joined room ${roomName} (socket ID: ${socket.id})`);

    socket.on('disconnect', () => {
      console.log(`🔌 Client disconnected from Socket.io (socket ID: ${socket.id})`);
    });
  });

  return io;
};

export const getIO = (): Server => {
  if (!io) {
    throw new Error('Socket.io has not been initialized');
  }
  return io;
};
