import 'package:bio_medica/main.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    {
      "question": "",
      "answers": [],
      "correctAnswer": null,
    },
    // Add more questions here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: secondaryColor,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset('assets/images/backArrow.png')),
        title: Align(
          alignment: Alignment.topLeft,
          child: CustomText(
            text: 'UX Design Quiz',
            fontWeight: FontWeight.bold,
            textColor: drawerBg,
            fontsize: 22.sp,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Progress Indicator (outside the card)
          SizedBox(
            height: 29.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: LinearProgressIndicator(
              minHeight: 7.h,
              value: (_currentPage + 1) /
                  (questions.length + 1), // Adjusted for extra page
              backgroundColor: Colors.grey[200],
              borderRadius: BorderRadius.circular(20),
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
              itemCount: questions.length +
                  1, // Include an extra page for the dropdown
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
                                  text: 'What is Failure Mode and Effects Analysis (FMEA), and how is it used in medical device risk management?',
                                  fontWeight: FontWeight.w600,
                                  textColor: Colors.white,
                                  fontsize: 12.sp,

                                ),
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: CustomText(
                                     text:  'FMEA is a structured approach used to identify potential failure modes in a device, assess the impact of those failures, and prioritize corrective actions. By systematically evaluating each component of the device, clinical engineers can identify weaknesses and implement changes to improve safety and performance before the device reaches the market..',
                                    fontWeight: FontWeight.w600,
                                      textColor: Colors.white,
                                      fontsize: 12.sp,

                                    ),
                                  ),
                                ],
                                collapsedIconColor: Colors.white,
                                iconColor: Colors.white,
                                tilePadding:
                                    EdgeInsets.symmetric(horizontal: 16.0),
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
                            // Question Number
                            CustomText(
                              text:
                                  "Question ${index + 1} of ${questions.length}",
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
                                  shrinkWrap: true,
                                  itemCount: questions[index]['answers'].length,
                                  itemBuilder: (context, answerIndex) {
                                    bool isCorrect = answerIndex ==
                                        questions[index]['correctAnswer'];
                                    bool isSelected =
                                        _selectedAnswers[index] == answerIndex;
                                    return GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedAnswers[index] = answerIndex;
                                        });
                                      },
                                      child: Container(
                                        margin: EdgeInsets.only(bottom: 11),
                                        padding: EdgeInsets.symmetric(
                                            vertical: 16, horizontal: 16),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? (isCorrect
                                                  ? Color.fromRGBO(
                                                      90, 231, 51, 1.0)
                                                  : Color.fromRGBO(
                                                      255, 56, 56, 1))
                                              : Color.fromRGBO(0, 28, 49, 1.0)
                                                  .withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(8.r),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.2),
                                              blurRadius: 4,
                                              offset: Offset(0, 2),
                                            ),
                                          ],
                                        ),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: 30.w,
                                              height: 30.h,
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
                                                      : Colors.grey,
                                                  width: 2,
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
                                                      : Colors.red,
                                                  size: 20,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 16.w),
                                            Expanded(
                                              child: Text(
                                                questions[index]['answers']
                                                    [answerIndex],
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
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

          // Continue Button
          Padding(
            padding:EdgeInsets.fromLTRB(16, 10, 16, 110),
            child: SizedBox(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan, // Background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  if (_currentPage < questions.length - 1) {
                    // Go to the next page
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    // End of quiz, handle submit
                    // Add logic to calculate score, etc.
                  }
                },
                child: Text(
                  _currentPage == questions.length - 1 ? 'Finish' : 'Continue',
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
