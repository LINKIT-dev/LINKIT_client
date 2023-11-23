import 'package:flutter/material.dart';
import '../meta_data.dart';
import '../controller/team_add_controller.dart';
import '../model/team_add_model.dart';

class TeamSpaceAddPage extends StatefulWidget {
  @override
  _TeamSpaceAddPageState createState() => _TeamSpaceAddPageState();
}

class _TeamSpaceAddPageState extends State<TeamSpaceAddPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController profileImgUrlController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();

  void handleSubmit() async {
    final String name = nameController.text;
    final String profileImgUrl = profileImgUrlController.text;
    final int capacity = int.tryParse(capacityController.text) ?? 0;

    TeamSpaceAddModel teamSpaceAddModel = TeamSpaceAddModel(
      name: name,
      profileImgUrl: profileImgUrl,
      capacity: capacity,
    );

    // 서버로 데이터 전송하는 로직 구현
    // 예: await sendTeamSpaceData(teamSpaceAddModel);

    // 서버 응답에 따른 UI 반응 구현
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CreateTeamAppBar(), // AppBar 스타일 유지
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Padding 추가
        child: Column(
          children: <Widget>[
            // TextField 위젯들 구성
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: profileImgUrlController,
              decoration: const InputDecoration(labelText: 'Profile Image URL'),
            ),
            TextField(
              controller: capacityController,
              decoration: const InputDecoration(labelText: 'Capacity'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20), // 간격 추가
            ElevatedButton(
              onPressed: handleSubmit,
              child: const Text('Submit'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(pColor), // 버튼 색상 조정
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CreateTeamAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CreateTeamAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color(pColor),
      title: const Text('Create team ⚙️'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
