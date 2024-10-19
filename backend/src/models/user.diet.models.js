import {mongoose, Schema} from "mongoose";

const dietSchema = new Schema({
    dietName: {
        type: String, 
        required: true
    },
    description: {
        type: String,
        required: true
    },
    startDate:{
        type: String,
        required: true
    },
    endDate: {
        type: String,
        required: true
    }
})


export const Diet = mongoose.model("Diet", dietSchema)