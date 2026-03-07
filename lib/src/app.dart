import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';
import 'package:flutter_clone_instagram/src/pages/home.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:get/get.dart';

class App extends GetView<BottomNavController> {
  //const App({Key? key}) : super(key: key); -> key를 받아 다시 반환하는 구조 효율 bad
  const App({super.key}); // <- 새로운 코드 등장

  @override
  Widget build(BuildContext context) {
    return PopScope(
      //WillPopScope는 예전 버젼 -> 현 PopScope로 간략화
      //WillPopScope는 예전 버젼 -> 현 PopScope로 간략화 또한 async를 기다려 주지 않음!!
      canPop: false, // 기본 pop 막음
      // canPop: controller.willPopAction --> Future<bool> != bool
      // canPop: await controller.willPopAction --> canPop은 확정된 bool but future<bool>은 아직 모른 bool
      onPopInvokedWithResult: (didPop, result) async {
        //사용자가 뒤로가기를 눌렀을 때 실행되는 콜백
        if (didPop) {
          //didPop == true , 뒤로가기 제스쳐가 감지되면 호출 된다.
          return;
        }
        // if (controller.searchPageNaviationKey.currentState?.canPop() ?? false) {
        //   controller.searchPageNaviationKey.currentState?.pop();
        //   return;
        // }
        final bool shouldPop = await controller.willPopAction(); //onWillpop : controller.willpopaction과 같음

        if (!context.mounted) {
          //이 화면이 아직 살아있으면 계속 진행
          return;
        }

        if (shouldPop ) {
          // Navigator.of(context).pop();
          SystemNavigator.pop();
        }
      },
      //onWillpop 또한 없어짐
      //위에 코드 매우 중요!!!
      //
      child: Obx(
        () => Scaffold(
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              //바뀔 예정
              const Home(),
              // Navigator(
              //   // key: controller.searchPageNaviationKey,
              //   onGenerateRoute: (routeSetting) {
              //     return MaterialPageRoute(
              //       builder: (context) => const Search(),
              //     );
              //   },
              // ),

              Container(child: Center(child: Text('UPLOAD'))),
              Container(child: Center(child: Text('ACTIVITY'))),
              Container(child: Center(child: Text('MYPAGE'))),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            //밑에 아이콘바 설정
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false, //선택 라벨 보이기 X
            showUnselectedLabels: false, //선택 X 라벨 보이기
            currentIndex: controller.pageIndex.value,
            elevation: 0,
            onTap: controller.changeBottomNav, //누르면 바뀜 설정
            items: [
              //이미지 설정
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
                  decoration: BoxDecoration(
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
