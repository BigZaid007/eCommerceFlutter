import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zero/features/profile/widget/headline.dart';
import 'package:zero/features/profile/widget/popularItems.dart';
import 'package:zero/provider/user_provider.dart';

import '../../features/search/screen/searchScreen.dart';

class Home extends StatefulWidget {
  static const String routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<userProvider>(context).user;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(

              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    child: Material(
                      borderRadius: BorderRadius.circular(15),
                      elevation: 1,
                      child: TextFormField(
                        onFieldSubmitted: navigateToSearchScreen,
                        decoration: InputDecoration(
                          prefixIcon: InkWell(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(
                                left: 6,
                              ),
                              child: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 23,
                              ),
                            ),
                          ),
                          filled: true,
                          fillColor: Colors.grey[100],
                          contentPadding: const EdgeInsets.only(top: 10),
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            borderSide: BorderSide(
                              color: Colors.black38,
                              width: 1,
                            ),
                          ),
                          hintText: 'Search Products',
                          hintStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              SizedBox(height: 10,),
                Container(
                  height: 60,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryItem('images/phone.png', 'Mobile',context),
                      CategoryItem('images/e.png', 'Electrons',context),
                      CategoryItem('images/furniture.png', 'Furniture',context),
                      CategoryItem('images/women.png', '''Women 
 Shoes''',context),

                      CategoryItem('images/wristwatch.png', 'Watches',context),
                      CategoryItem('images/airpods.png', 'Airpods',context),
                      CategoryItem('images/laptop.png', 'Laptops',context),
                      CategoryItem('images/sun.png', 'Glasses',context),
                      CategoryItem('images/shoe.png', 'Men Shoes',context),
                      CategoryItem('images/cap.png', 'Caps',context),
                      CategoryItem('images/dress.png', 'Clothes',context),


                    ],
                  ),
                ),
                SizedBox(height: 20,),
                headline('Special Offers'),
                Center(
                  child: CarouselSlider(

                    items: [
                      // specialOfferPolo(context),
                      // specialOfferNike(context),
                      // specialOfferWatch(context),
                      // Image.asset('images/offer3.jpg',width: 500,height: 500,),
                      // Image.asset('images/offer5.jpg',width: 500,height: 500,),
                      // Image.asset('images/offer6.jpg',width: 500,height: 500,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'images/offer5.jpg',
                            height: 500,
                            width: 500,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'images/offer6.jpg',
                            height: 500,
                            width: 500,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'images/offer10.jpg',
                            height: 500,
                            width: 500,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            'images/offer3.jpg',
                            height: 500,
                            width: 500,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),


                    ], options: CarouselOptions(
                    height: 240,
                    autoPlay: true,
                  ),
                  ),
                ),
                dealText(),
                OfferOfTheDay(),
                InkWell(
                    onTap: () {
                      print(user.email);
                    },
                    child: headline('Popular Item')),
                popularitems(),
                headline('Weekly Top'),
                popularitems(),
                headline('Trendy'),
                popularitems(),
              ],
            ),
          )),
    );
  }
}
