import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/screens/culture_pages/act_participation.dart';

class actConfirmPage extends StatefulWidget {
  const actConfirmPage({Key? key}) : super(key: key);

  @override
  _actConfirmPageState createState() => _actConfirmPageState();
}

List<String> images1 = [
  'assets/게시물1 이미지1.png',
  'assets/게시물1 이미지2.png',
  'assets/게시물1 이미지3.png'
];
List<String> images2 = [
  'assets/게시물2 이미지1.png',
  'assets/jj.jpg',
  'assets/게시물2 이미지3.png'
];
actImage(image) {
  return Container(
    width: 120,
    height: 123,
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.fitWidth)),
  );
}

actBox(profileName, images_1, images_2, images_3) {
  return Padding(
      padding: EdgeInsets.fromLTRB(4, 9, 10, 2),
      child: Container(
          height: 239,
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromRGBO(108, 205, 108, 0.7)),
              borderRadius: BorderRadius.circular(20)),
          child: Column(children: [
            Padding(
              padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
              child: Row(
                children: [
                  ImageIcon(
                    AssetImage('assets/프로필.png'),
                    size: 30,
                    color: Color.fromRGBO(108, 205, 108, 0.7),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                profileName,
                                style: TextStyle(fontSize: 15),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 34,
                                  ),
                                  Text(
                                    '3분전',
                                    style: TextStyle(fontSize: 8),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 230,
                          ),
                          Column(
                            children: [
                              Icon(
                                Icons.thumb_up,
                                size: 20,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '55',
                                style: TextStyle(fontSize: 8),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(12, 0, 0, 50),
                  child: Text(
                    'act.활동인증',
                    style: TextStyle(fontSize: 8),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 125,
              width: 369,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  actImage(images_1),
                  SizedBox(
                    width: 10,
                  ),
                  actImage(images_2),
                  SizedBox(
                    width: 10,
                  ),
                  actImage(images_3),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
          ])));
}

class _actConfirmPageState extends State<actConfirmPage> {
  bool isRecently = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leadingWidth: 0.0,
          toolbarHeight: 138,
          backgroundColor: Colors.white,
          title: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(5, 56, 0, 0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.chevron_left,
                          color: Colors.green, size: 30),
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    SizedBox(
                      width: 55,
                    ),
                    Text(
                      'act.활동인증',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Color.fromRGBO(67, 123, 86, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Get.to(actParticipationPage());
                      },
                      child: Text(
                        '참여하기',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      )),
                  SizedBox(
                    width: 10,
                  )
                ],
              )
            ],
          ),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    child: Text(
                      '최신순',
                      style: TextStyle(
                          color:
                              (isRecently) ? Colors.black : Colors.grey[500]),
                    ),
                    onPressed: () {
                      setState(() {
                        isRecently = true;
                      });
                    },
                  ),
                  TextButton(
                    child: Text(
                      '좋아요순',
                      style: TextStyle(
                          color:
                              (!isRecently) ? Colors.black : Colors.grey[500]),
                    ),
                    onPressed: () {
                      setState(() {
                        isRecently = false;
                      });
                    },
                  ),
                ],
              ),
              if (isRecently)
                SizedBox(
                  height: 550,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      actBox('온새미로', images1[0], images1[1], images1[2]),
                      actBox('온새미로', images2[0], images2[1], images2[2]),
                      actBox('온새미로', images1[0], images1[1], images1[2])
                    ],
                  ),
                )
              else
                SizedBox(
                  height: 550,
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      actBox('온새미로', images1[0], images1[1], images1[2]),
                      actBox('온새미로', images2[0], images2[1], images2[2]),
                      actBox('온새미로', images1[0], images1[1], images1[2])
                    ],
                  ),
                )
            ],
          ),
        ));
  }
}
