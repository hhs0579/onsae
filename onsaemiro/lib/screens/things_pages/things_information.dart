import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import 'package:onsaemiro/screens/access_pages/product_review.dart';

class thingsInformationPage extends StatefulWidget {
  const thingsInformationPage({Key? key}) : super(key: key);

  @override
  _thingsInformationPageState createState() => _thingsInformationPageState();
}

total(num, price) {
  return num * price;
}

class _thingsInformationPageState extends State<thingsInformationPage> {
  var num = 0;
  var price = 1100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 275,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/약콩두유.png'),
                          colorFilter: ColorFilter.mode(
                              Color.fromRGBO(89, 89, 89, 1).withOpacity(0.5),
                              BlendMode.dstATop),
                          fit: BoxFit.fill)),
                ),
                Positioned(
                  left: 39,
                  top: 106,
                  child: Row(
                    children: [
                      IconButton(
                        icon: ImageIcon(
                          AssetImage('assets/Vector(흰색).png'),
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 77.59,
                      ),
                      Text(
                        'access',
                        style: TextStyle(fontSize: 36, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 190, 0, 0),
                    child: Container(
                      width: 311,
                      height: 329,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromRGBO(108, 205, 108, 1)),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '약콩두유 100',
                            style: TextStyle(fontSize: 24),
                          ),
                          SizedBox(
                            height: 167,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 21,
                              ),
                              Text(
                                '가격',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                width: 180,
                              ),
                              Text(
                                '1,100원',
                                style: TextStyle(fontSize: 18),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                              height: 1.0,
                              width: 311,
                              color: Color.fromRGBO(108, 205, 108, 1)),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 21,
                              ),
                              Text(
                                '수량',
                                style: TextStyle(fontSize: 18),
                              ),
                              SizedBox(
                                width: 180,
                              ),
                              Container(
                                width: 69,
                                height: 25,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color.fromRGBO(0, 0, 0, 0.7),
                                        blurRadius: 1,
                                        offset: Offset(0, 0),
                                      )
                                    ],
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(18.5)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                        onPressed: () {
                                          setState(() {
                                            num--;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          size: 7,
                                        )),
                                    Text(
                                      '$num',
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                        onPressed: () {
                                          setState(() {
                                            num++;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 7,
                                        )),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 19,
            ),
            Container(
              width: 311,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color.fromRGBO(108, 205, 108, 1)),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 100,
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(
                                    "장바구니에 $num개의 상품이\n담겼습니다.",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  content: Row(
                                    children: [
                                      SizedBox(
                                        width: 65,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            setState(() {
                                              Navigator.of(context).pop();
                                            });
                                          },
                                          child: Text('쇼핑 계속하기',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color.fromRGBO(
                                                      89, 89, 89, 1)))),
                                      TextButton(
                                          onPressed: () {},
                                          child: Text('장바구니로 이동',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Color.fromRGBO(
                                                      89, 89, 89, 1))))
                                    ],
                                  ),
                                );
                              });
                        });
                      },
                      child: Text('$num개 담기',
                          style:
                              TextStyle(color: Color.fromRGBO(89, 89, 89, 1)))),
                  SizedBox(
                    width: 58,
                  ),
                  Text('${total(num, price)}원')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
