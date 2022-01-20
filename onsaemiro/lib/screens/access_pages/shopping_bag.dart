import 'package:flutter/material.dart';

class shoppingBagPage extends StatefulWidget {
  const shoppingBagPage({Key? key}) : super(key: key);

  @override
  _shoppingBagPageState createState() => _shoppingBagPageState();
}

class _shoppingBagPageState extends State<shoppingBagPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        toolbarHeight: 160,
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
                    width: 18,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          blurRadius: 4.0,
                          offset: Offset(0.0, 0.0))
                    ], borderRadius: BorderRadius.circular(20)),
                    width: 300,
                    height: 44,
                    child: TextField(
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          prefixIcon: IconButton(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 11),
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: Color.fromRGBO(89, 89, 89, 1),
                                size: 20,
                              )),
                          hintText: '상품검색',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(89, 89, 89, 0.5)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(27.0)),
                            borderSide: BorderSide(
                              color: Color.fromRGBO(255, 255, 255, 0.2),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(27.0)),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(89, 89, 89, 0.5)))),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    padding: EdgeInsets.fromLTRB(5, 33, 79, 34),
                    onPressed: () {},
                    icon: Icon(Icons.chevron_left, color: Colors.green),
                    iconSize: 30,
                  ),
                  Text(
                    '장바구니',
                    style: TextStyle(
                        fontSize: 36,
                        color: Color.fromRGBO(89, 89, 89, 1),
                        fontWeight: FontWeight.w700),
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
