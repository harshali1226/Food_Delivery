import 'package:flutter/material.dart';
import 'package:food_delivery/pages/edit_page.dart';
import 'package:food_delivery/pages/orders_page.dart';
import 'package:food_delivery/pages/userProduct_page.dart';
import './data/category_data.dart';
import './model/orders.dart';
import './pages/myfoods.dart';
import './pages/sign_up_page.dart';
import './pages/sign_in_page.dart';
import './screens/main_screen.dart';
import 'package:provider/provider.dart';
import './data/food_data.dart';
import './model/cart.dart';
import './pages/orders_page.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) =>  Foods(),
        ),
        ChangeNotifierProvider(
          create: (ctx) =>  Cats(),
        ),
        ChangeNotifierProvider(
          create: (ctx) =>  Cart(),
        ),
        ChangeNotifierProvider(
          create: (ctx) =>  Orders(),
        ),

      ],
            child: MaterialApp(
          title: 'Food Delivery App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: MainScreen(),
          routes: {
            SignIn.routeName: (ctx) => SignIn(),
            SignUp.routeName: (ctx) => SignUp(),
            MyFoods.routeName: (ctx) => MyFoods(),
            OrdersPage.routeName: (ctx) => OrdersPage(),
            EditProductScreen.routeName: (ctx) => EditProductScreen(),
            UserProductsScreen.routeName: (ctx) => UserProductsScreen()
          },
        ),
      
    );
  }
}

