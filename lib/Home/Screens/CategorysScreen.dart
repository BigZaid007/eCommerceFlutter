import 'package:flutter/material.dart';
import 'package:zero/Home/Screens/catScreen.dart';
import 'package:zero/global_varibales/global.dart';

class CategorysScreen extends StatefulWidget {
  @override
  _CategorysScreenState createState() => _CategorysScreenState();
}

class _CategorysScreenState extends State<CategorysScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Row(
                children: [
                  CategoryItemLarg('images/phone.png','Mobiles',Color(0xffff5949),(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>catScreen(catName: 'Mobiles')));
                  }),
                  CategoryItemLarg('images/e.png','Electrons',Colors.blueAccent,(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>catScreen(catName: 'Electrons')));
                  }),
                  CategoryItemLarg('images/furniture.png','Furniture',Colors.brown,(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>catScreen(catName: 'Mobiles')));
                  }),
                ],
              ),
              Row(
                children: [
                  CategoryItemLarg('images/shoe.png','Men Shoes',goColor,(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>catScreen(catName: 'Mobiles')));
                  }),
                  CategoryItemLarg('images/dress.png','Outfit',Color(0xffd6336c),(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>catScreen(catName: 'Mobiles')));
                  }),
                  CategoryItemLarg('images/laptop.png','Laptops',Colors.lightBlue,(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>catScreen(catName: 'Mobiles')));
                  }),
                ],
              ),
              Row(
                children: [
                  CategoryItemLarg('images/cap.png','Caps',Colors.amber,(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>catScreen(catName: 'Mobiles')));
                  }),
                  CategoryItemLarg('images/make.png','Makeup',Colors.pinkAccent,(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>catScreen(catName: 'Mobiles')));
                  }),
                  CategoryItemLarg('images/accessories.png','Accessories',Color(0xfffd7e14),(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>catScreen(catName: 'Mobiles')));
                  }),
                ],
              ),
              Row(
                children: [
                  CategoryItemLarg('images/sun.png','Furniture',Colors.indigo,(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>catScreen(catName: 'Mobiles')));
                  }),
                  CategoryItemLarg('images/wristwatch.png','Watches',Colors.amberAccent,(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>catScreen(catName: 'Mobiles')));
                  }),
                  CategoryItemLarg('images/book.png','Dress',Colors.greenAccent,(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>catScreen(catName: 'Mobiles')));
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  CategoryItemLarg(String img,String label,Color color,void goToCat())
  {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 5),
      child: InkWell(
        onTap: goToCat,
        child: Container(
          alignment: AlignmentDirectional.center,
          width: MediaQuery.of(context).size.width/3.3,
          height: 160,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: color
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(img,height: 100,width: 100,),
              SizedBox(height: 3,),
              Text(label,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                ),)
            ],
          ),
        ),
      ),
    );
  }
}
