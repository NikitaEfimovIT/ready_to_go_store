import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0, right: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // SvgPicture.asset("lib/assets/logo.svg",height: 37,
          //   width: 180, ),
          Image.asset("lib/assets/logo.png", width: 180, height: 37),
          Row(
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Image.asset("lib/assets/cart.png",
                      width: 30, height: 30)),
              IconButton(
                  onPressed: () {},
                  icon: Image.asset("lib/assets/profile.png",
                      width: 30, height: 30))
            ],
          )
        ],
      ),
    );
  }
}
