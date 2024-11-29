import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ready_to_go_store/models/Product.dart';
import 'package:ready_to_go_store/models/app_state.dart';
import 'package:ready_to_go_store/regular_top_bar/top_bar.dart';

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
                return const CircularProgressIndicator();
              } else if (snapshot.hasData) {
                final products = snapshot.data!;
                return buildProductsList(products);
              } else {
                print(snapshot);
                return const Text("No data available");
              }
            },
          ),
        )
    );
  }

  Widget buildProductsList(List<Product> posts) {
    // ListView Builder to show data in a list
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final product = posts[index];
        return Container(
          color: Colors.grey.shade300,
          margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          height: 100,
          width: double.maxFinite,
          child: Row(
            children: [
              Expanded(flex: 1, child: Image.network(product.img)),
              SizedBox(width: 10),
              Expanded(flex: 3, child: Text(product.title)),
            ],
          ),
        );
      },
    );
  }
}
