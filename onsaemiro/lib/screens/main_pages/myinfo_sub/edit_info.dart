import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:kpostal/kpostal.dart';
import 'package:onsaemiro/classes/toast_message.dart';
import 'package:onsaemiro/data/appdata.dart';
import 'package:onsaemiro/repo/database_service.dart';
import 'package:onsaemiro/repo/join_validation.dart';
import 'package:onsaemiro/screens/access_pages/shopping_bag.dart';
import 'package:onsaemiro/screens/main_pages/controller/cart_controller.dart';
import 'package:onsaemiro/screens/main_pages/controller/database_controller.dart';

class EditinfoPage extends StatefulWidget {
  const EditinfoPage({Key? key}) : super(key: key);

  @override
  EditinfoPageState createState() => EditinfoPageState();
}

class EditinfoPageState extends State<EditinfoPage> {
  final nicknameController = TextEditingController();
  final passwordController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();
  final deaddressController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final deaddressFocusNode = FocusNode();

  String address = '';

  final CartController c = Get.put(CartController());

  AppData appdata = Get.find();

  void initState() {
    setState(() {
      if (appdata.userType == 'user') {
        nicknameController.text = appdata.usermodel.nickname;
        passwordController.text = appdata.usermodel.password;
        addressController.text = appdata.usermodel.address;
        deaddressController.text = appdata.usermodel.addressdetail;
        phoneNumberController.text = appdata.usermodel.phone;
        dobController.text = appdata.usermodel.birth;
      } else if (appdata.userType == 'business') {
        nicknameController.text = appdata.businessmodel.nickname;
        passwordController.text = appdata.businessmodel.password;
        addressController.text = appdata.businessmodel.address;
        deaddressController.text = appdata.businessmodel.addressdetail;
        phoneNumberController.text = appdata.businessmodel.phone;
        dobController.text = appdata.businessmodel.birth;
      }
    });
    super.initState();
  }

  Future<UserCredential?> UpdateUserCredential() async {
    AppData appdata = Get.find();
    String uid = '';
    if (appdata.userType == 'user') {
      uid = appdata.usermodel.uid;
    } else if (appdata.userType == 'business') {
      uid = appdata.businessmodel.uid;
    }
    try {
      await DatabaseService(uid: uid).updateUserData(
        nicknameController.text,
        passwordController.text,
        phoneNumberController.text,
        addressController.text,
        deaddressController.text,
        dobController.text,
      );
    } catch (e) {
      errorToast(e);
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    AppData appdata = Get.find();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.123,
          shape: Border(bottom: BorderSide(color: Colors.green)),
          leading: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.green, size: 30),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart, color: Colors.green, size: 30),
              onPressed: () {
                Get.to(shoppingBagPage(c.allList));
              },
            )
          ],
          backgroundColor: Colors.white,
          title: Text(
            '회원정보 수정',
            style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: Color(0xff595959)),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SingleChildScrollView(
          child: Container(
            width: width,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Container(
                  width: width * 0.248,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.green))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        ' 닉네임',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      TextField(
                        controller: nicknameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none),
                      ),
                    ],
                  ),
                ),
                appdata.usermodel.password == '' &&
                        appdata.businessmodel.password == ''
                    ? Container()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 30),
                          Text(
                            ' 비밀번호',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w700),
                          ),
                          Container(
                            width: 200,
                            child: TextField(
                              controller: passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.green))),
                            ),
                          ),
                        ],
                      ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' 휴대폰 번호',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        controller: phoneNumberController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 15),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  width: width * 0.248,
                  decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.green))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' 생년월일',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      TextField(
                        controller: dobController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(fontSize: 15),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      ' 주소',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        controller: addressController,
                        readOnly: true,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: TextField(
                        controller: deaddressController,
                        decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.green))),
                      ),
                    ),
                    SizedBox(height: 25),
                    Row(
                      children: [
                        SizedBox(width: 25),
                        Container(
                          width: 150,
                          height: 35,
                          child: TextButton(
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
                                          addressController.text = address;
                                        });
                                      },
                                    ),
                                  ),
                                );
                              },
                              style: TextButton.styleFrom(
                                  primary: Colors.black,
                                  shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          color: Colors.green, width: 1.5),
                                      borderRadius: BorderRadius.circular(30))),
                              child: Text('우편번호 검색',
                                  style: TextStyle(color: Colors.black54))),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 260,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextButton(
                          onPressed: () async {
                            if (appdata.usermodel.password == '' &&
                                appdata.businessmodel.password == '') {
                              if (vaildationnickname(nicknameController.text) ==
                                  null) {
                                if (await databaseController
                                        .isDuplicatednickname(
                                            nicknameController.text) ==
                                    true) {
                                  toastMessage('중복된 닉네임입니다.');
                                } else {
                                  if (vaildationPhoneNumber(
                                          phoneNumberController.text) ==
                                      null) {
                                    if (vaildationdob(dobController.text) ==
                                        null) {
                                      if (addressController.text.isEmpty ||
                                          deaddressController.text.isEmpty) {
                                        toastMessage('주소 혹은 상세주소를 입력해주세요.');
                                      } else {
                                        UpdateUserCredential();
                                        if (appdata.userType == 'user') {
                                          await databaseController
                                              .fetchMyInfoToEmailUser(
                                                  appdata.usermodel.email);
                                        } else if (appdata.userType ==
                                            'business') {
                                          await databaseController
                                              .fetchMyInfoToEmailBusiness(
                                                  appdata.businessmodel.email);
                                        }
                                        setState(() {});
                                        Navigator.of(context).pop();

                                        toastMessage("수정이 완료되었습니다.");
                                      }
                                    }
                                  }
                                }
                              }
                            } else {
                              if (vaildationnickname(nicknameController.text) ==
                                  null) {
                                if (await databaseController
                                        .isDuplicatednickname(
                                            nicknameController.text) ==
                                    true) {
                                  toastMessage('중복된 닉네임입니다.');
                                } else {
                                  if (vaildationpassword(
                                          passwordController.text) ==
                                      null) {
                                    if (vaildationPhoneNumber(
                                            phoneNumberController.text) ==
                                        null) {
                                      if (vaildationdob(dobController.text) ==
                                          null) {
                                        if (addressController.text.isEmpty ||
                                            deaddressController.text.isEmpty) {
                                          toastMessage('주소 혹은 상세주소를 입력해주세요.');
                                        } else {
                                          UpdateUserCredential();
                                          if (appdata.userType == 'user') {
                                            await databaseController
                                                .fetchMyInfoToEmailUser(
                                                    appdata.usermodel.email);
                                          } else if (appdata.userType ==
                                              'business') {
                                            await databaseController
                                                .fetchMyInfoToEmailBusiness(
                                                    appdata
                                                        .businessmodel.email);
                                          }
                                          setState(() {});
                                          Navigator.of(context).pop();

                                          toastMessage("수정이 완료되었습니다.");
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          },
                          style: TextButton.styleFrom(
                              primary: Colors.black,
                              shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.green, width: 1.5),
                                  borderRadius: BorderRadius.circular(30))),
                          child: Text('수정 완료하기')),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
