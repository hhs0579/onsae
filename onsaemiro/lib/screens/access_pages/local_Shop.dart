import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/data/appdata.dart';
import 'package:onsaemiro/product/product_list.dart';
import 'package:onsaemiro/product/shop.dart';
import 'package:onsaemiro/screens/access_pages/accessSearch.dart';
import 'package:onsaemiro/screens/access_pages/shop_introduce.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';
import 'package:onsaemiro/screens/culture_pages/weekly.dart';
import 'package:onsaemiro/screens/main_pages/controller/auth_controller.dart';
import 'package:onsaemiro/screens/main_pages/controller/cart_controller.dart';

class localShopPage extends StatefulWidget {
  String local;
  localShopPage(this.local);

  @override
  _localShopPageState createState() => _localShopPageState(this.local);
}

Widget imagestackWidget(
    height, width, shopName, phone, where, insta, image, large, go) {
  return Padding(
    padding: EdgeInsets.fromLTRB(width * 0.027, 0, width * 0.027, 0),
    child: Container(
      height: height * 0.189,
      width: width * 0.408,
      child: Stack(
        children: [
          Positioned(
            top: height * 0.086,
            child: GestureDetector(
              onTap: large,
              child: Container(
                height: height * 0.09,
                width: width * 0.408,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.0123,
                      ),
                      Text(
                        shopName,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 9.5),
                      ),
                      SizedBox(
                        height: height * 0.00369,
                      ),
                      Text(
                        phone,
                        style: TextStyle(fontSize: 8),
                      ),
                      SizedBox(
                        height: height * 0.00369,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.place,
                            color: Color.fromRGBO(89, 89, 89, 1),
                            size: 7,
                          ),
                          Text(where,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 7)),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.00369,
                      ),
                      Text(
                        insta,
                        style: TextStyle(fontSize: 6),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Ink(
            height: height * 0.1256,
            width: width * 0.408,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
                border: Border.all(color: Color.fromRGBO(89, 89, 89, 0.2)),
                borderRadius: BorderRadius.all(Radius.circular(14))),
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(14)),
              onTap: go,
            ),
          ),
        ],
      ),
    ),
  );
}

class _localShopPageState extends State<localShopPage> {
  _localShopPageState(this._local);
  String _local;
  final areas = ['??????', '??????', '??????', '??????', '??????'];
  String _selectedValue = '??????';
  bool isReview = false;
  bool isLotsOfOrder = false;
  bool isDistance = false;
  bool isOnsae = false;

  final CartController c = Get.put(CartController());
  String str = '';
  final _searchController = TextEditingController();
  controlSearching(search) {
    print(search);
    setState(() {
      str = search;
    });
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => accessSearchPage(_searchController.text)));
  }

  @override
  Widget build(BuildContext context) {
    AppData appData = Get.find();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 2,
        toolbarHeight: height * 0.24,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Center(
          child: Column(
            children: [
              SizedBox(height: height * 0.03),
              Row(
                children: [
                  SizedBox(
                    width: width * 0.77,
                    height: height * 0.04,
                    child: TextFormField(
                      controller: _searchController,
                      onFieldSubmitted: controlSearching,
                      style: TextStyle(fontSize: 14),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          filled: true,
                          fillColor: Color.fromRGBO(162, 191, 98, 0.2),
                          contentPadding: EdgeInsets.symmetric(vertical: 8),
                          prefixIcon: IconButton(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              onPressed: () {},
                              icon: Icon(
                                Icons.search,
                                color: Color.fromRGBO(162, 191, 98, 1),
                                size: 20,
                              )),
                          hintText: '????????????',
                          hintStyle: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(162, 191, 98, 0.5)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(27.0)),
                            borderSide: BorderSide(color: Color(0xffffffff)),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(27.0)),
                              borderSide:
                                  BorderSide(color: Color(0xffA2BF62)))),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    color: Colors.lightGreen,
                    onPressed: () {
                      Get.to(shoppingBagPage(c.allList));
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.navigate_before, color: Colors.green),
                    iconSize: 22,
                  ),
                  SizedBox(
                    width: width * 0.2069,
                  ),
                  Text(
                    'access',
                    style: TextStyle(
                        fontSize: 36, color: Color.fromRGBO(162, 191, 98, 1)),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: width * 0.03,
                  ),
                  // Text(
                  //   _local,
                  //   style: TextStyle(fontSize: 15, color: Color(0xff595959)),
                  // ),
                  DropdownButton(
                      value: _local,
                      icon: Icon(Icons.expand_more,
                          size: 22, color: Colors.lightGreen),
                      items: areas.map((String value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          _local = newValue!;
                        });
                      })
                  // IconButton(
                  //     onPressed: () {},
                  // icon: Icon(Icons.expand_more,
                  //     size: 22, color: Colors.lightGreen)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isLotsOfOrder = true;
                          isOnsae = false;
                          isDistance = false;
                          isReview = false;
                        });
                      },
                      child: Text(
                        '?????? ?????????',
                        style: TextStyle(
                            fontSize: 13,
                            color: !isLotsOfOrder
                                ? Color.fromRGBO(89, 89, 89, 0.5)
                                : Color.fromRGBO(89, 89, 89, 1)),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isLotsOfOrder = false;
                          isOnsae = false;
                          isDistance = false;
                          isReview = true;
                        });
                      },
                      child: Text(
                        '?????????',
                        style: TextStyle(
                            fontSize: 13,
                            color: !isReview
                                ? Color.fromRGBO(89, 89, 89, 0.5)
                                : Color.fromRGBO(89, 89, 89, 1)),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isLotsOfOrder = false;
                          isOnsae = false;
                          isDistance = true;
                          isReview = false;
                        });
                      },
                      child: Text(
                        '?????????',
                        style: TextStyle(
                            fontSize: 13,
                            color: !isDistance
                                ? Color.fromRGBO(89, 89, 89, 0.5)
                                : Color.fromRGBO(89, 89, 89, 1)),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isLotsOfOrder = false;
                          isOnsae = true;
                          isDistance = false;
                          isReview = false;
                        });
                      },
                      child: Text(
                        '???????????? ??????',
                        style: TextStyle(
                            fontSize: 13,
                            color: !isOnsae
                                ? Color.fromRGBO(89, 89, 89, 0.5)
                                : Color.fromRGBO(89, 89, 89, 1)),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('shops').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Center(
                  child: Text('????????? ??????????????????.'),
                );
              }
              if (snapshot.data == null) {
                return Container();
              }
              List<Shop> Shops = [];
              for (var element in snapshot.data!.docs) {
                Shop shopModel =
                    Shop.fromJson(element.data() as Map<String, dynamic>);
                if (shopModel.shopAddress.contains(_local) &&
                    shopModel.isaccess == '????????????' &&
                    shopModel.type == '??????') {
                  Shops.add(shopModel);
                  print(Shops[0].name);
                }
              }
              int randomint;
              if (Shops.isEmpty) {
                randomint = 0;
                return Container();
              } else {
                randomint = Random().nextInt(Shops.length);
                return Center(
                  child: Column(
                    children: [
                      Container(
                        height: height * 0.32,
                        width: 234,
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Stack(
                          children: [
                            Positioned(
                              top: height * 0.1392,
                              child: Container(
                                height: height * 0.14,
                                width: 234,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 20,
                                      spreadRadius: 2,
                                    ),
                                  ],
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(14)),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: height * 0.01970,
                                    ),
                                    Text(
                                      Shops[randomint].name,
                                      style: TextStyle(fontSize: 13),
                                    ),
                                    // SizedBox(
                                    //   height: 6,
                                    // ),
                                    Text(
                                      Shops[randomint].phone,
                                      style: TextStyle(fontSize: 11),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(33, 6, 0, 3),
                                      child: Row(
                                        children: [
                                          Icon(Icons.place, size: 11),
                                          Text(Shops[randomint].shopAddress,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 11)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 13),
                                      child: Text(
                                        '', // 'http://wwww.instagram.com/bo.mool_vegan',
                                        style: TextStyle(fontSize: 8),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            StreamBuilder<QuerySnapshot>(
                                stream: FirebaseFirestore.instance
                                    .collection('shops')
                                    .doc(Shops[randomint].docId)
                                    .collection('products')
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasError) {
                                    print(snapshot.error);
                                    return Center(
                                      child: Text('????????? ??????????????????.'),
                                    );
                                  }
                                  if (snapshot.data == null) {
                                    return Container();
                                  }
                                  List<Product> products = [];
                                  for (var element in snapshot.data!.docs) {
                                    Product productModel = Product.fromJson(
                                        element.data() as Map<String, dynamic>);
                                    products.add(productModel);
                                  }
                                  return Ink(
                                    height: height * 0.2032,
                                    width: 234,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              Shops[randomint].image),
                                          fit: BoxFit.cover,
                                        ),
                                        border: Border.all(
                                            color: Color.fromRGBO(
                                                89, 89, 89, 0.2)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(14))),
                                    child: InkWell(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(14)),
                                      onTap: () {
                                        {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      shopIntroducePage(
                                                          Shops[randomint],
                                                          products)));
                                        }
                                      },
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      SizedBox(
                        height: height * 0.21,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: Shops.length,
                            itemBuilder: (context, index) {
                              return StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('shops')
                                      .doc(Shops[index].docId)
                                      .collection('products')
                                      .snapshots(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasError) {
                                      print(snapshot.error);
                                      return Center(
                                        child: Text('????????? ??????????????????.'),
                                      );
                                    }
                                    if (snapshot.data == null) {
                                      return Container();
                                    }
                                    List<Product> products = [];
                                    for (var element in snapshot.data!.docs) {
                                      Product productModel = Product.fromJson(
                                          element.data()
                                              as Map<String, dynamic>);
                                      products.add(productModel);
                                    }
                                    return imagestackWidget(
                                        height,
                                        width,
                                        Shops[index].name,
                                        Shops[index].phone,
                                        Shops[index].shopAddress,
                                        '', //????????? ??????
                                        Shops[index].image, () {
                                      setState(() {
                                        if (randomint == index) {
                                          randomint = randomint;
                                        } else {
                                          randomint = index;
                                        }
                                      });
                                    }, () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  shopIntroducePage(
                                                      Shops[index], products)));
                                    });
                                  });
                            }),
                      )
                    ],
                  ),
                );
              }
            }),
      ),
    );
  }
}
