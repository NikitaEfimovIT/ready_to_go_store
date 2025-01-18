import 'package:flutter/material.dart';

class ProductAmountChoice extends StatefulWidget {
  @override
  _ProductAmountChoiceState createState() => _ProductAmountChoiceState();
}

class _ProductAmountChoiceState extends State<ProductAmountChoice> {
  int _productCount = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.remove),
          onPressed: () {
            setState(() {
              if (_productCount > 1) _productCount--;
            });
          },
        ),
        Text(
          '$_productCount',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color.fromRGBO(225, 87, 7, 1)),
        ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            setState(() {
              if (_productCount < 10) _productCount++;
            });
          },
        ),
      ],
    );
  }
}
