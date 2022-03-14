//import 'package:animation_lesson_one/animation.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'details.dart';
import 'animation.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //this widget is the root of the application

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu',
      home: Home(),   //displays home page first
      //AnimationBox(),

    );
  }
}

