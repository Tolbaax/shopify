import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sign/Model/CartProvider.dart';
import 'package:sign/Model/FavoriteProv.dart';
import 'package:sign/Model/Product.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/Model/Quantity.dart';
class ProductScreen extends  StatefulWidget {
 static String id='ProductScreen';
 Product? product;
 ProductScreen({this.product});
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool like=false;
 @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Expanded(
          child: Column(
            children: [
              Container(
                height: 460.h,width: double.infinity.sw,
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
                        GoogleFonts.share(fontSize: 35,fontWeight: FontWeight.w500),),
                        Spacer(),
                        InkWell(
                            onTap: ()
                            {
                              setState(() {
                                like=!like;
                                Provider.of<FavoriteProv>(context,listen: false).addLike(widget.product);
                              });
                            },
                            child: Icon(Icons.favorite_sharp,color: changeColor(like),size: 31.sp,)),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,top: 15),
                      child: Text(widget.product!.style!,style:
                      GoogleFonts.delius(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.w500),),
                    ),),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Consumer<Quantity>(

                      builder:(context,child,data)=>
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: ()
                              {
                               Provider.of<Quantity>(context,listen: false).addQ();
                              },
                              child: Icon(Icons.add_circle,size: 35,)),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child:
                                  Text(Provider.of<Quantity>(context).q.toString(),style:
                              TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                            ),

                          InkWell(
                              onTap: ()
                              {
                                Provider.of<Quantity>(context,listen: false).subQ();
                              },
                              child: Icon(Icons.remove_circle,size: 35,)),
                        ],
                      ),
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
                            setState(() {
                              widget.product!.quantity=Provider.of<Quantity>(context,listen: false).q;
                            });
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