import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sign/Model/CartProvider.dart';
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
      body: ListView.builder(
          itemCount: Provider.of<CartProv>(context).cartProducts.length,
          itemBuilder: (context,index){
        return Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.grey,
                height: 120.h,width: 100.w,
                child: Image(image: AssetImage(Provider.of<CartProv>(context).cartProducts[index].imagePath!),
                  fit: BoxFit.cover,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(Provider.of<CartProv>(context).cartProducts[index].name!,style:
                  TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(Provider.of<CartProv>(context).cartProducts[index].price!,style:
                    TextStyle(color: Colors.teal[800],fontWeight: FontWeight.w800,fontSize: 17),),
                  ),
                ],
              ),
            ),
            Spacer(),
            Column(
              children: [
                InkWell(
                    onTap: ()
                    {
                      Provider.of<CartProv>(context,listen: false).removeProduct(
                        Provider.of<CartProv>(context,listen: false).cartProducts[index]
                      );
                    },
                    child: Icon(Icons.remove_circle,color: Colors.red,size: 30,)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(Provider.of<CartProv>(context,).cartProducts[index].quantity.toString())),
              ],
            ),

          ],
        );
      })
    );
  }
}
