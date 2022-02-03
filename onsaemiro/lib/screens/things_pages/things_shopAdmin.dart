import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/product/product_list.dart';
import 'package:onsaemiro/screens/access_pages/product_registration.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';
import 'package:onsaemiro/screens/main_pages/controller/cart_controller.dart';
import 'package:onsaemiro/screens/things_pages/things_information.dart';

class thingsShopAdminPage extends StatefulWidget {
  const thingsShopAdminPage({Key? key}) : super(key: key);

  @override
  _thingsShopAdminPageState createState() => _thingsShopAdminPageState();
}

List<String> items = List.generate(20, (i) {
  return '망넛이네';
});

foodBox() {
  return Container(
      height: 90,
      width: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(image: AssetImage('assets/mangnut.png')),
        border: Border.all(color: Colors.lightGreen),
      ));
}

class _thingsShopAdminPageState extends State<thingsShopAdminPage> {
  final CartController c = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        toolbarHeight: 160,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            padding: EdgeInsets.fromLTRB(10, 10, 30, 84),
            icon: Icon(Icons.shopping_cart),
            color: Color.fromRGBO(162, 191, 98, 1),
            onPressed: () {
              Get.to(shoppingBagPage(c.allList));
            },
          ),
        ],
        elevation: 0.5,
        title: Column(
          children: [
            Container(
              height: 44,
              child: TextField(
                style: TextStyle(fontSize: 11),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Color.fromRGBO(162, 191, 98, 0.2),
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                    prefixIcon: IconButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 11),
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Color.fromRGBO(162, 191, 98, 1),
                          size: 20,
                        )),
                    hintText: '상품검색',
                    hintStyle: TextStyle(
                        fontSize: 14, color: Color.fromRGBO(162, 191, 98, 0.5)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(27.0)),
                      borderSide: BorderSide(color: Color(0xffffffff)),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(27.0)),
                        borderSide: BorderSide(color: Color(0xffA2BF62)))),
              ),
            ),
            Container(
                child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.fromLTRB(20, 20, 80, 34),
                  onPressed: () {},
                  icon: Icon(Icons.navigate_before),
                  color: Color.fromRGBO(162, 191, 98, 1),
                  iconSize: 25,
                ),
                Text(
                  'things',
                  style: TextStyle(
                      fontSize: 36, color: Color.fromRGBO(162, 191, 98, 1)),
                )
              ],
            ))
          ],
        ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
        ),
        itemCount: items.length,
        itemBuilder: (context, i) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => thingsInformationPage()));
                  },
                  child: Container(
                    height: 90,
                    width: 105,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: AssetImage('assets/mangnut.png')),
                      border: Border.all(color: Colors.lightGreen),
                    ),
                  ),
                ),
              ),
              GridTile(
                child: Center(
                  child: Text(items[i]),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: Container(
        width: 58,
        height: 58,
        child: FloatingActionButton(
          elevation: 0.0,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => productRegistrationPage()));
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
