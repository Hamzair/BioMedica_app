import 'package:bio_medica/main.dart';
import 'package:bio_medica/view/const/color.dart';
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
      appBar: AppBar(
        backgroundColor: secondaryColor,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/images/backArrow.png',
          ),
        ),
        title: Align(
          alignment: Alignment.topLeft,
          child: CustomText(
            text: 'Chapters',
            textColor: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 3,
        flexibleSpace: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [secondaryColor, secondaryColor.withOpacity(0.8)],
              ),
            ),
          ),
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
               Navigator.pop(context);
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
