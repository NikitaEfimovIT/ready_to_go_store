import 'package:flutter/material.dart';
import 'package:ready_to_go_store/models/item.dart';
import 'package:ready_to_go_store/models/order.dart';

import 'models/price.dart';

class CartProvider with ChangeNotifier {
  final Order _order = Order([]);

  List<Item> get items => _order.orderItems;

  num get totalAmount => _order.totalAmount;

  Price get totalPrice => _order.totalPrice;

  void addItem(Item newItem) {
    _order.addNewProduct(newItem);
    notifyListeners();
  }

  void changeAmount(String id, num newAmount){
    if (newAmount > 0) {
      for (var el in _order.orderItems) {
        if (el.productId == id) {
          el.amount = newAmount;
        }
      }
    } else {
      _order.removeProduct(id);
    }

    _order.calculateTotalAmount();
    _order.calculateTotalPrice();
    notifyListeners();
  }

  void removeItem(String productId) {
    _order.removeProduct(productId);
    notifyListeners();
  }

  void clearCart() {
    _order.clearOrder();
    notifyListeners();
  }
}
