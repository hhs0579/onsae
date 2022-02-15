import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/screens/access_pages/accessSearch.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';
import 'package:onsaemiro/screens/main_pages/controller/cart_controller.dart';

import 'local_Seoul.dart';

class localSelectPage extends StatefulWidget {
  const localSelectPage({Key? key}) : super(key: key);

  @override
  _localSelectPageState createState() => _localSelectPageState();
}

local_Stack(where, whereInEnglish, whichPicture, onTap, height, width) {
  return Stack(
    children: [
      Positioned(
        top: height * 0.0467,
        left: width * 0.3,
        child: Column(
          children: [
            Text(
              where,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(whereInEnglish,
                style: TextStyle(color: Colors.white, fontSize: 20)),
          ],
        ),
      ),
      Ink(
        padding: EdgeInsets.fromLTRB(0, 19, 0, 19),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(whichPicture),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(Radius.circular(14))),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(14)),
          onTap: onTap,
          child: Container(
            height: height * 0.144,
            width: width * 0.776,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
          ),
        ),
      ),
    ],
  );
}

class _localSelectPageState extends State<localSelectPage> {
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
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 1,
        toolbarHeight: height * 0.197,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: width * 0.8,
                  height: height * 0.0541,
                  child: TextFormField(
                    controller: _searchController,
                    onFieldSubmitted: controlSearching,
                    style: TextStyle(fontSize: 11),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color.fromRGBO(162, 191, 98, 0.2),
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                        prefixIcon: IconButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 11),
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: Color.fromRGBO(162, 191, 98, 1),
                              size: width * 0.04,
                            )),
                        hintText: '상점검색',
                        hintStyle: TextStyle(
                            fontSize: 14,
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
                  icon: Icon(
                    Icons.shopping_cart,
                    color: Color(0xffA2BF62),
                    size: width * 0.056,
                  ),
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
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                  icon: Icon(Icons.navigate_before,
                      color: Color(0xffA2BF62), size: 30),
                  iconSize: 12,
                ),
                SizedBox(
                  width: width * 0.2069,
                ),
                Text(
                  'access',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 36,
                      color: Color.fromRGBO(162, 191, 98, 1)),
                )
              ],
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                local_Stack('\t\t서울', '\t\tSeoul\t', 'assets/seoul.jpg', () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => localSeoulPage()));
                }, height, width),
                SizedBox(
                  height: 14,
                ),
                local_Stack('인천', 'Incheon', 'assets/incheon.jpg', () {},
                    height, width),
                SizedBox(
                  height: 14,
                ),
                local_Stack('\t\t부산', '\t\tBusan', 'assets/busan.jpg', () {},
                    height, width),
                SizedBox(
                  height: 14,
                ),
                local_Stack('\t\t대구', '\t\tDaegu', 'assets/daegu.jpg', () {},
                    height, width),
                SizedBox(
                  height: 14,
                ),
                local_Stack('강원', 'Gangwon', 'assets/gangwon.jpg', () {},
                    height, width),
                SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
