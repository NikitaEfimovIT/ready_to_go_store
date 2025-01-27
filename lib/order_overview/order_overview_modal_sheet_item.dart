import 'package:flutter/material.dart';

import '../models/item.dart';

class OrderOverviewModalSheetItem extends StatelessWidget {
  final Item item;
  const OrderOverviewModalSheetItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10),
        child:
        Container(
          child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 108,
            maxWidth: MediaQuery.sizeOf(context).width,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start, // Align to the start to avoid unnecessary space
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Product Image
              Image.asset(
                "lib/assets/loading.gif",
                height: 64,
                width: 64,
              ),
              // Expanded widget to take as much space as possible
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12), // Adjust this padding to control the space
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product name
                      Text(
                        item.productName,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // Product additional details
                      const Text(
                        "Alpha: 1 | Betta: 3 | Gamma: 3",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      // Product price and currency
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            style: const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 14),
                            "${item.productPrice.price} ",
                          ),
                          Text(
                            style: const TextStyle(
                                color: Color.fromARGB(255, 255, 73, 8),
                                fontSize: 14),
                            item.productPrice.currency.name,
                          ),
                          const Text(
                            style: TextStyle(
                                fontWeight: FontWeight.w200, fontSize: 14),
                            "per unit",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        )

    );


  }
}
