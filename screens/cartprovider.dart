import 'package:flutter/material.dart';
import 'product.dart'; // Make sure to import your Product class

class CartProvider extends ChangeNotifier {
  List<Product> cartItems = [];

  void addToCart(Product product) {
    cartItems.add(product);
    notifyListeners(); // Notify listeners when cartItems change
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners(); // Notify listeners when cartItems change
  }
}
