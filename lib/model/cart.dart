import 'package:flutter/cupertino.dart';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({this.id, this.title,this.price,this.quantity});
}
class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  } 

  double get total {
    var total = 0.0;
   // var subTotal = 0.0;
    _items.forEach((key, cartItem) { 
      total += cartItem.price * cartItem.quantity;
      // subTotal = total + 3.0 + 0.5;
      // return subTotal;
    });
    return total;
  }

  double get subTotal {
    var subTotal = total;
    _items.forEach((key, cartItem) { 
      subTotal = total + 3.0 + 0.5; 
    });
    return subTotal;
  }

  void addItem(String productId, String title, double price) {
    if(_items.containsKey(productId)) {
        _items.update(productId, (existingValue) => CartItem(
          id: DateTime.now().toString(),
          title: existingValue.title,
          price: existingValue.price,
          quantity: existingValue.quantity + 1
        ));
    } else {
      _items.putIfAbsent(productId, () => CartItem(
        id: DateTime.now().toString(),
        title: title,
        price: price,
        quantity: 1
      ));
    }
  notifyListeners();
  }
}