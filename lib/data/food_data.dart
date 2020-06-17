import 'package:flutter/cupertino.dart';

import '../model/food_model.dart';

class Foods with ChangeNotifier {
  List<Food> _items = [
    Food(id: '1',name: 'Hot Coffee', imagePath: 'assets/images/coffee.jpg',price: 22.0,ratings: 22,discount: 22),
    Food(id: '2',name: 'Pizza', imagePath: 'assets/images/pizza.jpg',price: 120.0,ratings: 50,discount: 20),
  ];

  List<Food> get items {
    return [..._items];
  }

  Food findById(String id ) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addProducts() {
   // _items.add(value);
   notifyListeners();
  }
}

