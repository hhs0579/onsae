import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/classes/toast_message.dart';
import 'package:onsaemiro/repo/join_validation.dart';
import 'package:onsaemiro/screens/main_pages/Root.dart';

class nickNamePage extends StatefulWidget {
  const nickNamePage({Key? key}) : super(key: key);

  @override
  State<nickNamePage> createState() => _nickNamePageState();
}

class _nickNamePageState extends State<nickNamePage> {
  String nickname = '';

  final nickNameController = TextEditingController();

  var overlap = true;

  isnickName(String nickname) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('nickname', isEqualTo: nickname)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
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
                    child: Column(children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.back();
                            },
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
                          top: 20,
                          bottom: 20,
                        ),
                        child: Container(
                          width: 150,
                          height: 40,
                          child: TextField(
                            controller: nickNameController,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 5),
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xff6CCD6C), width: 1.5))),
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 40,
                        child: TextButton(
                            onPressed: () {
                              if (vaildationname(nickNameController.text) ==
                                  null) {
                                if (isnickName(nickNameController.text)) {
                                  toastMessage('중복된 닉네임 입니다.');
                                } else {
                                  toastMessage('사용 가능한 닉네임 입니다.');
                                  setState(() {
                                    overlap = !overlap;
                                    nickname = nickNameController.text;
                                  });
                                }
                              }
                            },
                            style: TextButton.styleFrom(
                                primary: Colors.black,
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: Colors.green, width: 1.5),
                                    borderRadius: BorderRadius.circular(20))),
                            child: overlap
                                ? Text("중복확인")
                                : Text('중복확인',
                                    style: TextStyle(color: Colors.grey))),
                      ),
                      SizedBox(height: 250),
                      _connectbutton('동의하고 계속 진행합니다.', () {})
                    ])))));
  }
}
