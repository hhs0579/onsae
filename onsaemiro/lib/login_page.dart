import 'package:flutter/material.dart';
import 'package:onsaemiro/screens/starting_pages/access_screen.dart';
import 'package:get/get.dart';

class loginpage extends StatelessWidget {
  const loginpage({Key? key}) : super(key: key);

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
            Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                height: 300,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '비밀번호',
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                            onPressed: () {
                              Visibility(
                                  child: Column(
                                children: [
                                  TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: '비밀번호 확인',
                                    ),
                                  ),
                                ],
                              ));
                            },
                            child: Text('회원가입')),
                        TextButton(
                            onPressed: () {
                              Get.to(AccessScreen());
                            },
                            child: Text('비밀번호 찾기')),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
