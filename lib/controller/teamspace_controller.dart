import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../model/teamspace_model.dart';
import '../meta_data.dart';

class TeamSpaceController extends GetxController {
  var ts = TeamSpaceModel().obs;
  @override
  void onInit() {
    super.onInit();
    fetchTeamSpaceDataFromServer(); // 컨트롤러 초기화 시 서버로부터 데이터를 가져옵니다.
  }

  Future<void> fetchTeamSpaceDataFromServer() async {
    dio.options.baseUrl = URL;
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';

    try {
      final response = await dio.get('/user-team/my/participations');
      if (response.statusCode == 200) {
        ts.value = TeamSpaceModel.fromJson(response.data);
      } else {
        // 오류 처리
        print('Failed to fetch team space data: ${response.statusCode}');
      }
    } catch (e) {
      // 오류 처리
      print('Error fetching team space data: $e');
    }
  }
}
