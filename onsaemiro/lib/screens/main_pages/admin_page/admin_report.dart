import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/models/report_model.dart';
import 'package:onsaemiro/screens/culture_pages/report_page.dart';

class AdminReport extends StatefulWidget {
  const AdminReport({Key? key}) : super(key: key);

  @override
  _AdminReportState createState() => _AdminReportState();
}

String reason = '';

class _AdminReportState extends State<AdminReport> {
  _reportItem(Report report, String reason) {
    return Column(children: [
      SizedBox(height: 20),
      Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          height: 230,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Color(0xff6CCD6C)),
          ),
          child: Column(children: [
            Row(
              children: [
                Container(
                    width: 120,
                    child: Text(report.reportReason,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15))),
                SizedBox(width: 50),
                Container(
                    width: 120,
                    child: Text(reason,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15))),
                SizedBox(width: 50),
                Container(
                  width: 120,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('게시글 바로가기'),
                  ),
                ),
                SizedBox(height: 20),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(width: 20),
                  Container(
                    width: 100,
                    height: 40,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xff6CCD6C),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26.5)),
                      ),
                      child: Text(
                        '삭제하기',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                      onPressed: () {
                        Get.defaultDialog(
                          cancelTextColor: Color(0xff3AAFFC),
                          title: '',
                          content: Text('정말 삭제하시겠습니까?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection('actPost')
                                    .doc(reportKey)
                                    .delete();
                                Get.back();
                              },
                              child: Text('확인'),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text('취소'),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ])
              ],
            ),
          ]))
    ]);
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _shopStream =
        FirebaseFirestore.instance.collection('report').snapshots();
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: height * 0.1,
          backgroundColor: Colors.white,
          title: Text(
            '신고 게시물 확인',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Color(0xff595959)),
          ),
          centerTitle: true,
          elevation: 1,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20),
                StreamBuilder<QuerySnapshot>(
                    stream: _shopStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        print(snapshot.error);
                        return Center(child: Text('오류가 발생했습니다.'));
                      }
                      if (snapshot.data == null) {
                        print('null');
                        return Container();
                      }
                      List<Report> reports = [];

                      for (var value in snapshot.data!.docs) {
                        Report report = Report.fromJson(
                            value.data() as Map<String, dynamic>);
                        reports.add(report);
                      }
                      return Container(
                        height: height * 0.9,
                        child: ListView.builder(
                            itemCount: reports.length,
                            itemBuilder: (context, index) {
                              Report report = reports.elementAt(index);
                              if (report.reportType == 1) {
                                setState(() {
                                  reason = '상품과 관련 없는 내용';
                                });
                                return _reportItem(report, reason);
                              } else if (report.reportType == 2) {
                                setState(() {
                                  reason = "개인의 상업적 홍보";
                                });
                                return _reportItem(report, reason);
                              } else if (report.reportType == 3) {
                                setState(() {
                                  reason = "개인정보 누출 위험";
                                });
                                return _reportItem(report, reason);
                              } else if (report.reportType == 4) {
                                setState(() {
                                  reason = "저작권 불법 도용";
                                });
                                return _reportItem(report, reason);
                              } else if (report.reportType == 5) {
                                setState(() {
                                  reason = "상품리뷰가 아닌 판매자 리뷰 내용";
                                });
                                return _reportItem(report, reason);
                              } else if (report.reportType == 6) {
                                setState(() {
                                  reason = "기타";
                                });
                                return _reportItem(report, reason);
                              }
                              return _reportItem(report, reason);
                            }),
                      );
                    }),
              ],
            ),
          ),
        ));
  }
}
