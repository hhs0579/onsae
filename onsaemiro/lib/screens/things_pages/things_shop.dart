import 'package:flutter/material.dart';

class thingsShopPage extends StatefulWidget {
  const thingsShopPage({Key? key}) : super(key: key);

  @override
  _thingsShopPageState createState() => _thingsShopPageState();
}

class _thingsShopPageState extends State<thingsShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        toolbarHeight: 160,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            padding: EdgeInsets.fromLTRB(10, 55, 10, 84),
            icon: Image.asset('assets/장바구니 (누런녹색).png'),
            onPressed: () {},
          ),
        ],
        elevation: 0.5,
        title: Column(
          children: [
            Container(
              height: 31,
              child: TextField(
                style: TextStyle(fontSize: 11),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color.fromRGBO(162, 191, 98, 0.2),
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    prefixIcon: IconButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 11),
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Color.fromRGBO(162, 191, 98, 1),
                          size: 15,
                        )),
                    hintText: '상품검색',
                    hintStyle: TextStyle(
                        fontSize: 11, color: Color.fromRGBO(162, 191, 98, 0.5)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(27.0)),
                      borderSide: BorderSide(color: Color(0xffffffff)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(27.0)),
                        borderSide: BorderSide(color: Color(0xffA2BF62)))),
              ),
            ),
            Container(
                child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.fromLTRB(20, 33, 90.59, 34),
                  onPressed: () {},
                  icon: Image.asset('assets/Vector(누런녹색).png'),
                  iconSize: 12,
                ),
                Text(
                  'things',
                  style: TextStyle(
                      fontSize: 36, color: Color.fromRGBO(162, 191, 98, 1)),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
