import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

class fleaMarketPage extends StatefulWidget {
  const fleaMarketPage({Key? key}) : super(key: key);

  @override
  _fleaMarketPageState createState() => _fleaMarketPageState();
}

Widget informationBox() {
  return Container(
    height: 453,
    width: 264,
    decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(108, 205, 108, 1)),
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(40, 30, 39, 20),
          child: Container(
            width: 185,
            height: 262,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/플리마켓 안내.png'), fit: BoxFit.fill)),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('일시 : 2021.11.13(토) 10:00~16:00\n장소 : 풍납백제문화공원',
                style: TextStyle(fontSize: 11)),
            SizedBox(
              height: 20,
            ),
            Text('행사내용', style: TextStyle(fontSize: 11)),
            SizedBox(
              height: 11,
            ),
            Text(
                '도시재생사업 홍보 및 주민협의제 회원 모집 부스\n의류,신발,장남감,유아용품 등 중고물품 판매 셀러 (10팀)\n 로컬푸드, 커피, 디저트 등 풍납 시장 상인회 (5팀)\n핸드메이드 쥬얼리, 페브릭 가방, 마들렌, 목공예품 등 전문셀러 (15팀)\n청소년을 위한 딱지치기, 페이스페인팅 이벤트 등',
                style: TextStyle(fontSize: 8)),
          ],
        ),
      ],
    ),
  );
}

List<Widget> informationList = [
  informationBox(),
  informationBox(),
  informationBox(),
];

class _fleaMarketPageState extends State<fleaMarketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        toolbarHeight: 170,
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
                        fillColor: Color.fromRGBO(67, 123, 86, 0.2),
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                        prefixIcon: IconButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 11),
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: Color.fromRGBO(67, 123, 86, 1),
                              size: 15,
                            )),
                        hintText: '상품검색',
                        hintStyle: TextStyle(
                          fontSize: 11,
                          color: Color.fromRGBO(67, 123, 86, 0.5),
                        ),
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
                  icon: Image.asset('assets/장바구니(진한녹색).png'),
                  onPressed: () {},
                ),
              ],
            ),
            Container(
                child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.fromLTRB(20, 33, 30.59, 34),
                  onPressed: () {},
                  icon: Image.asset('assets/Vector(진한녹색).png'),
                  iconSize: 12,
                ),
                Column(
                  children: [
                    Text(
                      '온새미로 플리마켓',
                      style: TextStyle(
                          fontSize: 36,
                          color: Color.fromRGBO(67, 123, 86, 1),
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'ONSEMIRO FLEAMARKET',
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromRGBO(67, 123, 86, 1),
                          fontWeight: FontWeight.w300),
                    ),
                  ],
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
              SizedBox(
                height: 20,
              ),
              SizedBox(
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 484,
                    enableInfiniteScroll: false,
                  ),
                  items: [
                    informationList[0],
                    informationList[0],
                    informationList[0],
                  ],
                ),
              ),
              // SizedBox(
              //   height: 50,
              //   child: Swiper(
              //     itemCount: informationList.length,
              //     scrollDirection: Axis.horizontal,
              //     itemHeight: 50,
              //     itemWidth: 50,
              //     itemBuilder: (BuildContext context, int index) {
              //       return informationList[index];
              //     },
              //     loop: false,
              //     control: SwiperControl(),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
