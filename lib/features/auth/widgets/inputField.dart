import 'package:flutter/material.dart';

Widget inputField(TextEditingController controller,String hint,bool secure,IconData icon,BuildContext context,{int maxLines=1})
{
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
    child: TextFormField(
      obscureText: secure,
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        prefixIcon: Icon(icon) ,
          hintText: 'Please Enter Your $hint',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(18),
          )
      ),
      validator: (val)
      {
        if(val ==null || val.isEmpty) {

          return 'Please Enter Your $hint';
        }
      },
    ),
  );
}