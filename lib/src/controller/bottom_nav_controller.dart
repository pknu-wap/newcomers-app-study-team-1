// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clone_instagram/src/pages/upload.dart';
import 'package:flutter_clone_instagram/src/components/message_popup.dart';
import 'package:get/get.dart';

enum PageName { HOME, SEARCH, UPLOAD, ACTIVITY, MYPAGE }

class BottomNavController extends GetxController {
  // static BottomNavController get to => Get.find();
  RxInt pageIndex = 0.obs; //RxInt: 반응형 정수
  // GlobalKey<NavigatorState> searchPageNaviationKey =
  //     GlobalKey<NavigatorState>();
  List<int> bottomHistory = [0]; //List

  void changeBottomNav(int value, {bool hasGestrue = true}) {
    var page = PageName.values[value];
    switch (page) {
      case PageName.UPLOAD:
        Get.to(() => Upload()); //Upload실행
        break;
      case PageName.HOME:
      case PageName.SEARCH:
      case PageName.ACTIVITY:
      case PageName.MYPAGE:
        _changePage(value, hasGestrue: hasGestrue); //화면 변환
        break;
    }
  }

  void _changePage(int value, {bool hasGestrue = true}) {
    //화면 변환
    pageIndex(value);
    if (!hasGestrue) {
      return;
    }
    if (bottomHistory.last != value) {
      ///중복이면 리스트 추가X
      bottomHistory.add(value); //중복 아니면 리스트에 추가
      print(bottomHistory);
    }
  }

  Future<bool> willPopAction() async {
    //app.dart에서 실행
    print(bottomHistory.length);
    if (bottomHistory.length <= 1) {
      // list에 수가 하나라도 있으면
      print('가나다');
      bool? result = await showDialog<bool>(
        // showDialog는 비동기 함수이며, 사용자의 선택 결과를 기다림
        context: Get.context!, //현재 앱의 context사용
        barrierDismissible: false, //바깥 영역 눌르면 안 닫힘
        builder: (context) => MessagePopup(
          //보여줄 팝업
          title: '시스템', //팝업 제목
          message: '종료하시겠습니까?', //팝업 내용
          okCallback: () {
            //확인 버튼을 누르면 실행
            Navigator.of(context).pop(true); //true값 반환
          },
          cancelCallback: () {
            //취소 버튼을 누르면 실행
            Navigator.of(context).pop(false); //false값 반환
          },
        ),
      );

      if (result == true) {
        print('가나다라마바사아자');
        //true가 들어온다면
        SystemNavigator.pop(); //앱을 종료
      }
      return false; // PopScope에서 중복 pop 방지
    } else {
      bottomHistory.removeLast();
      var index = bottomHistory.last;
      changeBottomNav(index, hasGestrue: false);
      return false;
    }
  }
}
