import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'Product.dart';

class AppState extends ChangeNotifier {
  //TODO User state
  //TODO Order state

  late final Future<List<Product>> _products;

  Future<List<Product>> get products => _products;

  static const _pageSize = 20;

  final PagingController<int, Product> pagingController = PagingController(firstPageKey: 0);


  Future<void> _fetchPage(int pageKey) async {
    try {
      print("TRYRYRYRRYRYR");
      final newItems = await getProductsFromTheServer(pageKey);
      final isLastPage = newItems.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newItems);
      } else {
        final nextPageKey = pageKey + newItems.length;
        pagingController.appendPage(newItems, nextPageKey);
      }
    } catch (error) {
      print("error"+error.toString());
      pagingController.error = error;
    }
  }

  Future<List<Product>> getProductsFromTheServer(num pageNum) async {
    print("getProd"+pageNum.toString());
    final response = await http
        .get(Uri.parse('https://dummyjson.com/products?skip=${pageNum}&limit=${_pageSize}'));

    if (response.statusCode == 200) {
      var body = json.decode(response.body);

      return body["products"].map<Product>((e)=>Product.fromJson(e)).toList();
    } else {

      throw Exception('Failed to load products');
    }
  }


  AppState(){
    // _products = getProductsFromTheServer(1);
    pagingController.addPageRequestListener((pageKey) {
      _fetchPage(pageKey);
    });
  }
}
