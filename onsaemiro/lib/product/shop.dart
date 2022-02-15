class Shop {
  String name;
  late String image;
  late String docId;
  late bool isaccess;
  late String type;
  late String phone;

  Shop(
      {required String this.name,
      required String this.image,
      required String this.docId,
      required bool this.isaccess,
      required String type,
      required String phone});
  Shop.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        docId = json['docId'],
        isaccess = json['isaccess'],
        type = json['type'],
        phone = json['phone'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'docId': docId,
        'isaccess': isaccess,
        'type': type,
        'phone': phone,
      };
}
