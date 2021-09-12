import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeView extends StatefulWidget {
  static String id='HomeView';
  @override
  _HomeViewState createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  List<String>imageUrl=[
    'images/shirt.jpg',
    'images/clock.jpg',
    'images/pantalon.jpg',
    'images/photo_2021-03-29_16-20-45.jpg',
    'images/photo_2021-03-29_16-20-44 (2).jpg',
    'images/photo_2021-03-29_16-20-44 (3).jpg',
    'images/photo_2021-03-29_16-20-44 (4).jpg',
  ];
  List<String>imageText=[
    'Shirts',
    'Watches',
    'Pantaloons',
    'Shoes',
    'Caps',
    'Jackets',
    'Bags',
  ];
  List<String>imageList=[
    'images/06.jpg',
    'images/07.jpg',
    'images/08.jpg',
    'images/09.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  maxLength: 15,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none),
                    contentPadding: EdgeInsets.all(18),
                    prefixIcon: Icon(Icons.search,color: Colors.black87,),
                    suffixIcon: Icon(Icons.check,color: Colors.black87,),
                    fillColor: Colors.grey[300],filled: true,
                    hintText: 'Search',hintStyle: TextStyle(fontSize: 19),
                  ),
                ),
              ),
              SizedBox(
                height: 160,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ListView.builder(
                      itemCount: 7,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                    return Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 35,
                              backgroundImage: AssetImage(imageUrl[index]),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(imageText[index],style:
                          GoogleFonts.acme(fontSize: 18,fontWeight: FontWeight.w600),),
                        ],
                      ),
                    );
                  }),
                ),
              ),
              Container(
                height: 300,width: double.infinity,
                child: Swiper(
                  pagination: new SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: new DotSwiperPaginationBuilder(
                        color: Colors.red, activeColor: Color(0xff38547C)),
                  ),
                  control: new SwiperControl(
                    color: Color(0xff38547C),
                  ),
                  autoplay: true,
                  itemCount: imageList.length,
                  itemBuilder: (context,index)
                  {
                    return Container(
                      height: 120,
                      width: double.infinity,
                      child: Image(image: AssetImage(imageList[index]),),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

