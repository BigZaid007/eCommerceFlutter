import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zero/features/admin/screen/addingProducts/screen/ProductInputField.dart';
import 'package:zero/features/admin/screen/addingProducts/service/adminService.dart';
import 'package:zero/global_varibales/utilits.dart';

import '../../../../../global_varibales/global.dart';

class addScreen extends StatefulWidget {
  @override
  _addScreenState createState() => _addScreenState();
}

class _addScreenState extends State<addScreen> {
  var formKeyProduct = GlobalKey<FormState>();

  String category = 'Mobile';
  List<String> categories = [
    'Mobile',
    'Electrons',
    'Furniture',
    'Women Shoes',
    'Watches',
    'Airpods',
    'Laptops',
    'Glasses',
    'Men Shoes',
    'Caps',
    'Clothes',
  ];

  AdminService adminService = AdminService();
  TextEditingController productNameController = TextEditingController();
  TextEditingController productDesController = TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();

  List<File> images = [];

  void selectImage() async
  {
    var res = await imagePicker();
    setState(() {
      images = res;
      print('click');
    });
  }

  void sellProduct() {
    if (formKeyProduct.currentState!.validate() && images.isNotEmpty)
      adminService.addProduct(context: context,
          name: productNameController.text,
          Des: productDesController.text,
          price:double.parse(productPriceController.text),
          Qun: double.parse(productQuantityController.text),
          Category: category,
          images: images);
  }

  @override
  void dispose() {
    productNameController.dispose();
    productDesController.dispose();
    productPriceController.dispose();
    productQuantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: goColor,
          elevation: 0,
          centerTitle: true,
          title: const Text('Add Product'),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: formKeyProduct,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  images.isNotEmpty
                      ? CarouselSlider(
                    items: images.map(
                          (i) {
                        return Builder(
                          builder: (BuildContext context) => Image.file(
                            i,
                            fit: BoxFit.cover,
                            height: 200,
                          ),
                        );
                      },
                    ).toList(),
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: 200,
                    ),
                  )
                      :
                  InkWell(
                    onTap: selectImage,
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 180,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(width: 2, color: Colors.black),
                          color: Colors.grey[200]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.folder,
                            size: 40,
                          ),
                          Text(
                            'Add an Image Of Product',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ProductInputField(
                      productNameController, 'Product`s Name', context),
                  const SizedBox(
                    height: 15,
                  ),
                  ProductInputField(
                      productDesController, 'Product`s Description', context,
                      maxLines: 6),
                  const SizedBox(
                    height: 15,
                  ),
                  ProductInputField(
                      productPriceController, 'Product`s Price', context),
                  const SizedBox(
                    height: 15,
                  ),
                  ProductInputField(
                      productQuantityController, 'Product`s Quantity', context),
                  SizedBox(height: 10,),
                  SizedBox(

                    width: double.infinity,
                    child: DropdownButton(
                      items: categories.map((String item) {
                        return DropdownMenuItem(
                          child: Text('Category'), value: item,);
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          category = val.toString();
                        });
                      },
                      value: category,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      items: categories.map((String item) {
                        return DropdownMenuItem(

                          child: Text('Color(s)',style: TextStyle(
                            color: Colors.red
                          ),), value: item,);
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          category = val.toString();
                        });
                      },
                      value: category,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: DropdownButton(
                      items: categories.map((String item) {
                        return DropdownMenuItem(

                          child: Text('Size(s)',style: TextStyle(
                              color: Colors.blue
                          ),), value: item,);
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          category = val.toString();
                        });
                      },
                      value: category,
                    ),
                  ),
                  SizedBox(height: 10,),
                  InkWell(
                    onTap: sellProduct,
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      height: 65,
                      alignment: AlignmentDirectional.center,
                      child: const Text(
                        'Add Product!',
                        style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                            fontSize: 22),
                      ),
                      decoration: BoxDecoration(
                        color: goColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
