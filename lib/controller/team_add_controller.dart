import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/team_add_model.dart'; // 경로 수정 필요
import 'package:dio/dio.dart';
import '../meta_data.dart';

class TeamController extends GetxController {
  Future<http.Response> sendTeamData(TeamModel team) async {
    var dio = Dio();
    dio.options.baseUrl = URL;

    final response = await dio.post(''); // path
    return response;
  }
}
