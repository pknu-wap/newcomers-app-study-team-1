import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/componets/image_data.dart';
import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';
import 'package:get/get.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // 기존 WillPopScope -> PopScope로 변경
      canPop: false, // 뒤로가기 방지
      onPopInvokedWithResult: (didPop, result) async {
        // 기존 onWillPop -> onPopInvokedWithResult
        // 뒤로가기 눌렀을 때 실행되는 콜백 함수
        if (didPop) return; // 뒤로가기 실행되면, 호출
        controller.willPopAction();
        // controller.willPopAction = (신)onWillpop:controller.willPopAction
      },
      child: Obx(
        () => Scaffold(
          backgroundColor: const Color.fromRGBO(233, 223, 200, 1),
          // # 2. UI 배경색 변경
          appBar: AppBar(),
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              Container(child: Center(child: Text('HOME'))),
              Container(child: Center(child: Text('SEARCH'))),
              Container(child: Center(child: Text('UPLOAD'))),
              Container(child: Center(child: Text('ACTIVITY'))),
              Container(child: Center(child: Text('MYPAGE'))),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false, // -> 하단 선택 아이콘 라벨x
            showUnselectedLabels: false, // -> 하단 선택x 아이콘 라벨o
            currentIndex: controller.pageIndex.value,
            // -> 하단 네비게이션 페이지 인덱스 상태 관리
            // 0 -> 하단에서  0번째 아이콘이 활성화된 상태로 시작
            onTap: controller.changeBottomNav, // -> 하단 아이콘 클릭 시 실행할 함수
            elevation: 0, // 하단 바의 그림자 제거

            items: [
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.homeOff),
                activeIcon: ImageData(IconsPath.homeOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.searchOff),
                activeIcon: ImageData(IconsPath.searchOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.uploadIcon),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.activeOff),
                activeIcon: ImageData(IconsPath.activeOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                ),
                label: 'home',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
