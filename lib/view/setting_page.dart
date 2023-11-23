import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:get/get.dart';
import 'team_add_page.dart';
import '../meta_data.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingAppBar(),
      body: SettingBody(),
    );
  }
}

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: const Color(pColor),
      title: const Text(
        'settings ⚙️',
        style: TextStyle(
          color: Colors.black87,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class SettingBody extends StatelessWidget {
  const SettingBody({super.key});

  void showErrorDialog() {
    Get.defaultDialog(
      title: "알람",
      content: const Text('⚒️ 서비스 준비 중입니다. ⚒️'),
      textCancel: '취소',
      onCancel: Get.back,
      buttonColor: const Color(pColor),
      cancelTextColor: Colors.black,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.business),
              title: Text('Team Setting'),
              onPressed: (BuildContext context) {
                showErrorDialog();
              },
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.add),
              title: Text('Team Add'),
              onPressed: (BuildContext context) {
                Get.to(() => TeamSpaceAddPage());
              },
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.info),
              title: Text('About'),
              onPressed: (BuildContext context) {
                // 여기에 'About' 타일을 탭했을 때의 동작을 추가하세요.
                showErrorDialog();
              },
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.send),
              title: Text('Send Feedback'),
              onPressed: (BuildContext context) {
                // 여기에 'About' 타일을 탭했을 때의 동작을 추가하세요.
                showErrorDialog();
              },
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.question_answer),
              title: Text('Help & FAQs'),
              onPressed: (BuildContext context) {
                // 여기에 'About' 타일을 탭했을 때의 동작을 추가하세요.
                showErrorDialog();
              },
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onPressed: (BuildContext context) {
                // 여기에 'About' 타일을 탭했을 때의 동작을 추가하세요.
                showErrorDialog();
              },
            ),
          ],
        ),
      ],
    );
  }
}
