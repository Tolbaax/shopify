import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sign/Model/FavoriteProv.dart';
import 'package:sign/Model/Product.dart';
class ProductWidget extends StatefulWidget {
  Product? product;
  ProductWidget({this.product,});
  @override
  _ProductWidgetState createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  bool like=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Badge(
            position: BadgePosition.topEnd(top: 1,end: 2),
            badgeContent: InkWell(
                onTap: ()
                {
                  setState(() {
                    Provider.of<FavoriteProv>(context,listen: false).addLike(widget.product);
                    like=!like;
                  });
                },
                child: Icon(Icons.favorite_sharp,size: 25,color: changeColor(like))),
            badgeColor: Colors.transparent,
            elevation: 0,
            borderSide: BorderSide.none,
            child: Container(
              width: 0.5.sw,
              height: 245,
              child: Image(image: AssetImage(widget.product!.imagePath!),
                fit: BoxFit.cover,
              ),

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
Color? changeColor(like)
{
  if(like==true)
  {
    return Colors.red;
  }
  else
  {
    return Colors.grey;
  }
}