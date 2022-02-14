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
  AppData appData = Get.find();
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
    String? userPhone = await localStorageController.getUserPhone();
    String? userType = await localStorageController.getUserType();
    if (userEmail == null || userPhone == null) {
      Get.off(() => TypeScreen());
    } else {
      if (userEmail == '' || userPhone == '') {
        Get.off(() => TypeScreen());
      } else {
        if (userEmail != '') {
          appData.userEmail = userEmail;
          appData.userType = userType!;
          if (appData.userType == 'user') {
            await databaseController.fetchMyInfoToEmailUser(userEmail);
            String? pushToken = await authController.getToken();
            if (pushToken != null) {
              databaseController.updatePushTokenToEmail(
                email: userEmail,
                pushToken: pushToken,
              );
            }
          } else if (appData.userType == 'business') {
            await databaseController.fetchMyInfoToEmailBusiness(userEmail);
            String? pushToken = await authController.getToken();
            if (pushToken != null) {
              databaseController.updatePushTokenToEmail(
                email: userEmail,
                pushToken: pushToken,
              );
            }
          }
          Get.off(() => Root());
        } else if (userPhone != '') {
          if (appData.userType == 'user') {
            appData.userPhone = userPhone;
            await databaseController.fetchMyInfoToPhoneUser(userPhone);
            String? pushToken = await authController.getToken();
            if (pushToken != null) {
              databaseController.updatePushTokenToPhone(
                  phone: userPhone, pushToken: pushToken);
            }
          } else if (appData.userType == 'business') {
            appData.userPhone = userPhone;
            await databaseController.fetchMyInfoToPhoneBusiness(userPhone);
            String? pushToken = await authController.getToken();
            if (pushToken != null) {
              databaseController.updatePushTokenToPhone(
                  phone: userPhone, pushToken: pushToken);
            }
          }
          Get.off(() => Root());
        }
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
