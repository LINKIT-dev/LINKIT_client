import 'package:flutter/material.dart';
import '../controller/profile_controller.dart';
import '../controller/teamspace_controller.dart';
import '../view/like_page.dart';
import 'package:get/get.dart';
import '../view/chat.dart';
import 'linkAdd.dart';
import '../controller/chat_controller.dart';
import '../controller/userlike_controller.dart';

class team_space extends StatefulWidget {
  const team_space({super.key});

  @override
  _team_spaceState createState() => _team_spaceState();
}

class _team_spaceState extends State<team_space> {
  // 이미지를 동적으로 업데이트하기 위해 Stateful 위젯으로 변경

  final ChatController chatController = Get.put(ChatController());
  final UserLikeController userlikeController = Get.put(UserLikeController());
  final ProfileController _profileController = Get.put(ProfileController());

  final String? name = Get.arguments[0] ?? '';
  final String? img = Get.arguments[1] ?? '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: AppBar(
          backgroundColor: const Color(0xffDDCEDD),
          foregroundColor: Colors.grey[700],
          elevation: 0.0,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  Color(0xffDDCEDD),
                  Colors.white,
                ],
              ),
            ),
          ),
          title: Container(
            padding: EdgeInsets.only(top: 16),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  radius: 21, // 원래의 radius + border의 절반
                  backgroundColor: Colors.black87, // 태두리 색상
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(img??''),
                  ),
                ),
                SizedBox(width: 8), // 프로필 사진과 텍스트 사이의 간격
                Text(
                  name??'',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: false,
          actions: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 16),
              child: IconButton(
                icon: const Icon(Icons.favorite_outline,
                    color: Color(0xff9a6a9a)),
                onPressed: () {
                  // 메뉴 버튼 동작
                  Get.to(() => like_space());
                },
              ),
            ),
            /* Container(
              padding: const EdgeInsets.only(top: 16),
              child: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  // 검색 버튼 동작
                },
              ),
            ),*/
          ],
          leading: Container(
            padding: const EdgeInsets.only(top: 16),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 9,
            child: Scrollbar(
              thumbVisibility: true,
              thickness: 6.0,
              radius: const Radius.circular(10),
              child: Obx(() {
                return ListView.builder(
                  itemCount: chatController.Posts.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        chatController.Posts[index].username == _profileController.pm.value.name
                            ? UsrChatForm(
                                post: chatController.Posts[index],
                                like: userlikeController.Likes[index],
                              )
                            : OthChatForm(
                                post: chatController.Posts[index],
                                like: userlikeController.Likes[index],
                              ),
                      ],
                    );
                  },
                );
              }),
            ),
          ),
          Expanded(flex: 1, child: LinkAdd()),
        ],
      ),
    );
  }
}
