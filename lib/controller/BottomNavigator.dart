import 'package:get/get.dart';
import 'package:flutter/material.dart';

// BottomNavigationBar 상태 관리를 위한 GetX controller
class BottomNavgationBarController extends GetxController {
  // Get.fine 대신 클래스명 사용 가능
  static BottomNavgationBarController get to => Get.find();

  // 현재 선택된 탭 아이템 번호 저장
  final RxInt selectedIndex = 0.obs;

  // 탭 이벤트가 발생할 시 selectedIndex값을 변경해줄 함수
  void changeIndex(int index) {
    selectedIndex(index);
  }
}

class BottomNavgationBarView extends GetView<BottomNavgationBarController> {
  const BottomNavgationBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          // 현재 인덱스를 selectedIndex에 저장
          currentIndex: controller.selectedIndex.value,
          // 요소(item)을 탭 할 시 실행)
          onTap: controller.changeIndex,
          // 선택에 따라 icon·label 색상 변경
          selectedItemColor: context.theme.colorScheme.onBackground,
          unselectedItemColor: context.theme.colorScheme.onSurfaceVariant,
          // 선택에 따라 label text style 변경
          unselectedLabelStyle: TextStyle(fontSize: 10),
          selectedLabelStyle: TextStyle(fontSize: 10),
          // 탭 애니메이션 변경 (fixed: 없음)
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xffffadb6),
          // Bar에 보여질 요소. icon과 label로 구성.
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Main',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.tag),
              label: 'Tag',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notice',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
        ));
  }
}
