import 'teamspacebox_model.dart';

class TeamSpaceModel {
  final int team_num;
  final List<TeamSpaceBoxModel> lst;

  TeamSpaceModel({
    required this.team_num,
    required this.lst,
  });

  factory TeamSpaceModel.fromJson(Map<String, dynamic> json) {
    var list = json['lst'] as List;
    List<TeamSpaceBoxModel> lstList =
        list.map((i) => TeamSpaceBoxModel.fromJson(i)).toList();
    return TeamSpaceModel(
      team_num: json['team_num'],
      lst: lstList,
    );
  }
}
