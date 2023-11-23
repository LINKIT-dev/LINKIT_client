import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import '../model/chat_model.dart';

class ChatController extends GetxController {
  var Posts = ChatModel().obs;

  @override
  void onInit() {
    super.onInit();
    fetchChatModelFromJson();
  }

  Future<void> fetchChatModelFromJson() async {
    final String response =
        await rootBundle.loadString('assets/test/post_ex.json');
    final data = await json.decode(response);
    Posts.value = ChatModel.fromJson(data);
  }
}
