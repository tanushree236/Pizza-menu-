import 'package:flutter/material.dart';
import 'trip.dart';
import 'like.dart';
import 'lists.dart';


class Detail extends StatelessWidget {
  final Trip trip;
   Detail({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
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
          crossAxisAlignment: CrossAxisAlignment.stretch,
         children: [
           ClipRRect(
             child:Hero(
               tag: 'location-img-${trip.img}',
               child: Image.asset(
                 'assets/${trip.img}',
                 height: 360,
                 fit: BoxFit.cover,
                 alignment: Alignment.topCenter,
               ),
             ) ,
           ),
           SizedBox(height: 30,),
           ListTile(
             title: Text(
               trip.title,
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 26,
                 color: Colors.grey[800],
               ),
             ),

             subtitle: Text(
               '${trip.description}',
               style: TextStyle(
                 color: Colors.grey[800],
                 fontSize: 16.0,
               ),
             ),
             trailing: Like(),
           ),
           Padding(
               padding: EdgeInsets.all(18.0),
           child:Text(
             '${trip.piece} slices for only \ Rs.${trip.price}',
             style: TextStyle(
               letterSpacing: 1,
               color: Colors.redAccent,
               fontSize: 20,
             ),
           ),
           ),
           Padding(
               padding: EdgeInsets.fromLTRB(18, 10, 0, 0),
             child: Text(
               'Address:',
               style: TextStyle(
                   color: Colors.grey[900],
                 fontSize: 20,
             ),
           ),
           ),
           Padding(
             padding: const EdgeInsets.fromLTRB(18, 10, 0, 0),
             child: Text(
               'YUM Pizza, ',
               style: TextStyle(
                 color: Colors.grey[900],
                 fontSize: 20,
               ),
             ),
           ),
           Padding(
             padding: const EdgeInsets.fromLTRB(18, 10, 0, 0),
             child: Text(
               'RT Nagar, Bangalore-560032. ',
               style: TextStyle(
                 color: Colors.grey[900],
                 fontSize: 20,
               ),
             ),
           ),
         ],
        ),
      ),
    );
  }
}
