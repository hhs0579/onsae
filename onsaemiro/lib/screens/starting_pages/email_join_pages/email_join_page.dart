import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/classes/toast_message.dart';
import 'package:onsaemiro/repo/join_validation.dart';
import 'package:onsaemiro/screens/main_pages/controller/database_controller.dart';
import 'package:onsaemiro/screens/starting_pages/agree_page2.dart';

class EmailjoinPage extends StatefulWidget {
  const EmailjoinPage({Key? key}) : super(key: key);

  @override
  State<EmailjoinPage> createState() => _EmailjoinPageState();
}

class _EmailjoinPageState extends State<EmailjoinPage> {
  String userType = Get.arguments;
  List arguments = [];

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final vfpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: EdgeInsets.only(top: 40, left: 20, right: 20),
                    height: 400,
                    width: 300,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Column(
                      children: [
                        TextField(
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            hintText: '???????????? ???????????????',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              hintText: '????????????',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: TextField(
                            controller: vfpasswordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                              hintText: '???????????? ??????',
                            ),
                          ),
                        ),
                        SizedBox(height: 35),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 45,
                              child: TextButton(
                                  onPressed: () async {
                                    if (vaildationemail(emailController.text) ==
                                        null) {
                                      if (await databaseController
                                              .isDuplicatedEmail(
                                                  emailController.text) ==
                                          true) {
                                        toastMessage('?????? ????????? ????????? ?????????.');
                                      } else {
                                        if (vaildationpassword(
                                                passwordController.text) ==
                                            null) {
                                          if (passwordController.text !=
                                              vfpasswordController.text) {
                                            toastMessage(
                                                '??????????????? ????????????. ?????? ?????? ??????????????????.');
                                          } else {
                                            arguments.add(emailController.text);
                                            arguments
                                                .add(passwordController.text);
                                            arguments.add(userType);
                                            Get.to(() => AgreePage2(),
                                                arguments: arguments);
                                          }
                                        }
                                      }
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                      primary: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.grey, width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  child: Text("?????? ?????????")),
                            ),
                            SizedBox(width: 25),
                            Container(
                              width: 100,
                              height: 45,
                              child: TextButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  style: TextButton.styleFrom(
                                      primary: Colors.black,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: Colors.grey, width: 1.5),
                                          borderRadius:
                                              BorderRadius.circular(20))),
                                  child: Text("????????????")),
                            )
                          ],
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
