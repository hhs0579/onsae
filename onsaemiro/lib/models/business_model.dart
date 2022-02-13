BusinessModel? businessmodel;

class BusinessModel {
  DateTime date;
  String email;
  String image;
  String name;
  String nickname;
  String password;
  String phone;
  String address;
  String addressdetail;
  List<dynamic> mystore;
  String pushToken;
  String uid;

  BusinessModel(
      {required this.date,
      required this.email,
      required this.image,
      required this.password,
      required this.name,
      required this.nickname,
      required this.phone,
      required this.address,
      required this.addressdetail,
      required this.mystore,
      required this.pushToken,
      required this.uid});

  BusinessModel.fromJson(Map<String, dynamic> json)
      : date = json['date'].toDate(),
        email = json['email'],
        image = json['image'],
        password = json['password'],
        name = json['name'],
        nickname = json['nickname'],
        phone = json['phone'],
        address = json['address'],
        addressdetail = json['addressdetail'],
        mystore = json['mystore'],
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
        'mystore': mystore,
        'pushToken': pushToken,
        'uid': uid
      };
}
