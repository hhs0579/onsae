import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/screens/starting_pages/connect_screen.dart';

class TypeScreen extends StatefulWidget {
  const TypeScreen({Key? key}) : super(key: key);

  @override
  _TypeScreenState createState() => _TypeScreenState();
}

class _TypeScreenState extends State<TypeScreen> {
  String usertype = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(height: 80),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextButton(
                onPressed: () {
                  usertype = 'business';
                  Get.to(() => ConnectScreen(), arguments: usertype);
                },
                child: Text("사업자 로그인",
                    style: TextStyle(
                      color: Colors.white,
                    )),
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffA2BF62),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 45,
              margin: EdgeInsets.symmetric(horizontal: 40),
              child: TextButton(
                  onPressed: () {
                    usertype = 'user';
                    Get.to(() => ConnectScreen(), arguments: usertype);
                  },
                  child: Text("사용자 로그인",
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffA2BF62),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
