import 'package:flutter/material.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';
import 'package:onsaemiro/screens/things_pages/things_information.dart';

class Product {
  late String name;
  late String image;
  late int price;
  late int num;

  Product({
    required this.name,
    required this.image,
    required this.price,
    required this.num,
  });
  Product.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        price = json['price'],
        num = json['num'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'image': image, 'price': price, 'num': num};
}
