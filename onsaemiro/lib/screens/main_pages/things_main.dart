import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';
import 'package:onsaemiro/screens/main_pages/culture_main.dart';
import 'package:onsaemiro/screens/things_pages/things_shop.dart';

import 'access_main.dart';

class thingsMainPage extends StatefulWidget {
  const thingsMainPage({Key? key}) : super(key: key);

  @override
  _thingsMainPageState createState() => _thingsMainPageState();
}

class _thingsMainPageState extends State<thingsMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 12),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.grey,
              onPressed: () {
                Get.to(shoppingBagPage());
              },
            ),
          )
        ],
        title: Container(
          width: double.infinity,
          height: 44,
          child: TextField(
            style: TextStyle(fontSize: 14),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 8),
                prefixIcon: IconButton(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 11),
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 20,
                    )),
                hintText: '상품검색',
                hintStyle: TextStyle(fontSize: 14),
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
                    'things',
                    style: TextStyle(fontSize: 36, color: Color(0xff595959)),
                  )),
              Ink(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/shop.png'), fit: BoxFit.fill),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  onTap: () {
                    //Get.to(localSelectPage());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => thingsShopPage()));
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => accessMainPage()));
                    },
                    child: Text(
                      'access',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cultureMainPage()));
                    },
                    child: Text(
                      'culture',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
