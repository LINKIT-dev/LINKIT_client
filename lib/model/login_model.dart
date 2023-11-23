import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import '../meta_data.dart';
import 'dart:convert';

class LoginModel {
  String? uid;
  String? pw;

  LoginModel({this.uid, this.pw});

  LoginModel.LoginfromJson(Map<String, dynamic> json){
    uid = json['uid'];
    pw = json['pw'];
  }

  Map<String, dynamic> LogintoJson() => {
    'uid': uid,
    'pw': pw,
  };
}

class AuthService {

  String token='';
  Future<bool> login(String email, String password) async {

      var dio = Dio();
     dio.options.baseUrl = URL;
      var param = {'uid': '$email', 'pw': '$password'}; //email=uid, password=pw

      Response response = await dio.post('/auth/login', data: param);

      if (response.statusCode == 200) { //로그인 성공시
        token = response.data['accessToken']; //토큰 받아오기(api get용)
        return true;
      }
      else
        return false;

    // 서버에 로그인 요청을 보내는 로직 구현
    // HTTP 통신을 사용하여 로그인 요청을 보내고 결과를 반환합니다.
    // http.post('your_api_endpoint', body: user.toJson());
    // 로그인 성공 시 true, 실패 시 false 반환

  }

  Future<bool> register(String username, String email, String password) async {
    return true;
  }
}

