import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true); // 앱 종료까지 인스턴스 유지
  }
}
