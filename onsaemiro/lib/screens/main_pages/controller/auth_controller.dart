import 'package:firebase_auth/firebase_auth.dart';
import 'package:onsaemiro/screens/main_pages/controller/database_controller.dart';

AuthController authController = AuthController();

class AuthController {
  Future authUser(String email, String password) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _saveLocalStorage(userCredential);
      String? pushToken = await getToken();
      if (pushToken != null) {
        databaseController.updatePushToken(
          email: email,
          pushToken: pushToken,
        );
      }
      AppData appData = Get.find();
      await databaseController.fetchMyInfo(appData.myInfo.email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        return '잘못된 이메일 입니다.';
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        return '비밀번호를 다시 한번 확인해주세요..';
      } else {
        print(e);
        return e.code.toString();
      }
    }
    return null;
  }

  Future<void> handleSignOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
