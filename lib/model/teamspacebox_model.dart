class TeamSpaceBoxModel {
  final String team_name;
  final String logo_image;
  final List<String> tags;

  TeamSpaceBoxModel({
    required this.team_name,
    required this.logo_image,
    required this.tags,
  });

  factory TeamSpaceBoxModel.fromJson(Map<String, dynamic> json) {
    return TeamSpaceBoxModel(
      team_name: json['team_name'],
      logo_image: json['logo_image'],
      tags: List<String>.from(json['tags']),
    );
  }
}
