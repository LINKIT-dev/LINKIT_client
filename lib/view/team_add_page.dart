import 'package:flutter/material.dart';
import '../meta_data.dart';
import '../model/team_add_model.dart';
import 'package:get/get.dart';

class TeamSpaceAddPage extends StatefulWidget {
  @override
  _TeamSpaceAddPageState createState() => _TeamSpaceAddPageState();
}

class _TeamSpaceAddPageState extends State<TeamSpaceAddPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController profileImgUrlController = TextEditingController();
  final TextEditingController capacityController = TextEditingController();

  void showErrorDialog() {
    Get.defaultDialog(
      title: '오류',
      content: const Text('저장되지 않았습니다.'),
      textCancel: '닫기',
      onCancel: Get.back,
    );
  }

  void showFieldError() {
    Get.defaultDialog(
      title: '오류',
      content: const Text('Name and Capacity are required.'),
      textCancel: '닫기',
      onCancel: Get.back,
    );
  }

  void showSuccess() {
    Get.defaultDialog(
      title: '성공',
      content: const Text('저장되었습니다..'),
      textCancel: '닫기',
      onCancel: Get.back,
    );
  }

  void handleSubmit() async {
    String name = nameController.text;
    String profileImgUrl = profileImgUrlController.text;
    String capacityStr = capacityController.text;

    if (name.isEmpty || capacityStr.isEmpty) {
      showFieldError();
      return;
    }

    int capacity = int.tryParse(capacityStr) ?? 0;

    TeamAddService teamAddService = TeamAddService();
    bool isAdded = await teamAddService.addTeam(name, profileImgUrl, capacity);

    if (isAdded) {
      showSuccess();
    } else {
      showErrorDialog();
    }
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
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(pColor), // 버튼 색상 조정
              ),
              child: const Text('Submit'),
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
