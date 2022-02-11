import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'phone_join_pages/smsauth_screen.dart';

class ConnectScreen extends StatefulWidget {
  const ConnectScreen({Key? key}) : super(key: key);

  @override
  _ConnectScreenState createState() => _ConnectScreenState();
}

// icon, onPressed 추가
_connectbutton(String text, String image, onPressed, context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 60,
    margin: EdgeInsets.only(bottom: 20),
    child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            primary: Colors.black,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Color(0xff6CCD6C), width: 1.5),
                borderRadius: BorderRadius.circular(30))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
                radius: 17,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage(image)),
            SizedBox(width: 10),
            Text(text),
          ],
        )),
  );
}

class _ConnectScreenState extends State<ConnectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 40),
          margin: EdgeInsets.only(top: 40),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Image.asset('assets/logo.png'),
              ),
              SizedBox(
                height: 50,
              ),
              _connectbutton('네이버로 연결하기', 'assets/naver.png', () {}, context),
              _connectbutton(
                  '페이스북 연결하기', 'assets/facebook.png', () {}, context),
              _connectbutton('카카오톡 연결하기', 'assets/kakao.png', () {}, context),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                margin: EdgeInsets.only(bottom: 20),
                child: TextButton(
                    onPressed: () {
                      Get.to(() => SmsAuthScreen());
                    },
                    style: TextButton.styleFrom(
                        primary: Colors.black,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color(0xff6CCD6C), width: 1.5),
                            borderRadius: BorderRadius.circular(30))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Image(image: AssetImage('assets/phone.png')),
                        SizedBox(width: 10),
                        Text('전화번호로 로그인하기'),
                      ],
                    )),
              )
            ],
          )),
    );
  }
}
