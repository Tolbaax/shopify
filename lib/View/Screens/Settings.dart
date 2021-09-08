import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);
  static String id='Settings';
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Settings',style:
      GoogleFonts.acme(fontSize: 40,color: Colors.blue,fontWeight: FontWeight.w600),)),
    );
  }
}
