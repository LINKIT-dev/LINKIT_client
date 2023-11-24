import 'package:get/get.dart';
import '../model/chat_model.dart';
import 'chat_controller.dart';

class LikePostController extends GetxController {
  var likedPosts = <Links>[].obs;

  final ChatController chatController = Get.find();

  @override
  void onInit() {
    super.onInit();
    updateLikedPosts(chatController.Posts.value);
  }

  // ChatModel 데이터를 받아 isLikePressed가 true인 게시물만 필터링하는 함수
  void updateLikedPosts(ChatModel chatModel) {
    var filteredPosts =
        chatModel.links!.where((link) => link.isLikePressed ?? false).toList();
    likedPosts.assignAll(filteredPosts);
  }
}
