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
import { purchaseOrderController } from '../controllers/purchaseOrderController';
import { purchaseReturnController } from '../controllers/purchaseReturnController';
import { returnController } from '../controllers/returnController';
import { inventoryCheckController } from '../controllers/inventoryCheckController';
import { reportController } from '../controllers/reportController';
import { brandController } from '../controllers/brandController';
import { tenantController } from '../controllers/tenantController';
import { authenticate, authorize, authenticateSuperAdmin } from '../middlewares/auth';

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

// ─── Brands ───
router.get('/brands', authenticate, brandController.getAll);
router.post('/brands', authenticate, brandController.create);

// ─── Customers ───
router.get('/customers', authenticate, customerController.getAll);
router.get('/customers/:id', authenticate, customerController.getById);
router.post('/customers/import', authenticate, customerController.importExcel);
router.post('/customers', authenticate, customerController.create);
router.put('/customers/:id', authenticate, customerController.update);
router.delete('/customers/:id', authenticate, authorize('ADMIN', 'MANAGER'), customerController.delete);

// ─── Orders ───
router.get('/orders/by-driver', orderController.getOrdersForDriver);
router.get('/orders', authenticate, orderController.getAll);
router.get('/orders/:id', authenticate, orderController.getById);
router.post('/orders/import', authenticate, orderController.importExcel);
router.post('/orders', authenticate, orderController.create);
router.put('/orders/by-code/:code/driver-status', orderController.updateDriverStatus);
router.put('/orders/:id', authenticate, orderController.update);
router.put('/orders/:id/cancel', authenticate, authorize('ADMIN', 'MANAGER'), orderController.cancel);
router.delete('/orders/:id', authenticate, orderController.delete);

// ─── Suppliers ───
router.get('/suppliers', authenticate, supplierController.getAll);
router.post('/suppliers/import', authenticate, supplierController.importExcel);
router.post('/suppliers', authenticate, supplierController.create);
router.put('/suppliers/:id', authenticate, supplierController.update);
router.delete('/suppliers/:id', authenticate, authorize('ADMIN'), supplierController.delete);

// ─── Dashboard ───
router.get('/dashboard', authenticate, dashboardController.get);

// ─── Users / Employees ───
router.get('/users', authenticate, authorize('ADMIN', 'MANAGER'), userController.getAll);
router.put('/users/:id', authenticate, authorize('ADMIN'), userController.update);
router.patch('/users/:id/toggle', authenticate, authorize('ADMIN'), userController.toggleActive);


// ─── Purchase Orders (Nhập hàng) ───
router.get('/purchase-orders', authenticate, purchaseOrderController.getAll);
router.get('/purchase-orders/:id', authenticate, purchaseOrderController.getById);
router.post('/purchase-orders', authenticate, authorize('ADMIN', 'MANAGER'), purchaseOrderController.create);
router.put('/purchase-orders/:id', authenticate, authorize('ADMIN', 'MANAGER'), purchaseOrderController.update);
router.put('/purchase-orders/:id/cancel', authenticate, authorize('ADMIN', 'MANAGER'), purchaseOrderController.cancel);
router.delete('/purchase-orders/:id', authenticate, authorize('ADMIN', 'MANAGER'), purchaseOrderController.delete);

// ─── Purchase Returns (Trả hàng nhập) ───
router.get('/purchase-returns', authenticate, purchaseReturnController.getAll);
router.get('/purchase-returns/:id', authenticate, purchaseReturnController.getById);
router.post('/purchase-returns', authenticate, authorize('ADMIN', 'MANAGER'), purchaseReturnController.create);

// ─── Returns (Trả hàng bán) ───
router.get('/returns', authenticate, returnController.getAll);
router.get('/returns/:id', authenticate, returnController.getById);
router.post('/returns', authenticate, authorize('ADMIN', 'MANAGER'), returnController.create);
router.put('/returns/:id', authenticate, authorize('ADMIN', 'MANAGER'), returnController.update);
router.put('/returns/:id/cancel', authenticate, authorize('ADMIN', 'MANAGER'), returnController.cancel);

// ─── Inventory Checks (Kiểm kho) ───
router.get('/inventory-checks', authenticate, inventoryCheckController.getAll);
router.post('/inventory-checks', authenticate, authorize('ADMIN', 'MANAGER'), inventoryCheckController.create);

// ─── Reports (Báo cáo) ───
router.get('/reports/end-of-day', authenticate, reportController.endOfDay);
router.get('/reports/sales', authenticate, reportController.sales);
router.get('/reports/products', authenticate, reportController.products);
router.get('/reports/customers', authenticate, reportController.getCustomers);

// ─── Cashbook ───
router.get('/cashbook', authenticate, cashbookController.getAll);
router.post('/cashbook', authenticate, authorize('ADMIN', 'MANAGER'), cashbookController.create);
router.put('/cashbook/:id/cancel', authenticate, authorize('ADMIN', 'MANAGER'), cashbookController.cancel);
router.get('/cashbook/partners', authenticate, cashbookController.getPartners);
router.post('/cashbook/partners', authenticate, cashbookController.createPartner);

// ─── Tenants (Super Admin Only) ───
router.get('/tenants', authenticateSuperAdmin, tenantController.getAll);
router.put('/tenants/:id', authenticateSuperAdmin, tenantController.update);
router.delete('/tenants/:id', authenticateSuperAdmin, tenantController.delete);

export default router;
