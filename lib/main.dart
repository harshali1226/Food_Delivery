import 'package:flutter/material.dart';
import './pages/sign_up_page.dart';
import './pages/sign_in_page.dart';
import './screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainScreen(),
      routes: {
        SignIn.routeName: (ctx) => SignIn(),
        SignUp.routeName: (ctx) => SignUp(),
      },
    );
  }
}

