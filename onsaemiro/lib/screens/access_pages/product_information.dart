import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:intl/intl.dart';
import 'package:onsaemiro/product/product_list.dart';

import 'package:onsaemiro/screens/access_pages/product_review.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';
import 'package:onsaemiro/screens/main_pages/controller/cart_controller.dart';

class productInformationPage extends StatefulWidget {
  Product product;
  productInformationPage(this.product);
  @override
  _productInformationPageState createState() =>
      _productInformationPageState(this.product);
}

total(product_num, price) {
  int total_price = product_num * price;
  return NumberFormat('###,###,###,###')
      .format(total_price)
      .replaceAll(' ', '');
}

class _productInformationPageState extends State<productInformationPage> {
  final CartController c = Get.put(CartController());
  Product _product;
  _productInformationPageState(this._product);
  var product_num = 0;
  var price = 2800;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var textScale = MediaQuery.of(context).textScaleFactor;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 0.3386 * height,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(_product.image),
                          fit: BoxFit.fill)),
                ),
                Positioned(
                  left: 39,
                  top: 106,
                  child: Row(
                    children: [
                      IconButton(
                        icon: ImageIcon(
                          AssetImage('assets/Vector(??????).png'),
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
                      height: height * 0.4729,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                              color: Color.fromRGBO(108, 205, 108, 1)),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.02463,
                          ),
                          Text(
                            '${_product.name}',
                            style: TextStyle(fontSize: 24 * textScale),
                          ),
                          SizedBox(
                            height: height * 0.0665,
                          ),
                          Text(
                            '',
                            // '????????? ????????? ?????? ?????? ????????????!\n???????????? ?????? ?????? ??????????????? ????????? ???',
                            style: TextStyle(fontSize: 15 * textScale),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: height * 0.15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 21,
                              ),
                              Text(
                                '??????',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                width: 132,
                              ),
                              Text(
                                '${NumberFormat('###,###,###,###').format(_product.price).replaceAll(' ', '')}???',
                                style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.0197,
                          ),
                          Container(
                              height: 1.0,
                              width: 311,
                              color: Color.fromRGBO(108, 205, 108, 1)),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 21,
                              ),
                              Text(
                                '??????',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                width: 180,
                              ),
                              Container(
                                width: 69,
                                height: height * 0.03078,
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
                                            product_num--;
                                          });
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          size: 7,
                                        )),
                                    Text(
                                      '$product_num',
                                      style: TextStyle(fontSize: 9),
                                    ),
                                    IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: BoxConstraints(),
                                        onPressed: () {
                                          setState(() {
                                            product_num++;
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
                        if (product_num > 0) {
                          var item = _product;

                          c.allList.add(item);
                          setState(() {
                            {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text(
                                        "??????????????? $product_num?????? ?????????\n???????????????.",
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
                                              child: Text('?????? ????????????',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color.fromRGBO(
                                                          89, 89, 89, 1)))),
                                          TextButton(
                                              onPressed: () {
                                                Get.to(
                                                    shoppingBagPage(c.allList));
                                              },
                                              child: Text('??????????????? ??????',
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color: Color.fromRGBO(
                                                          89, 89, 89, 1))))
                                        ],
                                      ),
                                    );
                                  });
                            }
                          });
                        }
                      },
                      child: Text('$product_num??? ??????',
                          style:
                              TextStyle(color: Color.fromRGBO(89, 89, 89, 1)))),
                  SizedBox(
                    width: 58,
                  ),
                  Text('${total(product_num, price)}???')
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text(
                    '?????? ????????????',
                    style: TextStyle(
                        fontSize: 13, color: Color.fromRGBO(89, 89, 89, 1)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => productReviewPage(_product)));
                  },
                ),
                ImageIcon(
                  AssetImage('assets/???????????? ??????.png'),
                  size: 6,
                ),
                SizedBox(
                  width: 70,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
