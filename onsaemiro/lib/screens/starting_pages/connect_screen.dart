import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'access_screen.dart';
import 'smsauth_screen.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({Key? key}) : super(key: key);

  @override
  _ConnectScreenState createState() => _ConnectScreenState();
}

// icon, onPressed 추가
_connectbutton(text, onPressed) {
  return Container(
    width: 275,
    height: 60,
    margin: EdgeInsets.only(bottom: 20),
    child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            primary: Colors.black,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.green, width: 1.5),
                borderRadius: BorderRadius.circular(30))),
        child: Text(text)),
  );
}

class _ConnectScreenState extends State<ConnectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.to(AccessScreen());
                    },
                    icon: Image.asset('assets/Vector.png'),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 220,
                height: 160,
                child: Image.asset('assets/logo.png'),
              ),
              SizedBox(
                height: 50,
              ),
              _connectbutton('네이버로 연결하dawdaw기', () {}),
              _connectbutton('페이스북 연결하기', () {}),
              _connectbutton('카카오 연결하기', () {}),
              _connectbutton('전화번호로 빠른가입', () {
                Get.to(SmsAuthScreen());
              }),
            ],
          )),
    );
  }
}
