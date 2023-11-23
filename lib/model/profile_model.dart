class ProfileModel {
  String? uid;
  String? profileImg;

  ProfileModel({this.uid, this.profileImg});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
