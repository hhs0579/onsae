import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/data/appdata.dart';
import 'package:onsaemiro/screens/main_pages/Root.dart';
import 'package:onsaemiro/screens/main_pages/controller/controller.dart';
import 'package:onsaemiro/screens/main_pages/myinfo_pages/my_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/starting_pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          return AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: _splashLoadingWidget(snapshot));
        });
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      print('error occur while loading');
      return Text('error occur');
    } else if (snapshot.hasData) {
      Get.put(AppData());
      return OnsaemiroApp();
    } else {
      Get.put(AppData());
      return OnsaemiroApp();
    }
  }
}

class OnsaemiroApp extends StatelessWidget {
  OnsaemiroApp({Key? key}) : super(key: key);
  final routes = <String, WidgetBuilder>{};

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '온새미로',
      initialBinding: BindingsBuilder(() {
        Get.put(RootContorller());
      }),
      home: MyInfoPage(),
      routes: routes,
    );
  }
}
