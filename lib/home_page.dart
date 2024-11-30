import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ready_to_go_store/models/Product.dart';
import 'package:ready_to_go_store/models/app_state.dart';
import 'package:ready_to_go_store/regular_top_bar/top_bar.dart';

import 'home_page_components/product_card/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (context, state, child) =>
        Scaffold(
          appBar: AppBar(
            title: const TopBar(),
          ),
          body: FutureBuilder<List<Product>>(
            future: state.products,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                final products = snapshot.data!;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // "Deals for You" Text
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Deals for You",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    // Product Grid
                    Expanded(
                      child: buildProductsList(products),
                    ),
                  ],
                );
              } else {
                print(snapshot);
                return const Center(child: Text("No data available"));
              }
            },
          ),
        )
    );
  }

  Widget buildProductsList(List<Product> posts) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of items per row
        crossAxisSpacing: 5, // Horizontal spacing between items
        mainAxisSpacing: 0, // Vertical spacing between items
      ),
      itemCount: posts.length,
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, index) {
        final product = posts[index];
        return ProductCard(
          title: product.title,
          imageUrl: product.img,
          price: product.price,
          description: 'test-description',
          onAddToCart: () {},
        );
      },
    );
  }
}
