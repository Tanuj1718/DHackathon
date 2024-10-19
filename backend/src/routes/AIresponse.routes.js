import { Router } from "express";
import { getData, getDiet, getExercise } from "../utils/AIResponse.js";


const router = Router()
router.route('/getData').post(getData)
router.route('/getDiet').post(getDiet)
router.route('/getExercise').post(getExercise)
export default router