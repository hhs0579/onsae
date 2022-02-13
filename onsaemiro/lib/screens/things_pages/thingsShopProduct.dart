import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/product/product_list.dart';
import 'package:onsaemiro/product/shop.dart';
import 'package:onsaemiro/screens/things_pages/things_regi.dart';

class thingsShopRegiPage extends StatefulWidget {
  const thingsShopRegiPage({Key? key}) : super(key: key);

  @override
  _thingsShopRegiPageState createState() => _thingsShopRegiPageState();
}

class _thingsShopRegiPageState extends State<thingsShopRegiPage> {
  // List<Shop> Shops = [Shop(name: '망넛이네', image_url: 'assets/mangnut.png')];
  final Stream<QuerySnapshot> _shopStream =
      FirebaseFirestore.instance.collection('shops').snapshots();
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 130,
          shape: Border(bottom: BorderSide(color: Colors.green)),
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset('assets/Vector(진한녹색).png'),
            iconSize: 12,
          ),
          backgroundColor: Colors.white,
          title: Text(
            '내 상점 목록',
            style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: Color(0xff595959)),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
            child: Center(
          child: Column(children: [
            SizedBox(
              height: 550,
              child: Column(
                children: [
                  StreamBuilder<QuerySnapshot>(
                      stream: _shopStream,
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
                        List<Shop> Shops = [];
                        for (var element in snapshot.data!.docs) {
                          Shop shopModel = Shop.fromJson(
                              element.data() as Map<String, dynamic>);
                          Shops.add(shopModel);
                          print(Shops[0].name);
                        }
                        return SizedBox(
                            height: height * 0.4,
                            child: ListView.builder(
                                itemCount: Shops.length,
                                itemBuilder: (context, index) {
                                  Shop shop = Shops.elementAt(index);
                                  return StreamBuilder<QuerySnapshot>(
                                      stream: FirebaseFirestore.instance
                                          .collection('shops')
                                          .doc(Shops[index].name)
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
                                        for (var element
                                            in snapshot.data!.docs) {
                                          Product productModel =
                                              Product.fromJson(element.data()
                                                  as Map<String, dynamic>);
                                          products.add(productModel);
                                          print(products[0].name);
                                        }
                                        return StoreBox(
                                            width, shop.name, shop.image, () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      thingsRegiPage(
                                                          Shops[index].name,
                                                          products)));
                                        });
                                      });
                                }));
                      }),
                  // SizedBox(
                  //   height: Shops.length * 105,
                  //   child: ListView.builder(
                  //       scrollDirection: Axis.vertical,
                  //       itemCount: Shops.length,
                  //       itemBuilder: (BuildContext context, int index) {
                  //         return StoreBox(
                  //             width, Shops[index].name, Shops[index].image_url,
                  //             () {
                  //           Navigator.push(
                  //               context,
                  //               MaterialPageRoute(
                  //                   builder: (context) =>
                  //                       productRegistrationPage()));
                  //         });
                  //       }),
                  // ),
                ],
              ),
            ),
          ]),
        )));
  }
}

Widget StoreBox(width, name, image, func1) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: Container(
      height: 100,
      width: width,
      decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // SizedBox(
          //   width: 10,
          // ),
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(108, 205, 108, 1)),
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.scaleDown),
            ),
          ),
          SizedBox(
            width: width * 0.3,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                onPressed: func1,
                child: Container(
                  width: width * 0.20,
                  height: 25,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(108, 205, 108, 0.5),
                      border:
                          Border.all(color: Color.fromRGBO(108, 205, 108, 1)),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    '상품 등록하기',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
