import 'package:get/get.dart';
import '../meta_data.dart';

class TagController extends GetxController {
  var tags = <String>[].obs; // RxList<String> 타입으로 변경

  @override
  void onInit() {
    super.onInit();
    fetchTagsFromServer();
  }

  // 서버에서 태그 데이터를 가져오는 함수
  Future<void> fetchTagsFromServer() async {
    dio.options.baseUrl = URL;
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';

    try {
      final response = await dio.get('/hashtag/all-hashtags');
      if (response.statusCode == 200) {
        // 서버에서 받은 데이터를 직접 문자열 리스트로 변환
        tags.value = List<String>.from(response.data);
      } else {
        // 오류 처리
        print('Failed to fetch tags: ${response.statusCode}');
      }
    } catch (e) {
      // 오류 처리
      print('Error fetching tags: $e');
    }
  }
}
