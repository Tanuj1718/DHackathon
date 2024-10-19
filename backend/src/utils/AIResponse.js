import {GoogleGenerativeAI} from "@google/generative-ai"


let storeDiet;
let storeExercise;
 
    const getData = async(req,res)=>{
    const genAI = new GoogleGenerativeAI(process.env.API_KEY);
    const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });
    
    const {prompt} = req.body

    const Instruction = `
    When someone asks you about any disease, physical health, or mental health problem, you must provide accurate and reliable information about that condition. 
    Respond with the following guidelines:
    
    1. **Be Clear and Concise**: Provide simple, easy-to-understand explanations about the disease, its symptoms, causes, and potential treatments.
    
    2. **Stay Factual**: Always offer correct, factual, and medically verified information. Avoid giving any misleading or incorrect details.
    
    3. **Offer General Advice**: While you can explain common treatments, remind users to consult a healthcare professional for a precise diagnosis and personalized treatment plan.
    
    4. **Show Empathy**: Be kind and empathetic in your responses, understanding that the user may be worried about their health.
    
    5. **Provide Prevention Tips**: If applicable, give prevention tips or healthy habits related to the condition being discussed.
    
    6. **Mental Health**: When addressing mental health questions, be especially compassionate and recommend seeking help from a licensed therapist or counselor when necessary.
    
    7. **End Politely**: If someone says "bye" or ends the conversation, respond politely and wish them well, like a healthcare professional would.
    
    Now, respond to health-related queries with accurate information, professionalism, and care so now respond them go......
    `;
    
    
    const result = await model.generateContent(Instruction + prompt);

    storeDiet = result.response.text()
    storeExercise = result.response.text()
    res.json({
        GeneralInfomsg:result.response.text()
    })

}


    const getDiet = async(req,res)=>{
    const genAI = new GoogleGenerativeAI(process.env.API_KEY);
    const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });

    const reqtheData = "now give the diet (food advice or what should we eat or what not) based on given data and the data is - "
    
    // console.log("THE Diet is " + storeDiet)

    
    const result = await model.generateContent(reqtheData + storeDiet);

    res.json({
        GeneralDietInfo:result.response.text()
    })

}

    const getExercise =  async(req,res)=>{
    const genAI = new GoogleGenerativeAI(process.env.API_KEY);
    const model = genAI.getGenerativeModel({ model: "gemini-1.5-flash" });

    const reqtheData = `now give the Exercise plan (What exercise should i do with timing ) based on this data 
    irrespective of u are a doctor or not like what generally people should do and want that don't respinse 
    any irrespective answer and the data is - `
    
    
    const result = await model.generateContent(reqtheData + storeExercise);

    res.json({
        GeneralExerciseInfo:result.response.text()
    })

}


export {getData, getDiet, getExercise}