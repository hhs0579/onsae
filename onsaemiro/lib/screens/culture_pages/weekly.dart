import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/screens/culture_pages/report_page.dart';

class Weekly extends StatefulWidget {
  const Weekly({Key? key}) : super(key: key);

  @override
  _WeeklyState createState() => _WeeklyState();
}

String value = Get.arguments;
String img = '';
Stream<DocumentSnapshot> post =
    FirebaseFirestore.instance.collection('actPost').doc(value).snapshots();

class _WeeklyState extends State<Weekly> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Stream<DocumentSnapshot> post =
        FirebaseFirestore.instance.collection('actPost').doc(value).snapshots();
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 138,
          leading: IconButton(
            icon: Icon(Icons.chevron_left, color: Colors.green, size: 30),
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
        body: Container(
            child: StreamBuilder<DocumentSnapshot>(
                stream: post,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    img = snapshot.data!['imgList'][0];
                    print('The Documents Exists');
                  }
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 57,
                              ),
                              Container(
                                width: width * 1,
                                height: height * 0.6,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(img),
                                        fit: BoxFit.fill),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: width * 0.6,
                                  ),
                                  ImageIcon(
                                    AssetImage('assets/신고.png'),
                                    color: Colors.red,
                                    size: 14,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  reportPage()));
                                    },
                                    child: Text(
                                      '신고하기',
                                      style: TextStyle(
                                          color: Colors.red, fontSize: 11),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      });
                })));
  }
}
