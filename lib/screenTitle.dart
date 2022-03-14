import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;
  const ScreenTitle({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.fromLTRB(24, 0, 0,18 ),
      child: TweenAnimationBuilder(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 40,
            color: Colors.red[800],
            fontWeight: FontWeight.bold,
          ),
        ),
        tween: Tween<double>(begin: 0,end: 1),
        duration: Duration(milliseconds: 500),   //to control the speed of the animation we use duration
        curve: Curves.easeInOut,
        builder: (BuildContext context, double val, Widget? child)  {    //returns a widget tree   //it's Widget? not Widget
          return Opacity(
          opacity: val,
      child:child,
      );
      },
      ),
    );
  }
}
