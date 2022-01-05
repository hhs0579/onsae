import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/screens/access_pages/local_select.dart';
import 'package:onsaemiro/screens/main_pages/culture_main.dart';
import 'package:onsaemiro/screens/main_pages/things_main.dart';

class accessMainPage extends StatefulWidget {
  const accessMainPage({Key? key}) : super(key: key);

  @override
  _accessMainPageState createState() => _accessMainPageState();
}

class _accessMainPageState extends State<accessMainPage> {
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
      body: Center(
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(115, 0, 115, 20),
                child: Text(
                  'access',
                  style: TextStyle(fontSize: 36, color: Color(0xff595959)),
                )),
            Ink(
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/디어비건베이커리 1.png'),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                onTap: () {
                  Get.to(localSelectPage());
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
                    Get.to(cultureMainPage());
                  },
                  child: Text(
                    'culture',
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
    );
  }
}