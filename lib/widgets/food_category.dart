import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/food_card.dart';
import '../data/category_data.dart';
import 'package:provider/provider.dart';
import '../model/category_model.dart';
class FoodCategory extends StatefulWidget {
  @override
  _FoodCategoryState createState() => _FoodCategoryState();
}

class _FoodCategoryState extends State<FoodCategory> {
  @override
  Widget build(BuildContext context) {
   // final List<Category> _catgories = categories;
   final loadedCategories = Provider.of<Cats>(context);
   final categories = loadedCategories.items;
    return Container(
      height: 80,
      margin: EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return FoodCard(
            categoryName: categories[index].categoryName,
            imagePath: categories[index].imagePath,
            numberOfItems: categories[index].numberOfItems,
          );
        },
      ),
    );
  }
}