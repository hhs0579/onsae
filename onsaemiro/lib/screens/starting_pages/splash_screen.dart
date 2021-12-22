import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:onsaemiro/screens/starting_pages/login_page.dart';
import 'dart:io';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Get.to(loginpage());
    });
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
