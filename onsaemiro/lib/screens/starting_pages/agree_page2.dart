import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/screens/starting_pages/email_join_pages/email_join_page2.dart';

class AgreePage2 extends StatefulWidget {
  const AgreePage2({Key? key}) : super(key: key);

  @override
  State<AgreePage2> createState() => _AgreePage2State();
}

class _AgreePage2State extends State<AgreePage2> {
  List arguments = Get.arguments;

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
  void initState() {
    setState(() {
      var agree1 = false;

      var agree2 = false;

      var agree3 = false;
    });
    super.initState();
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
                  child: Text('?????? ??????,???????????????.', style: TextStyle(fontSize: 20)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 20),
                  child: Text('''  ????????? ????????? ????????? ??????
?????? ?????? ????????? ???????????????.''', style: TextStyle(fontSize: 13)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('????????? ???????????? ?????? (??????)'),
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
                    Text('???????????? ?????? ?????? (??????)'),
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
                    Text('???????????? ???3??? ?????? ?????? (??????)'),
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
          SizedBox(height: 130),
          _connectbutton('???????????? ?????? ???????????????.', () {
            if (agree1 == true && agree2 == true && agree3 == true) {
              Get.to(EmailJoinPage2(), arguments: arguments);
            } else {
              Get.to(AgreePage2());
            }
          })
        ],
      ),
    ));
  }
}
