import 'package:flutter/material.dart';

import '../cart.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});


  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SvgPicture.asset("lib/assets/logo.svg",height: 37,
          //   width: 180, ),
          Image.asset("lib/assets/logo.png", width: 200, height: 37),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CartScreen()),
                  );
                },
              ),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset("lib/assets/profile.png",
                      width: 30, height: 30))
            ],
          )
        ],
      );
  }
}
