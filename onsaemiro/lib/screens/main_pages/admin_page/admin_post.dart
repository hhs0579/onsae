import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPost extends StatefulWidget {
  const AdminPost({Key? key}) : super(key: key);

  @override
  _AdminPostState createState() => _AdminPostState();
}

List<dynamic> imgList = [];
var a = Get.arguments;

class _AdminPostState extends State<AdminPost> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    Stream<DocumentSnapshot> post =
        FirebaseFirestore.instance.collection('actPost').doc(a).snapshots();
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
            '해당 게시글 ',
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
                    for (var i = 0; i < 1; i++) {
                      imgList.add(snapshot.data!['imgList'][i]);
                    }
                    print('The Documents Exists');
                  }
                  return Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: imgList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Image.network(imgList.elementAt(index),
                                fit: BoxFit.cover);
                          }));
                })));
  }
}
