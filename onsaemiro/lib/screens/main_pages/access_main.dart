import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/product/product_list.dart';
import 'package:onsaemiro/screens/access_pages/local_select.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';
import 'package:onsaemiro/screens/main_pages/controller/cart_controller.dart';
import 'package:onsaemiro/screens/main_pages/culture_main.dart';
import 'package:onsaemiro/screens/main_pages/things_main.dart';

class accessMainPage extends StatefulWidget {
  const accessMainPage({Key? key}) : super(key: key);

  @override
  _accessMainPageState createState() => _accessMainPageState();
}

class _accessMainPageState extends State<accessMainPage> {
  final CartController c = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        toolbarHeight: height * 0.176,
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 12),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              color: Colors.grey,
              onPressed: () {
                Get.to(shoppingBagPage(c.allList));
              },
            ),
          )
        ],
        title: Container(
          width: double.infinity,
          height: height * 0.038,
          child: TextField(
            style: TextStyle(fontSize: width * 0.029),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: height * 0.008),
                prefixIcon: IconButton(
                    padding: EdgeInsets.symmetric(
                      vertical: height * 0.008,
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                      size: width * 0.036,
                    )),
                hintText: '상품검색',
                hintStyle: TextStyle(fontSize: width * 0.029),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(27.0)),
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(27.0)),
                    borderSide: BorderSide(color: Colors.grey))),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              // SizedBox(
              //   height: height * 0.076,
              // ),
              Container(
                  padding: EdgeInsets.fromLTRB(115, 0, 115, 20),
                  child: Text(
                    'access',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 36,
                        color: Color(
                          0xff595959,
                        )),
                  )),
              Ink(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/빵.jpeg'), fit: BoxFit.fill),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: InkWell(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  onTap: () {
                    //Get.to(localSelectPage());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => localSelectPage()));
                  },
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    height: height * 0.45,
                    width: width * 0.7,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cultureMainPage()));
                    },
                    child: Text(
                      'culture',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => thingsMainPage()));
                    },
                    child: Text(
                      'things',
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
