class Shop {
  late String name;
  late String image;
  late String docId;
  late bool isaccess;
  late String type;

  Shop(
      {required String this.name,
      required String this.image,
      required String this.docId,
      required bool this.isaccess,
      required String type});
  Shop.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        docId = json['docId'],
        isaccess = json['isaccess'],
        type = json['type'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'docId': docId,
        'isaccess': isaccess,
        'type': type
      };
}
