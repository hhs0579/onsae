import 'package:flutter/material.dart';

class JoinPage extends StatefulWidget {
  const JoinPage({Key? key}) : super(key: key);

  @override
  _JoinPageState createState() => _JoinPageState();
}

class _JoinPageState extends State<JoinPage> {
  final nameController = TextEditingController();
  final nicknameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 120),
                Column(
                  children: [
                    Text('이름을 입력해주세요.', style: TextStyle(fontSize: 15)),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 180,
                          child: TextField(
                            controller: nameController,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, height: 1.5),
                            cursorColor: Color(0xff6CCD6C),
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 5),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff6CCD6C), width: 2)),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff6CCD6C), width: 2))),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 55,
                          height: 30,
                          child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  primary: Colors.white,
                                  backgroundColor: Color(0xff6CCD6C),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              child: Text(
                                '확인',
                                style: TextStyle(fontSize: 11),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )),
    ));
  }
}
