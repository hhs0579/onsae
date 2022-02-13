import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/classes/toast_message.dart';
import 'package:onsaemiro/repo/join_validation.dart';
import 'package:onsaemiro/screens/main_pages/Root.dart';
import 'package:onsaemiro/screens/main_pages/controller/auth_controller.dart';
import 'package:onsaemiro/screens/main_pages/controller/database_controller.dart';
import 'package:onsaemiro/screens/starting_pages/phone_join_pages/smsjoin_screen.dart';

class SmsAuthScreen extends StatefulWidget {
  const SmsAuthScreen({Key? key}) : super(key: key);

  @override
  _SmsAuthScreenState createState() => _SmsAuthScreenState();
}

class _SmsAuthScreenState extends State<SmsAuthScreen> {
  Timer? _timer;
  var _time = 0;

  String userType = Get.arguments;

  bool isSmsAuth = false;
  bool isotpconfirm = false;
  String? verificationId;

  FirebaseAuth _auth = FirebaseAuth.instance;

  final phoneNumberController = TextEditingController();
  final otpNumberController = TextEditingController();

  final otpFocusNode = FocusNode();

  authUserToPhone(
      PhoneAuthCredential phoneAuthCredential, String phoneNumber) async {
    signInWithPhoneNumber(phoneAuthCredential);

    await authController.saveLocalStorageToPhone(phoneNumber);
    String? pushToken = await authController.getToken();
    if (pushToken != null) {
      databaseController.updatePushTokenToPhone(
        phone: phoneNumber,
        pushToken: pushToken,
      );
    }
    await databaseController.fetchMyInfoToPhone(phoneNumber);
  }

  void signInWithPhoneNumber(PhoneAuthCredential phoneAuthCredential) async {
    try {
      final User? user =
          (await _auth.signInWithCredential(phoneAuthCredential)).user;
    } catch (e) {
      toastMessage('로그인에 실패했습니다.');
    }
  }

  _connectbutton(text, onPressed) {
    return Container(
      width: 275,
      height: 60,
      margin: EdgeInsets.only(bottom: 20),
      child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
              primary: Colors.black,
              shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.green, width: 1.5),
                  borderRadius: BorderRadius.circular(30))),
          child: Text(text)),
    );
  }

  void _timeStart() {
    _time = 120;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _time--;
        if (_time <= 0) {
          _time = 0;
        }
      });
    });
  }

  String _viewTime(int time) {
    final minutes = ((time / 60) % 60).floor().toString();
    final seconds = (time % 60).floor().toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Image.asset('assets/Vector.png'),
                    ),
                  ],
                ),
                Container(
                  width: 240,
                  height: 25,
                  margin: EdgeInsets.only(top: 80, bottom: 40),
                  child: Text('휴대전화 번호를 입력하세요.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18)),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: 160,
                    height: 30,
                    child: TextField(
                      controller: phoneNumberController,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, height: 1.5),
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  Container(
                    width: 45,
                    height: 25,
                    child: TextButton(
                        onPressed: isSmsAuth
                            ? null
                            : () async {
                                if (vaildationPhoneNumber(
                                        phoneNumberController.text) ==
                                    null) {
                                  if (await databaseController
                                          .isDuplicatedPhone(
                                              phoneNumberController.text) ==
                                      false) {
                                    toastMessage('가입되지 않은 전화번호 입니다.');
                                  } else {
                                    FocusScope.of(context).unfocus();
                                    toastMessage(
                                        "${phoneNumberController.text}로 인증코드를 발송하였습니다 잠시만 기다려주세요");
                                    await _auth.verifyPhoneNumber(
                                        timeout: const Duration(seconds: 120),
                                        codeAutoRetrievalTimeout:
                                            (String verificationId) {
                                          setState(() {
                                            isSmsAuth = false;
                                            otpNumberController.text = '';
                                            _timer?.cancel();
                                          });
                                          toastMessage(
                                              "인증번호가 만료되었습니다. 다시 시도해 주세요.");
                                        },
                                        phoneNumber: "+8210" +
                                            phoneNumberController.text
                                                .substring(3)
                                                .trim(),
                                        verificationCompleted:
                                            (phoneAuthCredential) async {
                                          await _auth.signInWithCredential(
                                              phoneAuthCredential);
                                          toastMessage('이미 로그인한 상태입니다.');
                                        },
                                        verificationFailed:
                                            (verificationFailed) async {
                                          print(verificationFailed.code);
                                          toastMessage(
                                              "코드 발송 실패했습니다. 전화번호를 확인해주세요");
                                        },
                                        codeSent: (verificationId,
                                            forceResendingToken) async {
                                          print('코드 보냄');

                                          setState(() {
                                            isSmsAuth = true;
                                            isotpconfirm = true;
                                            _timeStart();

                                            this.verificationId =
                                                verificationId;
                                          });
                                        });
                                    otpFocusNode.requestFocus();
                                  }
                                }
                              },
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            primary: Colors.white,
                            backgroundColor: Color(0xff6CCD6C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        child: Text(
                          '인증',
                          style: TextStyle(fontSize: 11),
                        )),
                  )
                ]),
                Container(
                  color: Colors.green,
                  width: 200,
                  height: 2,
                ),
                SizedBox(height: 10),
                Visibility(
                  visible: isotpconfirm,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 150,
                          height: 30,
                          child: TextField(
                            controller: otpNumberController,
                            focusNode: otpFocusNode,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, height: 1.5),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 0),
                              border: InputBorder.none,
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                        ),
                        SizedBox(width: 15),
                        Container(
                          child: Text(_viewTime(_time),
                              style: TextStyle(
                                color: Colors.grey,
                              )),
                        ),
                      ]),
                ),
                Visibility(
                  visible: isotpconfirm,
                  child: Container(
                    color: Color(0xff6CCD6C),
                    width: 200,
                    height: 2,
                  ),
                ),
                Visibility(
                  visible: isotpconfirm,
                  child: Container(
                    width: 220,
                    margin: EdgeInsets.only(top: 10),
                    child: Text('전송된 6자리 코드 입력해주세요.',
                        style: TextStyle(fontSize: 13),
                        textAlign: TextAlign.center),
                  ),
                ),
                SizedBox(height: 300),
                _connectbutton('전화번호로 로그인', () {
                  PhoneAuthCredential phoneAuthCredential =
                      PhoneAuthProvider.credential(
                          verificationId: verificationId!,
                          smsCode: otpNumberController.text);
                  authUserToPhone(
                      phoneAuthCredential, phoneNumberController.text);
                  Get.to(() => Root());
                }),
                _connectbutton('전화번호로 회원가입', () {
                  Get.to(SmsJoinScreen(), arguments: userType);
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
