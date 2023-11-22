class TeamSpaceModel {
  int? teamNum;
  List<TeamModel>? teams;

  TeamSpaceModel({this.teamNum, this.teams});

  TeamSpaceModel.fromJson(Map<String, dynamic> json) {
    teamNum = int.tryParse(json['team_num']) ?? 0;
    if (json['teams'] != null) {
      teams = <TeamModel>[];
      json['teams'].forEach((v) {
        teams!.add(new TeamModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['team_num'] = this.teamNum;
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
  List<String>? colors;

  TeamModel({this.teamName, this.logoImage, this.tags, this.colors});

  TeamModel.fromJson(Map<String, dynamic> json) {
    teamName = json['team_name'];
    logoImage = json['logo_image'];
    tags = json['tags'].cast<String>();
    colors = json['colors'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['team_name'] = this.teamName;
    data['logo_image'] = this.logoImage;
    data['tags'] = this.tags;
    data['colors'] = this.colors;
    return data;
  }
}
