class ChatModel {
  String username;
  String user_imageUrl;
  String imageUrl;
  String title;
  String description;
  String url;
  List<String> tags;

  ChatModel(
      {this.username = '',
      this.user_imageUrl = '',
      this.imageUrl = '',
      this.title = '',
      this.description = '',
      this.url = '',
      this.tags = const []});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      username: json['username'],
      user_imageUrl: json['user_imageUrl'],
      imageUrl: json['imageUrl'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      tags: List<String>.from(json['tags'] ?? []),
    );
  }
}
