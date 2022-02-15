import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kpostal/kpostal.dart';
import 'package:onsaemiro/classes/loading.dart';
import 'package:onsaemiro/classes/toast_message.dart';
import 'package:onsaemiro/data/appdata.dart';
import 'package:onsaemiro/repo/image_service.dart';
import 'package:onsaemiro/screens/things_pages/thingsShopProduct.dart';
import 'package:random_string/random_string.dart';

class StoreOpen extends StatefulWidget {
  const StoreOpen({Key? key}) : super(key: key);

  @override
  _StoreOpenState createState() => _StoreOpenState();
}

class _StoreOpenState extends State<StoreOpen> {
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
  var vegan = false;
  var food = false;
  var cloth = false;
  var health = false;
  String select = '';
  Imageservice imageservice = Imageservice();
  String urls = '';
  String businessurls = '';
  XFile? _storeimage;
  XFile? _businessimage;
  final _picker = ImagePicker();
  var visibley = false;

  void initState() {
    setState(() {
      storename.text = '';
      _postTextEditor.text = '';
      _addressTextEditor.text = '';
      _deaddressTextEditor.text = '';
      storeinfo.text = '';
      salesinfo.text = '';
      benefitinfo.text = '';
      urls = '';
      businessurls = '';
      select = '';
    });
    super.initState();
  }

  Future _getProductImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _storeimage = image;
      }
    });
  }

  Future _getBusinessImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _businessimage = image;
      }
    });
  }

  productimage() {
    return Flexible(
        fit: FlexFit.loose,
        child: _storeimage == null
            ? ElevatedButton(
                onPressed: () {
                  _getProductImage();
                },
                child: Container(
                  width: 120,
                  height: 120,
                  color: Color(0xffd6d6d6),
                  child: Icon(
                    Icons.image,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder()),
              )
            : ElevatedButton(
                onPressed: () {
                  _getProductImage();
                },
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.lightGreen),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(File(_storeimage!.path))))),
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder()),
              ));
  }

  businessimage() {
    return Flexible(
        fit: FlexFit.loose,
        child: _businessimage == null
            ? ElevatedButton(
                onPressed: () {
                  _getBusinessImage();
                },
                child: Container(
                  width: 120,
                  height: 120,
                  color: Color(0xffd6d6d6),
                  child: Icon(
                    Icons.image,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder()),
              )
            : ElevatedButton(
                onPressed: () {
                  _getBusinessImage();
                },
                child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.lightGreen),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: FileImage(File(_businessimage!.path))))),
                style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                    elevation: 0,
                    shape: RoundedRectangleBorder()),
              ));
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return GetBuilder(builder: (AppData appdata) {
      return Loading(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
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
                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment(0, 0),
                    height: height * 0.09,
                    width: width * 0.9,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1.0, color: Colors.black12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          child: Icon(Icons.create_rounded,
                              color: Color(0xff6CCD6C)),
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
                  SizedBox(height: 30),
                  Container(
                    width: width * 0.95,
                    height: height * 0.09,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 1.0, color: Colors.black12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text("상점 종류",
                            style: TextStyle(
                              color: Color(0xff6CCD6C),
                              fontWeight: FontWeight.bold,
                            )),
                        Checkbox(
                          activeColor: Colors.lightGreen,
                          checkColor: Colors.white,
                          value: vegan,
                          onChanged: (value) {
                            setState(() {
                              vegan = !vegan;
                              select = '비건';
                            });
                          },
                        ),
                        Text('비건'),
                        Checkbox(
                          activeColor: Colors.lightGreen,
                          checkColor: Colors.white,
                          value: food,
                          onChanged: (value) {
                            setState(() {
                              food = !food;
                              select = '음식';
                            });
                          },
                        ),
                        Text('음식'),
                        Checkbox(
                          activeColor: Colors.lightGreen,
                          checkColor: Colors.white,
                          value: cloth,
                          onChanged: (value) {
                            setState(() {
                              cloth = !cloth;
                              select = '의류';
                            });
                          },
                        ),
                        Text('의류'),
                        Checkbox(
                          activeColor: Colors.lightGreen,
                          checkColor: Colors.white,
                          value: health,
                          onChanged: (value) {
                            setState(() {
                              health = !health;
                              select = '건강';
                            });
                          },
                        ),
                        Text('건강')
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    alignment: Alignment(0, 0),
                    height: height * 0.23,
                    width: width * 0.9,
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
                              child:
                                  Icon(Icons.place, color: Color(0xff6CCD6C)),
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
                                        kakaoKey:
                                            'b7e55e7c67bfe3e039d72828eba39c44',
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
                                        borderRadius:
                                            BorderRadius.circular(10))),
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
                  SizedBox(height: 30),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      width: 100,
                      child: Text('대표 사진',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color(0xff6CCD6C))),
                    ),
                    SizedBox(width: 60),
                    productimage()
                  ]),
                  SizedBox(height: 30),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      width: 100,
                      child: Text('사업자 인증 사진',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Color(0xff6CCD6C))),
                    ),
                    SizedBox(width: 60),
                    businessimage()
                  ]),
                  SizedBox(height: 30),
                  Container(
                    child: Text("상점 정보",
                        style: TextStyle(
                          color: Color(0xff6CCD6C),
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    height: height * 0.23,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffd6d6d6))),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.top,
                      textAlign: TextAlign.start,
                      maxLines: 15,
                      controller: storeinfo,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: '내용작성',
                        hintStyle:
                            TextStyle(fontSize: 12, color: Colors.grey[400]),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: Text("영업 정보",
                        style: TextStyle(
                          color: Color(0xff6CCD6C),
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    height: height * 0.23,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffd6d6d6))),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.top,
                      textAlign: TextAlign.start,
                      maxLines: 15,
                      controller: salesinfo,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: '내용작성',
                        hintStyle:
                            TextStyle(fontSize: 12, color: Colors.grey[400]),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: Text("안내 및 혜택",
                        style: TextStyle(
                          color: Color(0xff6CCD6C),
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  Container(
                    height: height * 0.23,
                    width: width * 0.9,
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0xffd6d6d6))),
                    child: TextField(
                      textAlignVertical: TextAlignVertical.top,
                      textAlign: TextAlign.start,
                      maxLines: 15,
                      controller: benefitinfo,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        hintText: '내용작성',
                        hintStyle:
                            TextStyle(fontSize: 12, color: Colors.grey[400]),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  Visibility(
                    visible: visibley == false,
                    child: Container(
                        width: width * 0.9,
                        child: TextButton(
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              if (_storeimage == null ||
                                  _businessimage == null) {
                                toastMessage("사진을 선택해주세요.");
                              } else {
                                appdata.isLoadingScreen = true;
                                urls = await imageservice
                                    .uploadShopImageToStorage(
                                        storename.text, _storeimage!);

                                businessurls = await imageservice
                                    .uploadBusinessImageToStorage(
                                        storename.text, _businessimage!);
                                appdata.isLoadingScreen = false;
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
                                    borderRadius: BorderRadius.circular(25))))),
                  ),
                  Visibility(
                    visible: visibley,
                    child: Container(
                        width: width * 0.9,
                        child: TextButton(
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              if (storename.text == "") {
                                toastMessage("상점 이름을 입력해주세요.");
                              } else if (_addressTextEditor.text == "") {
                                toastMessage("주소를 입력해주세요.");
                              } else if (_deaddressTextEditor.text == "") {
                                toastMessage("상세주소를 입력해주세요.");
                              } else if (storeinfo.text == "") {
                                toastMessage("상점정보를 입력해주세요.");
                              } else if (salesinfo.text == "") {
                                toastMessage("영업정보를 입력해주세요.");
                              } else if (benefitinfo.text == "") {
                                toastMessage("안내 및 혜택을 입력해주세요.");
                              } else if (select == '') {
                                toastMessage("상점 종류를 고르세요.");
                              } else {
                                fireStore.collection('shops').doc(key).set({
                                  'name': storename.text,
                                  'StoreAddress': _addressTextEditor.text,
                                  'StoreDetailAddress':
                                      _deaddressTextEditor.text,
                                  'StoreInfo': storeinfo.text,
                                  'StoreSailsInfo': salesinfo.text,
                                  'StoreBenefitInfo': benefitinfo.text,
                                  'docId': key,
                                  'image': urls,
                                  'businessimage': businessurls,
                                  'type': select,
                                  'isaccess': '승인대기',
                                  'phone': ''
                                });

                                fireStore
                                    .collection('users')
                                    .doc(appdata.businessmodel.uid)
                                    .update({
                                  'mystore':
                                      FieldValue.arrayUnion([storename.text])
                                });
                                setState(() {
                                  appdata.businessmodel.mystore
                                      .add(storename.text);
                                });
                                final Keys = key;
                                final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            thingsShopRegiPage()));
                              }
                            },
                            child: Text('상점 등록',
                                style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              primary: Color(0xffA2BF62),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25)),
                            ))),
                  ),
                  SizedBox(height: 30)
                ]),
              )),
        ),
      );
    });
  }
}
