import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/food_data.dart';
import '../widgets/userProduct_item.dart';
import './edit_page.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-products';

  Future<void> _refreshProducts(BuildContext context) async {
    // await Provider.of<Foods>(context, listen: false)
    //     .fetchAndSetProducts(true);
  }

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Foods>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Products', style: TextStyle(color: Colors.black, fontSize: 22),textAlign: TextAlign.center,),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black,size: 22,),
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
          ),
        ],
      ),
     // drawer: AppDrawer(),
      // body: FutureBuilder(
      //  // future: _refreshProducts(context),
      //   builder: (ctx, snapshot) =>
      //       snapshot.connectionState == ConnectionState.waiting
      //           ? Center(
      //               child: CircularProgressIndicator(),
      //             )
      //           : RefreshIndicator(
      //               onRefresh: () => _refreshProducts(context),
      //               child: Consumer<Foods>(
      //                 builder: (ctx, productsData, _) => 
      body:       Padding(
                        padding: EdgeInsets.all(8),
                        child: ListView.builder(
                          itemCount: productsData.items.length,
                          itemBuilder: (_, i) => Column(
                            children: [
                              UserProductItem(
                                productsData.items[i].id,
                                productsData.items[i].name,
                                productsData.items[i].imagePath,
                              ),
                              Divider(),
                            ],
                          ),
                        ),
                      ),
    //                 ),
    //               ),
    //   ),
     );
  }
}