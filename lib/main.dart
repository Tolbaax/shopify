import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign/Provider/ThemeProv.dart';
import 'package:sign/View/Screens/Cart.dart';
import 'package:sign/View/Screens/FavScreen.dart';
import 'package:sign/View/Screens/ForgetPassword.dart';
import 'package:sign/View/Screens/HomeScreen.dart';
import 'package:sign/View/Screens/HomeView.dart';
import 'package:sign/View/Screens/OnBoarding.dart';
import 'package:sign/View/Screens/Settings.dart';
import 'package:sign/View/Screens/SignInScreen.dart';
import 'package:sign/View/Screens/SignUp.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProv()),
  ], child: Shopify()));
}

class Shopify extends StatefulWidget {
  const Shopify({Key? key}) : super(key: key);

  @override
  _ShopifyState createState() => _ShopifyState();
}

class _ShopifyState extends State<Shopify> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          brightness: Provider.of<ThemeProv>(context).isDark
              ? Brightness.dark
              : Brightness.light),
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: 'images/Shopify-Symbol.png',
        nextScreen: OnBoarding(),
        splashIconSize: 150,
        duration: 1500,
        curve: Curves.decelerate,
        splashTransition: SplashTransition.sizeTransition,
      ),
      routes: {
        OnBoarding.id: (context) => OnBoarding(),
        SignInScreen.id: (context) => SignInScreen(),
        ForgetPassword.id: (context) => ForgetPassword(),
        SignUp.id: (context) => SignUp(),
        HomeScreen.id: (context) => HomeScreen(),
        HomeView.id: (context) => HomeView(),
        FavScreen.id: (context) => FavScreen(),
        Cart.id: (context) => Cart(),
        Settings.id: (context) => Settings(),
      },
    );
  }
}
