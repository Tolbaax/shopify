import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign/View/Screens/ForgetPassword.dart';
import 'package:sign/View/Screens/HomeScreen.dart';
import 'package:sign/View/Screens/SignUp.dart';
import 'package:sign/View/Widgets/CustomTextFormFiled.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);
  static String id = 'SignInScreen';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: ListView(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10,top: 20),
                    child: Shimmer.fromColors(
                      baseColor: Colors.deepPurple,
                      highlightColor: Colors.transparent,
                      child: Icon(
                        FontAwesomeIcons.shopify,
                        size: 140,
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Form(
                      child: Column(
                        children: [
                          CustomTextFormFiled(
                            name: 'Email',
                            hint: 'Enter Your Email',
                            secure: false,
                            icon: FontAwesomeIcons.user,
                            eyeView: false,
                          ),
                          CustomTextFormFiled(
                            name: 'Password',
                            hint: 'Enter Your Password',
                            secure: true,
                            icon: Icons.lock,
                            eyeView: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.popAndPushNamed(context, HomeScreen.id);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15,bottom: 3,),
                                child: Container(
                                  height: 37.h,
                                  width: 200.w,
                                  decoration: BoxDecoration(
                                      color: Colors.deepPurpleAccent,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: Center(
                                      child: Text(
                                        'Sign In',
                                        style: GoogleFonts.share(
                                            color: Colors.white,
                                            fontSize: 25.h,
                                            fontWeight: FontWeight.w500),
                                      )),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, ForgetPassword.id);
                            },
                            child: Text(
                              'Forget Password ?',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account ?",
                                  style: TextStyle(
                                      color: Colors.grey[800],
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context, SignUp.id);
                                  },
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey,
                                    highlightColor: Colors.redAccent,
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 22,),
                            child: Container(
                              height: 40.h,width: 260.w,
                              decoration: BoxDecoration(
                                  color:Colors.blueAccent[400],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25,right: 10),
                                    child: Icon(FontAwesomeIcons.facebook,color: Colors.white,size:30,),
                                  ),
                                  Text('LOGIN WITH FACEBOOK',style:
                                  TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w700),),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20,),
                            child: Container(
                              height: 40.h,width: 260.w,
                              decoration: BoxDecoration(
                                color:Colors.grey[300],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 25,right: 10),
                                    child: Icon(FontAwesomeIcons.google,color: Colors.red,size:30,),
                                  ),
                                  Text('SIGN IN WITH GMAIL',style:
                                  TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.w700),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
