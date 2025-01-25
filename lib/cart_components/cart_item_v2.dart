import 'package:flutter/material.dart';

import '../models/item.dart';

class CartItem extends StatelessWidget {
  final void Function(String id, num newAmount) changeAmount;
  final Item item;

  const CartItem({super.key, required this.changeAmount, required this.item});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 108,
      width: 340,
      child: Card(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Padding( padding: const EdgeInsets.only(left: 20, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(item.productIcon, height: 64, width: 64, fit: BoxFit.fill,),
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
    ));
  }
}
