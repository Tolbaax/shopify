import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/Model/Product.dart';
class ProductWidget extends StatelessWidget {
  Product? product;
  ProductWidget({this.product});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 0.5.sw,
            height: 180,
            color: Colors.red,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(product!.name!),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(product!.style!),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 3),
            child: Text(product!.price!,style:
            TextStyle(color: Colors.deepPurple[900],fontWeight: FontWeight.w800),),
          ),
        ],
      ),
    );
  }
}
