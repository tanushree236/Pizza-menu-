import 'package:flutter/material.dart';
import 'trip.dart';
import 'screenTitle.dart';
import 'details.dart';

class Lists extends StatefulWidget {


  @override
  _ListsState createState() => _ListsState();
}

class _ListsState extends State<Lists> {
  List<Widget> _triptiles = [];   //lists of widgets
  final GlobalKey <AnimatedListState> _listkey=GlobalKey<AnimatedListState>();  //for animated list

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {   //fire this function only when the build method runs
      _addTrips();   //takes in a function
    });
   // _addTrips();
  }

  void _addTrips(){


    //List of the Pizza menu
    List<Trip> _trips=[
      Trip(title:'Margherita Pizza',price:'399',piece:'4',img:'pizzaMar.jpg',description: 'Loaded with real mozzarella cheese'),
      Trip(title:'Cheese Pizza',price:'499',piece:'6',img:'cheese.jpg',description: 'Nothing but just Cheese!'),
    Trip(title:'Tandoori Paneer Pizza',price:'459',piece:'6',img:'paneer.jpg',description: 'Hot and spicy.Tandoori paneer with capsicum,red paprika & mayo'),
    Trip(title:'Chicken Pizza',price:'699',piece:'8',img:'chicken.jpg',description: 'Fully Loaded with Chicken'),
      Trip(title:'Pasta Pizza',price:'599',piece:'6',img:'pasta1.jpg',description: 'Med Creamy Tomato Pasta Pizza'),
      Trip(title: 'Corn Pizza',price: '299',piece: '4',img: 'corn.jpg',description: 'A delectable combination of sweet & juicy golden corn'),
      Trip(title: 'Chicken Sausage',price: '349',piece: '5',img: 'csausage.jpg',description: 'American classic! Spicy, chicken sausage on pizza'),
    ];


    //for one by one animation of the list item appearance
    Future oneBy=Future((){});
    _trips.forEach((Trip trip) {
    oneBy = oneBy.then((_){
      return Future.delayed(const Duration(milliseconds: 100),(){
        _triptiles.add(_buildTile(trip));
        _listkey.currentState?.insertItem(_triptiles.length-1);   //will start from index 1 item i.e from item number 1
      });
    });
    });
  }

   Widget _buildTile(Trip trip){
    return ListTile(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Detail(trip:trip)));
      },
      contentPadding: EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${trip.piece} slices',
          style: TextStyle(
            fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.redAccent,
          )
          ),
          Text(
            trip.title,
            style: TextStyle(
                fontSize: 20,
          ),
          ),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Hero(
          tag: 'location-img-${trip.img}',
          child: Image.asset(
            'assets/${trip.img}',
            height: 50.0,
          ),
        ),
      ),
      trailing: Text(
          '\ Rs.${trip.price}',
      style: TextStyle(
        color: Colors.black,
        fontSize: 14.0,
      ),
      ),
    );
   }


   Tween<Offset> _offset = Tween(begin: Offset(1,0), end: Offset(0,0));



  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listkey,
        initialItemCount: _triptiles.length,
        itemBuilder: (context,index,animation){
          return SlideTransition(
              child: _triptiles[index],
              position: animation.drive(_offset),
          );
        }
    );
  }
}
