class TeamSpaceModel {
  final int teamNum;
  final List<TeamModel> teams;

  TeamSpaceModel({required this.teamNum, required this.teams});

  factory TeamSpaceModel.fromJson(Map<String, dynamic> json) {
    var list = json['teams'] as List;
    List<TeamModel> teamList = list.map((i) => TeamModel.fromJson(i)).toList();
    return TeamSpaceModel(
      teamNum: json['team_num'],
      teams: teamList,
    );
  }
}

class TeamModel {
  final String teamName;
  final String logoImage;
  final List<String> tags;
  final List<String> colors;

  TeamModel({
    required this.teamName,
    required this.logoImage,
    required this.tags,
    required this.colors,
  });

  factory TeamModel.fromJson(Map<String, dynamic> json) {
    return TeamModel(
      teamName: json['team_name'],
      logoImage: json['logo_image'],
      tags: List<String>.from(json['tags']),
      colors: List<String>.from(json['colors']),
    );
  }
}
