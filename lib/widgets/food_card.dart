import 'package:flutter/material.dart';
class FoodCard extends StatelessWidget {
  final String categoryName;
  final String imagePath;
  final int numberOfItems;
  FoodCard({this.numberOfItems,this.imagePath,this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              child: Row(
          children: <Widget>[
          Image(image: AssetImage(imagePath),
          height: 65,
          width: 75,
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Text(categoryName, style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
              Text('$numberOfItems kinds')
            ]
          )

        ],),
      )
    );
  }
}