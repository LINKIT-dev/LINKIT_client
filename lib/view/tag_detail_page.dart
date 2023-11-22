import 'package:flutter/material.dart';
import '../view/like_page.dart';
import 'package:get/get.dart';
import '../view/chat.dart';
import '../controller/chat_controller.dart';
import '../controller/userlike_controller.dart';

class TagDetailPage extends StatefulWidget {
  const TagDetailPage({super.key});

  @override
  State<TagDetailPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagDetailPage> {
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
            padding: EdgeInsets.only(top: 16),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/image/user.png'),
                ),
                SizedBox(width: 8), // 프로필 사진과 텍스트 사이의 간격
                Text(
                  'Oss Project',
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
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}