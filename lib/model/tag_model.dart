class TagModel {
  int? hashtagId;
  String? hashtagName;

  TagModel({this.hashtagId, this.hashtagName});

  TagModel.fromJson(Map<String, dynamic> json) {
    hashtagId = json['hashtagId'];
    hashtagName = json['hashtagName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hashtagId'] = this.hashtagId;
    data['hashtagName'] = this.hashtagName;
    return data;
  }
}
