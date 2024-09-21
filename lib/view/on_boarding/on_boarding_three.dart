import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingThree extends StatelessWidget {
  const OnBoardingThree({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _pageController = PageController(viewportFraction: 1);

    return Scaffold(
      backgroundColor: secondaryColor,
      body: Column(
        children: [
          SizedBox(
            height: 80.h,
          ),
          ///  Text Latest MedTech Innovations & Updates..
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: 'Latest MedTech Innovations & Updates',
                    style: GoogleFonts.jost(
                      fontSize: 28.sp,
                      color: primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  TextSpan(
                    text: '.', // The full stop in orange color
                    style: TextStyle(
                      fontSize: 28.sp,
                      color: buttonColor2, // Set the color to orange
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w),

            child: CustomText(
                textAlign: TextAlign.center,
                text:
                'This is your MedTech Instagram focusing on showcasing the latest developments in medical technology. keeping users informed with text-based summaries of new devices, innovations, and breakthroughs in biomedical engineering and healthcare technology.',
                fontsize: 14.sp,
                textColor: textColor,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(
            height: 21.9.h,
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
                    height: 93.h,
                  ),
                  SizedBox(
                      height: 263.h,
                      width: 266.w,
                      child: Image.asset(
                        AppImages.onboarding3,
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
