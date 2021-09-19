import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sign/Model/CartProvider.dart';
import 'package:sign/Model/FavoriteProv.dart';
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
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 450.h,width: double.infinity.sw,
              child: Image(image: AssetImage(widget.product!.imagePath!),
                fit: BoxFit.cover,),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8,right: 10,top: 10),
                  child: Row(
                    children: [
                      Text(widget.product!.name!,style:
                      GoogleFonts.share(fontSize: 35,fontWeight: FontWeight.w600),),
                      Spacer(),
                      InkWell(
                          onTap: ()
                          {
                            Provider.of<FavoriteProv>(context,listen: false).addLike(widget.product);
                          },
                          child: Icon(FontAwesomeIcons.heart)),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15,top: 15),
                    child: Text(widget.product!.style!,style:
                    GoogleFonts.delius(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w600),),
                  ),),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle,size: 35,color: Colors.teal,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('0',style: TextStyle(fontSize: 20),),
                      ),
                      Icon(Icons.remove_circle,size: 35,color: Colors.teal,),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12,top: 45,right: 5,),
                  child: Row(
                    children: [
                      Text(widget.product!.price!,style:
                      GoogleFonts.share(fontSize: 25,color: Colors.teal,fontWeight: FontWeight.bold),),
                      Spacer(),
                      InkWell(
                        onTap: (){
                          Provider.of<CartProv>(context,listen: false).addCart(widget.product);
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Add To Cart'),
                                backgroundColor: Colors.green,duration: Duration(seconds: 1),
                                behavior: SnackBarBehavior.floating,
                              ));
                        },
                        child: Container(
                            height: 36.h,width:130.w ,
                            decoration: BoxDecoration(
                                color: Colors.deepPurpleAccent,
                                borderRadius: BorderRadius.circular(25)
                            ),
                            child: Center(child: Text('Add To Card',style:
                            GoogleFonts.delius(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w800),))),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
