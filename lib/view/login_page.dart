import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/login_model.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _uidController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();

  void showErrorDialog() {
    Get.defaultDialog(
      title: '오류',
      content: const Text('아아디 혹은 비밀번호가 잘못되었습니다.'),
      textCancel: '취소',
      onCancel: Get.back,
    );
  }

  void _login() async {
    String uid = _uidController.text;
    String password = _pwController.text;

    AuthService authService = AuthService();
    bool isLoggedIn = await authService.login(uid, password);

    if (isLoggedIn) {
      Get.off(() => Home());
    } else {
      showErrorDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/image/intro_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    height: 400,
                    width: 400,
                    child: Image.asset(
                      'assets/image/linkit_logo.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  TextField(
                    controller: _uidController,
                    decoration: InputDecoration(labelText: 'ID'),
                  ),
                  TextField(
                    controller: _pwController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffffadb6),
                    ),
                    child: const Text('Login'),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black87,
                    ),
                    child: const Text('Sign In'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
