import 'dart:html';

import 'package:flutter/material.dart';

class nickNamePage extends StatelessWidget {
  const nickNamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/Vector.png'),
                  ),
                  SizedBox(
                    width: 95,
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Text('온새미로에서 사용할 닉네임을 설정해주세요.'),
              Padding(
                padding: const EdgeInsets.only(
                    left: 100, top: 20, bottom: 20, right: 100),
                child: TextFormField(),
              ),
            ])));
  }
}
