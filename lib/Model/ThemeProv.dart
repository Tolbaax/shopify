
import 'package:flutter/cupertino.dart';

class ThemeProv extends ChangeNotifier
{
  bool isDark=false;

  changeTheme()
  {
    isDark=!isDark;
    notifyListeners();
  }
}