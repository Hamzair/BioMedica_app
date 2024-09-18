import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ArticleDetail extends StatelessWidget {
  const ArticleDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Show the image if available
            Stack(
                children: [
                  SizedBox(
                      width: double.infinity,
                      child: Image.asset(AppImages.laptop)),
                  Positioned(
                      top: 40,
                      left: 10,
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset('assets/images/back_icon.png',height: 31.h,)))
                ]),
            SizedBox(height: 16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomText(
                text: 'Breakthrough in Wearable Cardiac Monitors',
                fontsize: 22.sp,
                fontWeight: FontWeight.w600,
                textColor: buttonColor2,
              ),
            ),
            // Show the headline
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                    color: tapColor,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 1)),

                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text:
                        "Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data analysis. These devices are revolutionizing healthcare by empowering individuals to take charge of their heart health.",
                        fontsize: 16.sp,
                        fontWeight: FontWeight.w500,
                        textColor: whiteColor,
                      ),
                      SizedBox(height: 16.h),
                      // Show the full article content
                      CustomText(
                        text:
                        "The integration of advanced sensors and sophisticated algorithms has enabled wearable cardiac monitors to track vital signs with unprecedented precision. With continuous monitoring, users can detect subtle changes in their heart rhythm, allowing for early intervention and potentially preventing serious cardiovascular events. Moreover, the availability of real-time data provides valuable insights for both patients and healthcare professionals, fostering a proactive approach to heart health management.The integration of advanced sensors and sophisticated algorithms has enabled wearable cardiac monitors to track vital signs with unprecedented precision. With continuous monitoring, users can detect subtle changes in their heart rhythm, allowing for early intervention and potentially preventing serious cardiovascular events. Moreover, the availability of real-time data provides valuable insights for both patients and healthcare professionals, fostering a proactive approach to heart health management",

                        fontsize: 16.sp,
                        fontWeight: FontWeight.w500,
                        textColor: whiteColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}