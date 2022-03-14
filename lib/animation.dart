import 'package:flutter/material.dart';

//Explicit Animation- Give us more control but are more complex to create
//                    -used if the animation requires granular control or the animation repeats over and over (used with an animation controller)
//Implicit Animation - Gives control, but are easier to create using either custom or built- in animated widgets



class AnimationBox extends StatefulWidget {
  const AnimationBox({Key? key}) : super(key: key);

  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<AnimationBox> {


  //Basic Animation

  double _margin =0;
  Color _color=Colors.blue;
  double _width=200;
  double _opacity=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: AnimatedContainer(
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        duration: Duration(milliseconds: 900),   //IMP any animated widget should have duration compulsory
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RaisedButton(
              child: Text(
                'Animate margin',
              ),
                onPressed:()=>setState(() => _margin =50 ),
              ),
            SizedBox(height: 50,),
            RaisedButton(
              child: Text(
                'Animate color',
              ),
              onPressed:()=>setState(() => _color=Colors.amber ),
            ),
            SizedBox(height: 50,),
            RaisedButton(
              child: Text(
                'Animate width',
              ),
              onPressed:()=>setState(() => _width=500 ),
            ),
            SizedBox(height: 50,),
            RaisedButton(
              child: Text(
                'Animate opacity',
              ),
              onPressed:()=>setState(() => _opacity =0 ),
            ),
            AnimatedOpacity(
                opacity: _opacity,
                duration: Duration(seconds: 2),
            child: Text('Hide me',
            style: TextStyle(
              color: Colors.white,
            ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
