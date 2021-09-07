
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);
  static String id="Forgetpassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(
                  FontAwesomeIcons.shopify,
                  size: 110,
                  color: Colors.deepPurpleAccent,
                ),
              ),
              Text('Reset Password',style:
              TextStyle(fontSize: 30,color: Colors.deepPurple,fontWeight: FontWeight.w600),),
              SizedBox(
                height: 120,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Text('Email',style: TextStyle(
                      fontSize: 25,fontWeight: FontWeight.w600,color: Colors.black87
                  ),)),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email,color: Colors.deepPurple,),
                  hintText: 'Enter Your Email',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.deepPurpleAccent,
                      borderRadius: BorderRadius.circular(28)
                  ),
                  child: Center(child: Text('Reset Password',style:
                  TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w600),)),
                ),
              ),],
          ),
        )
    );
  }
}
