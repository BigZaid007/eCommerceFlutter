import 'package:flutter/material.dart';

class popularItem extends StatefulWidget {
  @override
  _popularItemState createState() => _popularItemState();
}

class _popularItemState extends State<popularItem> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (index,context){
        return Card(
          child: Column(
            children: [
              Image.asset('images/user.png',height: 90,width: 100,),
            ],
          ),
        );
      }),
    );
  }
}
