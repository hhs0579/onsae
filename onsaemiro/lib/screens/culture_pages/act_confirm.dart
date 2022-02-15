import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/models/actpost_model.dart';
import 'package:onsaemiro/screens/culture_pages/act_participation.dart';

class actConfirmPage extends StatefulWidget {
  const actConfirmPage({Key? key}) : super(key: key);

  @override
  _actConfirmPageState createState() => _actConfirmPageState();
}

extension StringExtension on String {
  static String displayTimeAgoFromTimestamp(String timestamp) {
    final year = int.parse(timestamp.substring(0, 4));
    final month = int.parse(timestamp.substring(5, 7));
    final day = int.parse(timestamp.substring(8, 10));
    final hour = int.parse(timestamp.substring(11, 13));
    final minute = int.parse(timestamp.substring(14, 16));

    final DateTime videoDate = DateTime(year, month, day, hour, minute);
    final int diffInHours = DateTime.now().difference(videoDate).inHours;

    String timeAgo = '';
    String timeUnit = '';
    int timeValue = 0;

    if (diffInHours < 1) {
      final diffInMinutes = DateTime.now().difference(videoDate).inMinutes;
      timeValue = diffInMinutes;
      timeUnit = '분';
    } else if (diffInHours < 24) {
      timeValue = diffInHours;
      timeUnit = '시간';
    } else if (diffInHours >= 24 && diffInHours < 24 * 7) {
      timeValue = (diffInHours / 24).floor();
      timeUnit = '일';
    } else if (diffInHours >= 24 * 7 && diffInHours < 24 * 30) {
      timeValue = (diffInHours / (24 * 7)).floor();
      timeUnit = '주';
    } else if (diffInHours >= 24 * 30 && diffInHours < 24 * 12 * 30) {
      timeValue = (diffInHours / (24 * 30)).floor();
      timeUnit = '달';
    } else {
      timeValue = (diffInHours / (24 * 365)).floor();
      timeUnit = '년';
    }

    timeAgo = timeValue.toString() + ' ' + timeUnit;
    timeAgo += timeValue > 1 ? '' : '';

    return timeAgo + '전';
  }
}

int a = 1;
List<dynamic> uids = [];
bool toggle = false;
List<dynamic> posts = [];
FirebaseFirestore fireStore = FirebaseFirestore.instance;
bool press = false;
String select = likepress;
String likepress = '';
String datepress = '';

Stream<QuerySnapshot>? like;
Stream<QuerySnapshot>? date;
_profileImageOn() {
  return appData.usermodel.image == ''
      ? Container(
          child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24,
              backgroundImage: AssetImage('assets/basic.png')))
      : Container(
          child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 24,
              backgroundImage: NetworkImage(appData.usermodel.image)));
}

class _actConfirmPageState extends State<actConfirmPage> {
  String myimg = appData.usermodel.image;

  bool isRecently = true;
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> post = FirebaseFirestore.instance
        .collection('actPost')
        .orderBy(press ? 'like' : 'date', descending: true)
        .snapshots();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
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
                        Navigator.pop(context);
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
                        setState(() {
                          press = false;
                        });
                      },
                      child: Text(
                        '최신순',
                        style:
                            TextStyle(color: Color(0xff437B56), fontSize: 15),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          press = true;
                        });
                      },
                      child: Text(
                        '좋아요 순',
                        style:
                            TextStyle(color: Color(0xff437B56), fontSize: 15),
                      )),
                  TextButton(
                      onPressed: () {
                        Get.to(actParticipationPage());
                      },
                      child: Text(
                        '참여하기',
                        style:
                            TextStyle(color: Color(0xff437B56), fontSize: 15),
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
        body: Container(
            child: StreamBuilder<QuerySnapshot>(
                stream: post,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('오류 발생');
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Text('로딩중');
                  }
                  List<ActPost> actPosts = [];
                  for (var value in snapshot.data!.docs) {
                    ActPost actPost =
                        ActPost.fromJson(value.data() as Map<String, dynamic>);
                    actPosts.add(actPost);
                  }
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: actPosts.length,
                    itemBuilder: (BuildContext context, int index) {
                      ActPost actPost = actPosts.elementAt(index);
                      var video = actPost.date;
                      return Column(
                        children: [
                          Container(
                              width: width * 0.9,
                              height: height * 0.4,
                              margin: EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                    width: 1.0, color: Color(0xff437B56)),
                              ),
                              child: Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              children: [
                                                _profileImageOn(),
                                                Text('act.활동 인증',
                                                    style: TextStyle(
                                                      fontSize: 9,
                                                    )),

                                                //플렉시블
                                              ],
                                            ),
                                            Container(
                                              margin:
                                                  EdgeInsets.only(bottom: 10),
                                              child: Column(
                                                children: [
                                                  Text(actPost.nickname,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color:
                                                              Color(0xff437B56),
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                    StringExtension
                                                        .displayTimeAgoFromTimestamp(
                                                            video.toString()),
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 10),
                                              child: IconButton(
                                                icon: actPost.presslike
                                                    ? Icon(Icons.thumb_up,
                                                        color:
                                                            Color(0xff437B56))
                                                    : Icon(
                                                        Icons.thumb_up_outlined,
                                                        color:
                                                            Color(0xff437B56)),
                                                onPressed: () {
                                                  uids.add(
                                                      appData.usermodel.uid);
                                                  posts.add(actPost.postKey);
                                                  setState(() {
                                                    actPost.presslike =
                                                        !actPost.presslike;
                                                    if (actPost.like.contains(
                                                        appData
                                                            .usermodel.uid)) {
                                                      actPost.like.remove(
                                                          appData
                                                              .usermodel.uid);

                                                      fireStore
                                                          .collection('actPost')
                                                          .doc(actPost.postKey)
                                                          .update({
                                                        'like': FieldValue
                                                            .arrayRemove(uids)
                                                      });
                                                      fireStore
                                                          .collection('actPost')
                                                          .doc(actPost.postKey)
                                                          .update({
                                                        'likenum':
                                                            --actPost.likenum
                                                      });
                                                      fireStore
                                                          .collection('actPost')
                                                          .doc(actPost.postKey)
                                                          .update({
                                                        'presslike': false
                                                      });
                                                    } else {
                                                      actPost.like.add(appData
                                                          .usermodel.uid);
                                                      fireStore
                                                          .collection('actPost')
                                                          .doc(actPost.postKey)
                                                          .update({
                                                        'like': FieldValue
                                                            .arrayUnion(uids)
                                                      });
                                                      fireStore
                                                          .collection('actPost')
                                                          .doc(actPost.postKey)
                                                          .update({
                                                        'presslike': true
                                                      });
                                                      fireStore
                                                          .collection('actPost')
                                                          .doc(actPost.postKey)
                                                          .update({
                                                        'likenum':
                                                            ++actPost.likenum
                                                      });
                                                    }
                                                  });
                                                },
                                              ),
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.only(bottom: 1),
                                              child: Text(
                                                  actPost.like.length
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 15,
                                                      color:
                                                          Color(0xff437B56))),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    Flexible(
                                      fit: FlexFit.tight,
                                      child: Container(
                                          width: width * 0.8,
                                          color: Colors.white,
                                          child: ListView.builder(
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount: actPost.imgList.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return Image.network(
                                                    actPost.imgList
                                                        .elementAt(index),
                                                    fit: BoxFit.fill);
                                              })),
                                    ),
                                  ],
                                ),
                              )),
                        ],
                      );
                    },
                  );
                })));
  }
}
