import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';

import 'local_Seoul2.dart';

class localSeoulPage extends StatefulWidget {
  const localSeoulPage({Key? key}) : super(key: key);

  @override
  _localSeoulPageState createState() => _localSeoulPageState();
}

imagestackWidget(shop, phone, where, insta, image, onTap) {
  return Container(
    height: 153,
    width: 153,
    child: Stack(
      children: [
        Positioned(
          top: 70,
          child: Container(
            height: 72,
            width: 153,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
                  child: Text(
                    shop,
                    style: TextStyle(fontSize: 9.5),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(55, 0, 45, 0),
                  child: Text(
                    phone,
                    style: TextStyle(fontSize: 8),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(15, 4, 0, 4.5),
                  child: Row(
                    children: [
                      Icon(
                        Icons.place,
                        color: Color.fromRGBO(89, 89, 89, 1),
                        size: 7,
                      ),
                      Text(where,
                          style: TextStyle(color: Colors.black, fontSize: 7)),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 8, 8),
                  child: Text(
                    insta,
                    style: TextStyle(fontSize: 6),
                  ),
                ),
              ],
            ),
          ),
        ),
        Ink(
          height: 102,
          width: 156,
          decoration: BoxDecoration(
              image:
                  DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
              borderRadius: BorderRadius.all(Radius.circular(14))),
          child: InkWell(
            borderRadius: BorderRadius.all(Radius.circular(14)),
            onTap: onTap,
          ),
        ),
      ],
    ),
  );
}

class _localSeoulPageState extends State<localSeoulPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        toolbarHeight: 226,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Center(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 300,
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(27.0)),
                            borderSide: BorderSide(color: Color(0xffffffff)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(27.0)),
                              borderSide:
                                  BorderSide(color: Color(0xffA2BF62)))),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.lightGreen,
                    onPressed: () {
                      Get.to(shoppingBagPage());
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.fromLTRB(5, 11, 100.59, 0),
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.navigate_before, color: Colors.green),
                    iconSize: 22,
                  ),
                  Text(
                    'access',
                    style: TextStyle(
                        fontSize: 36, color: Color.fromRGBO(162, 191, 98, 1)),
                  )
                ],
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(130, 10, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        '강남구 역삼동',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff595959)),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.expand_more,
                              size: 22, color: Colors.lightGreen)),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        '주문 많은순',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromRGBO(89, 89, 89, 0.5)),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        '만족도순',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromRGBO(89, 89, 89, 0.5)),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        '거리순',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromRGBO(89, 89, 89, 0.5)),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        '온새미로 인증',
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromRGBO(89, 89, 89, 0.5)),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 245.91,
                width: 234,
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Stack(
                  children: [
                    Positioned(
                      top: 113.09,
                      child: Container(
                        height: 110,
                        width: 234,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 20,
                              spreadRadius: 2,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              '디어비건베이커리',
                              style: TextStyle(fontSize: 13),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text(
                              '02-558-0301',
                              style: TextStyle(fontSize: 11),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(33, 6, 0, 7),
                              child: Row(
                                children: [
                                  Icon(Icons.place, size: 11),
                                  Text('서울 서초구 강남대로 465',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 11)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 13),
                              child: Text(
                                'http://wwww.instagram.com/bo.mool_vegan',
                                style: TextStyle(fontSize: 8),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Ink(
                      height: 165,
                      width: 234,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/핫케이크.png'),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 47,
              ),
              SizedBox(
                height: 170.5,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    imagestackWidget(
                        '비건 베이커리보물',
                        '02-558-0301',
                        '서울 강남구 논현로 67길 11 1층',
                        'http://www.instagram.com/bo.mool_vegan',
                        'assets/비건 베이커리 보물.png', () {
                      Get.to(localSeoul2Page());
                    }),
                    SizedBox(width: 26),
                    imagestackWidget(
                        '본비 비건 베이커리',
                        '02-558-0301',
                        '서울 강남구 테헤란로34길 21-10',
                        'http://www.instagram.com/bo.mool_vegan',
                        'assets/샌드위치.png',
                        () {}),
                    SizedBox(width: 26),
                    imagestackWidget(
                        '아꼬떼 비건 베이커리',
                        '02-558-0301',
                        '서울 강남구 논현로86길 26',
                        'http://www.instagram.com/bo.mool_vegan',
                        'assets/아꼬떼 비건.png',
                        () {}),
                    SizedBox(width: 26),
                    imagestackWidget(
                        '비건 베이커리보물',
                        '02-558-0301',
                        '서울 강남구 논현로 67길 11 1층',
                        'http://www.instagram.com/bo.mool_vegan',
                        'assets/샌드위치.png',
                        () {}),
                    SizedBox(width: 26),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
