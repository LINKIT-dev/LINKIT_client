import 'package:get/get.dart';
import '../model/teamspace_model.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class TeamSpaceController extends GetxController {
  // TeamSpaceModel을 관찰 가능한 상태로 만듭니다.
  final ts = TeamSpaceModel().obs;

  // 서버로부터 데이터를 가져와서 모델을 업데이트하는 메서드
  Future<void> fetchTeamSpaceData() async {
    final String response =
        await rootBundle.loadString('assets/test/teamspace.json');
    final data = await json.decode(response);
    ts.value = TeamSpaceModel.fromJson(data);
  }

  @override
  void onInit() {
    super.onInit();
    fetchTeamSpaceData(); // 컨트롤러 초기화 시 데이터를 가져옵니다.
  }
}
