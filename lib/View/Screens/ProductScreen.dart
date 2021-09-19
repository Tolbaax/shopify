
import 'package:flutter/material.dart';
import 'package:sign/Model/Product.dart';
class ProductScreen extends StatelessWidget {
 static String id='ProductScreen';
 Product? product;
 ProductScreen({this.product});
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(product!.name!),
      ),
    );
  }
}
