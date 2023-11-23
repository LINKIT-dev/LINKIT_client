import 'package:dio/dio.dart';
import 'package:linkit_client/meta_data.dart';

class TeamSpaceAddModel {
  String? name;
  String? profileImgUrl;
  int? capacity;

  TeamSpaceAddModel({this.name, this.profileImgUrl, this.capacity});

  TeamSpaceAddModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profileImgUrl = json['profileImgUrl'];
    capacity = json['capacity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['profileImgUrl'] = this.profileImgUrl;
    data['capacity'] = this.capacity;
    return data;
  }
}

class TeamAddService {
  Future<bool> addTeam(String name, String profileImgUrl, int capacity) async {
    dio.options.baseUrl = URL;

    final data = TeamSpaceAddModel(
        name: name, profileImgUrl: profileImgUrl, capacity: capacity)
        .toJson();

    try {
      final response = await dio.post('/team', data: data);

      if (response.statusCode == 200) {
        return true;
      } else {
        // 서버에서 비정상적인 상태 코드를 반환했을 경우
        print('서버 오류: ${response.statusCode}');
        return false;
      }
    } on DioError catch (e) {
      // 그 외 예외 처리
      print('Error sending data: ${e.response?.statusCode}');
      print('Response data: ${e.response?.data}');
      print('Headers: ${e.response?.headers}');
      print('예외 발생: $e');
      return false;
    }
  }
}
