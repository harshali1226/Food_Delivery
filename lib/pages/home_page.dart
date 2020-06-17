import 'package:flutter/material.dart';
import '../widgets/bought_foods.dart';
import '../widgets/food_category.dart';
import '../widgets/search_field.dart';
import '../widgets/home_top.dart';
import '../data/food_data.dart';
import '../model/food_model.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Food> _foods = foods;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 60, left: 20, right: 20),
        children: <Widget> [
          HomeTop(),
          FoodCategory(),
         // SizedBox(height: 8),
          SearchField(),
          SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Text('Frequently bought foods', style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),),
              GestureDetector(
                onTap: () {},
                child: Text('View All', style: TextStyle(color: Colors.orangeAccent, fontSize: 18),))
            ]
          ),
          SizedBox(
            height: 10
          ),
          Column(
            children: _foods.map((Food food) => Container(
    margin: EdgeInsets.only(bottom: 20),
    child: BoughtFoods(
      id: food.id,
      name: food.name,
      imagePath: food.imagePath,
      ratings: food.ratings,
      price: food.price,
      discount: food.discount,
    ),
  )).toList()
          )
          
        ],)
        
      );
    
  }
}

