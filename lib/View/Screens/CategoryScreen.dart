import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static String id='CategoryScreen';
  String? categoryTitle;
  CategoryScreen({this.categoryTitle});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: Center(
          child: Text('CategoryScreen')),
    );
  }
}
