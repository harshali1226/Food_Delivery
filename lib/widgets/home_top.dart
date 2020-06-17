import 'package:flutter/material.dart';
class HomeTop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Text('What would', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                Text('you like to eat?', style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold))
              ],
              ),
              Icon(Icons.notifications_none, size: 35,)
              ]
            );
            
  }
}