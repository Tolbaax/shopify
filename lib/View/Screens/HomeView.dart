import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/Model/Category.dart';
import 'package:sign/Model/Product.dart';
import 'package:sign/View/Screens/CategoryScreen.dart';
import 'package:sign/View/Screens/ProductScreen.dart';
import 'package:sign/View/Widgets/CustomProductWidget.dart';
class HomeView extends StatefulWidget {
  static String id = 'HomeView';
  @override
  _HomeViewState createState() => _HomeViewState();
}
List<CategoryModel>category=[
  CategoryModel(categoryNames: 'Shirts',categoryImageUrl:'images/White_T-Shirt_Mockup.jpg',),
  CategoryModel(categoryNames: 'Watches',categoryImageUrl:'images/whach3.jpg',),
  CategoryModel(categoryNames: 'Pantalon',categoryImageUrl:'images/pantalon.webp',),
  CategoryModel(categoryNames: 'Shoes',categoryImageUrl:'images/shoes.jpg',),
  CategoryModel(categoryNames: 'Caps',categoryImageUrl:'images/caps.jpg',),
  CategoryModel(categoryNames: 'Jackets',categoryImageUrl:'images/jacket.jpg',),
  CategoryModel(categoryNames: 'Bags',categoryImageUrl:'images/bags.jpg',),
];
List<String>imageList=['images/fashon.jpg', 'images/07.jpg', 'images/fashon1.jpg', 'images/fashon2.jpg',];
List<Product>products=[
  Product(name: 'Oxford',style: 'casual',price: '240 LE',imagePath: 'images/shirt2.jpeg'),
  Product(name: 'Classic',style: 'button-down',price: '170 LE',imagePath: 'images/shirt1.jpg'),
  Product(name: 'Chambray',style: 'Cotton',price: '450 LE',imagePath: 'images/shirts3.jpg'),
  Product(name: 'Overshirt',style: 'Soft Cotton',price: '300 LE',imagePath: 'images/White_T-Shirt_Mockup.jpg'),
  Product(name: 'Bags',style: 'black bag',price: '170 LE',imagePath: 'images/bags.jpg'),
  Product(name: 'watch',style: 'Luxury',price: '170 LE',imagePath: 'images/whach3.jpg'),
  Product(name: 'Shoes',style: 'Sneakers',price: '220 LE',imagePath: 'images/shoes.jpg'),
];
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25,left: 25,bottom:15),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius:
                        BorderRadius.circular(35), borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.all(12),
                        prefixIcon: Icon(Icons.search, color: Colors.black,),
                        suffixIcon: Icon(Icons.check, color: Colors.black,),
                        fillColor: Colors.grey[300],
                        filled: true,
                        hintText: 'Search',
                        hintStyle: TextStyle(fontSize: 19,fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 120.h,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5,left: 5,bottom: 5),
                      child: ListView.builder(
                          itemCount: category.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              child: InkWell(
                                onTap: () {

                                  Navigator.push(context, MaterialPageRoute(builder:
                                      (context) => CategoryScreen(
                                        categoryTitle: category[index].categoryNames,)));
                                },
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 35.r,
                                        backgroundImage: AssetImage(
                                            category[index].categoryImageUrl!),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    Text(
                                      category[index].categoryNames!, style: GoogleFonts.aladin(
                                          fontSize: 18, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text('New Collection',style: TextStyle(fontWeight: FontWeight.w800),),
                            Spacer(),
                            Text('See All',style: TextStyle(fontWeight: FontWeight.w800),),
                            Icon(Icons.arrow_forward_ios_rounded,size: 15,),
                          ],
                        ),
                      ),
                      Container(
                        height: 340.h,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: products.length,
                            itemBuilder: (context,index){
                              return InkWell(
                                  onTap: ()
                                  {
                                    Navigator.push(context,
                                        PageRouteBuilder(
                                     transitionDuration: Duration(seconds: 1),
                                       transitionsBuilder: (context,animation,animationTime,child){
                                         animation=CurvedAnimation(parent: animation, curve: Curves.linearToEaseOut);
                                       return ScaleTransition(
                                         alignment: Alignment.center,
                                         scale: animation,
                                         child: child,
                                       );
                                       },
                                       pageBuilder: (context,animation,animationTime){
                                     return ProductScreen(product: products[index],);
                                   }));
                                  },
                                  child: ProductWidget(product: products[index],));
                            }),
                      ),
                    ],
                  ),
                  Container(
                    height: 250.h,color: Colors.red,
                    child: Swiper(
                      pagination: new SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: new DotSwiperPaginationBuilder(
                            color: Colors.white, activeColor: Color(0xffb927ff)),
                      ),
                      control: new SwiperControl(color: Color(0xffa31efc),
                      ),
                      autoplay: true,
                      itemCount: imageList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(imageList[index])
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
