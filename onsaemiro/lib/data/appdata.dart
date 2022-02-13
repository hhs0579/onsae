import 'package:get/get.dart';
import 'package:onsaemiro/models/actpost_model.dart';
import 'package:onsaemiro/models/myinfo_model.dart';

class AppData extends GetxController {
  bool _isLoadingScreen = false;
  String _userEmail = '';

  MyInfo _myInfo = MyInfo(
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
    uid: '',
  );

  MyInfo get myInfo => _myInfo;

  set myInfo(MyInfo myInfo) {
    _myInfo = myInfo;
    update();
  }

  ActPost _actPost = ActPost(
    date: DateTime.now(),
    nickname: '',
    imgList: [],
    postKey: '',
    post: '',
    like: [],
  );

  ActPost get actPost => _actPost;

  set actPost(ActPost _actPost) {
    _actPost = actPost;
    update();
  }

  String get userEmail => _userEmail;

  set userEmail(String userEmail) {
    _userEmail = userEmail;
    update();
  }

  bool get isLoadingScreen => _isLoadingScreen;

  set isLoadingScreen(bool isLoadingScreen) {
    _isLoadingScreen = isLoadingScreen;
    update();
  }
}
