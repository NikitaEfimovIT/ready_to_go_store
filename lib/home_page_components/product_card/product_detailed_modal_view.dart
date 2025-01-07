import 'package:flutter/material.dart';
import '../../models/Product.dart'; // Import your Product model if needed

void showProductModal(BuildContext context, Product product) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allows the modal to take more space
    builder: (BuildContext context) {
      return FractionallySizedBox(
        heightFactor: 0.8, // Make the modal take 80% of the screen height
        child: SingleChildScrollView( // Ensures content is scrollable if it exceeds available space
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  product.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    product.img,
                    fit: BoxFit.cover, // Ensures the image scales within its bounds
                    width: double.infinity, // Makes the image take the modal's width
                    height: 200, // Sets a fixed height for the image
                  ),
                ),
                const SizedBox(height: 10),
                 ElevatedButton(
                   onPressed: () {  },
                   child: Text("Add to Cart"),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
