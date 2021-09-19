import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
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
                      padding: const EdgeInsets.only(left: 6,bottom: 3),
                      child: Text('Hello',style:
                      GoogleFonts.acme(fontSize: 23,fontWeight: FontWeight.w500),),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text('Mohamed Tolba',style:
                      GoogleFonts.acme(fontSize: 25,fontWeight: FontWeight.w600),),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 20),
                      child: Icon(FontAwesomeIcons.home,size:25,color: Colors.teal,),
                    ),
                    Text('Home',style: GoogleFonts.dekko(fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 20),
                      child: Icon(Icons.add_shopping_cart_outlined,size:25,color: Colors.teal,),
                    ),
                    Text('My Orders',style: GoogleFonts.dekko(fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 20),
                      child: Icon(Icons.call_sharp,size:25,color: Colors.teal),
                    ),
                    Text('About Us',style: GoogleFonts.dekko(fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 20),
                      child: Icon(Icons.feedback,size:25,color: Colors.teal,),
                    ),
                    Text('Send Feedback',style: GoogleFonts.dekko(fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8,right: 20),
                      child: Icon(Icons.share,size:25,color: Colors.teal,),
                    ),
                    Text('Share This App',style: GoogleFonts.dekko(fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8,bottom: 10),
                      child: Text('Dark Mode',style: GoogleFonts.dekko(fontSize: 25,fontWeight: FontWeight.bold),),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10,right: 8),
                      child: InkWell(
                          onTap: ()
                          {
                            Provider.of<ThemeProv>(context,listen: false).changeTheme();
                          },
                          child: Icon(Icons.brightness_medium,size:27,color: Colors.teal,)),
                    ),
                  ],
                )
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
