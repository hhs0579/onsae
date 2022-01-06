import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/screens/culture_pages/culture_firstmain.dart';

import 'access_main.dart';
import 'things_main.dart';

class cultureMainPage extends StatefulWidget {
  const cultureMainPage({Key? key}) : super(key: key);

  @override
  _cultureMainPageState createState() => _cultureMainPageState();
}

class _cultureMainPageState extends State<cultureMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Image.asset('assets/장바구니(검정).png'),
            onPressed: () {},
          )
        ],
        title: Container(
          width: double.infinity,
          height: 37,
          child: TextField(
            style: TextStyle(fontSize: 11),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                prefixIcon: IconButton(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 11),
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 15,
                    )),
                hintText: '상품검색',
                hintStyle: TextStyle(fontSize: 11),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(27.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(27.0)),
                    borderSide: BorderSide(color: Colors.grey))),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 62,
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(115, 0, 115, 20),
                  child: Text(
                    'culture',
                    style: TextStyle(fontSize: 36, color: Color(0xff595959)),
                  )),
              Ink(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/시장.png'),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  onTap: () {
                    Get.to(culture_firstPage());
                  },
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: 364,
                    width: 267,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Get.to(accessMainPage());
                    },
                    child: Text(
                      'access',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(thingsMainPage());
                    },
                    child: Text(
                      'things',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                ],
              )
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
