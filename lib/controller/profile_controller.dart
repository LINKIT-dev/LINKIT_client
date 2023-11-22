import 'package:get/get.dart';
import '../model/profile_model.dart';

class ProfileController extends GetxController {
  final pm = ProfileModel(
          name: 'Kuromi58384',
          email: 'kuromi03@naver.com',
          profile_image:
              'https://i.pinimg.com/originals/19/fb/56/19fb56bd0d8fe6842965135b2ff33e95.jpg')
      .obs;
}
