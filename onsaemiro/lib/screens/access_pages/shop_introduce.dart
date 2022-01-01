import 'package:flutter/material.dart';

class shopIntroducePage extends StatefulWidget {
  const shopIntroducePage({Key? key}) : super(key: key);

  @override
  _shopIntroducePageState createState() => _shopIntroducePageState();
}

class _shopIntroducePageState extends State<shopIntroducePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        toolbarHeight: 367,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Center(
          child: Column(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/비건 베이커리 보물.png'))),
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
                                contentPadding:
                                    EdgeInsets.symmetric(vertical: 8),
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
                                    fontSize: 11, color: Colors.white),
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
                                        BorderSide(color: Colors.white))),
                          ),
                        ),
                        IconButton(
                          icon: Image.asset('assets/장바구니 (누런녹색).png'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    Row(
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
                              fontSize: 36,
                              color: Color.fromRGBO(162, 191, 98, 1)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 117,
                child: Column(
                  children: [
                    Text(
                      '비건 베이커리 보물',
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.location_on_outlined),
                          iconSize: 13,
                          color: Colors.black,
                          onPressed: () {},
                        ),
                        Text(
                          '서울 강남구 논현로67길 11 1층',
                          style: TextStyle(fontSize: 13, color: Colors.black),
                        ),
                      ],
                    ),
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
