import 'package:ready_to_go_store/models/price.dart';

import 'enums/currency.dart';

class Product {
  final String id;
  final String img;
  final String title;
  final String description;
  final Price price;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product(
      {required this.id,
      required this.img,
      required this.title,
      required this.description,
      required this.price,
      required this.createdAt,
      required this.updatedAt});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      title: json['title'],
      description: json['description'],
      price: Price(Currency.euro, json['price']),
      img: json['images'][0],
      createdAt: DateTime.parse(json["meta"]['createdAt']),
      updatedAt: DateTime.parse(json["meta"]['updatedAt']),
    );
  }
}
