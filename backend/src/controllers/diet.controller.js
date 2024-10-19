import { Diet } from "../models/user.diet.models.js";

// Create a new diet plan
const createDietPlan = async (req, res) => {
    const { dietName, description, startDate, endDate } = req.body;

    try {
        const newDiet = new Diet({
            dietName,
            description,
            startDate,
            endDate
        });

        await newDiet.save();
        return res.status(201).json(newDiet);
    } catch (error) {
        return res.status(400).json({ message: error.message });
    }
};

// Get all diet plans
const getAllDietPlans = async (req, res) => {
    try {
        const diets = await Diet.find();
        return res.status(200).json(diets);
    } catch (error) {
        return res.status(500).json({ message: error.message });
    }
};


export {createDietPlan, getAllDietPlans}