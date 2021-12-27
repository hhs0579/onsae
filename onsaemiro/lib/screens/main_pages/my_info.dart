import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class MyInfoPage extends StatefulWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  _MyInfoPageState createState() => _MyInfoPageState();
}

_connectbutton(text, onPressed) {
  return Container(
    width: 355,
    height: 40,
    margin: EdgeInsets.all(10),
    child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            primary: Colors.black,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: Colors.green, width: 2),
                borderRadius: BorderRadius.circular(7))),
        child: Row(
          children: [
            SizedBox(
              width: 28,
            ),
            Text(text),
            SizedBox(
              width: 195,
            ),
            Image.asset('assets/바로가기 버튼.png')
          ],
        )),
  );
}

class _MyInfoPageState extends State<MyInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: Column(
          children: [
            SizedBox(
              height: 18.0,
            ),
            AppBar(
              leading: Image.asset('assets/Vector.png'),
              backgroundColor: Colors.white,
              title: Text(
                '마이페이지',
                style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff595959)),
              ),
              centerTitle: true,
              elevation: 0.0,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 355,
            height: 170,
            decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.green,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/프로필.png'),
                Text(
                  '온새미로',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text('data'),
                Text('data'),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _connectbutton('회원정보 수정', () {}),
          _connectbutton('회원정보 수정', () {}),
          _connectbutton('회원정보 수정', () {}),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 355,
            height: 170,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.green,
              ),
              borderRadius: BorderRadius.circular(19),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  '최근 지출내역',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '망넛이네',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      width: 250,
                    )
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '약콩두유 100 (3개)',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      '2021-11-18(목)',
                      style:
                          TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    Text('3,300원')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
