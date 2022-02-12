import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');

  Future setPhoneUserData(
      DateTime date,
      String _name,
      String _nickname,
      String _phone,
      String _address,
      String _addressdetail,
      String _usertype) async {
    await userCollection.doc(uid).set({
      'data': date,
      'image': '',
      'name': _name,
      'nickname': _nickname,
      'phone': _phone,
      'address': _address,
      'addressdetail': _addressdetail,
      'myposts': [],
      'mybasket': [],
      'mypayment': [],
      'like': 0,
      'usertype': _usertype
    });
  }
}
