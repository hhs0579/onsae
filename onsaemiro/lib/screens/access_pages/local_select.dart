import 'package:flutter/material.dart';

class localSelectPage extends StatefulWidget {
  const localSelectPage({Key? key}) : super(key: key);

  @override
  _localSelectPageState createState() => _localSelectPageState();
}

class _localSelectPageState extends State<localSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        toolbarHeight: 160,
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Image.asset('assets/장바구니 (누런녹색).png'),
            onPressed: () {},
          )
        ],
        title: Column(
          children: [
            Container(
              width: double.infinity,
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
              child: Text('access'),
            )
          ],
        ),
      ),
    );
  }
}
