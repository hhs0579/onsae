class Shop {
  String name;
  late String image;
  late String businessimage;
  late String docId;
  late String isaccess;
  late String type;
  late String phone;
  late String info;
  late String shopAddress;
  late String shopDetailinfo;
  late String shopBenefit;
  late String shopDetailAddress;

  Shop(
      {required this.name,
      required this.image,
      required this.businessimage,
      required this.docId,
      required this.isaccess,
      required this.type,
      required this.info,
      required this.shopAddress,
      required this.phone,
      required this.shopDetailinfo,
      required this.shopBenefit,
      required this.shopDetailAddress});
  Shop.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        image = json['image'],
        businessimage = json['businessimage'],
        docId = json['docId'],
        isaccess = json['isaccess'],
        type = json['type'],
        phone = json['phone'],
        info = json['info'],
        shopAddress = json['shopAddress'],
        shopDetailinfo = json['shopDetailinfo'],
        shopBenefit = json['shopBenefit'],
        shopDetailAddress = json['shopDetailAddress'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'image': image,
        'businessimage': businessimage,
        'docId': docId,
        'isaccess': isaccess,
        'type': type,
        'phone': phone,
        'info': info,
        'shopAddress': shopAddress,
        'shopDetailinfo': shopDetailinfo,
        'shopBenefit': shopBenefit,
        'shopDetailAddress': shopDetailAddress
      };
}
