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
  Future setUserData(
      DateTime date,
      String email,
      String password,
      String _name,
      String _nickname,
      String _phone,
      String _address,
      String _addressdetail,
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
      'pushToken': '',
      'uid': uid,
    });
  }

  Future setPostData(
    DateTime date,
    String post,
    String postkey,
    String _nickname,
    List<dynamic> imgList,
  ) async {
    await postCollection.doc(key).set({
      'date': date,
      'post': post,
      'nickname': _nickname,
      'postKey': key,
      'imgList': imgList,
    });
  }
}
