import 'package:flutter/material.dart';
import '../model/cart.dart';
import 'package:provider/provider.dart';
import '../model/category_model.dart';
import '../data/category_data.dart';
class MyFoodsItems extends StatelessWidget {
  final String id;
  final String catName;
  final String imagePath;
  final double price;
  MyFoodsItems(this.id,this.price, this.catName, this.imagePath);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    final category = Provider.of<Cats>(context, listen: false).items;
    return GridTile(child: InkWell(
      onTap: () {},
      child: Image.asset(imagePath, fit: BoxFit.cover,)
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black38,
        leading: IconButton(icon: Icon(Icons.favorite),onPressed: () {},),
        title: Text(
          catName, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
        ),
        trailing: IconButton(icon: Icon(Icons.shopping_cart),onPressed: () {
          cart.addItem(id, catName, price, imagePath);
        },),
      ),
      );
  }
}