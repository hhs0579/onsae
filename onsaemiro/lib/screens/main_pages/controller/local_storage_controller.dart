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

  Future<String?> getUserType() async {
    _prefs = await SharedPreferences.getInstance();
    try {
      return _prefs!.getString('userType');
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> setUserType(String userType) async {
    _prefs = await SharedPreferences.getInstance();
    try {
      _prefs!.setString('userType', userType);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String?> getUserPhone() async {
    _prefs = await SharedPreferences.getInstance();
    try {
      return _prefs!.getString('userPhone');
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<void> setUserPhone(String phone) async {
    _prefs = await SharedPreferences.getInstance();
    try {
      _prefs!.setString('userPhone', phone);
    } catch (e) {
      print(e.toString());
    }
  }
}
