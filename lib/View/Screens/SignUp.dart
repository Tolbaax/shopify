import 'package:flutter/material.dart';
import 'package:sign/Controller/auth.dart';
import 'package:sign/View/Screens/HomeScreen.dart';
import 'package:sign/View/Screens/SignInScreen.dart';
import 'package:sign/View/Widgets/CustomTextFormFiled.dart';
class SignUp extends StatelessWidget {
  static String id = 'SignUp';
  GlobalKey<FormState>formKey=GlobalKey<FormState>();
  String? email;
  String? password;
  Auth auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurpleAccent),
                  ),
                ),
                Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        CustomTextFormFiled(
                          hint: 'Email',
                          secure: false,
                          eyeView: false,
                          icon: Icons.email,
                          onSaved: (v)
                          {
                            email=v;
                          },
                          validator: (v)
                          {
                            if(v.toString().isEmpty)
                              {
                                return 'Please Enter Email';
                              }
                          },
                        ),
                        CustomTextFormFiled(
                          hint: 'Name',
                          secure: false,
                          eyeView: false,
                          icon: Icons.person,
                          validator: (v)
                          {
                            if(v.toString().isEmpty)
                              {
                                return 'Please Enter Your Name';
                              }
                          },
                        ),
                        CustomTextFormFiled(
                          hint: 'Password',
                          secure: false,
                          eyeView: false,
                          icon: Icons.lock,
                          onSaved: (v){
                            password = v;
                          },
                          validator: (v)
                          {
                            if(v.toString().isEmpty)
                              {
                                return 'Please Enter Password';
                              }
                          },
                        ),
                        CustomTextFormFiled(
                          hint: 'Confirm Password',
                          secure: false,
                          eyeView: false,
                          icon: Icons.lock,
                          validator: (v)
                          {
                            if(v.toString().isEmpty)
                              {
                                return 'Please Confirm Password';
                              }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 150,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: InkWell(
                          onTap: ()async
                          {
                            if(formKey.currentState!.validate())
                              {
                                formKey.currentState!.save();
                                try{
                                 await auth.signUp(email, password);
                                 Navigator.popAndPushNamed(context, HomeScreen.id);
                                }
                                catch(e)
                            {
                              print(e);
                            }
                              }
                          },
                            child: Container(
                              height: 45,
                              width: 250,
                              decoration: BoxDecoration(
                                color: Colors.deepPurple,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Center(
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 26,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                          ),
                        ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have account ? ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 16),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, SignInScreen.id);
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.deepPurple.shade800,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )
    );
  }
}
