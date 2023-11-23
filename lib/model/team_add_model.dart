class TeamSpaceAddModel {
  String? name;
  String? profileImgUrl;
  int? capacity;

  TeamSpaceAddModel({this.name, this.profileImgUrl, this.capacity});

  TeamSpaceAddModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profileImgUrl = json['profileImgUrl'];
    capacity = json['capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['profileImgUrl'] = this.profileImgUrl;
    data['capacity'] = this.capacity;
    return data;
  }
}
