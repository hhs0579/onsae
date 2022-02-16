import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/product/product_list.dart';
import 'package:onsaemiro/product/shop.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';
import 'package:onsaemiro/screens/main_pages/controller/cart_controller.dart';
import 'package:onsaemiro/screens/things_pages/thingsShop_introduce.dart';

class accessSearchPage extends StatefulWidget {
  String str;
  accessSearchPage(this.str);
  @override
  _accessSearchPageState createState() => _accessSearchPageState(this.str);
}

class _accessSearchPageState extends State<accessSearchPage> {
  String _str;
  _accessSearchPageState(this._str);
  final _searchController = TextEditingController();

  final shopReference = FirebaseFirestore.instance.collection('shops');

  @override
  Widget build(BuildContext context) {
    controlSearching(search) {
      print(search);
      setState(() {
        _str = search;
      });
    }

    Stream<QuerySnapshot> SearchResults = FirebaseFirestore.instance
        .collection('shops')
        .where('name', isLessThanOrEqualTo: _str)
        .snapshots();
    final CartController c = Get.put(CartController());
    final Stream<QuerySnapshot> _shopStream =
        FirebaseFirestore.instance.collection('shops').snapshots();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    dispalyShopFoundScreen() {
      return StreamBuilder<dynamic>(
        stream: SearchResults,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text(
                '오류가 발생했습니다.',
                style: TextStyle(color: Colors.black),
              ),
            );
          }
          if (snapshot.data == null) {
            return Container();
          }
          List<ShopResult> searchShopResult = [];
          for (var element in snapshot.data!.docs) {
            Shop shop = Shop.fromJson(element.data() as Map<String, dynamic>);
            if (shop.isaccess == '승인완료' && shop.type == '비건') {
              ShopResult shopResult = ShopResult(shop);
              print(shop.name);
              searchShopResult.add(shopResult);
            }
          }
          if (searchShopResult.isEmpty) {
            return Center(
                child: Text(
              '검색 결과가 없습니다.',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                  color: Color.fromRGBO(162, 191, 98, 1)),
            ));
          } else {
            return ListView(
              children: searchShopResult,
            );
          }
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
          leadingWidth: 0,
          toolbarHeight: height * 0.2,
          backgroundColor: Colors.white,
          actions: [],
          elevation: 0.5,
          title: Column(children: [
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              children: [
                Container(
                  width: width * 0.77,
                  height: height * 0.04,
                  child: TextFormField(
                    controller: _searchController,
                    onFieldSubmitted: controlSearching,
                    style: TextStyle(fontSize: width * 0.029),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color.fromRGBO(162, 191, 98, 0.2),
                        contentPadding:
                            EdgeInsets.symmetric(vertical: height * 0.008),
                        prefixIcon: IconButton(
                            padding: EdgeInsets.symmetric(
                                vertical: height * 0.008, horizontal: 11),
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: Color.fromRGBO(162, 191, 98, 1),
                              size: width * 0.03,
                            )),
                        hintText: '상점검색',
                        hintStyle: TextStyle(
                            fontSize: width * 0.029,
                            color: Color.fromRGBO(162, 191, 98, 0.5)),
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
                  icon: Icon(Icons.shopping_cart),
                  color: Color.fromRGBO(162, 191, 98, 1),
                  onPressed: () {
                    Get.to(shoppingBagPage(c.allList));
                  },
                ),
              ],
            ),
            Container(
                child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  onPressed: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
                  icon: Icon(Icons.navigate_before),
                  color: Color.fromRGBO(162, 191, 98, 1),
                  iconSize: 25,
                ),
                SizedBox(
                  width: width * 0.231,
                ),
                Text(
                  'access',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      color: Color.fromRGBO(162, 191, 98, 1)),
                )
              ],
            )),
          ])),
      body: dispalyShopFoundScreen(),
    );
  }
}

class ShopResult extends StatelessWidget {
  final Shop eachShop;
  ShopResult(this.eachShop);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('shops')
            .doc(eachShop.docId)
            .collection('products')
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Center(
              child: Text('오류가 발생했습니다.'),
            );
          }
          if (snapshot.data == null) {
            return Container();
          }
          List<Product> products = [];
          for (var element in snapshot.data!.docs) {
            Product productModel =
                Product.fromJson(element.data() as Map<String, dynamic>);
            products.add(productModel);
          }
          return Padding(
              padding: EdgeInsets.all(3),
              child: Container(
                child: Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => thingsShopIntroducePage(
                                    eachShop, products)));
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: eachShop.image == ''
                                ? CachedNetworkImageProvider(
                                    'https://firebasestorage.googleapis.com/v0/b/onsaemiro-3cd5d.appspot.com/o/Product%2F%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C.jpg?alt=media&token=834ff6af-54ad-4ffd-a2ce-9987b7056dfb')
                                : CachedNetworkImageProvider(eachShop.image)),
                        title: Text(eachShop.name),
                      ),
                    )
                  ],
                ),
              ));
        });
  }
}
