import { Request, Response, NextFunction } from 'express';
import prisma from '../config/database';

export const cashbookController = {
  getAll: async (req: Request, res: Response, next: NextFunction) => {
    try {
      const from = req.query.from as string;
      const to = req.query.to as string;

      const where: any = {};
      if (from || to) {
        where.createdAt = {};
        if (from) where.createdAt.gte = new Date(from);
        if (to) where.createdAt.lte = new Date(to + 'T23:59:59.999Z');
      }

      const entries = await prisma.cashbookEntry.findMany({
        where,
        include: { user: { select: { id: true, fullName: true } } },
        orderBy: { createdAt: 'desc' },
      });
      res.json(entries);
    } catch (error) {
      next(error);
    }
  },

  create: async (req: Request, res: Response, next: NextFunction) => {
    try {
      // Auto-generate code
      const lastEntry = await prisma.cashbookEntry.findFirst({ orderBy: { id: 'desc' } });
      const nextNum = (lastEntry?.id || 0) + 1;
      const code = `SQ${String(nextNum).padStart(6, '0')}`;

      const entry = await prisma.cashbookEntry.create({
        data: { ...req.body, code },
        include: { user: { select: { id: true, fullName: true } } },
      });
      res.status(201).json(entry);
    } catch (error) {
      next(error);
    }
  },
};
