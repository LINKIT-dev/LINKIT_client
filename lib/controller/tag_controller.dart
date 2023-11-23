import 'package:get/get.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import '../model/tag_model.dart'; // TagModel 클래스가 정의된 경로를 수정하세요.

class TagController extends GetxController {
  // TagModel 객체의 리스트를 관찰 가능한 상태로 선언합니다.
  var tags = <TagModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchTagsFromJson();
  }

  // JSON 파일에서 태그 데이터를 불러오는 함수
  Future<void> fetchTagsFromJson() async {
    try {
      final String response = await rootBundle
          .loadString('assets/test/tags.json'); // JSON 파일 경로를 확인하세요.
      final Map<String, dynamic> jsonData = json.decode(response);
      final List<dynamic> tagsData = jsonData['hashtags'];

      // JSON 배열을 TagModel 객체의 리스트로 변환합니다.
      tags.value =
          tagsData.map((tagData) => TagModel.fromJson(tagData)).toList();
    } catch (e) {
      print('Error loading tags: $e');
    }
  }
}
