import 'package:bio_medica/main.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/course/result_screen.dart';
import 'package:bio_medica/drawer%20items/subscription_screen.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widget/custom_search.dart';
import '../const/image_assets.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentPage = 0;
  List<int?> _selectedAnswers = List.filled(10, null);
  PageController _pageController = PageController();

  // Sample quiz data
  List<Map<String, dynamic>> questions = [
    {
      "question":
      "Transformative journey through our comprehensive course, ‘Master Digital Product Design: UX Research & UI Design.’ Created especially for budding UX/UI designers.",
      "answers": ["Usable", "Undersanable", "Useful", "Findable"],
      "correctAnswer": 0,
    },
    {
      "question":
      "Transformative journey through our comprehensive course, ‘Master Digital Product Design: UX Research & UI Design.’ Created especially for budding UX/UI designers.",
      "answers": ["Usable", "Undersanable", "Useful", "Findable"],
      "correctAnswer": 0,
    },
    {
      "question":
      "Transformative journey through our comprehensive course, ‘Master Digital Product Design: UX Research & UI Design.’ Created especially for budding UX/UI designers.",
      "answers": ["Usable", "Undersanable", "Useful", "Findable"],
      "correctAnswer": 0,
    },
    // Add more questions here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
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
                            child: Image.asset('assets/images/back_icon.png',height: 31.h,width: 31.w,)),
                        SizedBox(
                          width: 7.w,
                        ),
                        CustomText(
                          text: "UX Design Quiz",
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
      body: Column(
        children: [
          // Progress Indicator (outside the card)
          SizedBox(
            height: 29.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0.w),
            child: LinearProgressIndicator(
              minHeight: 7.h,
              value: (_currentPage + 1) / (questions.length + 1), // Adjusted for extra page
              backgroundColor: Colors.grey[200],
              borderRadius: BorderRadius.circular(20.r),
              valueColor: AlwaysStoppedAnimation<Color>(Colors.cyan),
            ),
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              itemCount: questions.length + 1, // Include an extra page for the dropdown
              itemBuilder: (context, index) {
                if (index == 3) {
                  // Display a dropdown on the 4th page
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Card(
                      color: Color.fromRGBO(0, 28, 49, 1.0).withOpacity(0.4),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Display question before the dropdown
                            CustomText(
                              text: "Personal Study Question",
                              fontsize: 18.sp,
                              textColor: buttonColor2,
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(height: 35.h),
                            // Dropdown with description
                            Theme(
                              data: Theme.of(context).copyWith(
                                dividerColor: Colors.transparent,
                              ),
                              child: ExpansionTile(
                                title: CustomText(
                                  text:
                                  'What is Failure Mode and Effects Analysis (FMEA), and how is it used in medical device risk management?',
                                  fontWeight: FontWeight.w600,
                                  textColor: Colors.white,
                                  fontsize: 12.sp,
                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: CustomText(
                                      text:
                                      'FMEA is a structured approach used to identify potential failure modes in a device, assess the impact of those failures, and prioritize corrective actions. By systematically evaluating each component of the device, clinical engineers can identify weaknesses and implement changes to improve safety and performance before the device reaches the market.',
                                      fontWeight: FontWeight.w600,
                                      textColor: Colors.white,
                                      fontsize: 12.sp,
                                    ),
                                  ),
                                ],
                                collapsedIconColor: Colors.white,
                                iconColor: Colors.white,
                                tilePadding: EdgeInsets.symmetric(horizontal: 16.0.h),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  // Regular quiz question card
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal:25.w
                    ),
                    child: Card(
                      color: tapColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 23.w,vertical: 14.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Question Number
                            CustomText(
                              text: "Question ${index + 1} of ${questions.length}",
                              textColor: Colors.cyan,
                              fontWeight: FontWeight.bold,
                              fontsize: 18.sp,
                            ),
                            SizedBox(height: 16.h),
                            // Question Text
                            CustomText(
                              text: questions[index]['question'],
                              fontsize: 16.sp,
                              textColor: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(height: 34.h),
                            if (questions[index]['answers'].isNotEmpty)
                              Expanded(
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemCount: questions[index]['answers'].length,
                                  itemBuilder: (context, answerIndex) {
                                    bool isCorrect =
                                        answerIndex == questions[index]['correctAnswer'];
                                    bool isSelected =
                                        _selectedAnswers[index] == answerIndex;
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedAnswers[index] = answerIndex;
                                        });
                                      },
                                      child: Container(
                                        height: 52.h,
                                        margin: EdgeInsets.only(bottom: 11.h),
                                        padding: EdgeInsets.symmetric(

                                            horizontal: 16.w),
                                        decoration: BoxDecoration(

                                          color: isSelected
                                              ? (isCorrect
                                              ? Color.fromRGBO(90, 231, 51, 1.0)
                                              : Color.fromRGBO(255, 56, 56, 1))
                                              : tapColor,
                                          borderRadius: BorderRadius.circular(8.r),
                                          border: Border.all(color: Darkcontainer,width: 1),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.2),
                                              blurRadius: 4,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Container(

                                              decoration: BoxDecoration(

                                                shape: BoxShape.circle,
                                                color: isSelected
                                                    ? (isCorrect
                                                    ? Colors.white
                                                    : Colors.white)
                                                    : Colors.transparent,
                                                border: Border.all(

                                                  color: isSelected
                                                      ? (isCorrect
                                                      ? Colors.green
                                                      : Colors.red)
                                                      : buttonColor2,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Center(
                                                child: Icon(
                                                  isSelected
                                                      ? (isCorrect
                                                      ? Icons.check
                                                      : Icons.close)
                                                      : null,
                                                  color: isSelected
                                                      ? Colors.green
                                                      : Colors.transparent,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.w),
                                            Expanded(
                                              child: CustomText(
                                                text:
                                                questions[index]['answers'][answerIndex],
                                                fontsize: 16.sp,
                                                textColor: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
          // Button for "Continue" or "Finish"
          Padding(
            padding:EdgeInsets.fromLTRB(25.w, 10.h, 25.w, 16.h),
            child: SizedBox(
              width: double.infinity,
              height: 53.h,
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage < 3) {
                    // Move to the next page if not on the "Personal Study Question" page
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else if (_currentPage == 3) {
                    // Navigate to the ResultScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36.r),
                  ),
                ),
                child: Text(
                  _currentPage == 3 ? 'Finish' : 'Continue',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
