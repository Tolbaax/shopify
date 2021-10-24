
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sign/Controller/auth.dart';
import 'package:sign/View/Widgets/CustomTextFormFiled.dart';
class ForgetPassword extends StatelessWidget {
  static String id="Forgetpassword";
  String? email;
  Auth auth = Auth();
  TextEditingController forgetControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: ListView(
            children: [
              Column(
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
                  SizedBox(height: 100,),
                  CustomTextFormFiled(
                    hint: 'Enter Email',
                    secure: false,
                    eyeView: false,
                    name: 'Email',
                    icon: Icons.email,
                    controller: forgetControl,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: InkWell(
                      onTap: ()async{
                        if(forgetControl.text.isEmpty)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please Enter Email'),backgroundColor: Colors.blueAccent,));
                          }
                        else{
                          try{
                            auth.forgetPassword(forgetControl.text);
                          }
                          catch(e)
                        {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
                        }
                        }
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(28)
                        ),
                        child: Center(child: Text('Reset Password',style:
                        TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.w600),)),
                      ),
                    ),
                  ),],
              ),
            ],
          )
        )
    );
  }
}
