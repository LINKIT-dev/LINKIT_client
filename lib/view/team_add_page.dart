import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeamAddPage extends StatelessWidget {
  const TeamAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreateTeamAppBar(),
    );
  }
}

class CreateTeamAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CreateTeamAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(0xffffadb6),
      title: Text('Create team ⚙️'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
