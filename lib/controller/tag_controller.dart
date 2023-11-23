import 'package:get/get.dart';
import 'package:dio/dio.dart';
import '../model/tag_model.dart'; // 경로를 확인하세요.
import '../meta_data.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class TagController extends GetxController {
  var tags = <TagModel>[].obs;
  Dio dio = Dio(); // Dio 인스턴스 생성

  @override
  void onInit() {
    super.onInit();
    fetchTagsFromJson();
  }

  // 서버에서 태그 데이터를 가져오는 함수
  Future<void> fetchTagsFromServer() async {
    dio.options.baseUrl = URL;

    try {
      final response = await dio.get('/hashtag/team-hashtags'); // 서버의 엔드포인트로 수정
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
