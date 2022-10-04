import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../global_varibales/Stars.dart';
import '../../../global_varibales/global.dart';
import '../../../models/product.dart';
import '../../search/screen/searchScreen.dart';
import '../service/ProductDetailsServices.dart';

class ProductDetailScreen extends StatefulWidget {
  static const String routeName = '/product-details';
  final Product product;
  const ProductDetailScreen({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final ProductDetailsServices productDetailsServices =
  ProductDetailsServices();
  double avgRating = 0;
  double myRating = 0;

  @override
  void initState() {
     super.initState();
    // double totalRating = 0;
    // for (int i = 0; i < widget.product.rating!.length; i++) {
    //   totalRating += widget.product.rating![i].rating;
    //   if (widget.product.rating![i].userId ==
    //       Provider.of<UserProvider>(context, listen: false).user.id) {
    //     myRating = widget.product.rating![i].rating;
    //   }
    // }
    //
    // if (totalRating != 0) {
    //   avgRating = totalRating / widget.product.rating!.length;
    // }
  }

  void navigateToSearchScreen(String query) {
    Navigator.pushNamed(context, SearchScreen.routeName, arguments: query);
  }

  void addToCart() {
    productDetailsServices.addToCart(
      context: context,
      product: widget.product,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(
        elevation: 0,
        backgroundColor: goColor,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
          ),
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 42,
                margin: const EdgeInsets.only(left: 15),
                child: Material(
                  borderRadius: BorderRadius.circular(7),
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
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.only(top: 10),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                        borderSide: BorderSide.none,
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black38,
                          width: 1,
                        ),
                      ),
                      hintText: 'Search Product',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product.id!,
                    style: TextStyle(
                      color: Colors.black
                    ),
                  ),
                  Stars(
                    rating: 5,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: Center(
                child: Text(
                  widget.product.name,
                  style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ),
            CarouselSlider(
              items: widget.product.images.map(
                    (i) {
                  return Builder(
                    builder: (BuildContext context) => Image.network(
                      i,
                      fit: BoxFit.contain,
                      height: 200,
                    ),
                  );
                },
              ).toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                height: 300,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('\$${widget.product.price}',style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700,
                fontSize: 24
              ),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomDropdownButton2(
                    buttonWidth: 220,
                    onChanged: (value){},
                    value: 'Color',
                    hint: 'Color',
                    dropdownItems: [],
                  ),
                  SizedBox(width: 5,),
                  CustomDropdownButton2(
                    buttonWidth: 150,
                    onChanged: (value){},
                    value: 'Size',
                    hint: 'Size',
                    dropdownItems: [],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: AlignmentDirectional.center,
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: Text('ADD TO CART',style: GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w600
                ),),
                decoration:BoxDecoration(
                  color: goColor,
                  borderRadius: BorderRadius.circular(25),
                ) ,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(widget.product.description,style: GoogleFonts.roboto(
                fontSize: 16,
                color: Colors.grey[800]
              ),),
            ),


            Center(
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  'Rate The Product',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: RatingBar.builder(
                initialRating: myRating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  productDetailsServices.rateProduct(
                    context: context,
                    product: widget.product,
                    rating: rating,
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}