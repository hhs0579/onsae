import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/data/appdata.dart';
import 'package:onsaemiro/repo/image_service.dart';
import 'package:onsaemiro/screens/main_pages/admin_page/admin_shop_access.dart';
import 'package:onsaemiro/screens/main_pages/controller/auth_controller.dart';
import 'package:onsaemiro/screens/starting_pages/type_screen.dart';
import 'package:onsaemiro/screens/things_pages/thingsShopProduct.dart';
import 'package:onsaemiro/store/store_open.dart';

_connectbutton(text, width, height, onPressed) {
  return Container(
    width: width,
    height: 50,
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
        Container(width: 90, child: Text(text)),
        SizedBox(
          width: 180,
        ),
        Flexible(
          fit: FlexFit.loose,
          child: IconButton(
              onPressed: onPressed, icon: Image.asset('assets/바로가기 버튼.png')),
        )
      ],
    )),
  );
}

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  Imageservice imageservice = Imageservice();
  String resultURL = '';
  AppData appdata = Get.find();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.1,
        backgroundColor: Colors.white,
        title: Text(
          '관리자 페이지',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Color(0xff595959)),
        ),
        centerTitle: true,
        elevation: 1,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              _connectbutton('상점 개설 승인', width, height, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AdminShopAccess()));
              }),
              SizedBox(
                height: 30,
              ),
              _connectbutton('신고 관리', width, height, () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StoreOpen()));
              }),
              SizedBox(
                height: 30,
              ),
              _connectbutton('플리마켓 수정', width, height, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => thingsShopRegiPage()));
              }),
              SizedBox(height: 30),
              TextButton(
                child: Text(
                  '로그아웃',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
                ),
                onPressed: () {
                  appdata.userEmail = '';
                  appdata.userPhone = '';
                  authController.handleSignOut();
                  Get.offAll(() => TypeScreen());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
