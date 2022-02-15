import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:onsaemiro/classes/toast_message.dart';
import 'package:onsaemiro/data/appdata.dart';
import 'package:onsaemiro/models/business_model.dart';
import 'package:onsaemiro/models/user_model.dart';
import 'package:onsaemiro/screens/main_pages/controller/database_controller.dart';
import 'package:onsaemiro/screens/main_pages/controller/local_storage_controller.dart';

AuthController authController = AuthController();

AppData appdata = Get.find();

class AuthController {
  Future authUser(String email, String password, String userType) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (await databaseController.hasMatchTypeEmail(email, userType) == true) {
        await saveLocalStorageToEmail(userCredential, userType);
        String? pushToken = await getToken();
        if (pushToken != null) {
          databaseController.updatePushTokenToEmail(
              email: email, pushToken: pushToken, userType: userType);
        }
        AppData appData = Get.find();
        if (appData.userType == 'user') {
          await databaseController.fetchMyInfoToEmailUser(email);
        } else {
          await databaseController.fetchMyInfoToEmailBusiness(email);
        }
      } else {
        return toastMessage('존재하지 않는 이메일입니다.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return toastMessage('잘못된 이메일 입니다.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return toastMessage('비밀번호를 다시 한번 확인해주세요.');
      } else if (e.code == 'invalid-email') {
        print(e);
        return toastMessage('존재하지 않는 이메일입니다.');
      } else {
        return toastMessage(e.code.toString());
      }
    } catch (e) {
      print(e);
      toastMessage('잘못된 로그인 정보입니다.');
    }

    return null;
  }

  Future<void> saveLocalStorageToEmail(
      UserCredential userCredential, String userType) async {
    AppData appData = Get.find();
    appData.userEmail = userCredential.user?.email ?? 'null';
    if (userType == 'user') {
      appData.usermodel.email = appData.userEmail;
    } else if (userType == 'business') {
      appData.businessmodel.email = appData.userEmail;
    }
    localStorageController.setUserEmail(appData.userEmail);
    localStorageController.setUserType(userType);
  }

  Future<void> saveLocalStorageToPhone(String phone, userType) async {
    AppData appData = Get.find();
    appData.userPhone = phone;
    if (userType == 'user') {
      appData.usermodel.phone = appData.userPhone;
    } else if (userType == 'business') {
      appData.businessmodel.phone = appData.userPhone;
    }

    localStorageController.setUserPhone(phone);
    localStorageController.setUserType(userType);
  }

  Future<void> handleSignOut() async {
    appdata.usermodel = Usermodel(
        date: DateTime.now(),
        email: '',
        image: '',
        name: '',
        nickname: '',
        password: '',
        phone: '',
        address: '',
        addressdetail: '',
        myposts: [],
        mypayment: [],
        mybasket: [],
        like: 0,
        pushToken: '',
        birth: '',
        uid: '',
        usertype: '');
    appdata.businessmodel = BusinessModel(
        date: DateTime.now(),
        email: '',
        image: '',
        name: '',
        nickname: '',
        password: '',
        phone: '',
        address: '',
        addressdetail: '',
        mystore: [],
        pushToken: '',
        birth: '',
        uid: '',
        usertype: '');
    await localStorageController.setUserEmail('');
    await FirebaseAuth.instance.signOut();
  }

  Future<String?> getToken() async {
    return await FirebaseMessaging.instance.getToken();
  }
}
