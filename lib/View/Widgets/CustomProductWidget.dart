import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign/Model/Product.dart';
class ProductWidget extends StatefulWidget {
  Product? product;
  ProductWidget({this.product});

  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 0.5.sw,
            height: 245,
            child: Image(image: AssetImage(widget.product!.imagePath!),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(widget.product!.name!,style:
            GoogleFonts.delius(fontSize: 22,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2),
            child: Text(widget.product!.style!,style:
            GoogleFonts.delius(fontSize: 15,),),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 7),
            child: Text(widget.product!.price!,style:
            TextStyle(color: Colors.teal,fontWeight: FontWeight.w900,fontSize: 16),),
          ),
        ],
      ),
    );
  }
}
