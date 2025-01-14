import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ready_to_go_store/cart_provider.dart';
import 'package:ready_to_go_store/regular_top_bar/top_bar.dart';
import 'cart_components/cart_list.dart';
import 'cart_components/order_summary.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<StatefulWidget> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
        builder: (BuildContext context, CartProvider order, Widget? child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 50,
          backgroundColor: Colors.white,
          title: const Padding(
              padding: EdgeInsets.only(left: 2, right: 2),
              child: TopBar()),
          scrolledUnderElevation: 0,
        ),
        body: Padding( padding: const EdgeInsets.only(top:26, bottom: 26, right:10, left:10), child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 73, 8),
                      fontWeight: FontWeight.w600,
                      fontSize: 30),
                  "Your cart"),
              CartList(items: order.items, changeAmount: order.changeAmount),
            ]),
            OrderSummary(
                totalPrice: order.totalPrice, totalItems: order.totalAmount)
          ],
        ),
      ));
    });
  }
}
