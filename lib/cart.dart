import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final item = cart.items.values.toList()[index];
                return ListTile(
                  leading: CircleAvatar(child: Text("${item.quantity}x")),
                  title: Text(item.title),
                  subtitle: Text("\$${item.price * item.quantity}"),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      cart.removeItem(item.id);
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text("Total: \$${cart.totalAmount}"),
          ),
          ElevatedButton(
            onPressed: () {
              cart.clearCart();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Cart cleared")),
              );
            },
            child: Text("Clear Cart"),
          ),
        ],
      ),
    );
  }
}
