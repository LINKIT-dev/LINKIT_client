import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkit_client/model/tag_model.dart';
import 'package:linkit_client/view/tag_detail_page.dart';
import '../meta_data.dart'; // 이 파일에 dColor와 pColor를 정의하세요
import 'tag_detail_page.dart';
import '../controller/tag_controller.dart';

class TagPage extends StatefulWidget {
  const TagPage({super.key});

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  final TagController tagController = Get.put(TagController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TagAppBar(),
      body: Obx(() {
        return GridView.builder(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount:
              tagController.tags.length, // tagController의 tags 리스트를 사용합니다.
          itemBuilder: (context, index) {
            final hashtag = tagController.tags[index].hashtagName;
            return GestureDetector(
              onTap: () {
                Get.to(() => TagDetailPage(),
                    arguments: hashtag); // 해시태그 이름을 인자로 전달합니다.
              },
              child: Card(
                child: Center(
                  child: Text(
                    hashtag!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                color: Color(dColor), // 적절한 색상 코드로 교체하세요.
              ),
            );
          },
        );
      }),
    );
  }
}

class TagAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TagAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(pColor), // 적절한 색상 코드로 교체하세요.
      title: const Text(
        'Tag 🏷️',
        style: TextStyle(
          color: Colors.black87,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
