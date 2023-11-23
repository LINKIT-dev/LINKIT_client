class ChatModel {
  String? teamName;
  List<Links>? links;
  int? totalLinkCount;

  ChatModel({this.teamName, this.links, this.totalLinkCount});

  ChatModel.fromJson(Map<String, dynamic> json) {
    teamName = json['teamName'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(new Links.fromJson(v));
      });
    }
    totalLinkCount = json['totalLinkCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teamName'] = this.teamName;
    if (this.links != null) {
      data['links'] = this.links!.map((v) => v.toJson()).toList();
    }
    data['totalLinkCount'] = this.totalLinkCount;
    return data;
  }
}

class Links {
  UserVO? userVO;
  String? title;
  String? content;
  String? linkPreviewImg;
  List<String>? tags;
  String? url;

  Links(
      {this.userVO,
        this.title,
        this.content,
        this.linkPreviewImg,
        this.tags,
        this.url});

  Links.fromJson(Map<String, dynamic> json) {
    userVO =
    json['userVO'] != null ? new UserVO.fromJson(json['userVO']) : null;
    title = json['title'];
    content = json['content'];
    linkPreviewImg = json['linkPreviewImg'];
    tags = json['tags'].cast<String>();
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userVO != null) {
      data['userVO'] = this.userVO!.toJson();
    }
    data['title'] = this.title;
    data['content'] = this.content;
    data['linkPreviewImg'] = this.linkPreviewImg;
    data['tags'] = this.tags;
    data['url'] = this.url;
    return data;
  }
}

class UserVO {
  String? uid;
  String? profileImg;

  UserVO({this.uid, this.profileImg});

  UserVO.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    profileImg = json['profileImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['profileImg'] = this.profileImg;
    return data;
  }
}