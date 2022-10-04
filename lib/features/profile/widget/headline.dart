import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero/Home/Screens/category_deals_screen.dart';
import 'package:zero/global_varibales/global.dart';

Widget headline(String headline)
{
  return Padding(
    padding: const EdgeInsets.only(left: 10,right: 10,top: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
       Text(headline,style: GoogleFonts.roboto(
        fontSize: 24,
        fontWeight: FontWeight.w800,
        color: Colors.black
    )) ,
        Text('see all',style: TextStyle(
          fontSize: 20,
          color: Colors.grey
        ),)
      ],
    ),
  );
}

dealText()
{
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 7),
    child: Align(
      alignment: AlignmentDirectional.topStart,
      child: headline('Deal Of The Day')
    ),
  );
}

Widget searchbar()
{
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          child: TextFormField(
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                prefixIcon: Icon(Icons.search_sharp,color: goColor,),
                hintText: 'Search for Products',
                filled: true,
                fillColor: Colors.grey[200],
                hintStyle: TextStyle(
                  fontSize: 16,
                  color: goColor,
                )
            ),
          ),
        ),
        SizedBox(width: 15,),
        Container(
          width: 50,
          height: 50,
          child: Icon(Icons.search_sharp,color: Colors.grey[200],),
          decoration: BoxDecoration(
              color: goColor,
              shape: BoxShape.circle
          ),
        )
      ],
    ),
  );
}

Widget specialOfferPolo(BuildContext context)
{
  return  Padding(
    padding: const EdgeInsets.only(top: 40),
    child: Stack(

      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.antiAlias,
      overflow: Overflow.visible,
      children: [

      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(12),
          ),
          width: MediaQuery.of(context).size.width/1.2,
          height: 200,
          child: Padding(
            padding: const EdgeInsets.only(top: 32,left: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Flat 10%',style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    color: Colors.white
                ),),
                SizedBox(height: 16,),
                Text('On Polo Shirts',style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                ),),
                SizedBox(height: 12,),
                Container(
                  alignment: AlignmentDirectional.center,
                  child: Text('Buy Now',style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w800
                  ),),
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(colors: [
                        Colors.blueAccent,
                        Colors.lightBlueAccent
                      ],begin: AlignmentDirectional.topCenter)
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
        Positioned(
            top: -32,
            left:165,
            child: Image.asset('images/polo.png',height: 230,)),
      ],
    ),
  );
}

Widget specialOfferNike(BuildContext context)
{
  return  Padding(
    padding: const EdgeInsets.only(top: 40),
    child: Stack(

      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.antiAlias,
      overflow: Overflow.visible,
      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.deepOrange,
              borderRadius: BorderRadius.circular(12),
            ),
            width: MediaQuery.of(context).size.width/1.2,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(top: 32,left: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('25% Off',style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                  ),),
                  SizedBox(height: 16,),
                  Text('Nike Shoes',style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                  ),),
                  SizedBox(height: 12,),
                  Container(
                    alignment: AlignmentDirectional.center,
                    child: Text('Buy Now',style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w800
                    ),),
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(colors: [
                          Colors.blueAccent,
                          Colors.lightBlueAccent
                        ],begin: AlignmentDirectional.topCenter)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: -5,
            left:100,
            child: Image.asset('images/shoes.png',height: 190,)),
      ],
    ),
  );
}



Widget specialOfferWatch(BuildContext context)
{
  return  Padding(
    padding: const EdgeInsets.only(top: 40),
    child: Stack(

      alignment: AlignmentDirectional.topCenter,
      clipBehavior: Clip.antiAlias,
      overflow: Overflow.visible,
      children: [

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow[800],
              borderRadius: BorderRadius.circular(12),
            ),
            width: MediaQuery.of(context).size.width/1.2,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(top: 20,left: 14),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Rolex',style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                  ),),
                  SizedBox(height: 16,),
                  Text('30% Discount',style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      color: Colors.white
                  ),),
                  SizedBox(height: 12,),
                  Container(
                    alignment: AlignmentDirectional.center,
                    child: Text('Buy Now',style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w800
                    ),),
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        gradient: LinearGradient(colors: [
                          Colors.blueAccent,
                          Colors.lightBlueAccent
                        ],begin: AlignmentDirectional.topCenter)
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
            top: -32,
            left:155,
            child: Image.asset('images/rolex.png',height: 230,)),
      ],
    ),
  );
}



Widget popularitems()
{
  return Container(

    height: 200,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: 3,
          shrinkWrap: true,
          itemBuilder: (index,context){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black)
              ),
              child:  Image.network('https://i.pinimg.com/564x/32/18/37/32183779195a1a51cd5d835610022449.jpg',fit: BoxFit.cover,)
              )
        );
      }),
    ),
  );
}

CategoryItem(String img,String label,BuildContext context)
{
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
    child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>categoryProducts(category: label)));
      },
      child: Container(
        width: 120,
        height: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black54,
          ),
          color: Colors.white70,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset(img),
            ),
            Text(label,style: TextStyle(
              fontWeight: FontWeight.w900
            ),)
          ],
        ),
      ),
    ),
  );
}

OfferOfTheDay()
{
  return Stack(
    overflow: Overflow.visible,

    children:  [

      Container(
        width: double.infinity,
        height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/offer.jpg'),
            fit: BoxFit.cover
          )
        ),

      )
    ],
  );
}
