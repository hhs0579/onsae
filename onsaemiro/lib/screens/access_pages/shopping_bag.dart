import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';
import 'package:onsaemiro/product/product_list.dart';
import 'package:onsaemiro/screens/main_pages/controller/cart_controller.dart';
import 'package:onsaemiro/screens/things_pages/things_information.dart';
import 'package:shared_preferences/shared_preferences.dart';

total(product_num, price) {
  int total_price = product_num * price;
  return NumberFormat('###,###,###,###')
      .format(total_price)
      .replaceAll(' ', '');
}

class shoppingBagPage extends StatefulWidget {
  final CartController c = Get.put(CartController());
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
  int counter = 0;
  int Pricetotal = 0;
  @override
  void initState() {
    super.initState();
    _isChecked = List<bool>.filled(_cartlist.length, false);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        toolbarHeight: height * 0.2,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Center(
          child: Column(
            children: [
              SizedBox(height: height * 0.062),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.07,
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          blurRadius: 4.0,
                          offset: Offset(0.0, 0.0))
                    ], borderRadius: BorderRadius.circular(20)),
                    width: 321,
                    height: height * 0.04,
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
                        Navigator.of(context).pop();
                      });
                    },
                    icon: Icon(Icons.chevron_left, color: Colors.green),
                    iconSize: 30,
                  ),
                  Text(
                    '장바구니',
                    style: TextStyle(
                        fontSize: 32,
                        color: Color.fromRGBO(89, 89, 89, 1),
                        fontWeight: FontWeight.w700),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Container(
              height: height * 0.049,
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
                        if (total_check = value) {
                          for (var i = 0; i < _cartlist.length; i++) {
                            _isChecked[i] = true;
                          }
                        } else {
                          for (var i = 0; i < _cartlist.length; i++) {
                            _isChecked[i] = false;
                          }
                        }
                        if (total_check = value) {
                          for (var i = 0; i < _cartlist.length; i++) {
                            counter += _cartlist[i].num;
                            Pricetotal += _cartlist[i].num * _cartlist[i].price;
                          }
                        } else {
                          counter = 0;
                          Pricetotal = 0;
                        }
                      });
                    },
                  ),
                  Text(
                    '전체선택',
                    style: TextStyle(fontSize: 13),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: height * 0.56,
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
                                onChanged: (value) {
                                  setState(
                                    () {
                                      _isChecked[index] = value!;
                                      if (_isChecked[index] = value) {
                                        counter += item.num;
                                        Pricetotal += item.num * item.price;
                                      } else {
                                        counter -= item.num;
                                        Pricetotal -= item.num * item.price;
                                        total_check = false;
                                      }
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
                                child: Image(image: AssetImage(item.image_url)),
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
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.7),
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
                                                  if (_isChecked[index] =
                                                      true) {
                                                    item.num = item.num - 1;
                                                    counter -= 1;
                                                    Pricetotal -= item.price;
                                                  }
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
                                                  if (_isChecked[index] =
                                                      true) {
                                                    item.num = item.num + 1;
                                                    counter += 1;
                                                    Pricetotal += item.price;
                                                  }
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
          Container(
            height: height * 0.06,
            color: Color.fromRGBO(89, 89, 89, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(width * 0.11, 0, 0, 0),
                  child: Text(
                    '선택 상품 개수',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, width * 0.11, 0),
                  child: Text(
                    '${counter}개',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                )
              ],
            ),
          ),
          Container(
              height: height * 0.081,
              color: Color.fromRGBO(108, 205, 108, 1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          '${NumberFormat('###,###,###,###').format(Pricetotal).replaceAll(' ', '')}원 결제하기',
                          style: TextStyle(color: Colors.white, fontSize: 24)),
                    ],
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
