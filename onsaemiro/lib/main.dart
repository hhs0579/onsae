import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:onsaemiro/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'controller/in_app_purchase_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final routes = <String, WidgetBuilder>{};

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '온새미로',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      home: LoginPage(),
      routes: routes,
    );
  }
}
