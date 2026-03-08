import 'package:flutter_clone_instagram/src/pages/upload.dart';
import 'package:get/get.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  RxInt pageIndex = 0.obs; // 하단 네비게이션 페이지 인덱스 상태 관리
  List<int> bottomHistory = [0];

  // 눌린 인덱스 값의 페이지 관리 용이
  void changeBottomNav(int value, {bool hasGesture = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => const Upload());
        break; // 페이지 전환 대신 팝업 -> _changePage(value) 실행x

      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGesture: hasGesture);
        break;
    }
    /* 위의 switch(page)가 구분 용이, 간단하면 if을도 구분 가능
    if (value == 0) {
      //home event }
    if (value == 1) {
      //search event } */
  }

  void _changePage(int value, {bool hasGesture = true}) {
    pageIndex(value);
    if (!hasGesture) return; // 페이지 이동 아닌, 팝업에서 뒤로가기 눌렀을 때 실행x
    bottomHistory.add(value);
    print(bottomHistory);
  }

  Future<bool> willPopAction() async {
    // app.dart의 WillPop:controller.willPopAction과 연결
    if (bottomHistory.length == 1) {
      print('exit!');
      return true;
    } else {
      // 뒤로가기 누를 시
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGesture: false);
      print(bottomHistory);
      return false;
      // 페이지 이동 아닌, 팝업에서 뒤로가기 눌렀을 때 실행x
    }
    // 업로드 제외, 나머지만 페이지 이동 -> 기록 남김
  }
}
