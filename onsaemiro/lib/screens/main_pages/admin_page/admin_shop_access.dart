import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:onsaemiro/product/shop.dart';

class AdminShopAccess extends StatefulWidget {
  const AdminShopAccess({Key? key}) : super(key: key);

  @override
  _AdminShopAccessState createState() => _AdminShopAccessState();
}

class _AdminShopAccessState extends State<AdminShopAccess> {
  _shopItem(String name, String imageURL) {
    return Column(
      children: [
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.lightGreen),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text(name),
                SizedBox(width: 100),
                Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover, image: NetworkImage(imageURL)))),
              ],
            ),
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
                              return _shopItem(shop.name, shop.businessimage);
                            }),
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
