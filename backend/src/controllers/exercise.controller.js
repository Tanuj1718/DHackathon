import { Exercise } from "../models/user.exercise.models.js";


const createExercisePlan = async (req, res) => {
    const { exercise_name, duration, calories_burned, description } = req.body;

    try {
        const newExercise = new Exercise({
            exercise_name,
            duration,
            calories_burned,
            description
        });

        await newExercise.save();
        return res.status(201).json(newExercise);
    } catch (error) {
        return res.status(400).json({ message: error.message });
    }
};

const getAllExercisePlans = async (req, res) => {
    try {
        const exercises = await Exercise.find();
        return res.status(200).json(exercises);
    } catch (error) {
        return res.status(500).json({ message: error.message });
    }
};


export {createExercisePlan, getAllExercisePlans}