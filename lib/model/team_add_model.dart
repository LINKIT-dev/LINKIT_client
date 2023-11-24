import '../meta_data.dart';
import 'package:dio/dio.dart';

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
    Dio dio = Dio();
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';

    try {
      final response = await dio.post('/team', data: {
        'name': name,
        'profileImgUrl': profileImgUrl,
        'capacity': capacity
      });

      if (response.statusCode == 200) {
        print('success');
        return true;
      } else {
        // 서버에서 비정상적인 상태 코드를 반환했을 경우
        print('서버 오류: ${response.statusCode}');
        return false;
      }
    } on DioException catch (e) {
      // 그 외 예외 처리
      print('Error sending data: ${e.response?.statusCode}');
      print('Response data: ${e.response?.data}');
      print('Headers: ${e.response?.headers}');
      print('예외 발생: $e');
      return false;
      return false;
    }
  }
}
