import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'detail_page.dart';

class Workspace extends StatelessWidget {
  const Workspace({super.key});

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
              margin: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.5,
                  color: Colors.black87,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(right: 15, top: 20),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        "PROJECT1",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'JalnanGothic',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.black87, // 태두리 색상
                          child: CircleAvatar(
                            radius: 19,
                            backgroundImage:
                                AssetImage("assets/image/asset2.png"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 20, // 원래의 radius + border의 절반
                          backgroundColor: Colors.black87, // 태두리 색상
                          child: CircleAvatar(
                            radius: 19,
                            backgroundImage:
                                AssetImage("assets/image/asset3.png"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 20, // 원래의 radius + border의 절반
                          backgroundColor: Colors.black87, // 태두리 색상
                          child: CircleAvatar(
                            radius: 19,
                            backgroundImage:
                                AssetImage("assets/image/asset4.png"),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 20, // 원래의 radius + border의 절반
                          backgroundColor: Colors.black87, // 태두리 색상
                          child: CircleAvatar(
                            radius: 19,
                            backgroundImage:
                                AssetImage("assets/image/asset5.jpeg"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            // 버튼이 눌렸을 때 실행할 코드
                          },
                          child: Text(
                            "#spring",
                            style: TextStyle(
                              color: Colors.black87, // 텍스트 색상 설정
                              fontSize: 12, // 텍스트 글꼴 크기를 줄입니다.
                            ),
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            // 패딩을 줄입니다.
                            backgroundColor: Colors.lightGreen,
                            // 배경 색상 설정
                            primary: Colors.black87,
                            // 텍스트 색상 설정
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // 모서리의 둥근 정도를 설정
                            ),
                            minimumSize: Size(5, 5), // 버튼의 최소 크기를 설정할 수 있습니다.
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // 버튼이 눌렸을 때 실행할 코드
                          },
                          child: Text(
                            "#flutter",
                            style: TextStyle(
                              color: Colors.black87, // 텍스트 색상 설정
                              fontSize: 12, // 텍스트 글꼴 크기를 줄입니다.
                            ),
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            // 패딩을 줄입니다.
                            backgroundColor: Colors.blueAccent,
                            // 배경 색상 설정
                            primary: Colors.black87,
                            // 텍스트 색상 설정
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // 모서리의 둥근 정도를 설정
                            ),
                            minimumSize: Size(5, 5), // 버튼의 최소 크기를 설정할 수 있습니다.
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            // 버튼이 눌렸을 때 실행할 코드
                          },
                          child: Text(
                            "#figma",
                            style: TextStyle(
                              color: Colors.black87, // 텍스트 색상 설정
                              fontSize: 12, // 텍스트 글꼴 크기를 줄입니다.
                            ),
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            // 패딩을 줄입니다.
                            backgroundColor: Colors.orange,
                            // 배경 색상 설정
                            primary: Colors.black87,
                            // 텍스트 색상 설정
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(20), // 모서리의 둥근 정도를 설정
                            ),
                            minimumSize: Size(5, 5), // 버튼의 최소 크기를 설정할 수 있습니다.
                          ),
                        ),
                      ],
                    ),
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
                  backgroundImage: AssetImage("assets/image/asset1.jpeg"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
