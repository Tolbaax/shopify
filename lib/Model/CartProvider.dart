import 'package:flutter/cupertino.dart';
import 'package:sign/Model/Product.dart';

class CartProv extends ChangeNotifier
{
  List<Product>cartProducts=[];

  addCart(p){
    cartProducts.add(p);
    notifyListeners();
}
  removeProduct(p)
  {
    cartProducts.remove(p);
    notifyListeners();
  }
}