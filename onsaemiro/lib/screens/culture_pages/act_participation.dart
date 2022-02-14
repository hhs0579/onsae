import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onsaemiro/data/appdata.dart';
import 'package:onsaemiro/repo/database_service.dart';
import 'package:dotted_border/dotted_border.dart';

class actParticipationPage extends StatefulWidget {
  const actParticipationPage({Key? key}) : super(key: key);

  @override
  _actParticipationPageState createState() => _actParticipationPageState();
}

AppData appData = Get.find();
List<String> _arrImageUrls = [];
var visibley = false;
List<XFile>? imageFileList = [];
final _picker = ImagePicker();
FirebaseStorage firebaseStorage = FirebaseStorage.instance;
TextEditingController postTextEditController = TextEditingController();
String profile = '';

class _actParticipationPageState extends State<actParticipationPage> {
  Future<void> _pickedImgs() async {
    if (imageFileList != null) {
      imageFileList?.clear();
    }
    try {
      final List<XFile>? imgs = await _picker.pickMultiImage(
        imageQuality: 70,
        maxWidth: 1000,
      );

      if (imgs!.isNotEmpty) {
        imageFileList!.addAll(imgs);
      }
      print(imgs.length.toString());
    } catch (e) {
      print(e.toString());
    }
    setState(() {});
  }

  Future<String> uploadFile(XFile _image) async {
    String imageurls = _image.name;
    Reference reference =
        FirebaseStorage.instance.ref().child('post').child(imageurls);

    UploadTask uploadTask = reference.putFile(File(_image.path));
    await uploadTask.whenComplete(() {});
    return await reference.getDownloadURL();
  }

  Future uploadFunction(List<XFile> _images) async {
    for (int i = 0; i < _images.length; i++) {
      var imageUrl = await uploadFile(_images[i]);
      _arrImageUrls.add(imageUrl.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isPadMode = MediaQuery.of(context).size.width > 300;
    List<Widget> _boxContents = [
      IconButton(
          onPressed: () {
            _pickedImgs();
          },
          icon: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6), shape: BoxShape.circle),
              child: Icon(
                Icons.photo_camera,
                color: Theme.of(context).colorScheme.primary,
              ))),
      Container(),
      Container(),
      imageFileList!.length <= 4
          ? Container()
          : FittedBox(
              child: Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6),
                      shape: BoxShape.circle),
                  child: Text(
                    '+${(imageFileList!.length - 4).toString()}',
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        ?.copyWith(fontWeight: FontWeight.w800),
                  ))),
    ];
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 138,
          leading: Image.asset('assets/Vector(진한녹색).png'),
          backgroundColor: Colors.white,
          title: Text(
            '게시물 작성',
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.w700,
              color: Color.fromRGBO(67, 123, 86, 1),
            ),
          ),
          centerTitle: true,
          elevation: 0.5,
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 400,
                  padding: EdgeInsets.fromLTRB(24, 31, 24, 20),
                  child: TextField(
                    controller: postTextEditController,
                    keyboardType: TextInputType.multiline,
                    textInputAction: TextInputAction.newline,
                    maxLines: 36,
                    style: TextStyle(fontSize: 11),
                    decoration: InputDecoration(
                        hintText: '문구 입력...',
                        hintStyle: TextStyle(fontSize: 11),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(color: Colors.green),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.green))),
                  ),
                ),
                GridView.count(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(10),
                  crossAxisCount: isPadMode ? 4 : 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  children: List.generate(
                      4,
                      (index) => DottedBorder(
                          child: Container(
                            child: Center(child: _boxContents[index]),
                            decoration: index <= imageFileList!.length - 1
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(
                                            File(imageFileList![index].path))))
                                : null,
                          ),
                          color: Colors.lightGreen,
                          dashPattern: [1000, 1],
                          borderType: BorderType.RRect,
                          radius: Radius.circular(10))).toList(),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 110,
                    height: 41,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26.5)),
                        side: BorderSide(width: 2.0, color: Colors.green),
                      ),
                      onPressed: () async {
                        Fluttertoast.showToast(
                            msg: "게시하기 버튼이 나올 때까지 기다려주세요.",
                            toastLength: Toast.LENGTH_SHORT,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.lightBlue,
                            fontSize: 12.0);
                        await uploadFunction(imageFileList!);
                        setState(() {
                          visibley = true;
                        });
                      },
                      child: Text(
                        '사진등록',
                        style:
                            TextStyle(color: Color(0xff595959), fontSize: 13),
                      ),
                    )),
                Visibility(
                  visible: visibley,
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 110,
                    height: 41,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26.5)),
                        side: BorderSide(width: 2.0, color: Colors.green),
                      ),
                      child: Text(
                        '게시하기',
                        style:
                            TextStyle(color: Color(0xff595959), fontSize: 13),
                      ),
                      onPressed: () async {
                        if (postTextEditController.text == '') {
                          Fluttertoast.showToast(
                              msg: "게시글을 입력해주세요.",
                              toastLength: Toast.LENGTH_SHORT,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.lightBlue,
                              fontSize: 12.0);
                        } else if (_arrImageUrls == []) {
                          Fluttertoast.showToast(
                              msg: "사진을 하나이상 선택해주세요.",
                              toastLength: Toast.LENGTH_SHORT,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.lightBlue,
                              fontSize: 12.0);
                        } else {
                          await DatabaseService(uid: appData.usermodel.uid)
                              .setPostData(
                                  DateTime.now(),
                                  appData.usermodel.nickname,
                                  '',
                                  postTextEditController.text,
                                  _arrImageUrls,
                                  [],
                                  appData.usermodel.image,
                                  false);
                        }
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
