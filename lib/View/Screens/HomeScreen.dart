import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:provider/provider.dart';
import 'package:sign/Model/ThemeProv.dart';
import 'package:sign/View/Screens/Cart.dart';
import 'package:sign/View/Screens/FavScreen.dart';
import 'package:sign/View/Screens/HomeView.dart';
import 'package:sign/View/Screens/Settings.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  List view = [
    HomeView(), Cart(), FavScreen(), Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      drawer: Drawer(
        child: InkWell(
            onTap: () {
              Provider.of<ThemeProv>(context,listen: false).changeTheme();
            },
            child: Icon(Icons.brightness_medium,size: 40,)),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 24,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            activeColor: Colors.deepPurpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text('Shop'),
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Fav'),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        key.currentState!.openDrawer();
                      },
                      child: Icon(Icons.menu,size: 30,)),
                  Spacer(),
                  Icon(Icons.shopping_cart,size: 30,)
                ],
              ),
            ),
            Expanded(child: view[currentIndex]),
          ],
        ),
      ),
    );
  }
}
