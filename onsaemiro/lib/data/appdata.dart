import 'package:get/get.dart';
import 'package:onsaemiro/models/actpost_model.dart';
import 'package:onsaemiro/models/business_model.dart';
import 'package:onsaemiro/models/report_model.dart';
import 'package:onsaemiro/models/user_model.dart';

class AppData extends GetxController {
  bool _isLoadingScreen = false;
  String _userEmail = '';
  String _userPhone = '';
  String _userType = '';

  Usermodel _usermodel = Usermodel(
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

  Usermodel get usermodel => _usermodel;

  set usermodel(Usermodel usermodel) {
    _usermodel = usermodel;
    update();
  }

  BusinessModel _businessmodel = BusinessModel(
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

  BusinessModel get businessmodel => _businessmodel;

  set businessmodel(BusinessModel businessmodel) {
    _businessmodel = businessmodel;
    update();
  }

  ActPost _actPost = ActPost(
      date: DateTime.now(),
      nickname: '',
      imgList: [],
      postKey: '',
      post: '',
      like: [],
      profile: '',
      presslike: false,
      likenum: 0);

  ActPost get actPost => _actPost;

  set actPost(ActPost _actPost) {
    _actPost = actPost;
    update();
  }

  Report _report =
      Report(reportKey: '', reportReason: '', postkey: '', reportType: 0);

  Report get report => _report;

  set report(Report _report) {
    _report = report;
    update();
  }

  String get userEmail => _userEmail;

  set userEmail(String userEmail) {
    _userEmail = userEmail;
    update();
  }

  String get userPhone => _userPhone;

  set userPhone(String userEmail) {
    _userPhone = userPhone;
    update();
  }

  String get userType => _userType;

  set userType(String userType) {
    _userType = userType;
    update();
  }

  bool get isLoadingScreen => _isLoadingScreen;

  set isLoadingScreen(bool isLoadingScreen) {
    _isLoadingScreen = isLoadingScreen;
    update();
  }
}
