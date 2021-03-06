import 'package:flutter/material.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';
import 'package:onsaemiro/screens/things_pages/things_information.dart';

class Product {
  late String docId;
  late String name;
  late String image;
  late int price;
  late int num;
  late String Info;

  Product(
      {required this.docId,
      required this.name,
      required this.image,
      required this.price,
      required this.num,
      required this.Info});
  Product.fromJson(Map<String, dynamic> json)
      : docId = json['docId'],
        name = json['name'],
        image = json['image'],
        price = json['price'],
        num = json['num'],
        Info = json['Info'];

  Map<String, dynamic> toJson() => {
        'docId': docId,
        'name': name,
        'image': image,
        'price': price,
        'num': num,
        'Info': Info
      };
}
