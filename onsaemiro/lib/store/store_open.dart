import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kpostal/kpostal.dart';
import 'package:onsaemiro/screens/main_pages/culture_main.dart';
import 'package:random_string/random_string.dart';

class StoreOpen extends StatefulWidget {
  const StoreOpen({Key? key}) : super(key: key);

  @override
  _StoreOpenState createState() => _StoreOpenState();
}

var key = randomString(16);
FirebaseFirestore fireStore = FirebaseFirestore.instance;
final FirebaseAuth auth = FirebaseAuth.instance;
final storename = TextEditingController();
final _postTextEditor = TextEditingController();
final _addressTextEditor = TextEditingController();
final _deaddressTextEditor = TextEditingController();
final storeinfo = TextEditingController();
final salesinfo = TextEditingController();
final benefitinfo = TextEditingController();
String address = '';
String postcode = '';
final deaddressFocusNode = FocusNode();

class _StoreOpenState extends State<StoreOpen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.1,
          backgroundColor: Colors.white,
          title: Text('상점 개설',
              style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff6CCD6C))),
          centerTitle: true,
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              alignment: Alignment(0, 0),
              height: height * 0.09,
              width: width * 0.9,
              margin: EdgeInsets.only(top: 15, left: 20),
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
                    child: Icon(Icons.create_rounded, color: Color(0xff6CCD6C)),
                  ),
                  Container(
                    width: 60,
                    child: Text("상점 이름",
                        style: TextStyle(
                          color: Color(0xff6CCD6C),
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(right: 10),
                      child: TextField(
                        controller: storename,
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
              height: height * 0.23,
              width: width * 0.9,
              margin: EdgeInsets.only(left: 20, top: 50),
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(width: 1.0, color: Colors.black12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20),
                        child: Icon(Icons.place, color: Color(0xff6CCD6C)),
                      ),
                      Container(
                        width: 90,
                        child: Text("우편번호",
                            style: TextStyle(
                              color: Color(0xff6CCD6C),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: TextField(
                            controller: _postTextEditor,
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            readOnly: true,
                          ),
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 30,
                        child: TextButton(
                          child: Text(
                            "우편번호 검색",
                            style: TextStyle(
                              fontSize: 10,
                            ),
                          ),
                          onPressed: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => KpostalView(
                                  useLocalServer: true,
                                  kakaoKey: 'd06eb717fecc37bcfce1d08a4395e59e',
                                  callback: (Kpostal result) {
                                    deaddressFocusNode.requestFocus();
                                    setState(() {
                                      address = result.address;
                                      postcode = result.postCode;
                                      _addressTextEditor.text = address;
                                      _postTextEditor.text = postcode;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Color(0xff6CCD6C),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 43),
                        width: 90,
                        child: Text("주소",
                            style: TextStyle(
                              color: Color(0xff6CCD6C),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: TextField(
                            controller: _addressTextEditor,
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            readOnly: true,
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 43),
                        width: 90,
                        child: Text("상세주소",
                            style: TextStyle(
                              color: Color(0xff6CCD6C),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: TextField(
                            controller: _deaddressTextEditor,
                            focusNode: deaddressFocusNode,
                            textAlign: TextAlign.right,
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                            maxLines: null,
                            keyboardType: TextInputType.multiline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, left: 20),
              child: Text("상점 정보",
                  style: TextStyle(
                    color: Color(0xff6CCD6C),
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
              height: height * 0.23,
              width: width * 0.9,
              margin: EdgeInsets.only(left: 20),
              decoration:
                  BoxDecoration(border: Border.all(color: Color(0xffd6d6d6))),
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.start,
                maxLines: 15,
                controller: storeinfo,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: '내용작성',
                  hintStyle: TextStyle(fontSize: 12, color: Colors.grey[400]),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, left: 20),
              child: Text("영업 정보",
                  style: TextStyle(
                    color: Color(0xff6CCD6C),
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
              height: height * 0.23,
              width: width * 0.9,
              margin: EdgeInsets.only(left: 20),
              decoration:
                  BoxDecoration(border: Border.all(color: Color(0xffd6d6d6))),
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.start,
                maxLines: 15,
                controller: salesinfo,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: '내용작성',
                  hintStyle: TextStyle(fontSize: 12, color: Colors.grey[400]),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40, left: 20),
              child: Text("안내 및 혜택",
                  style: TextStyle(
                    color: Color(0xff6CCD6C),
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Container(
              height: height * 0.23,
              width: width * 0.9,
              margin: EdgeInsets.only(left: 20),
              decoration:
                  BoxDecoration(border: Border.all(color: Color(0xffd6d6d6))),
              child: TextField(
                textAlignVertical: TextAlignVertical.top,
                textAlign: TextAlign.start,
                maxLines: 15,
                controller: benefitinfo,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: '내용작성',
                  hintStyle: TextStyle(fontSize: 12, color: Colors.grey[400]),
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(right: 20),
                child: TextButton(
                    onPressed: () async {
                      if (storename.text == "") {
                        Fluttertoast.showToast(
                            msg: "상점 이름을 입력해주세요.",
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.lightGreen,
                            fontSize: 12.0);
                      } else if (_addressTextEditor.text == "") {
                        Fluttertoast.showToast(
                            msg: "주소를 입력해주세요.",
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.lightGreen,
                            fontSize: 12.0);
                      } else if (_deaddressTextEditor.text == "") {
                        Fluttertoast.showToast(
                            msg: "상세주소를 입력해주세요.",
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.lightGreen,
                            fontSize: 12.0);
                      } else if (storeinfo.text == "") {
                        Fluttertoast.showToast(
                            msg: "상점정보를 입력해주세요.",
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.lightGreen,
                            fontSize: 12.0);
                      } else if (salesinfo.text == "") {
                        Fluttertoast.showToast(
                            msg: "영업정보를 입력해주세요.",
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.lightGreen,
                            fontSize: 12.0);
                      } else if (benefitinfo.text == "") {
                        Fluttertoast.showToast(
                            msg: "안내 및 혜택을 입력해주세요.",
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.lightGreen,
                            fontSize: 12.0);
                      } else {
                        fireStore.collection('StoreRegister').doc(key).set({
                          'StoreName': storename.text,
                          'StoreAddress': _addressTextEditor.text,
                          'StoreDetailAddress': _deaddressTextEditor.text,
                          'StoreInfo': storeinfo.text,
                          'StoreSailsInfo': salesinfo.text,
                          'StoreBenefitInfo': benefitinfo.text
                        });
                        final Keys = key;
                        final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => cultureMainPage()));
                      }
                    },
                    child: Text('게시'))),
          ]),
        ));
  }
}
