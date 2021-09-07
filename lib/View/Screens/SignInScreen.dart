import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign/View/Screens/ForgetPassword.dart';
import 'package:sign/View/Screens/HomeScreen.dart';
import 'package:sign/View/Screens/SignUp.dart';
import 'package:sign/View/Widgets/CustomTextFormFiled.dart';

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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Icon(
                FontAwesomeIcons.shopify,
                size: 100,
                color: Colors.deepPurpleAccent,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                child: Column(
                  children: [
                    CustomTextFormFiled(
                      name: 'Username', hint: 'Enter Your Username', secure: false,
                      icon: FontAwesomeIcons.user,eyeView: false,),
                    CustomTextFormFiled(
                      name: 'Password',hint: 'Enter Your Password', secure: true,
                      icon: Icons.lock,eyeView: true,),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 55,
                        width: 280,
                        decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(28)
                        ),
                        child: Center(child: InkWell(
                          onTap: ()
                          {
                            Navigator.popAndPushNamed(context, HomeScreen.id);
                          },
                          child: Text('Login',style:
                          TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.w600),),
                        )),
                      ),
                    ),
                    InkWell(
                      onTap: ()
                      {
                        Navigator.pushNamed(context, ForgetPassword.id);
                      },
                      child: Text('Forget Password ?',style:
                      TextStyle(fontWeight: FontWeight.w600,fontSize: 19),),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an account ?",style:
                          TextStyle(color: Colors.grey[800],fontWeight: FontWeight.w600,fontSize: 18),),
                          InkWell(
                            onTap: ()
                            {
                              Navigator.pushNamed(context, SignUp.id);
                            },
                            child: Text("Sign Up",style:
                            TextStyle(color: Colors.grey[600],fontWeight: FontWeight.w600,fontSize: 18),),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

