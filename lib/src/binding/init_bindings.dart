import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';
import 'package:get/instance_manager.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);
  }
}
