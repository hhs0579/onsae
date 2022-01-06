import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/screens/access_pages/product_information.dart';

class shopIntroducePage extends StatefulWidget {
  const shopIntroducePage({Key? key}) : super(key: key);

  @override
  _shopIntroducePageState createState() => _shopIntroducePageState();
}

Review_Box(profileName, image1, image2, text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: Container(
        width: 326,
        height: 153,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromRGBO(108, 205, 108, 0.7)),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage('assets/프로필.png'),
                    size: 20,
                    color: Color.fromRGBO(108, 205, 108, 0.7),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    profileName,
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
              child: Row(
                children: [
                  Container(
                    height: 62,
                    width: 92,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(image: AssetImage(image1))),
                  ),
                  SizedBox(
                    width: 7.89,
                  ),
                  Container(
                    height: 62,
                    width: 92,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(image: AssetImage(image2))),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 4.35, 0, 0),
              child: Row(
                children: [
                  Text(
                    text,
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.start,
                  ),
                ],
              ),
            )
          ],
        )),
  );
}

product_Box(image, onTap, name, explanation, price) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: Container(
      width: 350,
      height: 84,
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(108, 205, 108, 0.7)),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(7, 5, 9, 6),
            child: Ink(
              height: 73,
              width: 97,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                height: 73,
                width: 97,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  onTap: onTap,
                ),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              SizedBox(
                height: 7,
              ),
              Text(
                explanation,
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              SizedBox(
                height: 21,
              ),
              Padding(
                padding: EdgeInsets.only(left: 155),
                child: Text(
                  price,
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                ),
              ),
            ],
          )
        ],
      ),
    ),
  );
}

class _shopIntroducePageState extends State<shopIntroducePage> {
  bool isMenuScreen = true;
  bool isInformationScreen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        leadingWidth: 0.0,
        toolbarHeight: 347,
        backgroundColor: Colors.white,
        elevation: 0.8,
        title: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/비건 베이커리 보물 (2).png'),
                            fit: BoxFit.fill)),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 12,
                  child: SizedBox(
                    height: 250,
                    width: 375,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 321,
                          height: 31,
                          child: TextField(
                            style: TextStyle(fontSize: 11),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Color.fromRGBO(255, 255, 255, 0.5),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8),
                                prefixIcon: IconButton(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 11),
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.search,
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      size: 15,
                                    )),
                                hintText: '상품검색',
                                hintStyle: TextStyle(
                                    fontSize: 11,
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(27.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffffffff)),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(27.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffA2BF62)))),
                          ),
                        ),
                        IconButton(
                          icon: Image.asset('assets/장바구니 (흰색).png'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 97,
                    child: Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.fromLTRB(31, 0, 102.59, 0),
                          onPressed: () {},
                          icon: Image.asset('assets/Vector(흰색).png'),
                          iconSize: 12,
                        ),
                        Text(
                          'access',
                          style: TextStyle(
                              fontSize: 36,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        )
                      ],
                    )),
              ],
            ),
            Container(
              height: 117,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '비건 베이커리 보물',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageIcon(
                        AssetImage('assets/위치.png'),
                        color: Color.fromRGBO(89, 89, 89, 1),
                      ),
                      Text('서울 강남구 논현로 67길 11 1층',
                          style: TextStyle(color: Colors.black, fontSize: 13)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                          onPressed: () {
                            setState(() {
                              isMenuScreen = true;
                              isInformationScreen = false;
                            });
                          },
                          child: Text(
                            '메뉴',
                            style: TextStyle(
                                fontSize: 13,
                                color: (isMenuScreen & !isInformationScreen)
                                    ? Color.fromRGBO(89, 89, 89, 1)
                                    : Color.fromRGBO(89, 89, 89, 0.5)),
                          )),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              isMenuScreen = false;
                              isInformationScreen = true;
                            });
                          },
                          child: Text(
                            '정보',
                            style: TextStyle(
                                fontSize: 13,
                                color: (!isMenuScreen & isInformationScreen)
                                    ? Color.fromRGBO(89, 89, 89, 1)
                                    : Color.fromRGBO(89, 89, 89, 0.5)),
                          )),
                      TextButton(
                          onPressed: () {
                            setState(() {
                              isMenuScreen = false;
                              isInformationScreen = false;
                            });
                          },
                          child: Text(
                            '후기',
                            style: TextStyle(
                                fontSize: 13,
                                color: (!isMenuScreen & !isInformationScreen)
                                    ? Color.fromRGBO(89, 89, 89, 1)
                                    : Color.fromRGBO(89, 89, 89, 0.5)),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          if (isMenuScreen & !isInformationScreen)
            Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      TextButton(
                        child: Text(
                          '거리순',
                          style: TextStyle(
                              color: Color.fromRGBO(89, 89, 89, 1),
                              fontSize: 11),
                        ),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: Text(
                          '가격순',
                          style: TextStyle(
                              color: Color.fromRGBO(89, 89, 89, 1),
                              fontSize: 11),
                        ),
                        onPressed: () {},
                      ),
                      TextButton(
                        child: Text(
                          '온새미로 인증',
                          style: TextStyle(
                              color: Color.fromRGBO(89, 89, 89, 1),
                              fontSize: 11),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 366,
                    width: 350,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        product_Box('assets/둘리우니 1.png', () {
                          Get.to(productInformationPage());
                        }, '둘리우니', '보리와 귀리가 만난 비건 브라우니', '2,800 ~ 3,200원'),
                        product_Box('assets/둘리우니 1.png', () {}, '둘리우니',
                            '보리와 귀리가 만난 비건 브라우니', '2,800 ~ 3,200원'),
                        product_Box('assets/둘리우니 1.png', () {}, '둘리우니',
                            '보리와 귀리가 만난 비건 브라우니', '2,800 ~ 3,200원'),
                        product_Box('assets/둘리우니 1.png', () {}, '둘리우니',
                            '보리와 귀리가 만난 비건 브라우니', '2,800 ~ 3,200원'),
                        product_Box('assets/둘리우니 1.png', () {}, '둘리우니',
                            '보리와 귀리가 만난 비건 브라우니', '2,800 ~ 3,200원'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          if (!isMenuScreen & isInformationScreen)
            Padding(
              padding: EdgeInsets.fromLTRB(9, 23, 5, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      '프리미엄 비건 베이커리 Bo.Mool 은\n유기농, 국내산, 최고급 원재료를 사용하여 맛있지만\n속이 편안한 No 버터, 밀가루, 달걀, 우유, 설탕\n디저트 제품을 만듭니다.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Text(
                    '영업정보',
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    '목요일 12:00 ~ 20:00\n품절시 인스타그램 공지 후 조기영업종료 (월별일정 변동, 인스타그램에 공지)\n금요일 12:00 ~ 20:00\n품절 시 인스타그램 공지 후 조기영업종료 (월별일정 변동, 인스타그램에 공지)',
                    style: TextStyle(fontSize: 11),
                  ),
                  Row(
                    children: [
                      ImageIcon(AssetImage('assets/인스타그램.png')),
                      Text(
                        'http://www.instagram.com/bo.mool_vegan',
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      ImageIcon(AssetImage('assets/폰.png')),
                      Text(
                        '02-558-0301',
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  ),
                  Text(
                    '안내 및 혜택',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    '11월 이벤트',
                    style: TextStyle(fontSize: 11),
                  )
                ],
              ),
            ),
          if (!isMenuScreen & !isInformationScreen)
            Center(
              child: SizedBox(
                height: 365,
                width: 350,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Review_Box('온새미로', 'assets/둘리우니2.png', 'assets/펜케이크.png',
                        '종류별로 사먹어보고 있는데 다 맛있어요!!\n비건이라 말 안하면 모를 정도로 웬만한 일반 빵보다 맛있어요!!\n사장님도 항상 넘넘 친절하셔요.'),
                    Review_Box('온새미로', 'assets/셀러드.png', 'assets/음식.png',
                        '종류별로 사먹어보고 있는데 다 맛있어요!!\n비건이라 말 안하면 모를 정도로 웬만한 일반 빵보다 맛있어요!!\n사장님도 항상 넘넘 친절하셔요.'),
                    Review_Box('온새미로', 'assets/둘리우니2.png', 'assets/펜케이크.png',
                        '종류별로 사먹어보고 있는데 다 맛있어요!!\n비건이라 말 안하면 모를 정도로 웬만한 일반 빵보다 맛있어요!!\n사장님도 항상 넘넘 친절하셔요.'),
                  ],
                ),
              ),
            )
        ],
      ),
      floatingActionButton: Container(
        width: 69.5,
        height: 69.5,
        child: FloatingActionButton(
          elevation: 0.0,
          onPressed: () {},
          child: ImageIcon(
            AssetImage('assets/장바구니(filled).png'),
            color: Color.fromRGBO(108, 205, 108, 1),
            size: 40,
          ),
          backgroundColor: Colors.white,
          shape: StadiumBorder(
              side: BorderSide(
            color: Color.fromRGBO(108, 205, 108, 1),
          )),
        ),
      ),
    );
  }
}
