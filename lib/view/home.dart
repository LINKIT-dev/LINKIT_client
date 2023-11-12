import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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

class ProfileContainer extends StatefulWidget {
  const ProfileContainer({super.key});

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      width: 360,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.transparent,
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "HELLO,\nKuromi58384",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "kuromi03@naver.com",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          SizedBox(
            width: 25,
          ),
          CircleAvatar(
            radius: 45, // 원래의 radius + border의 절반
            backgroundColor: Colors.black87, // 태두리 색상
            child: CircleAvatar(
              radius: 42,
              backgroundImage: AssetImage("assets/image/Curomi.png"),
            ),
          ),
        ],
      ),
    );
  }
}
