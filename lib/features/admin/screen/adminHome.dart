import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero/features/admin/screen/addingProducts/screen/addProduct.dart';
import 'package:zero/features/admin/screen/addingProducts/service/adminService.dart';
import 'package:zero/global_varibales/loader.dart';
import 'package:zero/global_varibales/utilits.dart';
import 'package:zero/models/product.dart';

import '../../../global_varibales/global.dart';

class adminHome extends StatefulWidget {
  @override
  _adminHomeState createState() => _adminHomeState();
}

class _adminHomeState extends State<adminHome> {
  AdminService adminService = AdminService();
  List<Product>? products;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAllProduct();
  }

  void fetchAllProduct() async {
    products = await adminService.fetchAllProducts(context);
    setState(() {});
  }

  void deleteProduct(Product product, int index) {
    adminService.deleteProduct(
        context: context,
        product: product,
        onSuccess: () {
          products!.removeAt(index);
          setState(() {});
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: products == null
          ? loaderWidget()
          : GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 5,
                mainAxisExtent: 245,
              ),
              itemCount: products?.length,
              itemBuilder: (context, index) {
                final ProductData = products![index];
                print(products!.length);
                return Padding(
                  padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
                  child: Container(
                    height: 500,
                    width: 600,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 0.2, color: Colors.black),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(products![index].name),
                        )),
                        Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                          products![index].images[0],
                          height: 120,
                          width: 120,
                          fit: BoxFit.fitWidth,
                        ),
                            ),),
                        ListTile(
                          title: Row(
                            children: <Widget>[
                              Expanded(child: RaisedButton(onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return customAlertDialog(
                                          'Delete Product?',
                                          'Do you want to delete the product?',
                                          'Delete',
                                          'Cancel',
                                              (){
                                            deleteProduct(ProductData, index);
                                            Navigator.pop(context);
                                          },
                                          context,Colors.red);
                                    });
                              },child: Text("Delete"),color: Colors.red,textColor: Colors.white,)),
                              SizedBox(width: 5,),
                              Expanded(child: RaisedButton(onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return customAlertDialog(
                                          'Delete Product?',
                                          'Do you want to delete the product?',
                                          'Delete',
                                          'Cancel',
                                              (){
                                            deleteProduct(ProductData, index);
                                            Navigator.pop(context);
                                          },
                                          context,Colors.red);
                                    });
                              },child: Text("Edit"),color: Colors.black,textColor: Colors.white,)),

                            ],
                          ),
                        ),



                      ],
                    ),
                  ),
                );
              }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: goColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addScreen()));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
