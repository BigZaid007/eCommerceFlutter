

//import for package
const express=require('express');
const mongoose=require('mongoose');

//import from file
const authRouter=require('./router/auth');
const adminRouter=require('./router/admin');
const productRouter=require('./router/product');




//init
const app=express();
const PORT=3000;
const DB='mongodb+srv://Zaid:Zaid1993@cluster0.qftsb.mongodb.net/?retryWrites=true&w=majority';


//middleware
app.use(express.json());
app.use(authRouter);
app.use(adminRouter);
app.use(productRouter);


mongoose.connect(DB).then(()=>{
console.log('Connection Successfully');
}).catch((e)=>{
console.log(e);
});


//just checking the connections with the port , the 0,0,0,0 is the local IP address and it could be empty
app.listen(PORT,'0.0.0.0',function(){
console.log(`connected to port ${PORT}`)
});