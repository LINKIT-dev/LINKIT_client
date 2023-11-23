import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../model/tag_model.dart'; // 경로를 확인하세요.
import '../meta_data.dart';

class TagController extends GetxController {
  var tags = <TagModel>[].obs;

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
      final response = await dio.get('/hashtag/all-hashtags'); // 서버의 엔드포인트로 수정
      if (response.statusCode == 200) {
        final List<dynamic> tagsData = response.data['hashtags'];
        tags.value =
            tagsData.map((tagData) => TagModel.fromJson(tagData)).toList();
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
