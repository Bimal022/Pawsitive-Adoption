import express from 'express';
import { getPets, addPet, addToFavorites, deletePet, deleteAllPets } from '../controllers/petController.js';

const router = express.Router();

router.route('/').get(getPets).post(addPet).delete(deleteAllPets);
router.route('/:id/favorite').put(addToFavorites);
router.route('/:id').delete(deletePet);

export default router;
