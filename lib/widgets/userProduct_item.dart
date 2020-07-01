import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/edit_page.dart';
import '../data/food_data.dart';

class UserProductItem extends StatelessWidget {
  final String id;
  final String name;
  final String imagePath;

  UserProductItem(this.id, this.name, this.imagePath);

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return ListTile(
      title: Text(name),
      leading: CircleAvatar(
        radius: 27,
        backgroundImage: NetworkImage(imagePath),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit, color: Colors.grey,),
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(EditProductScreen.routeName, arguments: id);
              },
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                try {
                  await Provider.of<Foods>(context, listen: false)
                      .deleteProduct(id);
                } catch (error) {
                  scaffold.showSnackBar(
                    SnackBar(
                      content: Text('Deleting failed!', textAlign: TextAlign.center,),
                    ),
                  );
                }
              },
              color: Theme.of(context).errorColor,
            ),
          ],
        ),
      ),
    );
  }
}