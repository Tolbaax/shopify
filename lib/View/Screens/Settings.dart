import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign/View/Screens/SignInScreen.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  static String id='Settings';
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       CircleAvatar(
         radius: 80,
         backgroundImage: AssetImage('images/Tolba1.jpg'),
       ),
        Padding(
          padding: const EdgeInsets.only(top: 10,bottom: 5),
          child: Text('Mohamed Tolba',style: GoogleFonts.share(fontSize: 30,fontWeight: FontWeight.w500,),),
        ),
        Text('Tolbaax@gmail.com',style: GoogleFonts.share(fontSize: 18,fontWeight: FontWeight.w300,),),
        Padding(
          padding: const EdgeInsets.only(top: 18,left: 15,right: 12,bottom: 5),
          child: Row(
            children: [
              Text('Account Information',style: GoogleFonts.share(fontWeight: FontWeight.w500,fontSize: 22),),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded,color: Colors.teal[800],),
            ],
          ),
        ),
        Divider(color: Colors.grey,),
        Padding(
          padding: const EdgeInsets.only(top: 8,left: 15,right: 12,bottom: 5),
          child: Row(
            children: [
              Text('Sales Channels',style: GoogleFonts.share(fontWeight: FontWeight.w500,fontSize: 22),),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded,color: Colors.teal[800],),
            ],
          ),
        ),
        Divider(color: Colors.grey,),
        Padding(
          padding: const EdgeInsets.only(top: 8,left: 15,right: 12,bottom: 5),
          child: Row(
            children: [
              Text('Notifications ',style: GoogleFonts.share(fontWeight: FontWeight.w500,fontSize: 22),),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded,color: Colors.teal[800],),
            ],
          ),
        ),
        Divider(color: Colors.grey,),
        Padding(
          padding: const EdgeInsets.only(top: 8,left: 15,right: 12,bottom: 5),
          child: Row(
            children: [
              Text('Language',style: GoogleFonts.share(fontWeight: FontWeight.w500,fontSize: 22),),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded,color: Colors.teal[800],),
            ],
          ),
        ),
        Divider(color: Colors.grey,),
        Padding(
          padding: const EdgeInsets.only(top: 8,left: 15,right: 12,bottom: 5),
          child: Row(
            children: [
              Text('Location',style: GoogleFonts.share(fontWeight: FontWeight.w500,fontSize: 22),),
              Spacer(),
              Icon(Icons.arrow_forward_ios_rounded,color: Colors.teal[800],),
            ],
          ),
        ),
        Divider(color: Colors.grey,),
        Padding(
          padding: const EdgeInsets.only(top: 8,left: 15,right: 12),
          child: InkWell(
            onTap: ()
            {
              Navigator.popAndPushNamed(context, SignInScreen.id);
            },
            child: Row(
              children: [
                Text('Log Out',style: GoogleFonts.share(fontWeight: FontWeight.w500,fontSize: 22),),
                Spacer(),
                Icon(Icons.arrow_forward_ios_rounded,color: Colors.teal[800],),
              ],
            ),
          ),
        ),
    ]
    );
  }
}
