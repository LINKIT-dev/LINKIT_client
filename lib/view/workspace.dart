import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkit_client/view/tag.dart';
import 'team_page.dart';
import 'tag_page.dart';
import 'tag_detail_page.dart';

class Workspace extends StatelessWidget {
  const Workspace(
      {super.key, required this.name, required this.tags, required this.image});

  final List<String> tags;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: 240,
      height: 220,
      child: GestureDetector(
        onTap: () {
          Get.to(() => team_space(), arguments: [name, image]);
        },
        child: Stack(
          children: [
            Container(
              width: 240,
              height: 180,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.5,
                  color: Colors.black87,
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    flex: 8,
                    child: Container(
                      padding: const EdgeInsets.only(left: 15, top: 45),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          name,
                          style: const TextStyle(
                            fontSize: 26,
                            fontFamily: 'JalnanGothic',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TagButton(
                          text: tags[0],
                        ),
                        TagButton(
                          text: tags[1],
                        ),
                        TagButton(
                          text: tags[2],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 10,
              child: CircleAvatar(
                radius: 30, // 원래의 radius + border의 절반
                backgroundColor: Colors.black87, // 태두리 색상
                child: CircleAvatar(
                  radius: 29,
                  backgroundImage: NetworkImage(image),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TagButton extends StatelessWidget {
  const TagButton({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Get.to(() => TagDetailPage(), arguments: text);
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        backgroundColor: Color(Rand_col()),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: const Size(5, 5),
      ),
      child: SizedBox(
        width: 40,
        child: Text(
          "#$text",
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 12,
          ),
          textAlign: TextAlign.left,
          softWrap: false,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
