class Shop {
  late String name;
  late String image;
  late String docId;

  Shop(
      {required String this.name,
      required String this.image,
      required String this.docId});
  Shop.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        docId = json['docId'];

  Map<String, dynamic> toJson() =>
      {'name': name, 'image': image, 'docId': docId};
}
