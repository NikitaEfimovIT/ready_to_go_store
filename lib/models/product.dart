import 'package:ready_to_go_store/models/price.dart';

import 'enums/currency.dart';

class Product {
  final String id;
  final String img;
  final String title;
  final String description;
  final Price price;
  final String category;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product(
      {required this.id,
      required this.img,
      required this.title,
      required this.description,
      required this.price,
        required this.category,
      required this.createdAt,
      required this.updatedAt});

  factory Product.fromJson(Map<String, dynamic> json) {
    print(json);
    return Product(
      id: json['id'].toString(),
      title: json['name'],
      description: json['description'],
      // price: Price(Currency.euro, json['price']),
      price: Price(Currency.euro, 0),
      // category: json["category"],
      category: "",
      // img: json['images'][0],
      img: "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/480px-No_image_available.svg.png",
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
