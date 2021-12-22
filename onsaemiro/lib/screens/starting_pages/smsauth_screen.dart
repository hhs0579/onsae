import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'agree_page.dart';
import 'connect_screen.dart';

class SmsAuthScreen extends StatefulWidget {
  const SmsAuthScreen({Key? key}) : super(key: key);

  @override
  _SmsAuthScreenState createState() => _SmsAuthScreenState();
}

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

class _SmsAuthScreenState extends State<SmsAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
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
                Container(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black26, width: 1.0)),
                      focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.green, width: 1.5)),
                    ),
                  ),
                ),
                SizedBox(height: 250),
                _connectbutton('동의하고 계속 진행합니다.', () {
                  Get.to(agreePage());
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
