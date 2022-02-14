import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/product/product_list.dart';
import 'package:onsaemiro/product/shop.dart';
import 'package:onsaemiro/screens/access_pages/product_registration.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';
import 'package:onsaemiro/screens/main_pages/controller/cart_controller.dart';
import 'package:onsaemiro/screens/things_pages/thingsShopProduct.dart';
import 'package:onsaemiro/screens/things_pages/thingsShop_introduce.dart';

class thingsShopAdminPage extends StatefulWidget {
  const thingsShopAdminPage({Key? key}) : super(key: key);

  @override
  _thingsShopAdminPageState createState() => _thingsShopAdminPageState();
}

class _thingsShopAdminPageState extends State<thingsShopAdminPage> {
  final CartController c = Get.put(CartController());
  bool isClothings = false;
  bool isLife = false;
  bool isFood = true;

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _shopStream =
        FirebaseFirestore.instance.collection('shops').snapshots();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 0,
        toolbarHeight: height * 0.2586,
        backgroundColor: Colors.white,
        actions: [],
        elevation: 0.5,
        title: Column(
          children: [
            SizedBox(
              height: height * 0.06,
            ),
            Row(
              children: [
                Container(
                  width: width * 0.8,
                  height: height * 0.0381,
                  child: TextField(
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
                              size: width * 0.036,
                            )),
                        hintText: '상품검색',
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
                  'things',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      color: Color.fromRGBO(162, 191, 98, 1)),
                )
              ],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: Text(
                    'Clothings',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: (isClothings & !isFood)
                            ? Color.fromRGBO(89, 89, 89, 1)
                            : Color.fromRGBO(89, 89, 89, 0.5),
                        fontSize: 15),
                  ),
                  onPressed: () {
                    setState(() {
                      isClothings = true;
                      isFood = false;
                    });
                  },
                ),
                TextButton(
                  child: Text(
                    'Life',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: (isLife & !isClothings)
                            ? Color.fromRGBO(89, 89, 89, 1)
                            : Color.fromRGBO(89, 89, 89, 0.5),
                        fontSize: 15),
                  ),
                  onPressed: () {
                    setState(() {
                      isLife = true;
                      isClothings = false;
                    });
                  },
                ),
                TextButton(
                  child: Text(
                    'Food',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: (!isClothings & !isLife)
                            ? Color.fromRGBO(89, 89, 89, 1)
                            : Color.fromRGBO(89, 89, 89, 0.5),
                        fontSize: 15),
                  ),
                  onPressed: () {
                    setState(() {
                      isClothings = false;
                      isLife = false;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
          child: Center(
              child: Column(children: [
        SizedBox(
          height: 20,
        ),
        if (!isClothings & !isLife)
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
                  Shop shopModel =
                      Shop.fromJson(element.data() as Map<String, dynamic>);
                  Shops.add(shopModel);
                  print(Shops[0].name);
                }

                return SizedBox(
                  height: height * 0.58,
                  width: width * 0.72,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0,
                        crossAxisSpacing: 30,
                      ),
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
                                  child: Text('오류가 발생했습니다.'),
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
                              return Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    thingsShopIntroducePage(
                                                        Shops[index].name,
                                                        Shops[index].image,
                                                        products)));
                                      },
                                      child: Container(
                                        height: height * 0.12,
                                        width: width * 0.28,
                                        child: Image.network(
                                          Shops[index].image,
                                          fit: BoxFit.fitWidth,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          // image: DecorationImage(
                                          //     image: NetworkImage(
                                          //         Shops[index].image)),
                                          border: Border.all(
                                              color: Colors.lightGreen),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GridTile(
                                      child: Center(
                                    child: Text(Shops[index].name),
                                  ))
                                ],
                              );
                            });
                      }),
                );
              })
      ]))),
      floatingActionButton: Container(
        width: 58,
        height: 58,
        child: FloatingActionButton(
          elevation: 0.0,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => thingsShopRegiPage()));
          },
          child: Text(
            '상품등록',
            style: TextStyle(
                color: Colors.black, fontSize: 11, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.white,
          shape: StadiumBorder(
              side: BorderSide(
            width: 3,
            color: Color.fromRGBO(108, 205, 108, 1),
          )),
        ),
      ),
    );
  }
}
