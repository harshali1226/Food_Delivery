import 'package:flutter/foundation.dart';

class Category with ChangeNotifier{
  final String id;
  final String categoryName;
  final String imagePath;
  final int numberOfItems;
  final double price;
   bool isFavorite;


  Category({
    @required this.id,
    @required this.categoryName,
    @required this.imagePath,
    @required this.numberOfItems,
    @required this.price,
     this.isFavorite = false,
    });

    void toggleFavoriteStatus() {
      isFavorite = !isFavorite;
      notifyListeners();
    }

   
}