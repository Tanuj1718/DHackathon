import { Router } from "express";
import { createExercisePlan, getAllExercisePlans } from "../controllers/exercise.controller.js";


const router = Router()
router.route('/exercise').post(createExercisePlan)
router.route('/exercises').get(getAllExercisePlans)
export default router