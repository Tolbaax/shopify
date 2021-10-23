import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sign/Model/CartProvider.dart';
import 'package:sign/Model/FavoriteProv.dart';
import 'package:sign/Model/Quantity.dart';
import 'package:sign/Model/ThemeProv.dart';
import 'package:sign/View/Screens/Cart.dart';
import 'package:sign/View/Screens/CategoryScreen.dart';
import 'package:sign/View/Screens/FavScreen.dart';
import 'package:sign/View/Screens/ForgetPassword.dart';
import 'package:sign/View/Screens/HomeScreen.dart';
import 'package:sign/View/Screens/HomeView.dart';
import 'package:sign/View/Screens/OnBoarding.dart';
import 'package:sign/View/Screens/ProductScreen.dart';
import 'package:sign/View/Screens/Settings.dart';
import 'package:sign/View/Screens/SignInScreen.dart';
import 'package:sign/View/Screens/SignUp.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProv()),
    ChangeNotifierProvider(create: (context)=> CartProv()),
    ChangeNotifierProvider(create: (context)=> FavoriteProv()),
    ChangeNotifierProvider(create: (context)=> Quantity()),
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
    return ScreenUtilInit(
      builder:()=> MaterialApp(
        theme: ThemeData(
            brightness: Provider.of<ThemeProv>(context).isDark
                ? Brightness.dark
                : Brightness.light),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          splash: Icon(FontAwesomeIcons.shopify,color: Colors.deepPurple,size: 140,),
          nextScreen: OnBoarding(),
          duration: 900,
          curve: Curves.easeIn,
          splashTransition: SplashTransition.rotationTransition,

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
          CategoryScreen.id:(context)=>CategoryScreen(),
          ProductScreen.id:(context)=>ProductScreen(),
        },
      ),
    );
  }
}
