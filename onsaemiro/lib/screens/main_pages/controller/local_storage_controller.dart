import 'package:shared_preferences/shared_preferences.dart';

LocalStorageController localStorageController = LocalStorageController();

class LocalStorageController {
  SharedPreferences? _prefs;

  LocalStorageController() {
    init();
  }

  void init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<String?> getUserEmail() async {
    _prefs = await SharedPreferences.getInstance();
    try {
      return _prefs!.getString('userEmail');
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> setUserEmail(String email) async {
    _prefs = await SharedPreferences.getInstance();
    try {
      _prefs!.setString('userEmail', email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String?> getUserPhone() async {
    _prefs = await SharedPreferences.getInstance();
    try {
      return _prefs!.getString('userEmail');
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> setUserPhone(String email) async {
    _prefs = await SharedPreferences.getInstance();
    try {
      _prefs!.setString('userEmail', email);
    } catch (e) {
      print(e.toString());
    }
  }
}
