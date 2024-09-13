import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:bio_medica/controller/nav_bar_controller.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/view/course/courses.dart';
import 'package:bio_medica/view/course/quiz.dart';
import 'package:bio_medica/view/home_Screen/home_screen.dart';
import 'package:bio_medica/view/profile/profile_screen.dart';
import 'package:bio_medica/view/profile/subscription_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  late final PageController _pageController;
  late final NotchBottomBarController _controller;

  int maxCount = 5;
  bool isUserDeleted = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _controller = NotchBottomBarController(index: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  List<Widget> bottomBarPages = [
     HomeScreen(),
     HomeScreen(),

    CoursesScreen(),
     QuizPage(),
     ProfileScreen()
  ];

  final NavBarController navBarController = Get.put(NavBarController());

  void _navigateToPage(int pageIndex) {
    _pageController.jumpToPage(pageIndex);
    _controller.jumpTo(pageIndex);
    Navigator.pop(context); // Close the drawer after navigation
  }

  @override
  Widget build(BuildContext context) {
    bool isIpad = MediaQuery.of(context).size.width > 600;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      key: navBarController.scaffoldKey,
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bottomBarPages.length, (index) {
          return bottomBarPages[index];
        }),
      ),
      extendBody: true,
      bottomNavigationBar: bottomBarPages.length <= maxCount
          ? AnimatedNotchBottomBar(
              showBlurBottomBar: false,
              showShadow: false,
              itemLabelStyle: TextStyle(
                color: whiteColor,
                fontWeight: FontWeight.w400,
                fontSize: 10.sp,
              ),
              blurFilterY: 10,
              blurFilterX: 10,
              notchBottomBarController: _controller,
              notchColor: buttonColor,
              color: Color(0xff001A2E),
              showLabel: true,
              shadowElevation: 0,
              kBottomRadius: 15.0,
              bottomBarWidth: 100.w,
              bottomBarHeight: 11.h,
              removeMargins: false,
              durationInMilliSeconds: 300,
              bottomBarItems: [
                BottomBarItem(
                  inActiveItem: Image.asset(AppImages.homeIcon),
                  activeItem: Image.asset(
                    AppImages.homeIcon,
                    alignment: Alignment.center,
                    color: whiteColor,
                  ),
                  itemLabel: 'Home'.tr,
                ),
                BottomBarItem(
                  inActiveItem: Image.asset(AppImages.devicesIcon),
                  activeItem: Image.asset(
                    alignment: Alignment.center,
                    AppImages.devicesIcon,
                    color: whiteColor,
                  ),
                  itemLabel: 'Devices'.tr,
                ),
                BottomBarItem(
                  inActiveItem: Image.asset(AppImages.coursesIcon),
                  activeItem: Image.asset(
                    alignment: Alignment.center,
                    AppImages.coursesIcon,
                    color: whiteColor,
                  ),
                  itemLabel: 'Courses'.tr,
                ),
                BottomBarItem(
                  inActiveItem: Image.asset(AppImages.devicesIcon),
                  activeItem: Image.asset(
                    AppImages.devicesIcon,
                    color: whiteColor,
                  ),
                  itemLabel: 'Quiz'.tr,
                ),
                BottomBarItem(
                  inActiveItem: Image.asset(AppImages.profileIcon),
                  activeItem: Image.asset(
                    alignment: Alignment.center,
                    AppImages.profileIcon,
                    color: whiteColor,
                  ),
                  itemLabel: 'Profile'.tr,
                ),
              ],
              onTap: (index) {
                _pageController.jumpToPage(index);
              },
              kIconSize: 23.sp,
            )
          : null,
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.yellow, child: const Center(child: Text('Page 1')));
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent, child: const Center(child: Text('Page 2')));
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.red, child: const Center(child: Text('Page 3')));
  }
}

class Page4 extends StatelessWidget {
  const Page4({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue, child: const Center(child: Text('Page 4')));
  }
}

class Page5 extends StatelessWidget {
  const Page5({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.lightGreenAccent,
        child: const Center(child: Text('Page 5')));
  }
}
