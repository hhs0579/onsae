import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';
import 'package:onsaemiro/screens/main_pages/access_main.dart';
import 'package:onsaemiro/screens/main_pages/controller/cart_controller.dart';
import 'package:onsaemiro/screens/main_pages/password_edit.dart';
import 'package:onsaemiro/screens/main_pages/phone_number.dart';

class edit_infoPage extends StatefulWidget {
  const edit_infoPage({Key? key}) : super(key: key);

  @override
  editInfoState createState() => editInfoState();
}

class editInfoState extends State<edit_infoPage> {
  final CartController c = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.123,
        shape: Border(bottom: BorderSide(color: Colors.green)),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.green, size: 30),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.green, size: 30),
            onPressed: () {
              Get.to(shoppingBagPage(c.allList));
            },
          )
        ],
        backgroundColor: Colors.white,
        title: Text(
          '회원정보 수정',
          style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Color(0xff595959)),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '이메일',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(89, 89, 89, 0.5)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        hintText: 'onsemiro.gmail.com',
                        hintStyle: TextStyle(fontSize: 15),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(0, height * 0.065, 0, height * 0.0418),
                child: Container(
                  width: width * 0.248,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.green))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        ' 이름',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            hintText: '온새미로',
                            hintStyle: TextStyle(fontSize: 15),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none),
                      ),
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ' 비밀번호',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Image.asset('assets/바로가기 버튼.png'),
                          onPressed: () {
                            Get.to(passwordEditPage());
                          },
                        ),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.fromLTRB(0, height * 0.0369, 0, height * 0.0246),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' 휴대폰 번호',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: '010 - 5768 - 1673',
                          hintStyle: TextStyle(fontSize: 15),
                          suffixIcon: IconButton(
                            icon: Image.asset('assets/바로가기 버튼.png'),
                            onPressed: () {
                              Get.to(phoneNumberPage());
                            },
                          ),
                          enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.green))),
                    ),
                  ],
                ),
              ),
              Container(
                width: width * 0.248,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.green))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' 생년월일',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: '2021.11.18',
                          hintStyle: TextStyle(fontSize: 15),
                          focusedBorder: InputBorder.none,
                          border: InputBorder.none),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
