import 'package:flutter/material.dart';



Widget ProductInputField(TextEditingController controller,String hint,BuildContext context,{int maxLines=1})
{
  return TextFormField(
    controller: controller,
    maxLines: maxLines,
    decoration: InputDecoration(

      filled: true,
        fillColor: Colors.grey[200],
        hintText: 'Enter $hint',
        hintStyle: TextStyle(color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        )
    ),
    validator: (val)
    {
      if(val ==null || val.isEmpty) {

        return 'Please Enter Your $hint';
      }
    },
  );
}