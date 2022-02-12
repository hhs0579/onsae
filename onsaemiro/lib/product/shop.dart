import 'package:flutter/material.dart';
import 'package:onsaemiro/product/product_list.dart';

class Shop {
  late String name;
  late String image;

  Shop({
    required String this.name,
    required String this.image,
  });
  Shop.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
      };
}
