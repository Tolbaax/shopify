import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);
  static String id='Cart';
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Cart',style:
      GoogleFonts.acme(fontSize: 40,color: Colors.deepPurple,fontWeight: FontWeight.w600),)),
    );
  }
}
