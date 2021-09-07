import 'dart:async';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign/View/Screens/OnBoarding.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  initState()
  {
    super.initState();
    Timer(Duration(seconds: 2), ()
    {
      Navigator.popAndPushNamed(context, OnBoarding.id);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.shopify,color: Colors.deepPurpleAccent,size: 150,),
            SizedBox(
              height: 45,
            ),
            Text('Shopify',style:
            GoogleFonts.condiment(fontSize: 70,color: Colors.deepPurpleAccent),),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
