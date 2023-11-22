class ChatModel {
  String username;
  String user_imageUrl;
  String imageUrl;
  String title;
  String description;
  String url;
  int tagNum;
  String tag;

  ChatModel(
      {this.username = '',
      this.user_imageUrl = '',
      this.imageUrl = '',
      this.title = '',
      this.description = '',
      this.url = '',
      this.tagNum = 0,
      this.tag = ''});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      username: json['username'],
      user_imageUrl: json['user_imageUrl'],
      imageUrl: json['imageUrl'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      tagNum: json['tagNum'],
      tag: json['tag'],
    );
  }
}
