import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/food_card.dart';
import '../data/category_data.dart';
import '../model/category_model.dart';
class FoodCategory extends StatefulWidget {
  @override
  _FoodCategoryState createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  @override
  Widget build(BuildContext context) {
    final List<Category> _catgories = categories;
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _catgories.length,
        itemBuilder: (context, index) {
          return FoodCard(
            categoryName: _catgories[index].categoryName,
            imagePath: _catgories[index].imagePath,
            numberOfItems: _catgories[index].numberOfItems,
          );
        },
      ),
    );
  }
}