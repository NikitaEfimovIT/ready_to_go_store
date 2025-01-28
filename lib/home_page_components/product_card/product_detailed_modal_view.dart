import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ready_to_go_store/home_page_components/product_card/product_amount_choice.dart';

import '../../cart_provider.dart';
import '../../models/Product.dart';
import '../../models/item.dart';

void showProductModal(BuildContext context, Product product) {
  int selectedAmount = 1; // Default selected amount

  showModalBottomSheet(
    backgroundColor: Colors.white,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return FractionallySizedBox(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: StatefulBuilder( // Use StatefulBuilder to manage state within the modal
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          product.img,
                          fit: BoxFit.cover,
                          width: 130,
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
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
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  product.price.toStringAsFixed(2),
                                  style: const TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 20,
                                  ),
                                ),
                                const Text(
                                  "€",
                                  style: TextStyle(
                                    color: Color.fromRGBO(255, 73, 8, 1),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(children: [
                      Flexible(child: Text(product.description))
                    ],),
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
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                              Text(
                                "a: 2, b: 5, c: 7",
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 14,
                                ),
                                softWrap: true,
                                overflow: TextOverflow.visible,
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Pass a callback to update selectedAmount
                            ProductAmountChoice(
                              onAmountChanged: (int amount) {
                                setState(() {
                                  selectedAmount = amount;
                                });
                              },
                            ),
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
                              shadowColor: Colors.transparent,
                              side: BorderSide(
                                  color: Color.fromRGBO(255, 73, 8, 1), width: 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 12),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the BottomSheet
                              Provider.of<CartProvider>(context, listen: false)
                                  .addItem(
                                Item(
                                  product.id,
                                  product.img,
                                  product.title,
                                  product.price,
                                ),
                              );


                              int itemExistingAMount = Provider.of<CartProvider>(context, listen: false)
                                  .retrieveItemAmount(product.id);

                              Provider.of<CartProvider>(context, listen: false)
                                  .changeAmount(product.id, itemExistingAMount + selectedAmount);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("${product.title} added to cart" )),
                              );
                            },
                            child: const Text(
                              "Add to Cart",
                              style: TextStyle(
                                  color: Color.fromRGBO(255, 73, 8, 1),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(width: 10), // Space between buttons
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(255, 73, 8, 1),
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 35, vertical: 12),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the BottomSheet
                              Provider.of<CartProvider>(context, listen: false)
                                  .addItem(
                                Item(
                                  product.id,
                                  product.img,
                                  product.title,
                                  product.price,
                                ),
                              );
                              int itemExistingAMount = Provider.of<CartProvider>(context, listen: false)
                                  .retrieveItemAmount(product.id);

                              Provider.of<CartProvider>(context, listen: false)
                                  .changeAmount(product.id, itemExistingAMount + selectedAmount);

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("${product.title} added to cart")),
                              );
                            },
                            child: Text(
                              "Buy Now",
                              style: TextStyle(
                                  color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(height: 100)
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      );
    },
  );
}
