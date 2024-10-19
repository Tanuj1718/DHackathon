import { Router } from "express";
import { getData, getDiet, getExercise } from "../utils/AIResponse.js";


const router = Router()
router.route('/getData').post(getData)
router.route('/getDiet').get(getDiet)
router.route('/getExercise').get(getExercise)
export default router