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

  List<Color> convertHexToColor(List<String> hexColors) {
    return hexColors.map((hex) {
      final buffer = StringBuffer();
      if (hex.length == 6 || hex.length == 7) buffer.write('ff');
      buffer.write(hex.replaceFirst('#', ''));
      return Color(int.parse(buffer.toString(), radix: 16));
    }).toList();
  }

  late List<Color> hexcolors = convertHexToColor(colors);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
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
              margin: EdgeInsets.only(top: 20, bottom: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.5,
                  color: Colors.black87,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 15, top: 45),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        name,
                        style: TextStyle(
                          fontSize: 30,
                          fontFamily: 'JalnanGothic',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TagButton(text: tags[0], color: hexcolors[0]),
                      TagButton(text: tags[1], color: hexcolors[1]),
                      TagButton(text: tags[2], color: hexcolors[2]),
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
      child: Text(
        "#${text}",
        style: TextStyle(
          color: Colors.black87,
          fontSize: 12,
        ),
      ),
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        backgroundColor: color,
        primary: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: Size(5, 5),
      ),
    );
  }
}
