MyInfo? myInfo;

class MyInfo {
  DateTime date;
  String email;
  String image;
  String name;
  String nickname;
  String password;
  String phone;
  String address;
  String addressdetail;
  List<dynamic> myposts;
  List<dynamic> mypayment;
  List<dynamic> mybasket;
  int like;
  String pushToken;
  String uid;

  MyInfo(
      {required this.date,
      required this.email,
      required this.image,
      required this.password,
      required this.name,
      required this.nickname,
      required this.phone,
      required this.address,
      required this.addressdetail,
      required this.myposts,
      required this.mypayment,
      required this.mybasket,
      required this.like,
      required this.pushToken,
      required this.uid});

  MyInfo.fromJson(Map<String, dynamic> json)
      : date = json['date'].toDate(),
        email = json['email'],
        image = json['image'],
        password = json['password'],
        name = json['name'],
        nickname = json['nickname'],
        phone = json['phone'],
        address = json['address'],
        addressdetail = json['addressdetail'],
        myposts = json['myposts'],
        mybasket = json['mybasket'],
        mypayment = json['mypayment'],
        like = json['like'],
        pushToken = json['pushToken'] ?? '',
        uid = json['uid'];

  Map<String, dynamic> toJson() => {
        'date': date,
        'email': email,
        'image': image,
        'password': password,
        'name': name,
        'nickname': nickname,
        'phone': phone,
        'adrress': address,
        'addressdetail': addressdetail,
        'myposts': myposts,
        'mypayment': mypayment,
        'mybasket': mybasket,
        'like': like,
        'pushToken': pushToken,
        'uid': uid
      };
}
