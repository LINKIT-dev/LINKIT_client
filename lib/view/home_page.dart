import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkit_client/view/team_add_page.dart';
import 'figures.dart';
import 'profile.dart';
import 'workspace.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';
import '../controller/teamspace_controller.dart';
import '../controller/BottomNavigator.dart';
import '../controller/profile_controller.dart';
import 'tag_page.dart';
import 'setting_page.dart';
import 'package:linkit_client/meta_data.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  static List<Widget> tabPages = <Widget>[
    MainPage(),
    TagPage(),
    SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavgationBarController());

    return Scaffold(
      body: Obx(
          () => tabPages[BottomNavgationBarController.to.selectedIndex.value]),
      bottomNavigationBar: BottomNavgationBarView(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController _scrollController = ScrollController();
  final _profileController = Get.put(ProfileController());

  @override
  void dispose() {
    // Dispose the controller when the widget is removed
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => (Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/image/linkit_bg.png",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileContainer(profile: _profileController.pm.value),
                  Line(width: 320),
                  SearchContainer(),
                  Line(width: 320),
                  SizedBox(height: 15),
                  VsScrollbar(
                    controller: _scrollController,
                    showTrackOnHover: true, // default false
                    isAlwaysShown: true, // default false
                    scrollbarFadeDuration: Duration(
                        milliseconds:
                            500), // default : Duration(milliseconds: 300)
                    scrollbarTimeToFade: Duration(
                        milliseconds:
                            800), // default : Duration(milliseconds: 600)
                    style: VsScrollbarStyle(
                      hoverThickness: 10.0, // default 12.0
                      radius:
                          Radius.circular(10), // default Radius.circular(8.0)
                      thickness: 5.0, // [ default 8.0 ]
                    ),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _Workspace(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))),
    );
  }
}

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 40,
        right: 16,
        top: 15,
        bottom: 16,
      ),
      child: const Row(
        children: [
          Icon(
            Icons.search,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Project name, Hash Tag ...",
            style: TextStyle(
              color: Colors.grey,
            ),
          )
        ],
      ),
    );
  }
}

List<Widget> _Workspace() {
  final TeamSpaceController teamspaceController =
      Get.put(TeamSpaceController());

  List<Widget> wd = [];
  int? teamCount = teamspaceController.ts.value.teamNum;
  print(teamCount);

  if (teamCount == 0) {
    wd.add(
      Container(
        padding: const EdgeInsets.only(top: 30),
        child: CircleAvatar(
          backgroundColor: Color(pColor), // 원하는 배경색 설정
          radius: 30, // 원의 반지름 조정으로 크기 조절
          child: IconButton(
            icon: const Icon(Icons.add),
            iconSize: 30, // 아이콘 크기 조정
            color: Colors.white, // 아이콘 색상 설정
            onPressed: () {
              // 버튼 클릭 시 실행할 동작
              Get.to(() => TeamAddPage());
            },
          ),
        ),
      ),
    );
    return wd;
  } else {
    for (int i = 0; i < teamCount!; i++) {
      final team = teamspaceController.ts.value.teams?[i];
      wd.add(Workspace(
        name: team?.teamName ?? 'Invalid Team',
        tags: team?.tags ?? ['tag1', 'tag2', 'tag3'],
        image: team?.logoImage ?? '', // 여기에 적절한 값이 필요
      ));
    }

    return wd;
  }
}
