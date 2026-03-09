import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clone_instagram/src/components/message_popup.dart';
import 'package:flutter_clone_instagram/src/pages/upload.dart';
import 'package:get/get.dart';

// ignore: constant_identifier_names
enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
<<<<<<< HEAD
  static BottomNavController get to => Get.find();
  RxInt pageIndex = 0.obs;
  GlobalKey<NavigatorState> searchPageNavigationKey =
      GlobalKey<NavigatorState>();
=======
  RxInt pageIndex = 0.obs;
>>>>>>> 6c249cdf6177290b614762a7de4431f3c5da774a
  List<int> bottomHistory = [0];

  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => const Upload());
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
    }
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return;
    if (bottomHistory.last != value) {
      bottomHistory.add(value);
    }
<<<<<<< HEAD
    print(bottomHistory);
  }

  Future<bool> willPopAction() async {
    print("--- 뒤로가기 감지됨! 현재 히스토리: $bottomHistory ---");
=======
  }

  Future<bool> willPopAction() async {
>>>>>>> 6c249cdf6177290b614762a7de4431f3c5da774a
    if (bottomHistory.length == 1) {
      showDialog(
        context: Get.context!,
        builder: (context) => MessagePopup(
          message: '종료하시겠습니까?',
          okCallback: () {
            SystemNavigator.pop();
          },
          cancelCallback: Get.back,
          title: '시스템',
        ),
      );
      return false;
<<<<<<< HEAD
      // return true;
    } else {
      var page = PageName.values[bottomHistory.last];
      if (page == PageName.SEARCH) {
        var value = await searchPageNavigationKey.currentState
            ?.maybePop(); // currentState은 null 반환가능. 해당 경우 maybePop실행 불가능. ?를 붙여 null일 시 실행 안함
        if (value == true) return false; // ?사용으로 value타입이 bool?이 됨. 따라서 기본값 명시
      }

=======
    } else {
>>>>>>> 6c249cdf6177290b614762a7de4431f3c5da774a
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      return false;
    }
  }
}
