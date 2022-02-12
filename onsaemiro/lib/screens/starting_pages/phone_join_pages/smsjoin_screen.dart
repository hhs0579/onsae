import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/classes/toast_message.dart';
import 'package:onsaemiro/repo/join_validation.dart';
import 'package:onsaemiro/screens/main_pages/controller/database_controller.dart';
import '../agree_page.dart';

class SmsJoinScreen extends StatefulWidget {
  const SmsJoinScreen({Key? key}) : super(key: key);

  @override
  _SmsJoinScreenState createState() => _SmsJoinScreenState();
}

class _SmsJoinScreenState extends State<SmsJoinScreen> {
  Timer? _timer;
  String userType = Get.arguments;
  List argument = [];
  var _time = 0;
  bool isSmsAuth = false;
  bool isotpconfirm = false;
  String? verificationId;

  final phoneNumberController = TextEditingController();
  final otpNumberController = TextEditingController();

  final otpFocusNode = FocusNode();

  FirebaseAuth _auth = FirebaseAuth.instance;

  signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential) async {
    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        setState(() {
          isSmsAuth = true;
          isotpconfirm = false;
          argument.add(userType);
          argument.add(phoneAuthCredential);
        });
        await _auth.currentUser!.delete();
        _auth.signOut();
        toastMessage('인증이 완료되었습니다');
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        print("인증실패");
        print(e.message);
      });

      toastMessage('오류가 발생했습니다. 인증번호를 확인해주세요.');
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

  @override
  void dispose() {
    _timer?.cancel();
    dispose();
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
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
                                if (await databaseController.isDuplicatedPhone(
                                        phoneNumberController.text) ==
                                    true) {
                                  toastMessage('이미 가입된 전화번호 입니다.');
                                } else {
                                  if (vaildationPhoneNumber(
                                          phoneNumberController.text) ==
                                      null) {
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
                                            (phoneAuthCredential) async {},
                                        verificationFailed:
                                            (verificationFailed) async {
                                          print(verificationFailed.code);
                                          toastMessage(
                                              "코드 발송 실패했습니다. 전화번호를 확인해주세요");
                                          print("코드 발송 실패");
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
                          width: 125,
                          height: 30,
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: otpNumberController,
                            focusNode: otpFocusNode,
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
                        Container(
                          margin: EdgeInsets.only(right: 8),
                          child: Text(_viewTime(_time),
                              style: TextStyle(
                                color: Colors.grey,
                              )),
                        ),
                        Container(
                          width: 45,
                          height: 25,
                          child: TextButton(
                              onPressed: () {
                                FocusScope.of(context).unfocus();
                                PhoneAuthCredential phoneAuthCredential =
                                    PhoneAuthProvider.credential(
                                        verificationId: verificationId!,
                                        smsCode: otpNumberController.text);
                                signInWithPhoneAuthCredential(
                                    phoneAuthCredential);
                              },
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  primary: Colors.white,
                                  backgroundColor: Color(0xff6CCD6C),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              child: Text(
                                '확인',
                                style: TextStyle(fontSize: 11),
                              )),
                        )
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
                    child: Text('전송된 6자리 코드를 입력해주세요.',
                        style: TextStyle(fontSize: 13),
                        textAlign: TextAlign.center),
                  ),
                ),
                SizedBox(height: 350),
                _connectbutton('다음 단계로 넘어가기', () {
                  if (isSmsAuth == false) {
                    toastMessage('휴대폰 인증을 완료해주세요.');
                  } else {
                    argument.add(phoneNumberController.text);
                    Get.to(agreePage(), arguments: argument);
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
