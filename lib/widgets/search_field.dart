import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(30),
          child: TextFormField(
       decoration: InputDecoration(
         contentPadding: EdgeInsets.symmetric(horizontal:15, vertical:15),
         hintText: 'Search any food',
         suffixIcon: Material(
           elevation: 10,
           borderRadius: BorderRadius.circular(30),
           child: Icon(Icons.search)),
         border: InputBorder.none
       ),
      
      ),
    );
  }
}