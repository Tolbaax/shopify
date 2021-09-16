import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign/View/Screens/SignInScreen.dart';
import 'package:sign/View/Widgets/CustomTextFormFiled.dart';
class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);
  static String id = 'SignUp';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
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
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          CustomTextFormFiled(
                            hint: 'Enter Your Name',
                            secure: false,
                            eyeView: false,
                            name: 'Full Name',
                            icon: FontAwesomeIcons.user,
                          ),
                          CustomTextFormFiled(
                            hint: 'Enter Your Email',
                            secure: false,
                            eyeView: false,
                            name: 'Email',
                            icon: Icons.email,
                          ),
                          CustomTextFormFiled(
                            hint: 'Enter Your Pass',
                            secure: false,
                            eyeView: false,
                            name: 'Password',
                            icon: Icons.lock,
                          ),
                          CustomTextFormFiled(
                            hint: 'Confirm Your Pass',
                            secure: false,
                            eyeView: false,
                            name: 'Confirm Password',
                            icon: Icons.lock,
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
                          child: Container(
                            height: 55,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.deepPurpleAccent,
                              borderRadius: BorderRadius.circular(28),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have account ?',
                              style: TextStyle(
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, SignInScreen.id);
                              },
                              child: Text(
                                'Sign In',
                                style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18),
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
          ),
        ],
      )
    );
  }
}
