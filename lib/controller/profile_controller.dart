import 'package:get/get.dart';
import '../model/profile_model.dart';
import 'package:dio/dio.dart';
import '../meta_data.dart';

class ProfileController extends GetxController {
  var pm = ProfileModel().obs;
  Dio dio = Dio();

  @override
  void onInit() {
    super.onInit();
    fetchPostFromJson();
  }

  Future<void> fetchPostFromJson() async {
    dio.options.baseUrl = URL;

    try {
      final response = await dio.get('/user/my/profile'); // 서버 엔드포인트
      if (response.statusCode == 200) {
        pm.value = ProfileModel.fromJson(response.data);
      } else {
        // 오류 처리
        print('Failed to fetch profile data: ${response.statusCode}');
      }
    } catch (e) {
      // 오류 처리
      print('Error fetching profile data: $e');
    }
  }
}
