import 'package:flutter/material.dart';

class BoughtFoods extends StatefulWidget {
  final String id;
  final String name;
  final String imagePath;
  final double price;
  final double ratings;
  final double discount;

  BoughtFoods({this.id, this.imagePath, this.discount, this.name,this.price,this.ratings});
  @override
  _BoughtFoodsState createState() => _BoughtFoodsState();
}

class _BoughtFoodsState extends State<BoughtFoods> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
          child: Stack(
        children: <Widget>[
          Container(
            height: 200,
            width: 370,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Image(image: NetworkImage(widget.imagePath,),fit: BoxFit.cover
            ),
          ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
                    child: Container(
              height: 60,
              width: 370,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black, Colors.black12
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter
                )
              ),
            ),
          ),
          Positioned(
            left: 10,
            bottom: 7,
            right: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  Text(widget.name, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Icon(Icons.star, color: Colors.blue,size: 20),
                      Icon(Icons.star, color: Colors.blue,size: 20), 
                      Icon(Icons.star, color: Colors.blue,size: 20), 
                      Icon(Icons.star, color: Colors.blue,size: 20), 
                      Icon(Icons.star, color: Colors.blue,size: 20),
                      SizedBox(width: 10,),  
                      Text('(' + widget.ratings.toString() + ' reviews)', style: TextStyle(color: Colors.grey),)
                    ],
                  )
                 
                ]
              ),
              Column(
                children: <Widget> [
                  Text(widget.price.toString(), style: TextStyle(fontSize: 20, color: Colors.orangeAccent, fontWeight: FontWeight.bold)),
                  Text('min order', style: TextStyle(color: Colors.grey),),
                ]
              )
            ],),
          )
        ],
      ),
    );
  }
}