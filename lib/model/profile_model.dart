class ProfileModel {
  final String name;
  final String email;
  final String profile_image;

  ProfileModel({
    required this.name,
    required this.email,
    required this.profile_image,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      name: json['name'],
      email: json['email'],
      profile_image: json['profile_image'],
    );
  }
}
