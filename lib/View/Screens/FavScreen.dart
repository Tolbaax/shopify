import 'package:flutter/material.dart';
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
      body: Center(child: Text('Fav')),
    );
  }
}
