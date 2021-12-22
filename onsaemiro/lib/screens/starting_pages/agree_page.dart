import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/screens/starting_pages/nick_name-page.dart';

class agreePage extends StatefulWidget {
  agreePage({Key? key}) : super(key: key);

  @override
  State<agreePage> createState() => _agreePageState();
}

class _agreePageState extends State<agreePage> {
  bool toggle = false;
  var agree1 = false;

  var agree2 = false;

  var agree3 = false;
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
        body: Container(
      margin: EdgeInsets.only(top: 40),
      child: Column(
        children: [
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
            height: 50,
          ),
          Container(
            width: 275,
            height: 330,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.green, width: 2),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 20),
                  child: Text('모두 확인,동의합니다.', style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text('''  원활한 서비스 이용을 위해
필수 항목 동의가 필요합니다.''', style: TextStyle(fontSize: 13)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('서비스 이용약관 동의 (필수)'),
                    IconButton(
                      icon: agree1
                          ? Icon(Icons.expand_more, color: Colors.lightGreen)
                          : Icon(Icons.expand_more, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          agree1 = !agree1;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('개인정보 수집 동의 (필수)'),
                    IconButton(
                      icon: agree2
                          ? Icon(Icons.expand_more, color: Colors.lightGreen)
                          : Icon(Icons.expand_more, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          agree2 = !agree2;
                        });
                      },
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('개인정보 제3자 제공 동의 (필수)'),
                    IconButton(
                      icon: agree3
                          ? Icon(Icons.expand_more, color: Colors.lightGreen)
                          : Icon(Icons.expand_more, color: Colors.grey),
                      onPressed: () {
                        setState(() {
                          agree3 = !agree3;
                        });
                      },
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 100),
          _connectbutton('동의하고 계속 진행합니다.', () {
            if (agree1 == true && agree2 == true && agree3 == true) {
              Get.to(nickNamePage());
            } else {
              Get.to(agreePage());
            }
          })
        ],
      ),
    ));
  }
}
