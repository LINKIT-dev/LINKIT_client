import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import 'figures.dart';
import 'profile.dart';
import 'workspace.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    // Dispose the controller when the widget is removed
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
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
              ProfileContainer(),
              Line(width: 320),
              SearchContainer(),
              Line(width: 320),
              SizedBox(height: 15),
              VsScrollbar(
                controller: _scrollController,
                showTrackOnHover: true, // default false
                isAlwaysShown: true, // default false
                scrollbarFadeDuration: Duration(
                    milliseconds: 500), // default : Duration(milliseconds: 300)
                scrollbarTimeToFade: Duration(
                    milliseconds: 800), // default : Duration(milliseconds: 600)
                style: VsScrollbarStyle(
                  hoverThickness: 10.0, // default 12.0
                  radius: Radius.circular(10), // default Radius.circular(8.0)
                  thickness: 5.0, // [ default 8.0 ]
                ),
                child: SingleChildScrollView(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Workspace(),
                      Workspace(),
                      Workspace(),
                      Workspace(),
                      Workspace(),
                      Workspace(),
                      Workspace(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: const Icon(
        Icons.menu,
        color: Colors.black87,
        size: 30,
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      actions: const [
        Icon(
          Icons.notifications,
          color: Colors.black87,
          size: 30,
        ),
        SizedBox(
          width: 18,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // AppBar의 높이 설정
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
