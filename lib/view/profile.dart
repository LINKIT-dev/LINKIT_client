import 'package:flutter/material.dart';

class ProfileContainer extends StatefulWidget {
  const ProfileContainer({super.key});

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      width: 360,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.transparent,
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "HELLO,\nKuromi58384",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'jalnanGothic',
                ),
              ),
              SizedBox(height: 5),
              Text(
                "kuromi03@naver.com",
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
          SizedBox(
            width: 25,
          ),
          CircleAvatar(
            radius: 45, // 원래의 radius + border의 절반
            backgroundColor: Colors.black87, // 태두리 색상
            child: CircleAvatar(
              radius: 42,
              backgroundImage: AssetImage("assets/image/Curomi.png"),
            ),
          ),
        ],
      ),
    );
  }
}
