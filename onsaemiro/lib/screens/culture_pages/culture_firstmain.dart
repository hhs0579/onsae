import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/screens/culture_pages/act_confirm.dart';
import 'package:onsaemiro/screens/culture_pages/culture_weekly.dart';
import 'package:onsaemiro/screens/culture_pages/flea_market.dart';

class culture_firstPage extends StatefulWidget {
  const culture_firstPage({Key? key}) : super(key: key);

  @override
  _culture_firstPageState createState() => _culture_firstPageState();
}

culture_Stack(name, double left, whichPicture, onTap) {
  return Stack(
    children: [
      Positioned(
        top: 100,
        left: left,
        child: Center(
          child: Column(
            children: [
              Text(
                name,
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
      Ink(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(whichPicture), fit: BoxFit.fill),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          onTap: onTap,
          child: Container(
            height: 140,
            width: 310,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
          ),
        ),
      ),
    ],
  );
}

class _culture_firstPageState extends State<culture_firstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 8,
        toolbarHeight: 170,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 300,
                  height: 44,
                  child: TextField(
                    style: TextStyle(fontSize: 14),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        filled: true,
                        fillColor: Color.fromRGBO(67, 123, 86, 0.2),
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                        prefixIcon: IconButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 11),
                            onPressed: () {},
                            icon: Icon(
                              Icons.search,
                              color: Color.fromRGBO(67, 123, 86, 1),
                              size: 20,
                            )),
                        hintText: '상품검색',
                        hintStyle: TextStyle(
                          fontSize: 14,
                          color: Color.fromRGBO(67, 123, 86, 0.5),
                        ),
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
                  icon: Icon(Icons.shopping_cart, color: Colors.lightGreen),
                  onPressed: () {},
                ),
              ],
            ),
            Container(
                child: Row(
              children: [
                IconButton(
                  padding: EdgeInsets.fromLTRB(10, 33, 90.59, 34),
                  icon: Icon(Icons.chevron_left, color: Colors.green, size: 30),
                  onPressed: () {
                    setState(() {
                      Navigator.of(context).pop();
                    });
                  },
                ),
                Text(
                  'culture',
                  style: TextStyle(
                    fontSize: 36,
                    color: Color.fromRGBO(67, 123, 86, 1),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 46,
              ),
              culture_Stack('주간베스트', 107, 'assets/bb.jpeg', () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => weeklyBestPage()));
              }),
              SizedBox(
                height: 20,
              ),
              culture_Stack('act. 활동인증', 93, 'assets/cc.jpg', () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => actConfirmPage()));
              }),
              SizedBox(
                height: 20,
              ),
              culture_Stack('온새미로 플리마켓', 75, 'assets/dd.jpg', () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => fleaMarketPage()));
              })
            ],
          ),
        ),
      ),
    );
  }
}
