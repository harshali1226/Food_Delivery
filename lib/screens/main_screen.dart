import 'package:flutter/material.dart';
import '../pages/favorite_page.dart';
import '../pages/cart_page.dart';
import '../pages/profile_page.dart';
import '../pages/home_page.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  HomePage homePage;
  CartPage orderPage;
  ProfilePage profilePage;
  FavoritesPage favoritesPage;
  int currentTabIndex = 0;
  List<Widget> pages;
  Widget currentPage;
  
  @override
  void initState() {
    super.initState();
    homePage = HomePage();
    orderPage = CartPage();
    profilePage = ProfilePage();
    favoritesPage = FavoritesPage();
    pages = [homePage, orderPage,favoritesPage ,profilePage];
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
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text('Cart')),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), title: Text('Favorites')),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Profile'))
        ]
        ),
        body: currentPage,
    );
  }
}