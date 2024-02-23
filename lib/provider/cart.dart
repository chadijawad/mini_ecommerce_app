import 'package:flutter/material.dart';
import 'package:mini_ecommerce_app/classes/items.dart';

class Cart with ChangeNotifier {
  double price = 0;
  List<Item> selectedItems = [];
  void addToCart(Item product) {
    selectedItems.add(product);
    price += product.price;
    notifyListeners();
  }
}
