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

class _actConfirmPageState extends State<actConfirmPage> {
  final Stream<QuerySnapshot> post = FirebaseFirestore.instance
      .collection('actPost')
      .orderBy('date', descending: true)
      .snapshots();
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
        body: SingleChildScrollView(
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
                        children: [],
                      );
                    },
                  );
                })));
  }
}
