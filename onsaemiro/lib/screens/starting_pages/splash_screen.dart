import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:onsaemiro/data/appdata.dart';
import 'package:onsaemiro/screens/main_pages/Root.dart';
import 'package:onsaemiro/screens/main_pages/controller/auth_controller.dart';
import 'package:onsaemiro/screens/main_pages/controller/database_controller.dart';
import 'package:onsaemiro/screens/main_pages/controller/local_storage_controller.dart';

import 'package:onsaemiro/screens/starting_pages/type_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      _checkDatabase();
    });
  }

  _checkDatabase() {
    _checkLocalInfo();
  }

  void _checkLocalInfo() async {
    String? userEmail = await localStorageController.getUserEmail();
    if (userEmail == null) {
      Get.off(() => TypeScreen());
    } else {
      if (userEmail == '') {
        Get.off(() => TypeScreen());
      } else {
        AppData appData = Get.find();
        appData.userEmail = userEmail;
        await databaseController.fetchMyInfo(userEmail);
        String? pushToken = await authController.getToken();
        if (pushToken != null) {
          databaseController.updatePushToken(
            email: userEmail,
            pushToken: pushToken,
          );
        }
        Get.off(() => Root());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
            child: SizedBox(
          width: 450,
          height: 250,
          child: Image.asset('assets/logo.png'),
        )));
  }
}
