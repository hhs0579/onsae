import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class passwordDuplicationPage extends StatefulWidget {
  const passwordDuplicationPage({Key? key}) : super(key: key);

  @override
  _passwordDuplicationPageState createState() =>
      _passwordDuplicationPageState();
}

class _passwordDuplicationPageState extends State<passwordDuplicationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          shape: Border(bottom: BorderSide(color: Colors.green)),
          leading: Image.asset('assets/Vector.png'),
          actions: [Image.asset('assets/장바구니.png')],
          backgroundColor: Colors.white,
          title: Text(
            '비밀번호',
            style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: Color(0xff595959)),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            padding: EdgeInsets.fromLTRB(0, 90, 0, 0),
            child: TextField(
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 11, horizontal: 20),
                  hintText: '현재 비밀번호',
                  hintStyle: TextStyle(fontSize: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green))),
            ),
          ),
          Row(
            children: [
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 6, 0, 0),
                  child: Text('비밀번호 중복!')),
            ],
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 28, 0, 10),
            child: TextField(
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 11, horizontal: 20),
                  hintText: '새 비밀번호 (8-16자 이내)',
                  hintStyle: TextStyle(fontSize: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green))),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child: TextField(
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 11, horizontal: 20),
                  hintText: '새 비밀번호 확인',
                  hintStyle: TextStyle(fontSize: 15),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green))),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(52, 102, 52, 27),
            child: Column(
              children: [
                Text(
                  '주기적인 비밀번호 변경은 개인정보를 안전하게',
                  style: TextStyle(color: Color(0xff595959), fontSize: 13),
                ),
                Text(
                  '보호하고 개인정보 도용을 예방할 수 있습니다.',
                  style: TextStyle(color: Color(0xff595959), fontSize: 13),
                ),
              ],
            ),
          ),
          Container(
            width: 330,
            height: 60,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                side: BorderSide(width: 2.0, color: Colors.green),
              ),
              child: Text(
                '비밀번호 변경완료',
                style: TextStyle(color: Color(0xff595959), fontSize: 13),
              ),
              onPressed: () {},
            ),
          ),
        ])));
  }
}
