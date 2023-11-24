import 'package:dio/dio.dart';
import '../meta_data.dart';

class LoginModel {
  String? uid;
  String? pw;

  LoginModel({this.uid, this.pw});

  LoginModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    pw = json['pw'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['pw'] = this.pw;
    return data;
  }
}

class AuthService {
  String token = '';

  Future<bool> login(String uid, String password) async {
    Dio dio = Dio();
    dio.options.baseUrl = URL;

    try {
      final response = await dio
          .post('/auth/login', data: {'uid': uid, 'password': password});

      if (response.statusCode == 200) {
        token = response.data['accessToken'];
        accessToken = token;
        return true;
      } else {
        // 서버에서 비정상적인 상태 코드를 반환했을 경우
        print('서버 오류: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // 그 외 예외 처리
      print('예외 발생: $e');
      return false;
    }
  }
}
