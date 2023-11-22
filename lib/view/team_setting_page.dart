import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'team_setting_detail_page.dart';

class TeamSettingPage extends StatelessWidget {
  const TeamSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SettingTeamAppBar(),
      body: TeamSettingBody(),
    );
  }
}

class SettingTeamAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingTeamAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(0xffffadb6),
      title: Text('team setting ⚙️'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class TeamSettingBody extends StatelessWidget {
  const TeamSettingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
