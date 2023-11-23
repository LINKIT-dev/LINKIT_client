import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/profile_controller.dart';
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
  final ProfileController _profileController = Get.put(ProfileController());

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
                  itemCount: chatController.Posts.value.totalLinkCount,
                  itemBuilder: (context, index) {

                    final linkItem = chatController.Posts.value.links?[index];
                    final isCurrentUser = linkItem?.userVO?.uid ==
                        _profileController.pm.value.uid;
                    return Column(
                      children: [
                        isCurrentUser
                            ? UsrChatForm(
                          post: linkItem,
                          like: userlikeController
                              .Likes[index], // 여기서 필요한 like 정보를 적절히 전달
                        )
                            : OthChatForm(
                          post: linkItem,
                          like: userlikeController
                              .Likes[index], // 여기서 필요한 like 정보를 적절히 전달
                        )
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
