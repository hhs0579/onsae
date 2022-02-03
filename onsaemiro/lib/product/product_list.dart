import 'package:flutter/material.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';
import 'package:onsaemiro/screens/things_pages/things_information.dart';

class Product {
  late String name;
  late String image_url;
  late int price;
  late int num;

  Product({
    required this.name,
    required this.image_url,
    required this.price,
    required this.num,
  });
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      image_url: json['image_url'],
      price: json['price'],
      num: json['num'],
    );
  }
}
