import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign/Model/Category.dart';
import 'package:sign/View/Screens/CategoryScreen.dart';
class HomeView extends StatefulWidget {
  static String id = 'HomeView';
  @override
  _HomeViewState createState() => _HomeViewState();
}
List<CategoryModel>category=[
  CategoryModel(categoryNames: 'Shirts',categoryImageUrl:'images/shirt.jpg',),
  CategoryModel(categoryNames: 'Watches',categoryImageUrl:'images/clock.jpg',),
  CategoryModel(categoryNames: 'Pantaloons',categoryImageUrl:'images/pantalon.jpg',),
  CategoryModel(categoryNames: 'Shoes',categoryImageUrl:'images/photo_2021-03-29_16-20-45.jpg',),
  CategoryModel(categoryNames: 'Caps',categoryImageUrl:'images/photo_2021-03-29_16-20-44 (2).jpg',),
  CategoryModel(categoryNames: 'Jackets',categoryImageUrl:'images/photo_2021-03-29_16-20-44 (3).jpg',),
  CategoryModel(categoryNames: 'Bags',categoryImageUrl:'images/photo_2021-03-29_16-20-44 (4).jpg',),
];
List<String>imageList=['images/06.jpg', 'images/07.jpg', 'images/08.jpg', 'images/09.jpg',];
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
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      maxLength: 15,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius:
                        BorderRadius.circular(25), borderSide: BorderSide.none),
                        contentPadding: EdgeInsets.all(18),
                        prefixIcon: Icon(Icons.search, color: Colors.black87,),
                        suffixIcon: Icon(Icons.check, color: Colors.black87,),
                        fillColor: Colors.grey[300],
                        filled: true,
                        hintText: 'Search',
                        hintStyle: TextStyle(fontSize: 19),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 160.h,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
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
                                      height: 10.h,
                                    ),
                                    Text(
                                      category[index].categoryNames!, style: GoogleFonts.acme(
                                          fontSize: 18, fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                  Container(
                    height: 300.h, width: double.infinity.w,
                    child: Swiper(
                      pagination: new SwiperPagination(
                        alignment: Alignment.bottomCenter,
                        builder: new DotSwiperPaginationBuilder(
                            color: Colors.red, activeColor: Color(0xff38547C)),
                      ),
                      control: new SwiperControl(color: Color(0xff38547C),
                      ),
                      autoplay: true,
                      itemCount: imageList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 120.h, width: double.infinity,
                          child: Image(image: AssetImage(imageList[index]),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
