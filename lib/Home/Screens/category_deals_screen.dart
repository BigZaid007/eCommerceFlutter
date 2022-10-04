// ignore: camel_case_types
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero/Home/Services/homeService.dart';
import 'package:zero/features/product/screen/ProductDetailScreen.dart';
import 'package:zero/global_varibales/global.dart';
import 'package:zero/global_varibales/loader.dart';
import 'package:zero/global_varibales/productCard.dart';

import '../../models/product.dart';

class categoryProducts extends StatefulWidget {
  static const String routeName = '/category-deals';
  final String category;

  const categoryProducts({Key? key, required this.category}) : super(key: key);
  @override
  _categoryProductsState createState() => _categoryProductsState();
}



class _categoryProductsState extends State<categoryProducts> {
  List<Product>? productList;
  final homeService home = homeService();

  @override
  void initState() {
    super.initState();
    fetchCategoryProducts();
  }

  fetchCategoryProducts() async {
    productList = await home.fetchCategoryProducts(
      context: context,
      category: widget.category,
    );
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: goColor,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
          ),
        ),
        title: Text(
          widget.category,
          style: GoogleFonts.andika(
            letterSpacing: 1.1,
            fontSize: 20,
            fontWeight: FontWeight.w700
          )
        ),
      ),
      body: productList == null
          ? loaderWidget()
          : Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height/1.2,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              padding: const EdgeInsets.symmetric(horizontal: 2),
              itemCount: productList!.length,
              itemBuilder: (context, index) {
                final product = productList![index];
                return GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, ProductDetailScreen.routeName,arguments: productList![index]);
                  },
                  child: Card(
                    elevation: 2,
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            width: 400,
                            height: 400,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(product.images[0],fit: BoxFit.contain,)),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(product.name,style: GoogleFonts.roboto(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: 20
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                          child: Text(product.description,
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
                              Text('\$${product.price}',style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontWeight: FontWeight.w700
                              ),),
                              Row(
                                children: [
                                  Container(
                                    alignment: AlignmentDirectional.center,
                                    child: Icon(Icons.add,color: Colors.white,),
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: goColor
                                    ),
                                  ),
                                  SizedBox(width: 7,),
                                  Container(
                                    alignment: AlignmentDirectional.center,
                                    child: Icon(Icons.favorite_border,color: Colors.white,),
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red
                                    ),
                                  ),
                                ],
                              )

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
