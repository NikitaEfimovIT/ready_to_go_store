import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ready_to_go_store/models/item.dart';
import '../../cart_provider.dart';
import '../../models/Product.dart';
import 'product_amount_choice.dart';

void showProductModal(BuildContext context, Product product) {
  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  product.img,
                  fit: BoxFit.cover,
                  width: 130,
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: (
                      ) {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title,
                            style: const TextStyle(
                              color: Color.fromRGBO(255, 73, 8, 1),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true, // Enables wrapping
                            overflow: TextOverflow.visible, // Prevents truncation
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Row(
                          children: [Text(
                            product.price.toStringAsFixed(2),
                            style: const TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 20,
                            ),
                          ),const Text(
                            "€",
                            style: TextStyle(
                              color: Color.fromRGBO(255, 73, 8, 1),
                              fontSize: 20,
                            ),
                          )],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Available in:",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 14,
                            ),
                            softWrap: true, // Enables wrapping
                            overflow: TextOverflow.visible, // Prevents truncation
                          ),
                          Text(
                            "a: 2, b: 5, c: 7",
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontSize: 12,
                            ),
                            softWrap: true, // Enables wrapping
                            overflow: TextOverflow.visible, // Prevents truncation
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        ProductAmountChoice()
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          side: BorderSide(color: Color.fromRGBO(255, 73, 8, 1), width: 1),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the BottomSheet
                          Provider.of<CartProvider>(context, listen: false).addItem(
                            Item(product.id, product.img, product.title, product.price),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("${product.title} added to cart")),
                          );
                        },
                        child: Text(
                          "Add to Cart",
                          style: TextStyle(color: Color.fromRGBO(255, 73, 8, 1), fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(width: 10), // Space between buttons
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(255, 73, 8, 1),
                          side: BorderSide(color: Colors.white, width: 1),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.symmetric(horizontal: 35, vertical: 12),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the BottomSheet
                          Provider.of<CartProvider>(context, listen: false).addItem(
                            Item(product.id, product.img, product.title, product.price),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("${product.title} added to cart")),
                          );
                        },
                        child: Text(
                          "Buy Now",
                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 100)
                  ],
                )
              ],
            ),
          ),
        ),
      );
    },
  );
}
