import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onsaemiro/classes/toast_message.dart';
import 'package:onsaemiro/data/appdata.dart';
import 'package:onsaemiro/repo/image_service.dart';
import 'package:onsaemiro/screens/main_pages/Root2.dart';
import 'package:onsaemiro/screens/main_pages/controller/auth_controller.dart';
import 'package:onsaemiro/screens/main_pages/controller/controller2.dart';
import 'package:onsaemiro/screens/main_pages/myinfo_sub/edit_info.dart';
import 'package:onsaemiro/screens/main_pages/myinfo_sub/product_comment.dart';
import 'package:onsaemiro/screens/main_pages/myinfo_sub/store_comment.dart';
import 'package:onsaemiro/screens/starting_pages/type_screen.dart';

_connectbutton(text, width, height, onPressed) {
  return Container(
    width: width * 0.95,
    height: height * 0.04926,
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

spending_info(where, which, when, price, width, height) {
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
            width: width * 0.6666,
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
              SizedBox(height: height * 0.006),
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

class MyInfoPage extends StatefulWidget {
  const MyInfoPage({Key? key}) : super(key: key);

  @override
  _MyInfoPageState createState() => _MyInfoPageState();
}

class _MyInfoPageState extends State<MyInfoPage> {
  String resultURL = '';
  AppData appdata = Get.find();
  final _picker = ImagePicker();

  @override
  void initState() {
    setState(() {});
    resultURL = appdata.usermodel.image;

    super.initState();
  }

  _profileImage() {
    return Container(
      width: 85,
      child: Stack(
        children: [
          Container(
              child:
                  Container(width: 80, height: 80, child: _profileImageOn())),
          Positioned(
              right: 0,
              top: 50,
              child: Container(
                width: 25,
                height: 25,
                child: CircleAvatar(
                  backgroundColor: Color(0xff6CCD6C),
                  child: IconButton(
                    onPressed: () async {
                      try {
                        XFile? result = await _picker.pickImage(
                            source: ImageSource.gallery);
                        resultURL = await imageservice
                            .uploadProfileImageToStorage(result!);
                        toastMessage('프로필 사진이 변경되었습니다.');
                      } catch (e) {
                        toastMessage('오류가 발생했습니다.');
                        print(e);
                      }
                      setState(() {});
                    },
                    icon: Icon(Icons.edit, color: Colors.white),
                    iconSize: 15,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    padding: EdgeInsets.zero,
                    constraints: BoxConstraints(),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  _profileImageOn() {
    return resultURL == ''
        ? Container(
            width: 70,
            height: 70,
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40,
                backgroundImage: AssetImage('assets/basic.png')))
        : Container(
            width: 70,
            height: 70,
            child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 40,
                backgroundImage: NetworkImage(resultURL)));
  }

  final Root2Contorller c = Get.put(Root2Contorller());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    AppData appdata = Get.find();
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.1,
        backgroundColor: Colors.white,
        title: Text(
          '마이페이지',
          style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Color(0xff595959)),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
        child: Column(
          children: [
            // SizedBox(
            //   height: height * 0.044,
            // ),
            Container(
              width: width * 0.95,
              height: height * 0.25,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.green,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _profileImage(),
                  SizedBox(height: 5),
                  Text(
                    appdata.usermodel.nickname,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(appdata.usermodel.email),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('좋아요', style: TextStyle(fontSize: 13)),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        appdata.usermodel.like.toString(),
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            _connectbutton('회원정보 수정', width, height, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EditinfoPage()));
            }),
            _connectbutton('상점 후기 작성', width, height, () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => store_commentPage()));
            }),
            _connectbutton('상품 후기 작성', width, height, () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => product_CommentPage()));
            }),
            SizedBox(
              height: 5,
            ),
            Container(
              width: width * 0.95,
              height: height * 0.278,
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
                    height: height * 0.012,
                  ),
                  Text(
                    '최근 지출내역',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.0123,
                  ),
                  spending_info('망넛이네', '약콩두유 100 (3개)', '2021-11-18(목)',
                      '3,300원', width, height),
                  SizedBox(
                    height: height * 0.012,
                  ),
                  spending_info('망넛이네', '약콩두유 100 (3개)', '2021-11-18(목)',
                      '3,300원', width, height),
                  SizedBox(
                    height: height * 0.012,
                  ),
                  spending_info('망넛이네', '약콩두유 100 (3개)', '2021-11-18(목)',
                      '3,300원', width, height)
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                info_button('고객센터', () {}),
                info_button('로그아웃', () {
                  appdata.userEmail = '';
                  appdata.userPhone = '';
                  authController.handleSignOut();
                  Get.offAll(() => TypeScreen());
                }),
                info_button('사업자 사용자 전환', () {
                  if (c.Pressed.value == 0) {
                    Get.to(Root2());
                    c.Pressed++;
                    print(c.Pressed.value);
                  } else if (c.Pressed.value == 1) {
                    Get.back();
                    c.Pressed--;
                    print(c.Pressed.value);
                  }
                }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
