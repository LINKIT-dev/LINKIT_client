class TeamSpaceModel {
  List<Teams>? teams;
  int? totalTeamCount;

  TeamSpaceModel({this.teams, this.totalTeamCount});

  TeamSpaceModel.fromJson(Map<String, dynamic> json) {
    if (json['teams'] != null) {
      teams = <Teams>[];
      json['teams'].forEach((v) {
        teams!.add(new Teams.fromJson(v));
      });
    }
    totalTeamCount = json['totalTeamCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teams != null) {
      data['teams'] = this.teams!.map((v) => v.toJson()).toList();
    }
    data['totalTeamCount'] = this.totalTeamCount;
    return data;
  }
}

class Teams {
  int? teamId;
  String? name;
  String? profileImg;
  List<String>? memberProfileImgs;
  List<String>? top3Hashtags;
  int? totalHashtagCount;

  Teams(
      {this.teamId,
      this.name,
      this.profileImg,
      this.memberProfileImgs,
      this.top3Hashtags,
      this.totalHashtagCount});

  Teams.fromJson(Map<String, dynamic> json) {
    teamId = json['teamId'];
    name = json['name'];
    profileImg = json['profileImg'];
    memberProfileImgs = json['memberProfileImgs'].cast<String>();
    top3Hashtags = json['top3Hashtags'].cast<String>();
    totalHashtagCount = json['totalHashtagCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['teamId'] = this.teamId;
    data['name'] = this.name;
    data['profileImg'] = this.profileImg;
    data['memberProfileImgs'] = this.memberProfileImgs;
    data['top3Hashtags'] = this.top3Hashtags;
    data['totalHashtagCount'] = this.totalHashtagCount;
    return data;
  }
}
