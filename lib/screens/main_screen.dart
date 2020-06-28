import 'package:flutter/material.dart';
import 'package:food_delivery/pages/myfoods.dart';
//import '../pages/favorite_page.dart';
import '../pages/cart_page.dart';
import '../pages/profile_page.dart';
import '../pages/home_page.dart';
class MainScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  HomePage homePage;
  CartPage orderPage;
  ProfilePage profilePage;
  MyFoods explorePage;
 // FavoritesPage favoritesPage;
  int currentTabIndex = 0;
  List<Widget> pages;
  Widget currentPage;
  
  @override
  void initState() {
    super.initState();
    homePage = HomePage();
    orderPage = CartPage();
    profilePage = ProfilePage();
    explorePage = MyFoods();
   // favoritesPage = FavoritesPage();
    pages = [homePage, explorePage ,orderPage,profilePage];
    currentPage = homePage;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
          currentPage = pages[index];
          });
          
        },
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem> [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('Explore')),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text('Cart')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile'))
        ]
        ),
        body: currentPage,
    );
  }
}