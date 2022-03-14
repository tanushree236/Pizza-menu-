import 'package:flutter/material.dart';

//Animated builder ->actively listen for changes in our animation controller and then rebuild the tree automatically when there is a change

class Like extends StatefulWidget {


  @override
  _LikeState createState() => _LikeState();
}

class _LikeState extends State<Like> with SingleTickerProviderStateMixin {   //mixin

  late AnimationController _controller;
  late Animation _colorAnimation;
 late bool isFav=false;
 late Animation<double> _sizeAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();




    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this     //vsync - syncs the controller with an animation ticket, only works when the current widget is in play on the screen
    );

    _colorAnimation=ColorTween(begin: Colors.grey[400],end: Colors.red)   //changes colour
    .animate(_controller);


    //For heart -> grow and shrink
    _sizeAnimation= TweenSequence(
        <TweenSequenceItem<double>>[
          TweenSequenceItem<double>(
            tween: Tween<double> (begin: 30,end: 50),
            weight: 50,
          ),
          TweenSequenceItem<double>(
            tween: Tween<double> (begin: 50,end: 30),
            weight: 50,
          ),
        ]
    ).animate(_controller);


    // _controller.forward();   //gives red heart from the starting

    _controller.addListener(() {
      // setState(() {   //retriger the build function
      //   //there will be a red heart from the starting , to avoid this use animated builder
      // });
      print(_controller.value);
      print(_colorAnimation.value);
    });

    _controller.addStatusListener((status) {   //gives status when function completes
     // print(status);

      if(status == AnimationStatus.completed){
        setState(() {
          isFav=true;
        });
      }
      if(status==AnimationStatus.dismissed){
        setState(() {
          isFav=false;
        });
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();     //controller gets disposed
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context , Widget? child){
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation.value,
            size: _sizeAnimation.value,    //gives the effect in heart - grow ans shrink
          ),
          onPressed: (){
            //Starting animation
           //_controller.forward();  //changes heart from grey to red

            isFav ? _controller.reverse() : _controller.forward();
          },
        );
      },
    );
  }
}
