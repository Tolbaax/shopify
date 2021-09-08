import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class FavScreen extends StatefulWidget {
  const FavScreen({Key? key}) : super(key: key);
  static String id='FavScreen';
  @override
  _FavScreenState createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Favorite',style:
      GoogleFonts.acme(fontSize: 40,color: Colors.red[900],fontWeight: FontWeight.w600),)),
    );
  }
}
