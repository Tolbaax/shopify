import 'package:flutter/cupertino.dart';

class Quantity extends ChangeNotifier
{
  int q=0;

  addQ()
  {
    q++;
    notifyListeners();
  }
  subQ()
  {
    q>0? q-- :null;
    notifyListeners();
  }
}