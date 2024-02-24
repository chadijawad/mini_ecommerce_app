import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/classes/items.dart';

class Cart with ChangeNotifier {
  int price = 0;
  List<Item> selectedItems = [];
  void addToCart(Item product) {
    selectedItems.add(product);
    price += product.price.round();
    notifyListeners();
  }

  void deletFromCart(int index, Item product) {
    selectedItems.removeAt(index);
    price -= product.price.round();
    notifyListeners();
  }
}
