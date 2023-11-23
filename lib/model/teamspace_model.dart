class TeamSpaceModel {
  int? teamNum;
  List<TeamModel>? teams;

  TeamSpaceModel({this.teamNum, this.teams});

  TeamSpaceModel.fromJson(Map<String, dynamic> json) {
    teamNum = int.tryParse(json['totalTeamCount']) ?? 0;
    if (json['teams'] != null) {
      teams = <TeamModel>[];
      json['teams'].forEach((v) {
        teams!.add(new TeamModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalTeamCount'] = this.teamNum;
    if (this.teams != null) {
      data['teams'] = this.teams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeamModel {
  String? teamName;
  String? logoImage;
  List<String>? tags;

  TeamModel({this.teamName, this.logoImage, this.tags});

  TeamModel.fromJson(Map<String, dynamic> json) {
    teamName = json['name'];
    logoImage = json['profileImg'];
    tags = json['top3Hashtags'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.teamName;
    data['profileImg'] = this.logoImage;
    data['top3Hashtags'] = this.tags;
    return data;
  }
}
