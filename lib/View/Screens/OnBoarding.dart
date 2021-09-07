import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign/View/Screens/SignInScreen.dart';
import 'package:google_fonts/google_fonts.dart';
class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key}) : super(key: key);
  static String id='onBoarding';
  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: [
              Icon(FontAwesomeIcons.shopify,color: Colors.deepPurpleAccent,size: 130,),
              SizedBox(
                height: 25,
              ),
              Text('Shopify',style:
              GoogleFonts.acme(fontSize: 60,color: Colors.deepPurpleAccent,fontWeight: FontWeight.w600),),

              SizedBox(height: 120,),

              Text('Start selling with Shopify',style:
              TextStyle(color: Colors.black,fontSize:27,fontWeight: FontWeight.w600),),

              SizedBox(height: 20,),

              Text('Reach customers with a platform trusted',style:
              TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w600,fontSize: 16),),
              Text('by over a million businesses worldwide',style:
              TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w600,fontSize: 16),),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child: Center(child: InkWell(
                    onTap: ()
                    {
                      Navigator.popAndPushNamed(context, SignInScreen.id);
                    },
                    child: Text('Get Started',style:
                    TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}