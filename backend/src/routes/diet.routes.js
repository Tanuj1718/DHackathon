import { Router } from "express";
import { createDietPlan, getAllDietPlans } from "../controllers/diet.controller.js";


const router = Router()
router.route('/diet').post(createDietPlan)
router.route('/diets').get(getAllDietPlans)
export default router