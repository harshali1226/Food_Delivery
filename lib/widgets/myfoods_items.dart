import 'package:flutter/material.dart';
import '../model/cart.dart';
import 'package:provider/provider.dart';
class MyFoodsItems extends StatelessWidget {
  final String id;
  final String catName;
  final String imagePath;
  MyFoodsItems(this.id, this.catName, this.imagePath);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
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
          cart.addItem(id, catName, 65);
        },),
      ),
      );
  }
}