import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/product/product_list.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';
import 'package:onsaemiro/screens/culture_pages/culture_firstmain.dart';
import 'package:onsaemiro/screens/main_pages/controller/cart_controller.dart';

import 'access_main.dart';
import 'things_main.dart';

class cultureMainPage extends StatefulWidget {
  const cultureMainPage({Key? key}) : super(key: key);

  @override
  _cultureMainPageState createState() => _cultureMainPageState();
}

class _cultureMainPageState extends State<cultureMainPage> {
  final CartController c = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        toolbarHeight: height * 0.176,
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 12),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.grey,
              onPressed: () {
                Get.to(shoppingBagPage(c.allList));
              },
            ),
          )
        ],
        title: Container(
          width: double.infinity,
          height: height * 0.038,
          child: TextField(
            style: TextStyle(fontSize: width * 0.029),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: height * 0.008),
                prefixIcon: IconButton(
                    padding: EdgeInsets.symmetric(
                        vertical: height * 0.008, horizontal: 11),
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: width * 0.036,
                    )),
                hintText: '상품검색',
                hintStyle: TextStyle(fontSize: width * 0.029),
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
              // SizedBox(
              //   height: 62,
              // ),
              Container(
                  padding: EdgeInsets.fromLTRB(115, 0, 115, 20),
                  child: Text(
                    'culture',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                        color: Color(0xff595959)),
                  )),
              Ink(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/aa.jpg'), fit: BoxFit.fill),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => culture_firstPage()));
                  },
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: height * 0.45,
                    width: width * 0.7,
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
                              builder: (context) => thingsMainPage()));
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
    );
  }
}
