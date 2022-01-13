import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:onsaemiro/screens/main_pages/controller/controller.dart';
import 'package:onsaemiro/screens/starting_pages/login_page.dart';

import 'screens/starting_pages/splash_screen.dart';

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
      initialBinding: BindingsBuilder(() {
        Get.put(RootContorller());
      }),
      home: SplashScreen(),
      routes: routes,
    );
  }
}
