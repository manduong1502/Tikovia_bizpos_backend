import { Router } from 'express';
import { productController } from '../controllers/productController';
import { authenticate } from '../middlewares/auth';

const router = Router();

router.use(authenticate);
router.get('/all', productController.getAll);
router.get('/', productController.list);
router.get('/:id', productController.getById);
router.post('/import', productController.importExcel);
router.post('/', productController.create);
router.put('/:id', productController.update);
router.delete('/:id', productController.delete);

export default router;
