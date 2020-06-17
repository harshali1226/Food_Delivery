import 'package:flutter/cupertino.dart';

import '../model/category_model.dart';

class Cats with ChangeNotifier {
 List<Category> _items = [
   Category(id: '1',categoryName: 'Burger', numberOfItems: 20,imagePath: 'assets/images/burger.jpg'),
  Category(id: '2',categoryName: 'Pizza', numberOfItems: 63,imagePath: 'assets/images/pizza.jpg'),
  Category(id: '3',categoryName: 'Cheese Burger', numberOfItems: 36,imagePath: 'assets/images/cheeseburger.jpg'),
  Category(id: '4',categoryName: 'Coffee', numberOfItems: 17,imagePath: 'assets/images/coffee.jpg'),
  Category(id: '5',categoryName: 'CupCake', numberOfItems: 30,imagePath: 'assets/images/cupcake.jpg'),
  Category(id: '6',categoryName: 'Beer', numberOfItems: 15,imagePath: 'assets/images/beer.jpg'),
  Category(id: '7',categoryName: 'pastry', numberOfItems: 25,imagePath: 'assets/images/pastry.jpeg'),
  Category(id: '8',categoryName: 'Pasta', numberOfItems: 30,imagePath: 'assets/images/pasta.jpg'),
  Category(id: '9',categoryName: 'IceCream', numberOfItems: 40,imagePath: 'assets/images/icecream.jpg'),

 ];

List<Category> get items {
    return [..._items];
  }
}
