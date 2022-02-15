import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:random_string/random_string.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  var key = randomString(16);
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference postCollection =
      FirebaseFirestore.instance.collection('actPost');
  final CollectionReference reportCollection =
      FirebaseFirestore.instance.collection('report');
  Future setUserData(
      DateTime date,
      String email,
      String password,
      String _name,
      String _nickname,
      String _phone,
      String _address,
      String _addressdetail,
      String _birth,
      String _usertype) async {
    await userCollection.doc(uid).set({
      'email': email,
      'date': date,
      'image': '',
      'name': _name,
      'nickname': _nickname,
      'password': password,
      'phone': _phone,
      'address': _address,
      'addressdetail': _addressdetail,
      'myposts': [],
      'mybasket': [],
      'mypayment': [],
      'like': 0,
      'usertype': _usertype,
      'birth': _birth,
      'pushToken': '',
      'uid': uid,
    });
  }

  Future setBusinessData(
      DateTime date,
      String email,
      String password,
      String _name,
      String _nickname,
      String _phone,
      String _address,
      String _addressdetail,
      String _birth,
      String _usertype) async {
    await userCollection.doc(uid).set({
      'email': email,
      'date': date,
      'image': '',
      'name': _name,
      'nickname': _nickname,
      'password': password,
      'phone': _phone,
      'address': _address,
      'addressdetail': _addressdetail,
      'mystore': [],
      'usertype': _usertype,
      'birth': _birth,
      'pushToken': '',
      'uid': uid,
    });
  }

  Future updateUserData(
    String _nickname,
    String _password,
    String _phone,
    String _address,
    String _addressdetail,
    String _birth,
  ) async {
    await userCollection.doc(uid).update({
      'nickname': _nickname,
      'password': _password,
      'address': _address,
      'addressdetail': _addressdetail,
      'birth': _birth,
      'phone': _phone,
    });
  }

  Future setPostData(
      DateTime date,
      String _nickname,
      String postkey,
      String post,
      List<dynamic> imgList,
      List<dynamic> like,
      String profile,
      bool presslike,
      int likenum) async {
    await postCollection.doc(key).set({
      'date': date,
      'post': post,
      'nickname': _nickname,
      'postKey': key,
      'imgList': imgList,
      'like': like,
      'profile': profile,
      'preesslike': presslike,
      'likenum': likenum
    });
  }
}
