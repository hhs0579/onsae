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
        top: 58.5,
        left: 130,
        child: Column(
          children: [
            Text(where),
            Text(whereInEnglish),
          ],
        ),
      ),
      Ink(
        padding: EdgeInsets.fromLTRB(0, 19, 0, 19),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(whichPicture),
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          onTap: onTap,
          child: Container(
            height: 117,
            width: 291,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
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
                  width: 321,
                  height: 31,
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
                            fontSize: 11,
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
                  icon: Image.asset('assets/장바구니 (누런녹색).png'),
                  onPressed: () {},
                ),
              ],
            ),
            Container(
                child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.fromLTRB(20, 33, 90.59, 34),
                  onPressed: () {},
                  icon: Image.asset('assets/Vector(누런녹색).png'),
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
          child: Column(
            children: [
              local_Stack('서울', 'Seoul', 'assets/서울.png', () {
                Get.to(localSeoulPage());
              }),
              local_Stack('서울', 'Seoul', 'assets/서울.png', () {}),
              local_Stack('대구', 'Deagu', 'assets/대구.png', () {}),
              SizedBox(
                height: 14,
              ),
              local_Stack('부산', 'Busan', 'assets/부산.png', () {}),
              local_Stack('부산', 'Busan', 'assets/부산.png', () {}),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: ImageIcon(
              AssetImage('assets/페이지.png'),
              color: Colors.green,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: ImageIcon(
              AssetImage('assets/culture.png'),
              color: Colors.green,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: ImageIcon(
              AssetImage('assets/home.png'),
              color: Colors.green,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: ImageIcon(
              AssetImage('assets/things.png'),
              color: Colors.green,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: ImageIcon(
              AssetImage('assets/마이.png'),
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
