import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/screens/access_pages/shop_introduce.dart';

class localSeoul2Page extends StatefulWidget {
  const localSeoul2Page({Key? key}) : super(key: key);

  @override
  _localSeoul2PageState createState() => _localSeoul2PageState();
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
              children: [
                Text(
                  shop,
                  style: TextStyle(fontSize: 10),
                ),
                Text(
                  phone,
                  style: TextStyle(fontSize: 8),
                ),
                Text(
                  insta,
                  style: TextStyle(fontSize: 6),
                ),
              ],
            ),
          ),
        ),
        Ink(
          height: 102,
          width: 156,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
              ),
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

class _localSeoul2PageState extends State<localSeoul2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        toolbarHeight: 190,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Center(
          child: Column(
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
                    icon: Image.asset('assets/장바구니 (누런녹색).png'),
                    onPressed: () {},
                  ),
                ],
              ),
              Container(
                  child: Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.fromLTRB(20, 11, 100.59, 0),
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
              )),
              Container(
                  padding: EdgeInsets.fromLTRB(135, 10, 0, 0),
                  child: Row(
                    children: [
                      Text(
                        '강남구 역삼동',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff595959)),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset('assets/화살표.png'),
                        iconSize: 12,
                      ),
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
      body: Center(
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
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '비건 베이커리 보물',
                            style: TextStyle(fontSize: 13),
                          ),
                          Text(
                            '02-558-0301',
                            style: TextStyle(fontSize: 11),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                icon: Icon(Icons.location_on_outlined),
                                iconSize: 12,
                                onPressed: () {},
                              ),
                              Text(
                                '서울 강남구 논현로 67길 11 1층',
                                style: TextStyle(fontSize: 11),
                              ),
                            ],
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
                          image: AssetImage('assets/비건 베이커리 보물.png'),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: InkWell(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      onTap: () {
                        Get.to(shopIntroducePage());
                      },
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  imagestackWidget(
                      '비건 베이커리보물',
                      '02-558-0301',
                      '서울 강남구 논현로 67길 11 1층',
                      'http://www.instagram.com/bo.mool_vegan',
                      'assets/핫케이크.png',
                      () {}),
                  SizedBox(width: 26),
                  imagestackWidget(
                      '비건 베이커리보물',
                      '02-558-0301',
                      '부천 상구',
                      'http://www.instagram.com/bo.mool_vegan',
                      'assets/샌드위치.png',
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
    );
  }
}
