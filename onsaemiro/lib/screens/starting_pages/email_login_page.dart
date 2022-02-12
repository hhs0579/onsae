import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/screens/starting_pages/email_join_page.dart';
import 'package:onsaemiro/screens/starting_pages/find_password.dart';

class Emailloginpage extends StatefulWidget {
  const Emailloginpage({Key? key}) : super(key: key);

  @override
  State<Emailloginpage> createState() => _EmailloginpageState();
}

class _EmailloginpageState extends State<Emailloginpage> {
  String userType = Get.arguments;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                    height: 350,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            hintText: '이메일을 적어주세요',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              hintText: '비밀번호',
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Get.to(() => EmailjoinPage(),
                                      arguments: userType);
                                },
                                child: Text('회원가입',
                                    style: TextStyle(color: Colors.black54))),
                            TextButton(
                                onPressed: () {
                                  Get.to(findPassword());
                                },
                                child: Text('비밀번호 찾기',
                                    style: TextStyle(color: Colors.black54))),
                          ],
                        ),
                        SizedBox(height: 40),
                        Container(
                          width: 100,
                          height: 40,
                          child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.grey, width: 1.5),
                                      borderRadius: BorderRadius.circular(20))),
                              child: Text("로그인")),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
