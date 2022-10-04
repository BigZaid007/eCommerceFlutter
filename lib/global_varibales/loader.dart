import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zero/global_varibales/global.dart';

class loaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: goColor,
      ),
    );
  }
}
