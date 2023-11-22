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
  Future<bool> login(String email, String password) async {
    // 서버에 로그인 요청을 보내는 로직 구현
    // HTTP 통신을 사용하여 로그인 요청을 보내고 결과를 반환합니다.
    // http.post('your_api_endpoint', body: user.toJson());
    // 로그인 성공 시 true, 실패 시 false 반환
    return true; // 임시 반환값
  }

  Future<bool> register(String username, String email, String password) async {
    return true;
  }
}
