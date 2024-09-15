import 'package:bio_medica/main.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/view/course/courses.dart';
import 'package:bio_medica/view/course/quiz.dart';
import 'package:bio_medica/view/homeOptions/DeviceLibrary/deviceLibrary.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LessonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(13.r),
                  bottomRight: Radius.circular(13.r))),
          centerTitle: true,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset('assets/images/back_icon.png')),
                        SizedBox(
                          width: 7.w,
                        ),
                        CustomText(
                          text: "Chapters",
                          textColor: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontsize: 22.sp,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: secondaryColor,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 28, 49, 1.0).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black, // Black border color
                    width: 1.0, // Border width
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section Title
                      CustomText(
                        text: 'Hypertension',
                        textColor: buttonColor2,
                        fontWeight: FontWeight.w600,
                        fontsize: 22,
                      ),
                      SizedBox(height: 16),
                      // Definition
                      CustomText(
                        text:
                            'Definition: Hypertension is a chronic medical condition where the blood pressure in the arteries is persistently elevated.',
                        textColor: Colors.white,
                        fontsize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: 16),
                      // Types Section
                      Text(
                        'Types:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '• Primary (Essential) Hypertension: No identifiable cause, accounts for 90-95% of cases.\n'
                        '• Secondary Hypertension: Caused by an underlying condition (e.g., kidney disease, endocrine disorders).',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16),
                      // Risk Factors Section
                      Text(
                        'Risk Factors:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Age, obesity, sedentary lifestyle, high salt intake, smoking, and genetic predisposition.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16),
                      // Symptoms Section
                      Text(
                        'Symptoms:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Often asymptomatic, but severe cases can cause headaches, dizziness, blurred vision, and chest pain.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16),
                      // Complications Section
                      Text(
                        'Complications:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'If untreated, can lead to heart disease, stroke, kidney failure, and vision loss.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 16),
                      // Management Section
                      Text(
                        'Management:',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Lifestyle changes (diet, exercise), medications if needed.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Continue Button
            SizedBox(
              width: double.infinity,
              height: 52.sp,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Get.to(() => QuizPage());
                },
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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
