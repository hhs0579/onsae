import 'package:firebase_auth/firebase_auth.dart';

AuthController authController = AuthController();

class AuthController {
  Future<void> handleSignOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
