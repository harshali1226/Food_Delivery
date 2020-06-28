import 'package:flutter/material.dart';
import '../model/cart.dart';
import 'package:provider/provider.dart';
import '../model/category_model.dart';
import '../data/category_data.dart';
class MyFoodsItems extends StatelessWidget {
  final bool showFavs;
 MyFoodsItems(this.showFavs);
  // final String id;
  // final String catName;
  // final String imagePath;
  // final double price;
  // MyFoodsItems(this.id,this.price, this.catName, this.imagePath);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final category = Provider.of<Category>(context, listen: false);
    return GridTile(child: InkWell(
      onTap: () {},
      child: Image.asset(category.imagePath, fit: BoxFit.cover,)
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black38,
        leading: Consumer<Category>(
          builder: (ctx, category, child) => IconButton(
            icon: Icon(
              category.isFavorite ? Icons.favorite : Icons.favorite_border
            ),onPressed: () {
            category.toggleFavoriteStatus();
          },),
        ),
        title: Text(
          category.categoryName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
        ),
        trailing: IconButton(icon: Icon(Icons.shopping_cart),onPressed: () {
          showDialog(context: context, builder: (ctx) => AlertDialog(
            title: Text('Item added to the cart'),
            actions: <Widget>[
              FlatButton(onPressed: () {
                Navigator.of(context).pop();
              }, child: Text('Okay', style: TextStyle(color: Colors.orange),))
            ],
          ));
          cart.addItem(category.id, category.categoryName, category.price, category.imagePath);
        },),
      ),
      );
  }
}