import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'Product.dart';

class AppState extends ChangeNotifier {
  //TODO User state
  //TODO Order state

  late final Future<List<Product>> _products;

  Future<List<Product>> get products => _products;

  Future<List<Product>> getProductsFromTheServer() async {
    final response = await http
        .get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return body["products"].map<Product>((e)=>Product.fromJson(e)).toList();
    } else {

      throw Exception('Failed to load products');
    }
  }

  AppState(){
    _products = getProductsFromTheServer();
  }
}
