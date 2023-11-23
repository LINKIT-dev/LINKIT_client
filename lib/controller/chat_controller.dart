import 'package:get/get.dart';
import '../model/chat_model.dart';
import 'package:dio/dio.dart';
import '../meta_data.dart';

class ChatController extends GetxController {
  var Posts = ChatModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchChatModelFromJson();
  }

  Future<void> fetchChatModelFromJson() async {
    dio.options.baseUrl = URL;
    dio.options.headers['Authorization'] = 'Bearer $accessToken';
    dio.options.headers['Content-Type'] = 'application/json';
    dio.options.headers['Accept'] = 'application/json';

    try {
      final response = await dio.get('/link/team-links/1'); // 서버 엔드포인트
      if (response.statusCode == 200) {
        Posts.value = ChatModel.fromJson(response.data);
      } else {
        // 오류 처리
        print('Failed to fetch ChatModel data: ${response.statusCode}');
      }
    } catch (e) {
      // 오류 처리
      print('Error fetching ChatModel data: $e');
    }
  }
}
