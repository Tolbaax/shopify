import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign/Controller/auth.dart';
import 'package:sign/View/Screens/ForgetPassword.dart';
import 'package:sign/View/Screens/HomeScreen.dart';
import 'package:sign/View/Screens/SignUp.dart';
import 'package:sign/View/Widgets/CustomTextFormFiled.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class SignInScreen extends StatefulWidget {
  static String id = 'SignInScreen';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}
class _SignInScreenState extends State<SignInScreen> {
  GlobalKey<FormState>formKey=GlobalKey<FormState>();
  String? email;
  String? password;
  Auth auth=Auth();
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
                    padding: const EdgeInsets.only(bottom: 10,top: 25),
                    child: Icon(
                      FontAwesomeIcons.shopify,
                      size: 100,
                      color: Colors.deepPurple,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Form(
                      key: formKey,
                      child: Container(
                        height: 390.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.grey.shade500,),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 15,top: 20),
                              child: Text('SIGN IN',style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),
                            ),
                            CustomTextFormFiled(
                              hint: 'Email',
                              secure: false,
                              icon: FontAwesomeIcons.user,
                              eyeView: false,
                              onSaved: (v)
                              {
                                email=v;
                              },
                              validator: (v)
                              {
                                if(v.toString().isEmpty)
                                  {
                                    return 'Enter Your Email';
                                  }
                              },
                            ),
                            CustomTextFormFiled(
                              hint: 'Password',
                              secure: true,
                              icon: Icons.lock,
                              eyeView: true,
                              onSaved: (v)
                              {
                                password = v;
                              },
                              validator: (v)
                              {
                                if(v.toString().isEmpty)
                                  {
                                    return 'Please Enter your Password';
                                  }
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, ForgetPassword.id);
                                    },
                                    child: Text(
                                      'Forget Password ?',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600, fontSize: 16,),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15,bottom: 3,),
                                child: InkWell(
                                  onTap: ()async{
                                    if(formKey.currentState!.validate())
                                      {
                                        formKey.currentState!.save();
                                        try{
                                         await auth.signIn(email, password);
                                         Navigator.popAndPushNamed(context, HomeScreen.id);
                                        }
                                        catch(v)
                                    {
                                      print(v);
                                    }
                                      }
                                  },
                                  child: Container(
                                    height: 37.h,
                                    width: 200.w,
                                    decoration: BoxDecoration(
                                        color: Colors.deepPurple,
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
                            SizedBox(
                              height: 15,
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account? ",
                                    style: TextStyle(
                                        color: Colors.grey[800],
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.popAndPushNamed(context, SignUp.id);
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.deepPurple.shade900,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Column(
                    children: [
                      Text('Sign In With',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),),
                      SizedBox(height: 12,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25,backgroundColor: Colors.transparent,
                                child: Icon(FontAwesomeIcons.facebookF,size:28,color: Colors.blue.shade800,),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25,backgroundColor: Colors.transparent,
                                child: Icon(FontAwesomeIcons.google,size:28,color: Colors.red,),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25,backgroundColor: Colors.transparent,
                                child: Icon(FontAwesomeIcons.github,size:28,color: Colors.black,),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
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