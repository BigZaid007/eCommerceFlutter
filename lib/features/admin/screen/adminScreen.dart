import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zero/global_varibales/global.dart';

import 'adminHome.dart';

class adminScreen extends StatefulWidget {
  @override
  _adminScreenState createState() => _adminScreenState();
}

class _adminScreenState extends State<adminScreen> {

  int _index=0;
  void _selectPage(int page) {
    setState(() {
      _index = page;
    });
  }
  List<Widget> pages = [
    adminHome(),
    Center(child: Text('add'),),
    Center(child: Text('analayze'),),
    Center(child: Text('Cart'),),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: _selectPage,
            iconSize: 25,
            elevation: 10,
            selectedFontSize: 12,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
              BottomNavigationBarItem(icon: Icon(Icons.production_quantity_limits), label: 'Products'),

            ],
          ),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: goColor,
          elevation: 0,
          title: Text('Admin Panel',style: GoogleFonts.montserrat(
            fontSize: 22,
            fontWeight: FontWeight.w500
          ),)
        ),

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: Text('Welcome,Admin',style: GoogleFonts.roboto(
                fontWeight: FontWeight.w700,
                fontSize: 25
              ),),
            ),
            SizedBox(height: 4,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text('This is the Control Panel For the App, You can Add,Delete and Edit any item',style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                color: Colors.grey
              ),),
            ),
            Expanded(child: pages[_index])
          ],
        )
      ),
    );
  }
}
