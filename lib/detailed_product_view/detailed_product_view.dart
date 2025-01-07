import 'package:flutter/material.dart';

class ProductDetailView extends StatelessWidget {
  final String productName;

  const ProductDetailView({required this.productName, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              'Details of $productName',
            ),
            ElevatedButton(
              child: const Text('Close'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}

void showProductDetail(BuildContext context, String productName) {
  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      return ProductDetailView(productName: productName);
    },
  );
}
