import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kpostal/kpostal.dart';
import 'package:onsaemiro/classes/toast_message.dart';
import 'package:onsaemiro/repo/database_service.dart';
import 'package:onsaemiro/repo/join_validation.dart';
import 'package:onsaemiro/screens/main_pages/controller/database_controller.dart';
import 'package:onsaemiro/screens/starting_pages/type_screen.dart';

class PhoneJoinPage extends StatefulWidget {
  const PhoneJoinPage({Key? key}) : super(key: key);

  @override
  _PhoneJoinPageState createState() => _PhoneJoinPageState();
}

class _PhoneJoinPageState extends State<PhoneJoinPage> {
  final nameController = TextEditingController();
  final nicknameController = TextEditingController();
  final dobController = TextEditingController();
  final addressController = TextEditingController();
  final deaddressController = TextEditingController();

  final deaddressFocusNode = FocusNode();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String address = '';
  String deaddress = '';
  String userType = Get.arguments[0];
  PhoneAuthCredential phoneAuthCredential = Get.arguments[1];
  String phonenumber = Get.arguments[2];

  bool isnamecheck = false;
  bool isnicknamecheck = false;

  signUpUserCredential() async {
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      if (userType == 'user') {
        await DatabaseService(uid: authCredential.user!.uid).setUserData(
          DateTime.now(),
          '',
          '',
          nameController.text,
          nicknameController.text,
          phonenumber,
          address,
          deaddressController.text,
          dobController.text,
          userType,
        );
      } else if (userType == 'business') {
        await DatabaseService(uid: authCredential.user!.uid).setBusinessData(
          DateTime.now(),
          '',
          '',
          nameController.text,
          nicknameController.text,
          phonenumber,
          address,
          deaddressController.text,
          dobController.text,
          userType,
        );
      }
    } catch (e) {
      print(e);
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
                      Text('이름을 입력해주세요.', style: TextStyle(fontSize: 15)),
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
                                  hintText: 'ex) 홍길동',
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
                                onPressed: () {
                                  if (vaildationname(nameController.text) ==
                                      null) {
                                    setState(() {
                                      isnamecheck = true;
                                      toastMessage('확인되었습니다.');
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
                      Text('생년월일을 입력해주세요.', style: TextStyle(fontSize: 15)),
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
                      Text('닉네임을 입력해주세요.', style: TextStyle(fontSize: 15)),
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
                                  hintText: 'ex) 온새미롱',
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
                                      toastMessage('중복된 닉네임 입니다.');
                                    } else {
                                      setState(() {
                                        isnicknamecheck = true;
                                        toastMessage('확인되었습니다.');
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
                  SizedBox(height: 40),
                  Column(
                    children: [
                      Text('주소를 입력해주세요.', style: TextStyle(fontSize: 15)),
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
                            child: Text('우편번호 검색',
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
                                  hintText: '주소',
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
                              hintText: '상세주소',
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
                          onPressed: () {
                            if (!isnamecheck) {
                              toastMessage('실명인증을 완료해주세요.');
                            } else {
                              if (!isnicknamecheck) {
                                toastMessage('닉네임 중복확인을 완료해주세요.');
                              } else {
                                if (vaildationdob(dobController.text) == null) {
                                  if (addressController.text.isEmpty ||
                                      deaddressController.text.isEmpty) {
                                    toastMessage('주소 혹은 상세주소를 입력해주세요.');
                                  } else {
                                    signUpUserCredential();
                                    toastMessage("가입이 완료되었습니다.");

                                    Get.to(() => TypeScreen());
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
                          child: Text('회원가입 완료')))
                ],
              ),
            )),
      )),
    );
  }
}
