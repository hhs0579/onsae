ActPost? actPost;

class ActPost {
  DateTime date;
  String nickname;
  String postKey;
  String post;
  List<dynamic> imgList;
  ActPost(
      {required this.date,
      required this.nickname,
      required this.postKey,
      required this.post,
      required this.imgList});

  ActPost.fromJson(Map<String, dynamic> json)
      : date = json['date'].toDate(),
        nickname = json['nickname'],
        postKey = json['postKey'],
        post = json['post'],
        imgList = json['imgList'];

  Map<String, dynamic> toJson() => {
        'date': date,
        'nickname': nickname,
        'postKey': postKey,
        'post': post,
        'imgList': imgList
      };
}
