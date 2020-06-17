import 'package:flutter/material.dart';
import 'package:food_delivery/data/category_data.dart';
import './pages/myfoods.dart';
import './pages/sign_up_page.dart';
import './pages/sign_in_page.dart';
import './screens/main_screen.dart';
import 'package:provider/provider.dart';
import './data/food_data.dart';
import './model/cart.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value:  Foods(),
        ),
        ChangeNotifierProvider.value(
          value:  Cats(),
        ),
        ChangeNotifierProvider.value(
          value:  Cart(),
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
            MyFoods.routeName: (ctx) => MyFoods()
          },
        ),
      
    );
  }
}

