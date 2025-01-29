import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cart.dart';
import '../cart_provider.dart';
import '../models/item.dart';
import 'order_overview_modal_sheet_item.dart';


class OrderOverviewModalSheetItemList extends StatelessWidget {
  final List<Item> items;
  const OrderOverviewModalSheetItemList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: items.isNotEmpty ? size.height / 3 : size.height/2,
      width: size.width,
      child: items.isNotEmpty
          ? ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final Item item = items[index];
          return OrderOverviewModalSheetItem(item: item);
        },
      )
          : const Center(
        child: Text("Visit store to add products",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color.fromRGBO(0, 0, 0, 0.15),
              fontWeight: FontWeight.w500,
              fontSize: 35,
            )),
      ),
    );
  }
}


class OrderOverviewItemsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, cartProvider, child) {
        Size size = MediaQuery.of(context).size;
        // Get the list of items from the cart
        List<Item> items = cartProvider.items;

        // If no items in the cart, display a message
        if (items.isEmpty) {
          return Center(child: Text('No items in the cart.'));
        }

        return SizedBox(
          height: items.isNotEmpty ? size.height / 3 : size.height/2,
          width: size.width,
          child: items.isNotEmpty
              ? ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final Item item = items[index];
              return OrderOverviewModalSheetItem(item: item);
            },
          )
              : const Center(
            child: Text("Visit store to add products",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  fontWeight: FontWeight.w500,
                  fontSize: 35,
                )),
          ),
        );
      },
    );
  }
}