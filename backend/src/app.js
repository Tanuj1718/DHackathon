import express from "express"
import cors from "cors"
import cookieParser from 'cookie-parser'
const app = express()
import dotenv from "dotenv"
import passport from 'passport';
dotenv.config({
    path: "./.env"
})



const corsOptions = {
  origin: '*', //use your frontend url
  credentials: true,
  optionsSuccessStatus: 200,
};

//common middlewares
app.use(express.json())
app.use(cors(corsOptions))
app.use(passport.initialize())
app.use(cookieParser())


//import routes
import signupRouter from "./routes/signup.routes.js"
import signinRouter from "./routes/signin.routes.js"
import aiResponseRouter from "./routes/AIresponse.routes.js"
import dietRouter from "./routes/diet.routes.js"
import exerciseRouter from "./routes/exercise.routes.js"
app.use('/user', signupRouter)
app.use('/user', signinRouter)
app.use('/user', aiResponseRouter)
app.use('/user', dietRouter)
app.use('/user', exerciseRouter)
export {app}