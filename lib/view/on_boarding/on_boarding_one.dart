import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingOne extends StatelessWidget {
  const OnBoardingOne({super.key});

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
          /// Text The best Medical Device Library in the world.
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'The Only Medical Device Library in the World',
                    style: GoogleFonts.jost(
                      fontSize: 28.sp,
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.81.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: CustomText(
              textAlign: TextAlign.center,
              text:
              'A detailed and organized repository of medical devices, offering comprehensive information on how each device works, its importance, and its clinical applications, making it an essential reference for biomedical engineers and healthcare professionals.',
              fontsize: 14.sp,
              textColor: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 22.19.h,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.onboardingellipse),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 93.h,
                  ),
                  SizedBox(
                    height: 236.h,
                    width: 264.w,
                    child: Image.asset(
                      AppImages.onboarding1,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
