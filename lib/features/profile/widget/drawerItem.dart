import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget drawerItem(IconData icon,String label)
{
  return Container(

    child: Row(

      children: [
        Icon(icon,size: 26,color: Colors.grey,),
        SizedBox(width: 15,),
        Text(label,style: GoogleFonts.lato(
          color: Colors.grey,
          fontSize: 20
        )
        ),
      ],
    ),
  );
}