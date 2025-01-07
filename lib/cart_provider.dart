import 'package:flutter/material.dart';
import 'models/cart.dart';

class CartProvider with ChangeNotifier {
  final Cart _cart = Cart();

  Map<String, CartItem> get items => _cart.items;

  double get totalAmount => _cart.totalAmount;

  void addItem(String productId, String title, double price) {
    _cart.addItem(productId, title, price);
    notifyListeners();
  }

  void removeItem(String productId) {
    _cart.removeItem(productId);
    notifyListeners();
  }

  void clearCart() {
    _cart.clearCart();
    notifyListeners();
  }
}
