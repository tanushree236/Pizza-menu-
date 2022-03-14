import 'package:flutter/material.dart';
import 'screenTitle.dart';
import 'lists.dart';

class Home extends StatefulWidget {


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         padding: EdgeInsets.all(20),
         decoration: BoxDecoration(
           image:DecorationImage(
             image: AssetImage('assets/food1.jpg'),
             fit: BoxFit.fitWidth,
             alignment: Alignment.topLeft,
           ),
           gradient: LinearGradient(
             begin: Alignment.topRight,
             end: Alignment.bottomLeft,
             stops: [
               0.5,
               1.0,
             ],
             colors: [
               Colors.white,
               Colors.grey,
             ],
           ),
         ),
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             SizedBox(height: 10,),
             SizedBox(
               height: 160,
               child: ScreenTitle(
                   text:
                   'YUM Pizza',
               ),
             ),
             Flexible(child: Lists(),
             )
           ],
         ),
       ),
    );
  }
}
