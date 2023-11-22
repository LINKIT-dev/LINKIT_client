import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:get/get.dart';
import '../model/userlike_model.dart';

class UserLikeController extends GetxController {
  var Likes = <UserLikeModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchPostsFromLocalJson();
  }

  Future<void> fetchPostsFromLocalJson() async {
    final String response =
        await rootBundle.loadString('assets/test/user_like_ex.json');
    final data = await json.decode(response) as List;
    Likes.value = data.map((data) => UserLikeModel.fromJson(data)).toList();
  }
}
