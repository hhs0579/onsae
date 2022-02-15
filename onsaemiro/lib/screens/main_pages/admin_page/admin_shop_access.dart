import 'package:flutter/material.dart';

class AdminShopAccess extends StatefulWidget {
  const AdminShopAccess({Key? key}) : super(key: key);

  @override
  _AdminShopAccessState createState() => _AdminShopAccessState();
}

class _AdminShopAccessState extends State<AdminShopAccess> {
  @override
  Widget build(BuildContext context) {
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
              ],
            ),
          ),
        ));
  }
}
