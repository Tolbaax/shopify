import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sign/Model/ThemeProv.dart';
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
        InkWell(
            onTap: ()
            {
              Provider.of<ThemeProv>(context,listen: false).changeTheme();
            },
            child: Icon(FontAwesomeIcons.ban,color: Colors.red,)),
      ],
    );
  }
}
