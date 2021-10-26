
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
                      color: Colors.deepPurple,
                    ),
                  ),
                  Text('Reset Password',style:
                  TextStyle(fontSize: 30,color: Colors.deepPurple,fontWeight: FontWeight.w600),),
                  SizedBox(height: 75,),
                  CustomTextFormFiled(
                    hint: 'Email',
                    secure: false,
                    eyeView: false,
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
                        height: 45,width: 250,
                        decoration: BoxDecoration(
                            color: Colors.deepPurple,
                            borderRadius: BorderRadius.circular(30)
                        ),
                        child: Center(child: Text('Reset Password',style:
                        TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),)),
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
