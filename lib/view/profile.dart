import 'package:flutter/material.dart';
import '../model/profile_model.dart';

class ProfileContainer extends StatefulWidget {
  final ProfileModel profile;

  const ProfileContainer({super.key, required this.profile});

  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  // ProfileController 인스턴스를 가져오거나 생성합니다.

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            "HELLO,\n${widget.profile.name}",
            style: const TextStyle(
              fontSize: 25,
              fontFamily: 'jalnanGothic',
            ),
          ),
          CircleAvatar(
            radius: 45, // 원래의 radius + border의 절반
            backgroundColor: Colors.black87, // 태두리 색상
            child: CircleAvatar(
              radius: 42,
              backgroundImage: NetworkImage(widget.profile.profile_image),
            ),
          ),
        ],
      ),
    );
  }
}
