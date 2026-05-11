import { Request, Response, NextFunction } from 'express';

// Global error handler — prevents crashes from unhandled errors
export const errorHandler = (err: any, req: Request, res: Response, next: NextFunction) => {
  console.error('❌ Error:', err.message);
  console.error(err.stack);

  // Prisma known errors
  if (err.code === 'P2002') {
    return res.status(409).json({
      message: `Dữ liệu đã tồn tại (trùng ${err.meta?.target?.join(', ') || 'unique field'})`,
    });
  }
  if (err.code === 'P2025') {
    return res.status(404).json({ message: 'Không tìm thấy bản ghi' });
  }

  // Zod validation errors
  if (err.name === 'ZodError') {
    return res.status(400).json({
      message: 'Dữ liệu không hợp lệ',
      errors: err.issues.map((i: any) => ({ field: i.path.join('.'), message: i.message })),
    });
  }

  const status = err.statusCode || err.status || 500;
  res.status(status).json({
    message: err.message || 'Lỗi máy chủ nội bộ',
    ...(process.env.NODE_ENV === 'development' && { stack: err.stack }),
  });
};

// 404 handler
export const notFoundHandler = (req: Request, res: Response) => {
  res.status(404).json({ message: `Không tìm thấy route: ${req.method} ${req.originalUrl}` });
};
