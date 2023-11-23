import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio; // Dio 패키지를 dio라는 별칭으로 가져옵니다.
import '../model/team_add_model.dart'; // 경로 수정 필요
import '../meta_data.dart';

class TeamController extends GetxController {
  Future<dio.Response> sendTeamData(TeamModel team) async {
    var dioClient = dio.Dio();
    dioClient.options.baseUrl = URL; // URL은 실제 서버의 URL로 수정해야 합니다.

    try {
      final response = await dioClient.post('/your_endpoint', data: {
        'teamname': team.teamName,
        'imgUrl': team.imageUrl
      }); // '/your_endpoint'는 실제 서버의 API 엔드포인트로 수정해야 합니다.

      return response;
    } catch (e) {
      // 오류 처리
      print(e);
      return Future.error(e);
    }
  }
}
