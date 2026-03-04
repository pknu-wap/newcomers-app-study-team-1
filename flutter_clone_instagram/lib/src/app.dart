import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:get/get.dart';
import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';

class App extends GetView <BottomNavController>{
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(canPop: false, child: Obx(() => Scaffold(
      appBar: AppBar(),
      body: IndexedStack(
        index: controller.pageIndex.value,
        children:[
          Container(child: Center(child: Text('HOME')),),
          Container(child: Center(child: Text('SEARCH')),),
          Container(child: Center(child: Text('UPLOAD')),),
          Container(child: Center(child: Text('ACTIVITY')),),
          Container(child: Center(child: Text('MYPAGE')),),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: controller.pageIndex.value,
        elevation: 0,
        onTap: controller.changeBottomNav,
        items: [
          BottomNavigationBarItem(
            icon: ImageData(icon: IconsPath.homeOff),
            activeIcon: ImageData(icon: IconsPath.homeOn),
            label: 'home'
            ),
            BottomNavigationBarItem(
            icon: ImageData(icon: IconsPath.searchOff),
            activeIcon: ImageData(icon: IconsPath.searchOn),
            label: 'home'
            ),
            BottomNavigationBarItem(
            icon: ImageData(icon: IconsPath.uploadIcon),
            label: 'home'
            ),
            BottomNavigationBarItem(
            icon: ImageData(icon: IconsPath.activeOff),
            activeIcon: ImageData(icon: IconsPath.activeOn),
            label: 'home'
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
            label: 'home'
            )
        ]
      ),
    ),
    ),
    );
  }
}