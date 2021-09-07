import 'package:flutter/material.dart';
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
      body: Center(child: Text('Cart')),
    );
  }
}
