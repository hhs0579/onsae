import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/data/appdata.dart';
import 'package:onsaemiro/models/business_model.dart';
import 'package:onsaemiro/models/public_model.dart';
import 'package:onsaemiro/models/user_model.dart';

DatabaseController databaseController = DatabaseController();

class DatabaseController {
  Future<bool> isDuplicatedEmail(String email) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    if (querySnapshot.docs.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

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

  Future<bool?> hasMatchTypeEmail(String email, String userType) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    Publicmodel usermodel = Publicmodel.fromJson(
        querySnapshot.docs.first.data() as Map<String, dynamic>);
    if (usermodel.usertype == userType) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool?> hasMatchTypePhone(String phone, String userType) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('phone', isEqualTo: phone)
        .get();
    Publicmodel usermodel = Publicmodel.fromJson(
        querySnapshot.docs.first.data() as Map<String, dynamic>);
    if (usermodel.usertype == userType) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> fetchMyInfoToEmailUser(String email) async {
    AppData appData = Get.find();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isEmpty) {
    } else {
      appData.usermodel = Usermodel.fromJson(
          querySnapshot.docs.first.data() as Map<String, dynamic>);
    }
  }

  Future<void> fetchMyInfoToEmailBusiness(String email) async {
    AppData appData = Get.find();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();

    if (querySnapshot.docs.isEmpty) {
    } else {
      appData.businessmodel = BusinessModel.fromJson(
          querySnapshot.docs.first.data() as Map<String, dynamic>);
    }
  }

  Future<void> fetchMyInfoToPhoneUser(String phone) async {
    AppData appData = Get.find();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('phone', isEqualTo: phone)
        .get();

    if (querySnapshot.docs.isEmpty) {
    } else {
      appData.usermodel = Usermodel.fromJson(
          querySnapshot.docs.first.data() as Map<String, dynamic>);
    }
  }

  Future<void> fetchMyInfoToPhoneBusiness(String phone) async {
    AppData appData = Get.find();
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('phone', isEqualTo: phone)
        .get();

    if (querySnapshot.docs.isEmpty) {
    } else {
      appData.businessmodel = BusinessModel.fromJson(
          querySnapshot.docs.first.data() as Map<String, dynamic>);
    }
  }

  Future<void> updatePushTokenToEmail(
      {required String email,
      required String pushToken,
      required String userType}) async {
    AppData appData = Get.find();
    if (userType == 'user') {
      Usermodel newMyInfo = appData.usermodel;
      newMyInfo.pushToken = pushToken;
      appData.usermodel = newMyInfo;
    } else {
      BusinessModel newMyInfo = appData.businessmodel;
      newMyInfo.pushToken = pushToken;
      appData.businessmodel = newMyInfo;
    }

    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .get();
    String id = querySnapshot.docs.first.id;

    await FirebaseFirestore.instance.collection('users').doc(id).update({
      'pushToken': pushToken,
    });
  }

  Future<void> updatePushTokenToPhone(
      {required String phone,
      required String pushToken,
      required String userType}) async {
    AppData appData = Get.find();
    if (userType == 'user') {
      Usermodel newMyInfo = appData.usermodel;
      newMyInfo.pushToken = pushToken;
      appData.usermodel = newMyInfo;
    } else {
      BusinessModel newMyInfo = appData.businessmodel;
      newMyInfo.pushToken = pushToken;
      appData.businessmodel = newMyInfo;
    }
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('phone', isEqualTo: phone)
        .get();
    String id = querySnapshot.docs.first.id;

    await FirebaseFirestore.instance.collection('users').doc(id).update({
      'pushToken': pushToken,
    });
  }
}
