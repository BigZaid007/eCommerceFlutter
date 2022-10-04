const mongoose=require('mongoose');

const userSchema=mongoose.Schema({

name:{

    type:String,
    required:true,
    trim:true,

},

email:{

    type:String,
    required:true,
    trim:true,


    validate: {
      validator:(value) => {

          const re = /\S+@\S+\.\S+/;
           return value.match(re);
      },
   message:'Please Enter a valid Email',

},

},

password:{
    required:true,
    type:String,
     validate: {
          validator:(value) => {

               return value.length > 6;
          },
       message:'Password is too short!',

    },


},

address: {
    type:String,
    default:'',
},

type: {
    default:"user",
    type:String,
}

});

const User=mongoose.model('User',userSchema);
module.exports=User;