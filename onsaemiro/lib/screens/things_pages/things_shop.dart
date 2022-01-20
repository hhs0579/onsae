import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';

class thingsShopPage extends StatefulWidget {
  const thingsShopPage({Key? key}) : super(key: key);

  @override
  _thingsShopPageState createState() => _thingsShopPageState();
}

final List<String> items = List.generate(20, (i) {
  return '가게이름';
});

class _thingsShopPageState extends State<thingsShopPage> {
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
                Get.to(shoppingBagPage());
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
                          fontSize: 14,
                          color: Color.fromRGBO(162, 191, 98, 0.5)),
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
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: items.length,
          itemBuilder: (context, i) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                border: Border.all(color: Colors.lightGreen),
              ),
              child: GridTile(
                child: Center(
                  child: Text(items[i]),
                ),
              ),
            );
          },
        ));
  }
}
