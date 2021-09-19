import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:google_fonts/google_fonts.dart';
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
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        child: Drawer(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: CircleAvatar(
                    radius: 65,
                    backgroundImage: AssetImage('images/Tolba.jpg'),
                  ),
                ),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text('Hello',style:
                      GoogleFonts.acme(fontSize: 23,fontWeight: FontWeight.w600),),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text('Mohamed Tolba',style:
                      GoogleFonts.acme(fontSize: 25,fontWeight: FontWeight.w600),),
                    )),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 30,
        curve: Curves.easeIn,
        onItemSelected: (index) => setState(() => currentIndex = index),
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            icon: Icon(Icons.home,),
            title: Text('Home',style: GoogleFonts.tauri(fontSize: 15),),
            inactiveColor: Colors.black,
            activeColor: Colors.deepPurpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.shopping_cart,),
            title: Text('Shop',style: GoogleFonts.tauri(fontSize: 15),),
            inactiveColor: Colors.black,
            activeColor: Colors.deepPurpleAccent,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.favorite,),
            title: Text('Fav',style: GoogleFonts.tauri(fontSize: 15),),
            activeColor: Colors.red,
            inactiveColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.settings,),
            title: Text('Settings',style: GoogleFonts.tauri(fontSize: 15),),
            inactiveColor: Colors.black,
            activeColor: Colors.blue,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      body: Column(
        children: [
          SafeArea(
            child: Row(
              children: [
                InkWell(
                    onTap: () {
                      key.currentState!.openDrawer();
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10,top: 8),
                      child: Icon(Icons.menu,size: 27,),
                    )),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 10,top: 8),
                  child: Icon(Icons.add_shopping_cart,size: 27,),
                )
              ],
            ),
          ),
          Expanded(child: view[currentIndex]),
        ],
      ),
    );
  }
}
