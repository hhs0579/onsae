import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpostal/kpostal.dart';
import 'package:onsaemiro/classes/toast_message.dart';
import 'package:onsaemiro/repo/database_service.dart';
import 'package:onsaemiro/repo/join_validation.dart';
import 'package:onsaemiro/screens/main_pages/controller/database_controller.dart';
import 'package:onsaemiro/screens/starting_pages/type_screen.dart';

class EmailJoinPage2 extends StatefulWidget {
  const EmailJoinPage2({Key? key}) : super(key: key);

  @override
  _EmailJoinPage2State createState() => _EmailJoinPage2State();
}

class _EmailJoinPage2State extends State<EmailJoinPage2> {
  final nameController = TextEditingController();
  final nicknameController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();
  final deaddressController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final deaddressFocusNode = FocusNode();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String address = '';
  String deaddress = '';
  String userType = Get.arguments[2];
  String email = Get.arguments[0];
  String password = Get.arguments[1];

  bool isnamecheck = false;
  bool isnicknamecheck = false;

  void signUpUserCredential() async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (userType == 'user') {
        await DatabaseService(uid: user!.uid).setUserData(
          DateTime.now(),
          email,
          password,
          nameController.text,
          nicknameController.text,
          phoneNumberController.text,
          address,
          deaddressController.text,
          dobController.text,
          userType,
        );
      } else if (userType == 'business') {
        await DatabaseService(uid: user!.uid).setBusinessData(
          DateTime.now(),
          email,
          password,
          nameController.text,
          nicknameController.text,
          phoneNumberController.text,
          address,
          deaddressController.text,
          dobController.text,
          userType,
        );
      } else {}
    } catch (e) {
      errorToast(e);

      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
            margin: EdgeInsets.only(top: 40),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Image.asset('assets/Vector.png'),
                      ),
                      SizedBox(
                        width: 95,
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Column(
                    children: [
                      Text('????????? ??????????????????.', style: TextStyle(fontSize: 15)),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 30,
                            child: TextField(
                                controller: nameController,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15, height: 1.5),
                                cursorColor: Color(0xff6CCD6C),
                                decoration: InputDecoration(
                                  hintText: 'ex) ?????????',
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 5),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.name),
                          ),
                          Container(
                            width: 15,
                            height: 35,
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  if (vaildationname(nameController.text) ==
                                      null) {
                                    setState(() {
                                      isnamecheck = true;
                                      toastMessage('?????????????????????.');
                                    });
                                  }
                                },
                                icon: Image.asset('assets/active.png')),
                          )
                        ],
                      ),
                      Container(
                        color: Color(0xff6CCD6C),
                        width: 170,
                        height: 2,
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Column(
                    children: [
                      Text('??????????????? ??????????????????.', style: TextStyle(fontSize: 15)),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 30,
                            child: TextField(
                                controller: dobController,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15, height: 1.5),
                                cursorColor: Color(0xff6CCD6C),
                                decoration: InputDecoration(
                                  hintText: 'ex) 19990620',
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 5),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.phone),
                          ),
                        ],
                      ),
                      Container(
                        color: Color(0xff6CCD6C),
                        width: 170,
                        height: 2,
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Column(
                    children: [
                      Text('???????????? ??????????????????.', style: TextStyle(fontSize: 15)),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 30,
                            child: TextField(
                                controller: nicknameController,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15, height: 1.5),
                                cursorColor: Color(0xff6CCD6C),
                                decoration: InputDecoration(
                                  hintText: 'ex) ????????????',
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 5),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.name),
                          ),
                          Container(
                            width: 10,
                            height: 35,
                            child: IconButton(
                                padding: EdgeInsets.zero,
                                onPressed: () async {
                                  if (vaildationnickname(
                                          nicknameController.text) ==
                                      null) {
                                    if (await databaseController
                                            .isDuplicatednickname(
                                                nicknameController.text) ==
                                        true) {
                                      toastMessage('????????? ????????? ?????????.');
                                    } else {
                                      setState(() {
                                        isnicknamecheck = true;
                                        toastMessage('?????????????????????.');
                                      });
                                    }
                                  }
                                },
                                icon: Image.asset('assets/active.png')),
                          )
                        ],
                      ),
                      Container(
                        color: Color(0xff6CCD6C),
                        width: 170,
                        height: 2,
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Column(
                    children: [
                      Text('??????????????? ??????????????????.', style: TextStyle(fontSize: 15)),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 150,
                            height: 30,
                            child: TextField(
                                controller: phoneNumberController,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15, height: 1.5),
                                cursorColor: Color(0xff6CCD6C),
                                decoration: InputDecoration(
                                  hintText: 'ex) 01012345678',
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 5),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.phone),
                          ),
                        ],
                      ),
                      Container(
                        color: Color(0xff6CCD6C),
                        width: 170,
                        height: 2,
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Column(
                    children: [
                      Text('????????? ??????????????????.', style: TextStyle(fontSize: 15)),
                      SizedBox(height: 30),
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
                                        print(address);
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
                            child: Text('???????????? ??????',
                                style: TextStyle(color: Colors.black54))),
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 250,
                            height: 30,
                            child: TextField(
                                controller: addressController,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 15, height: 1.5),
                                cursorColor: Color(0xff6CCD6C),
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: '??????',
                                  hintStyle: TextStyle(fontSize: 14),
                                  isDense: true,
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 5),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.name),
                          ),
                        ],
                      ),
                      Container(
                        color: Color(0xff6CCD6C),
                        width: 250,
                        height: 2,
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Column(
                    children: [
                      Container(
                        width: 250,
                        height: 30,
                        child: TextField(
                            controller: deaddressController,
                            focusNode: deaddressFocusNode,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, height: 1.5),
                            cursorColor: Color(0xff6CCD6C),
                            decoration: InputDecoration(
                              hintText: '????????????',
                              hintStyle: TextStyle(fontSize: 14),
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 5),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.name),
                      ),
                      Container(
                        color: Color(0xff6CCD6C),
                        width: 250,
                        height: 2,
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Container(
                      width: 275,
                      height: 50,
                      margin: EdgeInsets.only(bottom: 20),
                      child: TextButton(
                          onPressed: () async {
                            if (!isnamecheck) {
                              toastMessage('??????????????? ??????????????????.');
                            } else {
                              if (!isnicknamecheck) {
                                toastMessage('????????? ??????????????? ??????????????????.');
                              } else {
                                if (vaildationPhoneNumber(
                                        phoneNumberController.text) ==
                                    null) {
                                  if (await databaseController
                                          .isDuplicatedPhone(
                                              phoneNumberController.text) ==
                                      true) {
                                    toastMessage('?????? ????????? ???????????? ?????????.');
                                  }
                                  if (vaildationdob(dobController.text) ==
                                      null) {
                                    if (addressController.text.isEmpty ||
                                        deaddressController.text.isEmpty) {
                                      toastMessage('?????? ?????? ??????????????? ??????????????????.');
                                    } else {
                                      toastMessage("????????? ?????????????????????.");
                                      signUpUserCredential();
                                      Get.to(() => TypeScreen());
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
                          child: Text('???????????? ??????')))
                ],
              ),
            )),
      )),
    );
  }
}
