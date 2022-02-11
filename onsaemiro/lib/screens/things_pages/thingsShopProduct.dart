import 'package:flutter/material.dart';
import 'package:onsaemiro/product/shop.dart';

import 'package:onsaemiro/screens/access_pages/product_confirm.dart';
import 'package:onsaemiro/screens/access_pages/product_registration.dart';

class thingsShopRegiPage extends StatefulWidget {
  const thingsShopRegiPage({Key? key}) : super(key: key);

  @override
  _thingsShopRegiPageState createState() => _thingsShopRegiPageState();
}

class _thingsShopRegiPageState extends State<thingsShopRegiPage> {
  List<shop> Shops = [shop(name: '망넛이네', image_url: 'assets/mangnut.png')];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 130,
          shape: Border(bottom: BorderSide(color: Colors.green)),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset('assets/Vector(진한녹색).png'),
            iconSize: 12,
          ),
          backgroundColor: Colors.white,
          title: Text(
            '내 상점 목록',
            style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: Color(0xff595959)),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(children: [
            SizedBox(
              height: 550,
              child: Column(
                children: [
                  SizedBox(
                    height: Shops.length * 105,
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: Shops.length,
                        itemBuilder: (BuildContext context, int index) {
                          return StoreBox(
                              width, Shops[index].name, Shops[index].image_url,
                              () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        productRegistrationPage()));
                          });
                        }),
                  ),
                ],
              ),
            ),
          ]),
        )));
  }
}

Widget StoreBox(width, name, image, func1) {
  return Container(
    height: 100,
    width: width,
    decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 10,
        ),
        Container(
          height: 33,
          width: 97,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
          ),
        ),
        SizedBox(
          width: width * 0.3,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: func1,
              child: Container(
                width: width * 0.18,
                height: 33,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  '수정하기',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
