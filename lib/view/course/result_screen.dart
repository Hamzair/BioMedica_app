import 'package:bio_medica/drawer%20items/progress.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/course/courses.dart';
import 'package:bio_medica/view/course/quiz.dart';
import 'package:bio_medica/drawer%20items/technical_support_chat_screen.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
          child:AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(13.r),
                bottomRight: Radius.circular(13.r),
              ),
            ),
            centerTitle: true,
            automaticallyImplyLeading: false,
            flexibleSpace: Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w,vertical: 5.h),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width < 360 ? 30.w : 38.w,
                          height: MediaQuery.of(context).size.width < 360 ? 30.h : 38.h,
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image(
                              image: AssetImage('assets/images/back_icon.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        CustomText(
                          text: "Result",
                          textColor: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontsize: 22.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            backgroundColor: secondaryColor,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 42.h),
              Container(
              // height: 410.11.h,
              width: 309.w,
              decoration: BoxDecoration(
                color: tapColor,
                borderRadius: BorderRadius.circular(15.12.r),
                border: Border.all(
                  color: Darkcontainer, // Set the border color to dark blue
                  width: 1.0.w, // Adjust the border width as needed
                ),
              ),
                child: Column(
                  children: [
                    SizedBox(height: 27.24.h),
                    /// Text Chapter Complete
                    CustomText(
                        text: 'Chapter Complete',
                        textColor: buttonColor,
                        fontWeight: FontWeight.w700,
                      fontsize: 15.sp,

                    ),
                    SizedBox(height: 8.29.h),
                    /// Text Congratulations
                    CustomText(
                      text: 'Congratulations! You Passed!',
                      textColor: whiteColor,
                      fontWeight: FontWeight.w700,
                      fontsize: 18.96.sp,

                    ),
                    SizedBox(height: 34.48.h),
                    /// Circle Avatar Image
                    Container(
                      height: 138.91.h,
                      width: 138.91.w,
                      child: Image.asset('assets/images/chart_image.png'),
                    ),
                    SizedBox(height: 27.24.h),
                    /// Answers Detail
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal:20.60.w),
                      child: Row(
                        children: [
                          /// Small Green Circle
                          SizedBox(
                            height: 11.34.h,
                            width: 11.34.w,
                            child:CircleAvatar(
                              backgroundColor: greenColor,
                            ),
                          ),
                          ///  Text 8 Correct Answers
                          SizedBox(
                            height: 19.h,
                            width: 110.w,
                            child: CustomText(
                                text: ' 8 Correct Answers',
                                textColor: Color.fromRGBO(209, 213, 219, 1),
                                fontWeight: FontWeight.w600,
                            fontsize: 12.sp,
                            ),
                          ),
                          SizedBox(width: 17.06.w),
                          /// Small Pink Circle
                          SizedBox(
                            height: 11.34.h,
                            width: 11.34.w,
                            child:CircleAvatar(
                              backgroundColor: Color.fromRGBO(255, 143, 158, 1),
                            ),
                          ),
                          ///  Text 8 Correct Answers
                          SizedBox(
                            height: 19.h,
                            width: 110.w,
                            child: CustomText(
                              text: ' 2 Wrong Answers',
                              textColor: Color.fromRGBO(209, 213, 219, 1),
                              fontWeight: FontWeight.w600,
                              fontsize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15.02.h),
                    /// Points earned Text
                    CustomText(
                      text: 'Point earned',
                      textColor: buttonColor,
                      fontWeight: FontWeight.w700,
                      fontsize: 15.sp,
                    ),
                    /// 120 points Text
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: '120 ',
                          textColor: buttonColor2,
                          fontWeight: FontWeight.w800,
                          fontsize: 20.23.sp,
                        ),
                        CustomText(
                          text: 'points',
                          textColor: buttonColor2,
                          fontWeight: FontWeight.w800,
                          fontsize: 13.23.sp,
                        ),
                      ],
                    ),
                    SizedBox(height: 9.32.h),
                  ],
                ),
              ),
                SizedBox(height: 79.h),
                /// Try Again Button
                SizedBox(
                  height: 52.92.h,
                  width: double.infinity.w,
                  child: ElevatedButton(
                    onPressed: () {                      Get.to(()=>QuizPage());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36.29.r), // Set the desired border radius
                        side: BorderSide.none
                      ),
                    ),
                    child: CustomText(
                      text: 'Try Again',
                      textColor: whiteColor,
                      fontWeight: FontWeight.w700,
                      fontsize: 20.sp,
                    ),
                  ),
                ),
                SizedBox(height: 11.34.h),
                /// View Progress Button
                SizedBox(
                  height: 52.92.h,
                  width: double.infinity.w,
                  child: ElevatedButton(
                    onPressed: () {
                      Get.to(()=>ProgressScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36.29.r), // Set the desired border radius
                          side: BorderSide(
                            width: 1.w,
                            color: Darkcontainer,
                          ),
                      ),
                    ),
                    child: CustomText(
                      text: 'View Progress',
                      textColor: whiteColor,
                      fontWeight: FontWeight.w700,
                      fontsize: 20.sp,
                    ),
                  ),
                ),
                SizedBox(height: 50.h),




              ],
            ),
          ),
        )
    );
  }
}
