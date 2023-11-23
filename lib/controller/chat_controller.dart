import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import '../model/chat_model.dart';

class ChatController extends GetxController {
  var Posts = <ChatModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPostsFromLocalJson();
  }

  Future<void> fetchPostsFromLocalJson() async {
    final String response =
        await rootBundle.loadString('assets/test/post_ex.json');
    final data = await json.decode(response) as List;
    Posts.value = data.map((data) => ChatModel.fromJson(data)).toList();
  }
}
