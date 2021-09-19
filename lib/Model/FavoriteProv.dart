import 'package:flutter/cupertino.dart';
import 'package:sign/Model/Product.dart';

class FavoriteProv extends ChangeNotifier
{
  List<Product> favProducts = [];
  addLike(l) {
    favProducts.add(l);
    notifyListeners();
  }
  removeLike(r)
  {
    favProducts.remove(r);
    notifyListeners();
  }
}
