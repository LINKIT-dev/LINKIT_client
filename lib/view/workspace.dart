import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_page.dart';

class Workspace extends StatelessWidget {
  Workspace(
      {super.key,
      required this.name,
      required this.tags,
      required this.colors,
      required this.image});

  final List<String> tags;
  final List<String> colors;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: 240,
      height: 200,
      child: GestureDetector(
        onTap: () {
          Get.to(() => DetailsPage());
        },
        child: Stack(
          children: [
            Container(
              width: 240,
              height: 160,
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.5,
                  color: Colors.black87,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 15, top: 45),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontSize: 30,
                          fontFamily: 'JalnanGothic',
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TagButton(
                          text: tags[0],
                          color: Color(
                              int.parse(colors[0].substring(2), radix: 16))),
                      TagButton(
                          text: tags[1],
                          color: Color(
                              int.parse(colors[1].substring(2), radix: 16))),
                      TagButton(
                          text: tags[2],
                          color: Color(
                              int.parse(colors[2].substring(2), radix: 16))),
                    ],
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
  const TagButton({super.key, required this.text, required this.color});

  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // 버튼이 눌렸을 때 실행할 코드
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: const Size(5, 5),
      ),
      child: Text(
        "#$text",
        style: const TextStyle(
          color: Colors.black87,
          fontSize: 12,
        ),
      ),
    );
  }
}
