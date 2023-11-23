import 'package:dio/dio.dart';
import '../model/team_add_model.dart'; // 모델 클래스 경로 확인
import '../meta_data.dart';

Future<void> sendTeamSpaceData(TeamSpaceAddModel teamSpaceAddModel) async {

  // Dio 기본 설정 추가
  dio.options.baseUrl = URL;
  dio.options.headers['Authorization'] = 'Bearer $accessToken';
  dio.options.headers['Content-Type'] = 'application/json';
  dio.options.headers['Accept'] = 'application/json';

  try {
    // 서버로 데이터 전송
    Response response = await dio.post(
      '/team', // API 경로 (엔드포인트 내부 경로)
      data: teamSpaceAddModel.toJson(), // TeamSpaceAddModel 인스턴스를 JSON으로 변환
    );

    // 서버 응답 처리
    print('Server Response: ${response.data}');
  } catch (e) {
    // 오류 처리
    print('Error sending data: $e');
  }
}
