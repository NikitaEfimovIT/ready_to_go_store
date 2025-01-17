import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ready_to_go_store/cart_provider.dart';

import '../cart.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});


  @override
  Widget build(BuildContext context) {

    return Consumer<CartProvider>(

        builder: (BuildContext context, CartProvider value, Widget? child) {

        return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SvgPicture.asset("lib/assets/logo.svg",height: 37,
          //   width: 180, ),
          Image.asset("lib/assets/logo.png", width: 200, height: 37),
          Row(
            children: [
              IconButton(
                icon: value.totalAmount>0 ? Badge.count(
                  count: value.totalAmount.toInt(),
                  child: const Icon(Icons.shopping_cart),
                ) : const Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cart()),
                  );
                },
              ),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset("lib/assets/profile.png",
                      width: 30, height: 30))
            ],
          )
        ]);
      });
  }
}
