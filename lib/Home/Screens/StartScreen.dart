import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:zero/Home/Screens/CategorysScreen.dart';
import 'package:zero/features/profile/screen/profile_screen.dart';
import 'package:zero/features/profile/widget/drawer.dart';
import 'package:zero/features/profile/widget/drawerItem.dart';
import 'package:zero/provider/user_provider.dart';

import 'Home.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  int _index = 0;

  void _selectPage(int page) {
    setState(() {
      _index = page;
    });
  }



  @override
  Widget build(BuildContext context) {
    final user = Provider.of<userProvider>(context).user;

    double height = 15;
    List<Widget> pages = [
      Home(),
      CategorysScreen(),
      Center(child: Text('favorite'),),
      Center(
        child: Text('Cart'),),
    ];

    List<String> appBarTitle=[
      'Home',
      'Categories',
      'Favorite',
      'Cart'
    ];
    return AdvancedDrawer(
      backdropColor: Colors.white,
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(seconds: 1),
      animateChildDecoration: true,
      rtlOpening: false,
      // openScale: 1.0,
      disabledGestures: false,
      childDecoration: const BoxDecoration(

          borderRadius: const BorderRadius.all(Radius.circular(16))),
      drawer: Drawer(
          backgroundColor: Colors.black,
          child: SafeArea(
            child: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage('images/user.png'),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      height: height+10,
                    ),
                    Text(
                      'Welcome ${user.name}',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          fontSize: 30),
                    ),
                    SizedBox(
                      height: height,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: drawerItem(Icons.home, 'Home Screen'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: drawerItem(Icons.favorite_border, 'Favorite'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: drawerItem(Icons.star, 'Rate Us'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: drawerItem(Icons.help, 'Help Center'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25),
                      child: drawerItem(Icons.logout, 'Logout'),
                    ),

                  ],
                ),
              ),
            ),
          )),
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(Icons.notifications,color: Colors.black,),
              )
            ],
            centerTitle: true,
            title: Text(appBarTitle[_index],style: GoogleFonts.roboto(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 22
            ),),
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu_open_sharp,
                      color: Colors.black,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
          ),
          body: pages[_index],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            onTap: _selectPage,
            iconSize: 25,
            elevation: 10,
            selectedFontSize: 12,
            showUnselectedLabels: true,
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.category_rounded), label: 'Categories'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border), label: 'Favorite'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart), label: 'Cart'),
            ],
          )),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
