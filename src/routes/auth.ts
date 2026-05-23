import { Router } from 'express';
import { authController } from '../controllers/authController';
import { authenticate, authorize } from '../middlewares/auth';

const router = Router();

router.post('/login', authController.login);
router.post('/register', authenticate, authorize('ADMIN'), authController.register);
router.post('/register-tenant', authController.registerTenant);
router.get('/tenant', authController.getTenant);
router.get('/me', authenticate, authController.me);

export default router;

