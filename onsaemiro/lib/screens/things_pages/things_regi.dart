import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/product/product_list.dart';
import 'package:onsaemiro/screens/access_pages/product_confirm.dart';
import 'package:onsaemiro/screens/main_pages/myinfo_sub/edit_info.dart';
import 'package:onsaemiro/store/store_regist.dart';

Widget StoreBox(width, height, name, image, func1) {
  return Padding(
    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: Container(
      height: height * 0.15,
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
                    '상품 수정하기',
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

class thingsRegiPage extends StatefulWidget {
  late String name;
  late String DocId;
  List<Product> products = [];
  thingsRegiPage(this.name, this.DocId, this.products);

  @override
  _thingsRegiPageState createState() =>
      _thingsRegiPageState(this.name, this.DocId, this.products);
}

class _thingsRegiPageState extends State<thingsRegiPage> {
  _thingsRegiPageState(this._name, this._DocId, this._products);
  late String _name;
  late String _image;
  late String _DocId;
  List<Product> _products = [];
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
          '$_name\n상품 등록목록',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Color(0xff595959)),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(
            //   height: 21,
            // ),
            SizedBox(
              height: height * 0.63,
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: _products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return StoreBox(width, height, _products[index].name,
                        _products[index].image, () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => productConfirmPage(
                                  _products[index].name, _name)));
                    });
                  }),
            ),
            Container(
              height: 1,
              width: width,
              color: Colors.green,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '상품등록',
                  style: TextStyle(
                      fontSize: width * 0.05, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  width: 44,
                  height: 44,
                  child: FloatingActionButton(
                    elevation: 0.0,
                    backgroundColor: Color.fromRGBO(196, 196, 196, 0.7),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  StoreRegist(_name, _DocId)));
                    },
                    child: Icon(
                      Icons.add,
                      size: 19,
                      color: Color.fromRGBO(89, 89, 89, 0.6),
                    ),
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: 9,
            // ),
            // Container(
            //   width: 110,
            //   height: 41,
            //   child: OutlinedButton(
            //     style: OutlinedButton.styleFrom(
            //       shape: RoundedRectangleBorder(
            //           borderRadius: BorderRadius.circular(26.5)),
            //       side: BorderSide(width: 2.0, color: Colors.green),
            //     ),
            //     child: Text(
            //       '등록하기',
            //       style: TextStyle(color: Color(0xff595959), fontSize: 13),
            //     ),
            //     onPressed: () {},
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
