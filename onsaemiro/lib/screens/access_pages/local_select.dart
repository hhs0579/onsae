import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'local_Seoul.dart';

class localSelectPage extends StatefulWidget {
  const localSelectPage({Key? key}) : super(key: key);

  @override
  _localSelectPageState createState() => _localSelectPageState();
}

local_Stack(where, whereInEnglish, whichPicture, onTap) {
  return Stack(
    children: [
      Positioned(
        top: 50,
        left: 130,
        child: Column(
          children: [
            Text(
              where,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(whereInEnglish,
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
      ),
      Ink(
        padding: EdgeInsets.fromLTRB(19, 19, 19, 19),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(whichPicture),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(40))),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          onTap: onTap,
          child: Container(
            height: 117,
            width: 291,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
      ),
    ],
  );
}

class _localSelectPageState extends State<localSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        toolbarHeight: 160,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 300,
                  height: 44,
                  child: TextField(
                    style: TextStyle(fontSize: 11),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color.fromRGBO(162, 191, 98, 0.2),
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                        prefixIcon: IconButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 11),
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: Color.fromRGBO(162, 191, 98, 1),
                              size: 15,
                            )),
                        hintText: '상품검색',
                        hintStyle: TextStyle(
                            fontSize: 14,
                            color: Color.fromRGBO(162, 191, 98, 0.5)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(27.0)),
                          borderSide: BorderSide(color: Color(0xffffffff)),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(27.0)),
                            borderSide: BorderSide(color: Color(0xffA2BF62)))),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.shopping_cart, color: Color(0xffA2BF62)),
                  onPressed: () {},
                ),
              ],
            ),
            Container(
                child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.fromLTRB(20, 22, 90.59, 34),
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.navigate_before,
                      color: Color(0xffA2BF62), size: 30),
                  iconSize: 12,
                ),
                Text(
                  'access',
                  style: TextStyle(
                      fontSize: 36, color: Color.fromRGBO(162, 191, 98, 1)),
                )
              ],
            ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                local_Stack('\t\t서울', '\t\tSeoul\t', 'assets/seoul.jpg', () {
                  Get.to(localSeoulPage());
                }),
                SizedBox(
                  height: 14,
                ),
                local_Stack('인천', 'Incheon', 'assets/incheon.jpg', () {}),
                SizedBox(
                  height: 14,
                ),
                local_Stack('\t\t부산', '\t\tBusan', 'assets/busan.jpg', () {}),
                SizedBox(
                  height: 14,
                ),
                local_Stack('\t\t대구', '\t\tDaegu', 'assets/daegu.jpg', () {}),
                SizedBox(
                  height: 14,
                ),
                local_Stack('강원', 'Gangwon', 'assets/gangwon.jpg', () {}),
                SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
