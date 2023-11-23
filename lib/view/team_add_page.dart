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
    final String name = nameController.text ?? '';
    final String profileImgUrl = profileImgUrlController.text ?? '';
    final int capacity = int.tryParse(capacityController.text) ?? 0;

    TeamSpaceAddModel teamSpaceAddModel = TeamSpaceAddModel(
      name: name,
      profileImgUrl: profileImgUrl,
      capacity: capacity,
    );

    // 서버로 데이터 전송
    await sendTeamSpaceData(teamSpaceAddModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CreateTeamAppBar(),
      body: Column(
        children: <Widget>[
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
          ElevatedButton(
            onPressed: handleSubmit,
            child: const Text('Submit'),
          ),
        ],
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
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
