import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:linkit_client/controller/profile_controller.dart';
import '../model/profile_model.dart';

class ProfileContainer extends StatefulWidget {
  const ProfileContainer({super.key});


  @override
  State<ProfileContainer> createState() => _ProfileContainerState();
}

class _ProfileContainerState extends State<ProfileContainer> {
  // ProfileController 인스턴스를 가져오거나 생성합니다.
  final ProfileController pc = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    String uid = pc.pm.value.uid ?? 'User';
    String img =
        pc.pm.value.profileImg ?? 'https://i.ibb.co/V9rV08m/logo-003.jpg';
    return Container(
      padding: const EdgeInsets.only(left: 30, right: 30),
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
            "HELLO,\n$uid",
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
              backgroundImage: NetworkImage(img),
            ),
          ),
        ],
      ),
    );
  }
}

