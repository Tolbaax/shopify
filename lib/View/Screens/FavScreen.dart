import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign/Model/FavoriteProv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        body: ListView.builder(
            itemCount: Provider.of<FavoriteProv>(context).favProducts.length,
            itemBuilder: (context,index){
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      color: Colors.grey,
                      height: 120.h,width: 100.w,
                      child: Image(image: AssetImage(Provider.of<FavoriteProv>(context).favProducts[index].imagePath!),
                        fit: BoxFit.cover,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(Provider.of<FavoriteProv>(context).favProducts[index].name!,style:
                        TextStyle(fontWeight: FontWeight.w800,fontSize: 20),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(Provider.of<FavoriteProv>(context).favProducts[index].price!,style:
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
                            Provider.of<FavoriteProv>(context,listen: false).removeLike(
                                Provider.of<FavoriteProv>(context,listen: false).favProducts[index]
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(Icons.remove_circle,color: Colors.red,size: 30,),
                          )),
                    ],
                  ),
                ],
              );
            })
    );
  }
}
