class ProfileModel {
  String name;
  String profile_image;

  ProfileModel({
    this.name = '',
    this.profile_image = '',
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      profile_image: json['profile_image'],
    );
  }
}
