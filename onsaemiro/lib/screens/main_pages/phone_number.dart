import 'package:flutter/material.dart';

class phoneNumberPage extends StatefulWidget {
  const phoneNumberPage({Key? key}) : super(key: key);

  @override
  _phoneNumberPageState createState() => _phoneNumberPageState();
}

class _phoneNumberPageState extends State<phoneNumberPage> {
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
          '휴대폰 번호',
          style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Color(0xff595959)),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(68, 90, 67, 10),
              child: TextField(
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 11, horizontal: 54),
                    hintText: '휴대폰 번호 (숫자만 입력)',
                    hintStyle: TextStyle(fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.green))),
              ),
            ),
            Container(
              width: 110,
              height: 41,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.5)),
                  side: BorderSide(width: 2.0, color: Colors.green),
                ),
                child: Text(
                  '인증번호',
                  style: TextStyle(color: Color(0xff595959), fontSize: 13),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(91, 20, 92, 10),
              child: TextField(
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 11, horizontal: 68),
                    hintText: '인증번호 입력',
                    hintStyle: TextStyle(fontSize: 15),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.green),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.green))),
              ),
            ),
            Container(
              width: 110,
              height: 41,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(26.5)),
                  side: BorderSide(width: 2.0, color: Colors.green),
                ),
                child: Text(
                  '확인',
                  style: TextStyle(color: Color(0xff595959), fontSize: 13),
                ),
                onPressed: () {},
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(52, 90, 52, 17),
              child: Column(
                children: [
                  Text(
                    '아이디, 비밀번호 찾기 등 본인확인이',
                    style: TextStyle(color: Color(0xff595959), fontSize: 13),
                  ),
                  Text(
                    '필요한 상황에서 사용할 휴대폰 번호입니다.',
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
                  '휴대폰번호 변경완료',
                  style: TextStyle(color: Color(0xff595959), fontSize: 13),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
