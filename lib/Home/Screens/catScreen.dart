import 'package:flutter/material.dart';


class catScreen extends StatefulWidget {
  final String catName;

  const catScreen({Key? key, required this.catName}) : super(key: key);
  @override
  _catScreenState createState() => _catScreenState();
}

class _catScreenState extends State<catScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.catName),
      ),
    );
  }
}
