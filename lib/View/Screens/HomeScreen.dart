import 'package:flutter/material.dart';
import 'package:sign/View/Screens/Cart.dart';
import 'package:sign/View/Screens/FavScreen.dart';
import 'package:sign/View/Screens/HomeView.dart';
import 'package:sign/View/Screens/Settings.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id='HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index=0;
  List view=[
    Cart(),Settings(),HomeView(),FavScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value)
        {
          setState(() {
            index=value;
          });
        },
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: index,
        iconSize: 25,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'cart'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Fav'),
          BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),

        ],
      ),
      body:view[index],
    );
  }
}
