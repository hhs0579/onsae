import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:onsaemiro/models/actpost_model.dart';
import 'package:onsaemiro/screens/culture_pages/act_confirm.dart';
import 'package:onsaemiro/screens/culture_pages/image1_Enlarge.dart';
import 'package:onsaemiro/screens/culture_pages/image2_enlarge.dart';
import 'package:onsaemiro/screens/culture_pages/report_page.dart';
import 'package:onsaemiro/screens/culture_pages/weekly.dart';

import 'image1_enlarge.dart';
import 'image3_enlarge.dart';

class weeklyBestPage extends StatefulWidget {
  const weeklyBestPage({Key? key}) : super(key: key);

  @override
  _weeklyBestPageState createState() => _weeklyBestPageState();
}

var visibley = false;

class _weeklyBestPageState extends State<weeklyBestPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Stream<QuerySnapshot> like = FirebaseFirestore.instance
        .collection('actPost')
        .orderBy(
          'like',
          descending: true,
        )
        .limit(3)
        .snapshots();

    return Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.15,
          leading: IconButton(
            icon: ImageIcon(
              AssetImage('assets/Vector(진한녹색).png'),
              color: Colors.green,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.white,
          title: Text(
            '주간 베스트',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(67, 123, 86, 1),
            ),
          ),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                StreamBuilder<QuerySnapshot>(
                    stream: like,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('오류 발생');
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text('로딩중');
                      }
                      List<ActPost> actPosts = [];
                      for (var value in snapshot.data!.docs) {
                        ActPost actPost = ActPost.fromJson(
                            value.data() as Map<String, dynamic>);
                        actPosts.add(actPost);
                      }
                      return CarouselSlider.builder(
                          options: CarouselOptions(
                              height: height * 0.6,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              enlargeStrategy: CenterPageEnlargeStrategy.scale),
                          itemCount: actPosts.length,
                          itemBuilder:
                              (BuildContext context, int index, realIndex) {
                            ActPost actPost = actPosts.elementAt(index);
                            return Column(
                              children: [
                                Stack(
                                  children: [
                                    Ink(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  actPost.imgList[0]),
                                              fit: BoxFit.cover),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: InkWell(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                        onTap: () {},
                                        child: Container(
                                          clipBehavior:
                                              Clip.antiAliasWithSaveLayer,
                                          height: height * 0.5,
                                          width: width * 0.9,
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        bottom: 10,
                                        right: 10,
                                        child: IconButton(
                                            onPressed: () {
                                              Get.to(() => Weekly(),
                                                  arguments: actPost.postKey);
                                            },
                                            icon: Image(
                                              image:
                                                  AssetImage('assets/확대.png'),
                                            )))
                                  ],
                                ),
                              ],
                            );
                          });
                    }),
                SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: 110,
                  height: height * 0.05,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(26.5)),
                      side: BorderSide(width: 2.0, color: Colors.green),
                    ),
                    child: Text(
                      '인증하러 가기',
                      style: TextStyle(color: Color(0xff595959), fontSize: 13),
                    ),
                    onPressed: () {
                      Get.to(actConfirmPage());
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
