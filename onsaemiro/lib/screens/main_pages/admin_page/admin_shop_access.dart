import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/product/shop.dart';

class AdminShopAccess extends StatefulWidget {
  const AdminShopAccess({Key? key}) : super(key: key);

  @override
  _AdminShopAccessState createState() => _AdminShopAccessState();
}

class _AdminShopAccessState extends State<AdminShopAccess> {
  _shopItem(Shop shop) {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          height: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color(0xff6CCD6C)),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                      width: 120,
                      child: Text(shop.name,
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 15))),
                  SizedBox(width: 50),
                  Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(shop.businessimage)))),
                ],
              ),
              SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  width: 100,
                  height: 40,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.5)),
                      side: BorderSide(width: 2.0, color: Color(0xff6CCD6C)),
                    ),
                    child: Text(
                      '승인하기',
                      style: TextStyle(color: Colors.black, fontSize: 13),
                    ),
                    onPressed: () {
                      FirebaseFirestore.instance
                          .collection('shops')
                          .doc(shop.docId)
                          .update({'isaccess': '승인완료'});
                    },
                  ),
                ),
                SizedBox(width: 20),
                Container(
                  width: 100,
                  height: 40,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Color(0xff6CCD6C),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.5)),
                    ),
                    child: Text(
                      '삭제하기',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    onPressed: () {
                      Get.defaultDialog(
                        cancelTextColor: Color(0xff3AAFFC),
                        title: '',
                        content: Text('정말 삭제하시겠습니까?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection('shops')
                                  .doc(shop.docId)
                                  .delete();
                              Get.back();
                            },
                            child: Text('확인'),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text('취소'),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ])
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _shopStream = FirebaseFirestore.instance
        .collection('shops')
        .where('isaccess', isEqualTo: '승인대기')
        .snapshots();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.1,
          backgroundColor: Colors.white,
          title: Text(
            '상품 개설 승인',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Color(0xff595959)),
          ),
          centerTitle: true,
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20),
                StreamBuilder<QuerySnapshot>(
                    stream: _shopStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return Center(child: Text('오류가 발생했습니다.'));
                      }
                      if (snapshot.data == null) {
                        print('null');
                        return Container();
                      }
                      List<Shop> shoplist = [];

                      for (var value in snapshot.data!.docs) {
                        Shop shop =
                            Shop.fromJson(value.data() as Map<String, dynamic>);
                        if (shop.isaccess == '승인대기') {
                          shoplist.add(shop);
                        }
                      }

                      return Container(
                        height: height * 0.9,
                        child: ListView.builder(
                            itemCount: shoplist.length,
                            itemBuilder: (context, index) {
                              Shop shop = shoplist.elementAt(index);
                              return _shopItem(shop);
                            }),
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
