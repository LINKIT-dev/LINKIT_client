import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkit_client/view/tag_detail_page.dart';
import '../meta_data.dart';
import 'tag_detail_page.dart';

class TagPage extends StatefulWidget {
  const TagPage({super.key});

  @override
  State<TagPage> createState() => _TagPageState();
}

class _TagPageState extends State<TagPage> {
  final List<String> tags = [
    "태그1",
    "태그2",
    "태그3",
    "태그3",
    "태그3",
    "태그3",
    "태그3",
    "태그3",
    "태그3",
    "태그3",
    "태그3",
    "태그3",
    "태그3",
    "태그3",
    "태그3",
    // ... 여기에 더 많은 태그들을 추가할 수 있습니다.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TagAppBar(),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 두 열로 표시
          crossAxisSpacing: 10, // 열 사이의 간격
          mainAxisSpacing: 10, // 행 사이의 간격
        ),
        itemCount: tags.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.to(() => TagDetailPage());
            },
            child: Card(
              child: Center(
                child: Text(
                  tags[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              color: Color(dColor),
            ),
          );
        },
      ),
    );
  }
}

class TagAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TagAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Color(pColor),
      title: const Text(
        'Tag 🏷️',
        style: TextStyle(
          color: Colors.black87,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}