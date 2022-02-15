class Shop {
  String name;
  late String image;
  late String businessimage;
  late String docId;
  late String isaccess;
  late String type;
  late String phone;

  Shop(
      {required this.name,
      required this.image,
      required this.businessimage,
      required this.docId,
      required this.isaccess,
      required this.type});
  Shop.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        businessimage = json['businessimage'],
        docId = json['docId'],
        isaccess = json['isaccess'],
        type = json['type'],
        phone = json['phone'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'businessimage': businessimage,
        'docId': docId,
        'isaccess': isaccess,
        'type': type,
        'phone': phone,
      };
}
