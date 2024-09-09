import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(viewportFraction: 1);

    return Scaffold(
      backgroundColor: secondaryColor,
      body: Column(
        children: [
          SizedBox(
            height: 30.h,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w),
            child: CustomText(
                textAlign: TextAlign.center,
                text: 'Interactive Learning Modules & Quizzes.',
                fontsize: 28.sp,
                textColor: primaryColor,
                fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 21.h,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w),

            child: CustomText(
                textAlign: TextAlign.center,
                text:
                'Thorough, text-based learning modules that dive into critical areas of biomedical engineering, breaking down complex topics into readable, easy-to-understand sections, coupled with a variety of interactive quizez to test your knowledge and skills gained in a certain area.',
                fontsize: 14.sp,
                textColor: textColor,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 22.h,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppImages.onboardingellipse),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  SizedBox(
                    height: 136.h,
                  ),
                  SizedBox(
                      height: 212.h,
                      width: 243.w,
                      child: Image.asset(
                        AppImages.onboarding2,
                        fit: BoxFit.contain,
                      )),
                  SizedBox(
                    height: 50.h,
                  ),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
