import 'package:bio_medica/view/auth/login_view/login_view.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/on_boarding/on_boarding_one.dart';
import 'package:bio_medica/view/on_boarding/on_boarding_three.dart';
import 'package:bio_medica/view/on_boarding/on_boarding_two.dart';
import 'package:bio_medica/widget/custom_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MainOnBoardingView extends StatefulWidget {
  const MainOnBoardingView({super.key});

  @override
  State<MainOnBoardingView> createState() => _MainOnBoardingViewState();
}

class _MainOnBoardingViewState extends State<MainOnBoardingView> {
  PageController pageController = PageController();
  bool onLastPage = false;
  int currentpage = 0;
  void _moveToNextPage() {
    print(pageController);
    // Check if there is a next page
    if (currentpage < 2) {
      // Assuming there are three pages (0, 1, 2)
      pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.ease,
      );
    } else if (currentpage == 2) {
       CustomRoute.navigateTo(context, const LoginView());
    }
  }

  @override
  Widget build(BuildContext context) {
    double progress = (currentpage + 1) / 3;
    return Scaffold(
       backgroundColor: secondaryColor,
        body: SafeArea(
          child: Stack(
            children: [
              GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (currentpage < 4) {
                    // Assuming there are three pages (0, 1, 2)
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                },
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      onLastPage = (index == 3);
                      currentpage = index;
                    });
                  },
                  children: const [
                    OnBoardingOne(),
                    OnBoardingTwo(),
                    OnBoardingThree(),

                  ],
                ),
              ),
              Container(
                  alignment: const Alignment(0, 0.92),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SmoothPageIndicator(
                            effect: ExpandingDotsEffect(
                              dotWidth: 9.w,
                              dotHeight: 9.h,
                              activeDotColor: buttonColor2,
                              dotColor: secondaryColor,
                            ),
                            controller: pageController,
                            count: 3),
                    
                        GestureDetector(
                          onTap: () {
                            _moveToNextPage();
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: 52,
                                height: 52,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: buttonColor2, // Change color as needed
                                ),
                                child: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: primaryColor
                                ),
                              ),
                              SizedBox(
                                width: 65,
                                height: 65,
                                child: CircularProgressIndicator(
                                  value: progress,
                                  strokeWidth: 1.5,
                                  backgroundColor: buttonColor2.withOpacity(0.3),
                                  valueColor: const AlwaysStoppedAnimation<Color>(
                                      buttonColor2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ));
  }
}
