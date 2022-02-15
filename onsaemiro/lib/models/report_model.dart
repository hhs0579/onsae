ActPost? actPost;

class ActPost {
  DateTime date;
  String nickname;
  String postKey;
  String post;
  List<dynamic> imgList;
  List<dynamic> like;
  String profile;
  bool presslike;
  int likenum;

  ActPost(
      {required this.date,
      required this.nickname,
      required this.postKey,
      required this.post,
      required this.imgList,
      required this.like,
      required this.profile,
      required this.presslike,
      required this.likenum});

  ActPost.fromJson(Map<String, dynamic> json)
      : date = json['date'].toDate(),
        nickname = json['nickname'],
        postKey = json['postKey'],
        post = json['post'],
        imgList = json['imgList'],
        like = json['like'] ?? [],
        profile = json['profile'] ?? '',
        presslike = json['presslike'] ?? false,
        likenum = json['likenum'] ?? 0;

  Map<String, dynamic> toJson() => {
        'date': date,
        'nickname': nickname,
        'postKey': postKey,
        'post': post,
        'imgList': imgList,
        'like': like,
        'profile': profile,
        'preesslike': presslike,
        'likenum': likenum
      };
}
