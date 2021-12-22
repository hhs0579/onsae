import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'connect_screen.dart';

class SmsAuthScreen extends StatefulWidget {
  const SmsAuthScreen({Key? key}) : super(key: key);

  @override
  _SmsAuthScreenState createState() => _SmsAuthScreenState();
}

class _SmsAuthScreenState extends State<SmsAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.to(ConnectScreen());
                    },
                    icon: Image.asset('assets/Vector.png'),
                  ),
                ],
              ),
              Container(
                width: 240,
                height: 25,
                margin: EdgeInsets.only(top: 80, bottom: 40),
                child: Text('휴대전화 번호를 입력하세요.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
