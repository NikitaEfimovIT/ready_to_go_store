import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../cart.dart';
import '../cart_provider.dart';
import 'order_overview_modal_sheet_item_list.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<StatefulWidget> createState() => _BottomModalOrderOverviewState();
}

class _BottomModalOrderOverviewState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
        builder: (BuildContext context, CartProvider order, Widget? child)
    {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order Overview",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.close,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            OrderOverviewModalSheetItemList(
              items: CartProvider().items,
            ),
          ],
        ),
      );
    }
    );
  }
}
