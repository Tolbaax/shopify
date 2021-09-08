import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  static String id='HomeView';
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home',style:
      GoogleFonts.acme(fontSize: 40,color: Colors.deepPurple,fontWeight: FontWeight.w600),)),
    );
  }
}
