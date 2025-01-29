import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:ready_to_go_store/home_page_components/filters/filters_component.dart';
import 'package:ready_to_go_store/home_page_components/search_bar/search_bar_component.dart';
import 'package:ready_to_go_store/models/Product.dart';
import 'package:ready_to_go_store/models/app_state.dart';
import 'package:ready_to_go_store/regular_top_bar/top_bar.dart';

import 'home_page_components/product_card/product_card.dart';
import 'home_page_components/product_card/product_detailed_modal_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(
      builder: (context, state, child) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 200,
          backgroundColor: Colors.white,
          title: const Padding(
              padding: EdgeInsets.only(left: 2, right: 2),
              child: Column(children: [TopBar(), SearchBarComponent(), FilterComponents()])),
          scrolledUnderElevation: 0,
        ),
        body: RefreshIndicator(
          onRefresh: () async => state.pagingController.refresh(),
          child: PagedGridView<int, Product>(
            cacheExtent: 9999,
            pagingController: state.pagingController,
            builderDelegate: PagedChildBuilderDelegate<Product>(
              animateTransitions: true,
              itemBuilder: (context, product, index) => GestureDetector(
                onTap: () {
                  showProductModal(context, product); // Call the modal function
                },
                child: ProductCard(
                  title: product.title,
                  imageUrl: product.img,
                  price: product.price,
                  description: 'test-description',
                  onAddToCart: () {},
                ),
              ),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.7,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildProductsList(List<Product> posts) {
    return GridView.builder(
      cacheExtent: 9999,
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
