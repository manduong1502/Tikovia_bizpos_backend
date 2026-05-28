import { Router } from 'express';
import { notificationController } from '../controllers/notificationController';

const router = Router();

router.get('/', notificationController.getAll);
router.put('/read-all', notificationController.readAll);
router.put('/:id/read', notificationController.readOne);
router.delete('/:id', notificationController.delete);

export default router;
