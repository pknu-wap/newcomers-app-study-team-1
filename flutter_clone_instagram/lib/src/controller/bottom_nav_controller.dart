import 'package:get/get.dart';

enum PageName { home, search, upload, activity, mypage }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs;

  void changeBottomNav(int value) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.home:
        pageIndex.value = value;
        break;
      case PageName.search:
        pageIndex.value = value;
        break;
      case PageName.upload:
        pageIndex.value = value;
        break;
      case PageName.activity:
        pageIndex.value = value;
        break;
      case PageName.mypage:
        pageIndex.value = value;
        break;
    }
  }
}