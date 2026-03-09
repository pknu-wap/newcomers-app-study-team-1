import 'package:flutter/material.dart';
import 'package:flutter_clone_instagram/src/components/image_data.dart';
import 'package:flutter_clone_instagram/src/controller/bottom_nav_controller.dart';
<<<<<<< HEAD
import 'package:flutter_clone_instagram/src/pages/home.dart';
import 'package:flutter_clone_instagram/src/pages/search.dart';
=======
>>>>>>> 6c249cdf6177290b614762a7de4431f3c5da774a
import 'package:get/get.dart';

class App extends GetView<BottomNavController> {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Obx(
        () => Scaffold(
<<<<<<< HEAD
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              const Home(),
              Navigator(
                key: controller.searchPageNavigationKey,
                onGenerateRoute: (routeSettings) {
                  return MaterialPageRoute(
                    builder: (context) => const Search(),
                  );
                },
=======
          appBar: AppBar(),
          body: IndexedStack(
            index: controller.pageIndex.value,
            children: [
              Center(
                child: Text('HOME'),
              ),
              Center(
                child: Text('SEARCH'),
>>>>>>> 6c249cdf6177290b614762a7de4431f3c5da774a
              ),
              Center(
                child: Text('UPLOAD'),
              ),
              Center(
                child: Text('ACTIVITY'),
              ),
              Center(
                child: Text('MYPAGE'),
              ),
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
                icon: ImageData(IconsPath.homeOff),
                activeIcon: ImageData(IconsPath.homeOn),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.searchOff),
                activeIcon: ImageData(IconsPath.searchOn),
                label: 'search',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.uploadIcon),
                label: 'upload',
              ),
              BottomNavigationBarItem(
                icon: ImageData(IconsPath.activeOff),
                activeIcon: ImageData(IconsPath.activeOn),
                label: 'active',
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
                label: 'avatar',
              ),
            ],
          ),
        ),
      ),
      onPopInvokedWithResult: (bool didpop, result) async {
        if (didpop) {
          return;
        }

        final bool shouldPop = await controller.willPopAction();
        if (!context.mounted) {
          return;
        }
        if (shouldPop && context.mounted) {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop(result);
          }
          // } else {
          //   SystemNavigator.pop();
          // }
        }
      },
    );
  }
}
