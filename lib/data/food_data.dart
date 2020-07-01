import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/food_model.dart';
import 'dart:convert';

class Foods with ChangeNotifier {
  List<Food> _items = [
    Food(id: '1',name: 'Hot Coffee', imagePath: 'https://rakskitchen.net/wp-content/uploads/2016/12/Cold-coffee-recipe.jpg',price: 22.0,ratings: 22,discount: 22),
    Food(id: '2',name: 'Pizza', imagePath: 'https://www.kingarthurflour.com/sites/default/files/recipe_legacy/20-3-large.jpg',price: 120.0,ratings: 50,discount: 20),
  ];

  List<Food> get items {
    return [..._items];
  }

  Food findById(String id ) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  Future<void> addProducts(Food food) async {
    const url = 'https://fooddelivery-cab9c.firebaseio.com/products.json';
    try {
      final response = await http.post(url, body: json.encode({
      'name': food.name,
      'price': food.price,
      'discount': food.discount,
      'ratings': food.ratings,
      'imagePath': food.imagePath,
      
    }));
    final newFood = Food(
      name: food.name,
      price: food.price,
      discount: food.discount,
      ratings: food.ratings,
      imagePath: food.imagePath,
      id: json.decode(response.body)['name']
      );
      _items.add(newFood);

   notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
    
     // print(json.decode(response.body));   
  }

  void updateProduct(String id, Food newFood  ) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if(prodIndex >= 0) {
      _items[prodIndex] = newFood;
      notifyListeners();
    }
    else {
      print('..');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}

