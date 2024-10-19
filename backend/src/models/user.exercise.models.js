import {mongoose, Schema} from "mongoose";

const exerciseSchema = new Schema({
    exercise_name: {
        type: String,
        required: true
    },
    duration: {
        type: String,
        required: true
    },
    calories_burned: {
        type: String,
        required: true
    },
    description: {
        type: String,
        required: true
    }
})

export const Exercise = mongoose.model("Exercise", exerciseSchema);