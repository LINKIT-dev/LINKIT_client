class TeamModel {
  String teamName;
  String imageUrl;

  TeamModel({required this.teamName, required this.imageUrl});

  Map<String, dynamic> toJson() {
    return {
      'teamName': teamName,
      'imageUrl': imageUrl,
    };
  }
}
