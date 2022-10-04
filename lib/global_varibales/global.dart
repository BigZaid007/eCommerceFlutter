
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String uri='http://192.168.0.106:3000';

class Global
{

}

Widget Loader()
{
  return Center(
    child: CircularProgressIndicator(),
  );
}

Color goColor=Color(0xff2A4B7C);


Widget productCard(String productImage,String productName,String productDes,String productPrice)
{
  return Card(
    elevation: 1.2,
    margin: EdgeInsets.all(10),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 200,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(productImage,fit: BoxFit.contain,)),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(productName,style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              color: Colors.black,
              fontSize: 18
          ),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: Text(productDes,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              color: Colors.grey,
              fontSize: 13,
            ),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${productPrice}',style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w700
              ),),
              Container(
                alignment: AlignmentDirectional.center,
                child: Icon(Icons.add,color: Colors.white,),
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: goColor
                ),
              )
            ],
          ),
        )
      ],
    ),
  );
}