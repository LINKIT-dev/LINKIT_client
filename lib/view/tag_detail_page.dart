import 'package:flutter/material.dart';
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

  final String? tag = Get.arguments ?? '';

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
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "#${tag!}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          centerTitle: true,
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
