import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/screens/main_pages/my_info.dart';

class nickNamePage extends StatefulWidget {
  nickNamePage({Key? key}) : super(key: key);

  @override
  State<nickNamePage> createState() => _nickNamePageState();
}

class _nickNamePageState extends State<nickNamePage> {
  var overlap = false;
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
                        child: TextFormField(
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 40,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                overlap = !overlap;
                              });
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
                      _connectbutton('동의하고 계속 진행합니다.', () {
                        Get.to(MyInfoPage());
                      })
                    ])))));
  }
}
