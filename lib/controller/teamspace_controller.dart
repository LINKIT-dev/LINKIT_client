import 'package:get/get.dart';
import '../model/teamspace_model.dart';

class TeamSpaceController extends GetxController {
  // TeamSpaceModel을 관찰 가능한 상태로 만듭니다.
  final ts = TeamSpaceModel(
    teamNum: 0,
    teams: [],
  ).obs;

  // 서버로부터 데이터를 가져와서 모델을 업데이트하는 메서드
  void fetchTeamSpaceData() async {
    // 서버 요청 및 응답 처리 로직을 여기에 구현합니다.
    // 예를 들어, 서버로부터 받은 JSON 데이터를 파싱하여 TeamSpaceModel 객체로 변환합니다.
    // 다음은 임시 데이터를 사용한 예시입니다.
    var responseData = {
      "team_num": "2",
      "teams": [
        {
          "team_name": "Team A",
          "logo_image": "logo_url_a",
          "tags": ["tag1", "tag2"],
          "colors": ["#FF0000", "#800000"]
        },
        {
          "team_name": "Team B",
          "logo_image": "logo_url_b",
          "tags": ["tag3", "tag4"],
          "colors": ["#FF0000", "#800000"]
        }
      ]
    };

    ts.value = TeamSpaceModel.fromJson(responseData);
  }

  @override
  void onInit() {
    super.onInit();
    fetchTeamSpaceData(); // 컨트롤러 초기화 시 데이터를 가져옵니다.
  }
}
