import 'package:flutter/material.dart';
import 'package:food_delivery/data/category_data.dart';
import 'package:food_delivery/model/category_model.dart';
import 'package:food_delivery/widgets/myfoods_items.dart';
import 'package:provider/provider.dart';
class MyFoods extends StatefulWidget {
  static const routeName = '/myfoods';
  @override
  _MyFoodsState createState() => _MyFoodsState();
}

class _MyFoodsState extends State<MyFoods> {
  var _showFavorites = true;
  @override
  Widget build(BuildContext context) {
    final loadedCategories = Provider.of<Cats>(context);
    final categories = loadedCategories.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('My Food', style: TextStyle(color: Colors.black, fontSize: 25,),),
        centerTitle: true,
        elevation: 10,
        backgroundColor: Colors.white,
      ),
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 25),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 3/2
            ),
          itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          
            // builder: (c) => products[i],s
            value: categories[i],
            child: MyFoodsItems(
              _showFavorites
                // products[i].id,
                // products[i].title,
                // products[i].imageUrl,
                ),
          ),
      ),
          )
    );
  }
}