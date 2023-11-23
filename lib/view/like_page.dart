import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/userlike_controller.dart';
import '../view/team_page.dart';
import '../view/chat.dart';
import '../controller/chat_controller.dart';

class like_space extends StatefulWidget {
  const like_space({super.key});

  @override
  State<like_space> createState() => _like_spaceState();
}

class _like_spaceState extends State<like_space> {
  final ChatController chatController = Get.put(ChatController());
  final UserLikeController userlikeController = Get.put(UserLikeController());

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
            padding: const EdgeInsets.only(top: 16),
            child: const Text(
              'Like List',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          centerTitle: true,
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
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Scrollbar(
          thumbVisibility: true,
          // 항상 스크롤바를 표시하도록 설정합니다. (Flutter 2 이전 버전에서 사용)
          thickness: 6.0,
          // 스크롤바의 두께를 설정합니다.
          radius: const Radius.circular(10),
          child: Obx(() {
            return ListView.builder(
              itemCount: chatController.Posts.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    if (userlikeController.Likes[index].user_like)
                      chatController.Posts[index].username == 'Eunjin'
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
              // 채팅 위젯 리스트를 여기에 표시
            );
          }),
        ),
      ),
    );
  }
}
