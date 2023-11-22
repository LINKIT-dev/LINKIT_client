class UserLikeModel {
  String user_url;
  bool user_like;

  UserLikeModel({
    this.user_url = '',
    this.user_like = false,
  });

  factory UserLikeModel.fromJson(Map<String, dynamic> json) {
    return UserLikeModel(
      user_url: json['user_url'],
      user_like: json['user_like'],
    );
  }
}
