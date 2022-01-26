import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/screens/main_pages/edit_info.dart';
import 'package:onsaemiro/screens/main_pages/product_comment.dart';
import 'package:onsaemiro/screens/main_pages/store_comment.dart';
import 'package:onsaemiro/screens/things_pages/things_shopAdmin.dart';

class MyInfoPage extends StatefulWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  _MyInfoPageState createState() => _MyInfoPageState();
}

_connectbutton(text, onPressed) {
  return Container(
    width: 355,
    height: 30,
    margin: EdgeInsets.all(5),
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
        ),
        borderRadius: BorderRadius.circular(7.0)),
    child: Container(
        child: Row(
      children: [
        SizedBox(
          width: 25,
        ),
        Text(text),
        SizedBox(
          width: 192,
        ),
        IconButton(
            onPressed: onPressed, icon: Image.asset('assets/바로가기 버튼.png'))
      ],
    )),
  );
}

spending_info(where, which, when, price) {
  return Column(
    children: [
      Row(
        children: [
          SizedBox(
            width: 20,
          ),
          Text(
            where,
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
            which,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
          SizedBox(
            width: 3,
          ),
          Column(
            children: [
              SizedBox(height: 5),
              Text(
                when,
                style: TextStyle(fontSize: 8, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          SizedBox(
            width: 80,
          ),
          Text(price)
        ],
      )
    ],
  );
}

info_button(text, onPressed) {
  return TextButton(
    child: Text(
      text,
      style: TextStyle(
        fontSize: 8,
        fontWeight: FontWeight.w700,
        color: Color(0xff59595980),
      ),
    ),
    onPressed: onPressed,
  );
}

class _MyInfoPageState extends State<MyInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
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
      body: Center(
        child: Column(
          children: [
            Container(
              width: 355,
              height: 160,
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
                  Text('onsemiro.gmail.com'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('좋아요', style: TextStyle(fontSize: 13)),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        '100',
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            _connectbutton('회원정보 수정', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => edit_infoPage()));
            }),
            _connectbutton('상점 후기 작성', () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => store_commentPage()));
            }),
            _connectbutton('상품 후기 작성', () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => product_CommentPage()));
            }),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 355,
              height: 190,
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
                    height: 5,
                  ),
                  Text(
                    '최근 지출내역',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  spending_info(
                      '망넛이네', '약콩두유 100 (3개)', '2021-11-18(목)', '3,300원'),
                  SizedBox(
                    height: 5,
                  ),
                  spending_info(
                      '망넛이네', '약콩두유 100 (3개)', '2021-11-18(목)', '3,300원'),
                  SizedBox(
                    height: 5,
                  ),
                  spending_info(
                      '망넛이네', '약콩두유 100 (3개)', '2021-11-18(목)', '3,300원')
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                info_button('고객센터', () {}),
                info_button('로그아웃', () {}),
                info_button('사업자 사용자 전환', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => thingsShopAdminPage()));
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
