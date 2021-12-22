import 'dart:html';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/screens/starting_pages/login_page.dart';

import 'join_page.dart';

class findPassword extends StatelessWidget {
  const findPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('비밀번호를 재설정합니다'),
            Container(
                padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                height: 400,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '이메일을 적어주세요',
                      ),
                    ),
                    Text('''가입 시 사용했던 이메일 주소를 입력해주시면
비밀번호 재설정 링크를 보내드립니다.'''),
                    Container(
                      width: 100,
                      height: 40,
                      child: TextButton(
                          onPressed: () {
                            Get.to(loginpage());
                          },
                          style: TextButton.styleFrom(
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.grey, width: 1.5),
                                  borderRadius: BorderRadius.circular(20))),
                          child: Text("재설정 링크 전송")),
                    ),
                    TextButton(onPressed: () {}, child: Text('뒤로가기'))
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
