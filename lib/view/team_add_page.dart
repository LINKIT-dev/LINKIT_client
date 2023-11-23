import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../meta_data.dart';
import '../controller/team_add_controller.dart';
import '../model/team_add_model.dart';

class TeamAddPage extends StatelessWidget {
  TeamAddPage({super.key});

  TextEditingController teamNameController = TextEditingController();
  TextEditingController imageUrlController = TextEditingController();

  final TeamController teamController = Get.put(TeamController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreateTeamAppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 150, left: 40, right: 40),
        child: Column(
          children: <Widget>[
            TextField(
              controller: teamNameController,
              decoration: InputDecoration(labelText: "Team Name"),
            ),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(labelText: "Image URL"),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                var teamData = TeamModel(
                  teamName: teamNameController.text,
                  imageUrl: imageUrlController.text,
                );
                teamController.sendTeamData(teamData).then((response) {
                  if (response.statusCode == 200) {
                    // 성공적으로 데이터가 전송되었을 때의 로직
                    Get.bottomSheet(
                        SizedBox(
                          height: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '팀이 성공적으로 생성되었습니다.',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: Get.back,
                                child: const Text('닫기'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(pColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        clipBehavior: Clip.hardEdge,
                        backgroundColor: Colors.white);
                  } else {
                    // 실패했을 때의 로직
                    Get.bottomSheet(
                        SizedBox(
                          height: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '데이터를 전송하는데 실패하였습니다.',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: Get.back,
                                child: const Text('닫기'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(pColor),
                                ),
                              )
                            ],
                          ),
                        ),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                          ),
                        ),
                        clipBehavior: Clip.hardEdge,
                        backgroundColor: Colors.white);
                  }
                }).catchError((error) {
                  // 오류가 발생했을 때의 로직
                  Get.bottomSheet(
                      SizedBox(
                        height: 400,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              '데이터를 전송하는데 에러가 발생했습니다.',
                              style: TextStyle(fontSize: 20),
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                              onPressed: Get.back,
                              child: const Text('닫기'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(pColor),
                              ),
                            )
                          ],
                        ),
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      backgroundColor: Colors.white);
                });
              },
              child: const Text("Submit"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(pColor),
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
