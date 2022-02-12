import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:onsaemiro/product/product_list.dart';
import 'package:onsaemiro/screens/access_pages/product_information.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';
import 'package:onsaemiro/screens/main_pages/controller/cart_controller.dart';
import 'package:onsaemiro/screens/things_pages/things_information.dart';

Review_Box(height, width, profileName, image1, image2, text) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: Container(
        width: width * 0.8693,
        height: height * 0.1884,
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
                    size: width * 0.0533,
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
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: Row(
                children: [
                  Container(
                    height: height * 0.0763,
                    width: 92,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage(image1), fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 7.89,
                  ),
                  Container(
                    height: height * 0.0763,
                    width: 92,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage(image2), fit: BoxFit.cover)),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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

product_Box(height, width, image, onTap, name, explanation, int price) {
  return Padding(
    padding: EdgeInsets.only(bottom: 10),
    child: Container(
      width: 350,
      height: height * 0.1034,
      decoration: BoxDecoration(
          border: Border.all(color: Color.fromRGBO(108, 205, 108, 0.7)),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(7, 5, 9, 6),
            child: Ink(
              height: height * 0.0899,
              width: 97,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                height: height * 0.0899,
                width: 97,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
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
              // SizedBox(
              //   height: 7,
              // ),
              Text(
                explanation,
                style: TextStyle(color: Colors.grey, fontSize: 10),
              ),
              SizedBox(
                height: height * 0.0246,
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.37),
                child: Text(
                  '${NumberFormat('###,###,###,###').format(price).replaceAll(' ', '')}원',
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

class thingsShopIntroducePage extends StatefulWidget {
  late String name;
  late String image;
  List<Product> products = [];
  thingsShopIntroducePage(this.name, this.image, this.products);
  @override
  _thingsShopIntroducePageState createState() =>
      _thingsShopIntroducePageState(this.name, this.image, this.products);
}

class _thingsShopIntroducePageState extends State<thingsShopIntroducePage> {
  _thingsShopIntroducePageState(this._name, this._image, this._products);
  late String _name;
  late String _image;
  List<Product> _products = [];
  final CartController c = Get.put(CartController());
  bool isMenuScreen = true;
  bool isInformationScreen = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        leadingWidth: 0.0,
        toolbarHeight: height * 0.4273,
        backgroundColor: Colors.white,
        elevation: 0.8,
        title: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  child: Container(
                    width: double.infinity,
                    height: height * 0.3078,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(89, 89, 89, 0.5),
                        image: DecorationImage(
                            image: NetworkImage(_image),
                            colorFilter: ColorFilter.mode(
                                Colors.white.withOpacity(0.5),
                                BlendMode.dstATop),
                            fit: BoxFit.fill),
                        border: Border(
                            bottom: BorderSide(
                          color: Color.fromRGBO(89, 89, 89, 1),
                        ))),
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 12,
                  child: SizedBox(
                    height: height * 0.3078,
                    width: width,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 321,
                          height: height * 0.0381,
                          child: TextField(
                            style: TextStyle(fontSize: 11),
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                filled: true,
                                fillColor: Color.fromRGBO(86, 123, 53, 0.5),
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8),
                                prefixIcon: IconButton(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 8, horizontal: 11),
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.search,
                                      color: Color.fromRGBO(86, 123, 53, 1),
                                      size: 15,
                                    )),
                                hintText: '상품검색',
                                hintStyle: TextStyle(
                                  fontSize: 11,
                                  color: Color.fromRGBO(86, 123, 53, 1),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(27.0)),
                                  borderSide: BorderSide(
                                    color: Color.fromRGBO(86, 123, 53, 1),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(27.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffA2BF62)))),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        IconButton(
                          icon: Image.asset('assets/장바구니 (누런녹색).png'),
                          color: Color.fromRGBO(86, 123, 53, 0.5),
                          onPressed: () {
                            Get.to(shoppingBagPage(c.allList));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    bottom: 60,
                    child: Row(
                      children: [
                        IconButton(
                          padding: EdgeInsets.fromLTRB(31, 0, 0, 0),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Image.asset('assets/Vector(누런녹색).png'),
                          iconSize: 12,
                        ),
                        SizedBox(width: width * 0.24),
                        Text(
                          'things',
                          style: TextStyle(
                            fontSize: 36,
                            color: Color.fromRGBO(86, 123, 53, 0.5),
                          ),
                        )
                      ],
                    )),
              ],
            ),
            Container(
              height: height * 0.1441,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '$_name',
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
      body: SingleChildScrollView(
        child: Column(
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
                      height: height * 0.4507,
                      width: 350,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: _products.length,
                        itemBuilder: (context, index) {
                          return product_Box(
                              height, width, _products[index].image, () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => thingsInformationPage(
                                        _products[index])));
                          }, _products[index].name, 'explanation',
                              _products[index].price);
                        },
                      ),
                      // child: ListView(
                      //   physics: BouncingScrollPhysics(),
                      //   scrollDirection: Axis.vertical,
                      //   children: [
                      //     product_Box(height, width, 'assets/망넛이네 약콩두유.png',
                      //         () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) =>
                      //             thingsInformationPage()));
                      //     }, '약콩두유 100', '약콩 두유 100, ', '1100원'),
                      //     product_Box(height, width, 'assets/둘리우니 1.png', () {},
                      //         '둘리우니', '보리와 귀리가 만난 비건 브라우니', '2,800 ~ 3,200원'),
                      //     product_Box(height, width, 'assets/둘리우니 1.png', () {},
                      //         '둘리우니', '보리와 귀리가 만난 비건 브라우니', '2,800 ~ 3,200원'),
                      //     product_Box(height, width, 'assets/둘리우니 1.png', () {},
                      //         '둘리우니', '보리와 귀리가 만난 비건 브라우니', '2,800 ~ 3,200원'),
                      //     product_Box(height, width, 'assets/둘리우니 1.png', () {},
                      //         '둘리우니', '보리와 귀리가 만난 비건 브라우니', '2,800 ~ 3,200원'),
                      //   ],
                      // ),
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
                  height: height * 0.4495,
                  width: 350,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    children: [
                      SizedBox(
                        height: height * 0.0234,
                      ),
                      Review_Box(
                          height,
                          width,
                          '온새미로',
                          'assets/둘리우니2.png',
                          'assets/펜케이크.png',
                          '종류별로 사먹어보고 있는데 다 맛있어요!!\n비건이라 말 안하면 모를 정도로 웬만한 일반 빵보다 맛있어요!!\n사장님도 항상 넘넘 친절하셔요.'),
                      Review_Box(
                          height,
                          width,
                          '온새미로',
                          'assets/셀러드.png',
                          'assets/음식.png',
                          '종류별로 사먹어보고 있는데 다 맛있어요!!\n비건이라 말 안하면 모를 정도로 웬만한 일반 빵보다 맛있어요!!\n사장님도 항상 넘넘 친절하셔요.'),
                      Review_Box(
                          height,
                          width,
                          '온새미로',
                          'assets/둘리우니2.png',
                          'assets/펜케이크.png',
                          '종류별로 사먹어보고 있는데 다 맛있어요!!\n비건이라 말 안하면 모를 정도로 웬만한 일반 빵보다 맛있어요!!\n사장님도 항상 넘넘 친절하셔요.'),
                    ],
                  ),
                ),
              )
          ],
        ),
      ),
      floatingActionButton: Container(
        width: 69.5,
        height: 69.5,
        child: FloatingActionButton(
          elevation: 0.0,
          onPressed: () {
            Get.to(shoppingBagPage(c.allList));
          },
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
