import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onsaemiro/product/product_list.dart';
import 'package:onsaemiro/repo/image_service.dart';

class productConfirmPage extends StatefulWidget {
  String productName;
  String shopName;
  productConfirmPage(this.productName, this.shopName);

  @override
  _productConfirmPageState createState() =>
      _productConfirmPageState(this.productName, this.shopName);
}

Imageservice imageservice = Imageservice();
var visibley = false;
final productname = TextEditingController();
final productprice = TextEditingController();
int price = int.parse(productprice.text);
final productinfo = TextEditingController();
final _picker = ImagePicker();
XFile? _image;
String urls = '';

class _productConfirmPageState extends State<productConfirmPage> {
  String _productName;
  String _shopName;
  _productConfirmPageState(this._productName, this._shopName);
  Future _getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = image;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Product itsProduct = Product(
        docId: 'docID',
        name: 'name',
        image: 'image',
        price: 0,
        num: 0,
        Info: 'Info');
    var _productStream = FirebaseFirestore.instance
        .collection('shops')
        .doc(_shopName)
        .collection('products')
        .snapshots();

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 138,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset('assets/Vector(진한녹색).png'),
            iconSize: 12,
          ),
          backgroundColor: Colors.white,
          title: Text(
            '$_productName\n상품 수정하기',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(89, 89, 89, 1),
            ),
          ),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: SingleChildScrollView(
          child: StreamBuilder<QuerySnapshot>(
              stream: _productStream,
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
                var docId;

                for (var element in snapshot.data!.docs) {
                  Product productModel =
                      Product.fromJson(element.data() as Map<String, dynamic>);
                  products.add(productModel);
                  print(products[0].name);
                }

                for (var i = 0; i < products.length; i++) {
                  if (products[i].name == _productName) {
                    itsProduct = products[i];
                  }
                }
                var updateDoc = FirebaseFirestore.instance
                    .doc('/shops/$_shopName/products/${itsProduct.docId}');
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('상품 이미지 수정'),
                          GestureDetector(
                            onTap: () async {
                              _getImage();
                            },
                            child: _image == null
                                ? Container(
                                    width: width * 0.4,
                                    height: height * 0.2,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.green),
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                    ),
                                    child: Image(
                                      image: AssetImage('assets/이미지 추가.png'),
                                      fit: BoxFit.scaleDown,
                                    ))
                                : Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    height: MediaQuery.of(context).size.height *
                                        0.23,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.lightGreen),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: FileImage(
                                                File(_image!.path))))),
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('상품 이름 수정'),
                          Container(
                            width: width * 0.4,
                            height: height * 0.05,
                            child: TextField(
                              controller: productname,
                              textInputAction: TextInputAction.newline,
                              style: TextStyle(fontSize: 11),
                              decoration: InputDecoration(
                                  hintText: '${itsProduct.name}',
                                  hintStyle: TextStyle(fontSize: 11),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('상품 정보 수정'),
                          Container(
                            height: height * 0.2,
                            width: width * 0.4,
                            child: TextField(
                              controller: productinfo,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.newline,
                              maxLines: 36,
                              style: TextStyle(fontSize: 11),
                              decoration: InputDecoration(
                                  hintText: '문구 입력...',
                                  hintStyle: TextStyle(fontSize: 11),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('상품 가격 수정'),
                          Container(
                            width: width * 0.4,
                            height: height * 0.05,
                            child: TextField(
                              controller: productprice,
                              textInputAction: TextInputAction.newline,
                              style: TextStyle(fontSize: 11),
                              decoration: InputDecoration(
                                  // hintText: '${updateDoc.data()}',
                                  hintStyle: TextStyle(fontSize: 11),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(color: Colors.green),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.0)),
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20, left: 20),
                          width: width * 0.9,
                          child: TextButton(
                              onPressed: () async {
                                if (_image == null) {
                                  Fluttertoast.showToast(
                                      msg: "사진을 선택해주세요.",
                                      toastLength: Toast.LENGTH_SHORT,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.lightGreen,
                                      fontSize: 12.0);
                                } else {
                                  urls = await imageservice
                                      .uploadProductImageToStorage(
                                          productname.text, _image!);
                                  setState(() {
                                    visibley = true;
                                  });
                                }
                              },
                              child: Text('사진 등록',
                                  style: TextStyle(color: Colors.white)),
                              style: ElevatedButton.styleFrom(
                                  primary: Color(0xffA2BF62),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(25))))),
                      Visibility(
                        visible: visibley,
                        child: Container(
                            margin: EdgeInsets.only(top: 20, left: 20),
                            width: width * 0.9,
                            child: TextButton(
                                onPressed: () async {
                                  if (productname.text == "") {
                                    Fluttertoast.showToast(
                                        msg: "상품 이름을 입력해주세요.",
                                        toastLength: Toast.LENGTH_SHORT,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.lightGreen,
                                        fontSize: 12.0);
                                  } else if (productprice.text == "") {
                                    Fluttertoast.showToast(
                                        msg: "가격을 입력해주세요.",
                                        toastLength: Toast.LENGTH_SHORT,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.lightGreen,
                                        fontSize: 12.0);
                                  } else if (productinfo.text == "") {
                                    Fluttertoast.showToast(
                                        msg: "상품정보를 입력해주세요.",
                                        toastLength: Toast.LENGTH_SHORT,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.lightGreen,
                                        fontSize: 12.0);
                                  } else if (_image == null) {
                                    Fluttertoast.showToast(
                                        msg: "상품 이미지를 등록해주세요.",
                                        toastLength: Toast.LENGTH_SHORT,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.lightGreen,
                                        fontSize: 12.0);
                                  } else {
                                    updateDoc.update({
                                      'name': productname.text,
                                      'Info': productinfo.text,
                                      'price': price,
                                      'image': urls
                                    });
                                    Navigator.pop(context);
                                  }
                                },
                                child: Text('수정 완료',
                                    style: TextStyle(color: Colors.white)),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xffA2BF62),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                ))),
                      ),
                    ],
                  ),
                );
              }),
        ));
  }
}
