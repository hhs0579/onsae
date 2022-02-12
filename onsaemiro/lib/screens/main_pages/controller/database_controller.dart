import 'package:cloud_firestore/cloud_firestore.dart';

DatabaseController databaseController = DatabaseController();

class DatabaseController {
  Future<bool> isDuplicatednickname(String nickname) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('nickname', isEqualTo: nickname)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future<bool> isDuplicatedPhone(String phoneNumber) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('phone', isEqualTo: phoneNumber)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
