import { Router } from 'express';
import authRoutes from './auth';
import productRoutes from './products';
import { categoryController } from '../controllers/categoryController';
import { customerController } from '../controllers/customerController';
import { orderController } from '../controllers/orderController';
import { supplierController } from '../controllers/supplierController';
import { dashboardController } from '../controllers/dashboardController';
import { userController } from '../controllers/userController';
import { cashbookController } from '../controllers/cashbookController';
import { authenticate, authorize } from '../middlewares/auth';

const router = Router();

// ─── Auth (public login) ───
router.use('/auth', authRoutes);

// ─── Products ───
router.use('/products', productRoutes);

// ─── Categories ───
router.get('/categories', authenticate, categoryController.getAll);
router.post('/categories', authenticate, categoryController.create);
router.put('/categories/:id', authenticate, categoryController.update);
router.delete('/categories/:id', authenticate, authorize('ADMIN', 'MANAGER'), categoryController.delete);

// ─── Customers ───
router.get('/customers', authenticate, customerController.getAll);
router.get('/customers/:id', authenticate, customerController.getById);
router.post('/customers', authenticate, customerController.create);
router.put('/customers/:id', authenticate, customerController.update);
router.delete('/customers/:id', authenticate, authorize('ADMIN', 'MANAGER'), customerController.delete);

// ─── Orders ───
router.get('/orders', authenticate, orderController.getAll);
router.get('/orders/:id', authenticate, orderController.getById);
router.post('/orders', authenticate, orderController.create);
router.put('/orders/:id/cancel', authenticate, authorize('ADMIN', 'MANAGER'), orderController.cancel);

// ─── Suppliers ───
router.get('/suppliers', authenticate, supplierController.getAll);
router.post('/suppliers', authenticate, supplierController.create);
router.put('/suppliers/:id', authenticate, supplierController.update);
router.delete('/suppliers/:id', authenticate, authorize('ADMIN'), supplierController.delete);

// ─── Dashboard ───
router.get('/dashboard', authenticate, dashboardController.get);

// ─── Users / Employees ───
router.get('/users', authenticate, authorize('ADMIN', 'MANAGER'), userController.getAll);
router.put('/users/:id', authenticate, authorize('ADMIN'), userController.update);
router.patch('/users/:id/toggle', authenticate, authorize('ADMIN'), userController.toggleActive);

// ─── Cashbook ───
router.get('/cashbook', authenticate, cashbookController.getAll);
router.post('/cashbook', authenticate, authorize('ADMIN', 'MANAGER'), cashbookController.create);

export default router;
