import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/home_page.dart';
import 'view/intro_page.dart';
import 'view/login_page.dart';

// is_logged는 서버에서 로그인을 했을 때
bool is_logged = true;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: FutureBuilder(
        future: checkLoginStatus(),
        builder: (context, snapshot) {
          // 로딩 중인 경우
          if (snapshot.connectionState != ConnectionState.done) {
            return const IntroScreen();
          }

          if (snapshot.hasData) {
            if (snapshot.data == true) {
              // 로그인한 경우
              return const Home();
            } else {
              // 로그인하지 않은 경우
              return const LoginPage();
            }
          } else {
            // 오류가 발생했거나 데이터가 없는 경우
            print("Error or no data");
            return const IntroScreen(); // 임시로 Intro 화면을 보여줍니다.
          }
        },
      ),
    );
  }
}

// 서버에서 정보를 받아오는 로직 구현해야 함
Future<bool> checkLoginStatus() async {
  // 서버에서 로그인 상태를 받아오는 로직을 구현
  await Future.delayed(const Duration(seconds: 3)); // 예시를 위한 지연
  return is_logged; // is_logged는 서버에서 로그인 상태를 나타내는 변수
}
