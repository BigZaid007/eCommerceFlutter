import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:provider/provider.dart';
import 'package:zero/provider/user_provider.dart';





 Widget drawer(BuildContext context) {
   final user=Provider.of<userProvider>(context).user;
   return Scaffold(
     drawerEnableOpenDragGesture: false,
     drawer: Drawer(
       backgroundColor: Colors.red,
     ),

   );
 }