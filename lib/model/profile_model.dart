class ProfileModel {
  String name;
  String email;
  String profile_image;

  ProfileModel({
    this.name = '',
    this.email = '',
    this.profile_image = '',
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      email: json['email'],
      profile_image: json['profile_image'],
    );
  }
}
