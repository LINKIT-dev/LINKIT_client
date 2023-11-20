import 'package:get/get.dart';
import '../model/profile_model.dart';

class ProfileController extends GetxController {
  final pm = ProfileModel(
          name: 'Kuromi58384',
          email: 'kuromi03@naver.com',
          profile_image:
              'https://postfiles.pstatic.net/MjAyMTAxMTNfMTc2/MDAxNjEwNTIxNjQ2MTEz.jkUHo32_psfSWJRA-oi4VmITlneVcSQ2UtA5GI6DBn4g.i5jVgvdLrz6DVi7rmhQVd7AQwNfbmsTixDM9NfIaO-wg.JPEG.sosohan_n/original_(3).jpg?type=w773')
      .obs;
}
