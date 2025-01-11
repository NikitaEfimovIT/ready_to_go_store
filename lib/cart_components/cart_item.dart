import 'package:flutter/material.dart';

import '../models/item.dart';

class CartItem extends StatelessWidget {
  final void Function(String id, num newAmount) changeAmount;
  final Item item;

  const CartItem({super.key, required this.changeAmount, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: [BoxShadow(
            blurRadius: 10,
            blurStyle: BlurStyle.normal,
            color: Color.fromRGBO(0, 23, 37, 0.05),
            offset: Offset(0, 4),
            spreadRadius: 0,
          )]
      ),
      height: 100,
      width: 356,
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(item.productIcon),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.productName),
                const Text("Store in:"),
                const Text("Not supported yet")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                              fontSize: 16),"${item.productPrice.price} "),
                      Text(
                          style: const TextStyle(
                              color: Color.fromARGB(255, 255, 73, 8),
                              fontSize: 16),
                          item.productPrice.currency.name)
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                        onPressed: () =>
                            changeAmount(item.productId, item.amount - 1),
                        child: const Text("-")),
                    Text(
                        style: const TextStyle(
                            color: Color.fromARGB(255, 255, 73, 8),
                            fontSize: 22),
                        '${item.amount}'),
                    TextButton(
                        onPressed: () =>
                            changeAmount(item.productId, item.amount + 1),
                        child: const Text("+")),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
