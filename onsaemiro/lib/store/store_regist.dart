import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:onsaemiro/repo/image_service.dart';
import 'package:onsaemiro/screens/things_pages/thingsShopProduct.dart';
import 'package:onsaemiro/screens/things_pages/things_regi.dart';
import 'package:random_string/random_string.dart';

class StoreRegist extends StatefulWidget {
  String shopName;
  String shopDocId;
  StoreRegist(this.shopName, this.shopDocId);

  @override
  _StoreRegistState createState() =>
      _StoreRegistState(this.shopName, this.shopDocId);
}

class _StoreRegistState extends State<StoreRegist> {
  var visibley = false;
  var key = randomString(16);

  List<String> _arrImageUrls = [];
  final _picker = ImagePicker();
  List<XFile>? imageFileList = [];
  XFile? _image;
  final productname = TextEditingController();
  final productprice = TextEditingController();

  final productinfo = TextEditingController();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  String urls = '';
  String _shopName;
  String _shopDocId;
  _StoreRegistState(this._shopName, this._shopDocId);
  Future _getImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = image;
      }
    });
  }

  productimage() {
    return Flexible(
        fit: FlexFit.tight,
        child: _image == null
            ? ElevatedButton(
                onPressed: () {
                  _getImage();
                },
                child: CircleAvatar(
                  backgroundColor: Color(0xffd6d6d6),
                  radius: 50,
                  child: Icon(
                    Icons.image,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    elevation: 0, shape: CircleBorder()),
              )
            : ElevatedButton(
                onPressed: () {
                  _getImage();
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: MediaQuery.of(context).size.height * 0.23,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.lightGreen),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(File(_image!.path))))),
                style: ElevatedButton.styleFrom(
                    elevation: 0, shape: CircleBorder()),
              ));
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.1,
          backgroundColor: Colors.white,
          title: Text('?????? ??????',
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff6CCD6C))),
          centerTitle: true,
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Row(children: [
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text('?????? ??????',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            color: Color(0xff6CCD6C))),
                  ),
                  productimage()
                ]),
              ),
              Container(
                alignment: Alignment(0, 0),
                height: height * 0.09,
                width: width * 0.9,
                margin: EdgeInsets.only(top: 30, left: 10),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1.0, color: Colors.black12),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child:
                          Icon(Icons.create_rounded, color: Color(0xff6CCD6C)),
                    ),
                    Container(
                      width: 60,
                      child: Text("?????? ??????",
                          style: TextStyle(
                            color: Color(0xff6CCD6C),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: TextField(
                          controller: productname,
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment(0, 0),
                height: height * 0.09,
                width: width * 0.9,
                margin: EdgeInsets.only(top: 30, left: 10),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1.0, color: Colors.black12),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child:
                          Icon(Icons.create_rounded, color: Color(0xff6CCD6C)),
                    ),
                    Container(
                      width: 60,
                      child: Text("?????? ??????",
                          style: TextStyle(
                            color: Color(0xff6CCD6C),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: TextField(
                          keyboardType: TextInputType.number,
                          controller: productprice,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                alignment: Alignment(0, 0),
                height: height * 0.09,
                width: width * 0.9,
                margin: EdgeInsets.only(top: 30, left: 10),
                padding: EdgeInsets.only(left: 20, right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 1.0, color: Colors.black12),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 20),
                      child:
                          Icon(Icons.create_rounded, color: Color(0xff6CCD6C)),
                    ),
                    Container(
                      width: 60,
                      child: Text("?????? ??????",
                          style: TextStyle(
                            color: Color(0xff6CCD6C),
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: TextField(
                          controller: productinfo,
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 12),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  width: width * 0.9,
                  child: TextButton(
                      onPressed: () async {
                        if (_image == null) {
                          Fluttertoast.showToast(
                              msg: "????????? ??????????????????.",
                              toastLength: Toast.LENGTH_SHORT,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.lightGreen,
                              fontSize: 12.0);
                        } else {
                          urls = await imageservice.uploadProductImageToStorage(
                              productname.text, _image!);
                          setState(() {
                            visibley = true;
                          });
                        }
                      },
                      child:
                          Text('?????? ??????', style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xffA2BF62),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25))))),
              Visibility(
                visible: visibley,
                child: Container(
                    margin: EdgeInsets.only(top: 20, left: 20),
                    width: width * 0.9,
                    child: TextButton(
                        onPressed: () async {
                          if (productname.text == "") {
                            Fluttertoast.showToast(
                                msg: "?????? ????????? ??????????????????.",
                                toastLength: Toast.LENGTH_SHORT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.lightGreen,
                                fontSize: 12.0);
                          } else if (productprice.text == "") {
                            Fluttertoast.showToast(
                                msg: "????????? ??????????????????.",
                                toastLength: Toast.LENGTH_SHORT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.lightGreen,
                                fontSize: 12.0);
                          } else if (productinfo.text == "") {
                            Fluttertoast.showToast(
                                msg: "??????????????? ??????????????????.",
                                toastLength: Toast.LENGTH_SHORT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.lightGreen,
                                fontSize: 12.0);
                          } else if (_image == null) {
                            Fluttertoast.showToast(
                                msg: "?????? ???????????? ??????????????????.",
                                toastLength: Toast.LENGTH_SHORT,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.lightGreen,
                                fontSize: 12.0);
                          } else {
                            int price = int.parse(productprice.text);
                            FirebaseFirestore.instance
                                .collection('shops')
                                .doc(_shopDocId)
                                .collection('products')
                                .doc(key)
                                .set({
                              'name': productname.text,
                              'price': price,
                              'Info': productinfo.text,
                              'num': 0,
                              'image': urls,
                              'docId': key
                            });
                            final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        thingsShopRegiPage()));
                          }
                        },
                        child: Text('?????? ??????',
                            style: TextStyle(color: Colors.white)),
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffA2BF62),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)),
                        ))),
              )
            ],
          ),
        ));
  }
}
