import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign/Model/Product.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class ProductScreen extends StatefulWidget {
 static String id='ProductScreen';
 Product? product;
 ProductScreen({this.product});

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
 @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
      children: [
        Container(
        height: 450.h,width: double.infinity.sw,
        child: Image(image: AssetImage(widget.product!.imagePath!),
          fit: BoxFit.fill,),
      ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8,right: 10,top: 10),
              child: Row(
                children: [
                  Text(widget.product!.name!,style: GoogleFonts.macondo(color: Colors.black,fontSize: 40),),
                  Spacer(),
                  Icon(FontAwesomeIcons.heart),
                ],
              ),
            ),
             Align(
                 alignment: Alignment.topLeft,
                 child: Padding(
                   padding: const EdgeInsets.only(left: 15,top: 15),
                   child: Text(widget.product!.style!,style: TextStyle(color: Colors.grey,fontSize: 20),),
                 ),),
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_circle,size: 35,color: Colors.deepPurple,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('0',style: TextStyle(color: Colors.black,fontSize: 30),),
                  ),
                  Icon(Icons.remove_circle,size: 35,color: Colors.deepPurple,),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12,top: 20,right: 5,),
              child: Row(
                children: [
                  Text(widget.product!.price!,style: GoogleFonts.aladin(fontSize: 25,color: Colors.black),),
                  Spacer(),
                  Container(
                    height: 35.h,width:120 ,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(25)
                      ),
                      child: Center(child: Text('Add Card',style:
                      GoogleFonts.delius(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),))),
                ],
              ),
            ),
          ],
        ),
   ],
      ),
    );
  }
}
