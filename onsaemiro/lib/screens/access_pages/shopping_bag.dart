import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:onsaemiro/product/product_list.dart';
import 'package:onsaemiro/screens/things_pages/things_information.dart';
import 'package:shared_preferences/shared_preferences.dart';

total(product_num, price) {
  int total_price = product_num * price;
  return NumberFormat('###,###,###,###')
      .format(total_price)
      .replaceAll(' ', '');
}

class shoppingBagPage extends StatefulWidget {
  List<Product> cartlist = [];
  shoppingBagPage(this.cartlist);
  @override
  _shoppingBagPageState createState() => _shoppingBagPageState(cartlist);
}

class _shoppingBagPageState extends State<shoppingBagPage> {
  _shoppingBagPageState(this._cartlist);
  List<Product> _cartlist;
  bool total_check = false;
  List<bool> _isChecked = [];

  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(_cartlist.length, false);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
                height: 25,
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
                    width: 321,
                    height: 31,
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
                                size: 15,
                              )),
                          hintText: '상품검색',
                          hintStyle: TextStyle(
                              fontSize: 11,
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
                    padding: EdgeInsets.fromLTRB(5, 33, 85, 34),
                    onPressed: () {
                      setState(() {
                        (context) => shoppingBagPage(_cartlist);
                        Navigator.of(context).pop();
                      });
                    },
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.lightGreen, width: 2),
                        top: BorderSide(color: Colors.lightGreen, width: 2))),
                child: Row(
                  children: [
                    Checkbox(
                      //fillColor: ,
                      value: total_check,
                      onChanged: (value) {
                        setState(() {
                          total_check = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 470,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _cartlist.length,
                  itemBuilder: (context, index) {
                    var item = _cartlist[index];
                    return Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Container(
                        height: 144,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.lightGreen),
                                top: BorderSide(color: Colors.lightGreen))),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                  value: _isChecked[index],
                                  onChanged: (val) {
                                    setState(
                                      () {
                                        _isChecked[index] = val!;
                                      },
                                    );
                                  },
                                ),
                                Text(
                                  item.name,
                                  style: TextStyle(fontSize: 11),
                                ),
                                SizedBox(
                                  width: 235,
                                ),
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        _cartlist.remove(item);
                                      });
                                    },
                                    icon: ImageIcon(
                                      AssetImage('assets/X.png'),
                                      color: Colors.lightGreen,
                                    ))
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 78,
                                  height: 94,
                                  child:
                                      Image(image: AssetImage(item.image_url)),
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 57,
                                    ),
                                    Container(
                                        width: 69,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.7),
                                                blurRadius: 1,
                                                offset: Offset(0, 0),
                                              )
                                            ],
                                            border:
                                                Border.all(color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(18.5)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            IconButton(
                                                padding: EdgeInsets.zero,
                                                constraints: BoxConstraints(),
                                                onPressed: () {
                                                  setState(() {
                                                    item.num = item.num - 1;
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.remove,
                                                  size: 7,
                                                )),
                                            Text(
                                              '${item.num}',
                                              style: TextStyle(fontSize: 13),
                                            ),
                                            IconButton(
                                                padding: EdgeInsets.zero,
                                                constraints: BoxConstraints(),
                                                onPressed: () {
                                                  setState(() {
                                                    item.num = item.num + 1;
                                                  });
                                                },
                                                icon: Icon(
                                                  Icons.add,
                                                  size: 7,
                                                )),
                                          ],
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  width: 157,
                                ),
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 68,
                                    ),
                                    Text('${total(item.num, item.price)}원'),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container()
          ],
        ),
      ),
    );
  }
}
