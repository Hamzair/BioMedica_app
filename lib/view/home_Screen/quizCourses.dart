import 'package:bio_medica/controller/nav_bar_controller.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/course/quiz.dart';
import 'package:bio_medica/widget/custom_search.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/drawer%20items/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../const/image_assets.dart';

class QuizCourses extends StatefulWidget {
  final String QuizNames;

  QuizCourses({
    required this.QuizNames,
  });

  @override
  State<QuizCourses> createState() => _QuizCoursesState();
}

class _QuizCoursesState extends State<QuizCourses> {
  final FocusNode _searchFocusNode = FocusNode();

  final NavBarController navBarController = Get.put(NavBarController());

  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> quizNumber = [
    'Quiz 1',
    'Quiz 2',
    'Quiz 3',
    'Quiz 4',

  ];

  final List<String> courseNames = [
    'UX Research in Digital Product Design: Master Class',
    'The Full-Fledged Investment Banking Course 2023',
    'Photoshop: Master the Blend Tool to Enhance Your Photos',
    'End-to-End Web Design: Figma to Webflow Master'
  ];


  final List<String> courseCompletionStatuses = [
    '',
    '',
    'Finished',
    '',
  ];

  // Color getStatusColor(String status) {
  //   if (status.contains('Finished')) {
  //     return Colors.green;
  //   } else if (status.contains('Not started')) {
  //     return Colors.red;
  //   } else {
  //     return buttonColor2;
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(13.r),
              bottomRight: Radius.circular(13.r),
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        width: MediaQuery.of(context).size.width < 360
                            ? 30.w
                            : 38.w,
                        height: MediaQuery.of(context).size.width < 360
                            ? 30.h
                            : 38.h,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset('assets/images/back_icon.png'),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      CustomText(
                        text: widget.QuizNames,
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
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Container(
                width: Get.width * 0.9,
                height: Get.height / 1.6,
                child: GridView.builder(
                  itemCount:
                  quizNumber.length, // Adjust the count dynamically
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 10,
                    childAspectRatio: courseCompletionStatuses.toString().isNotEmpty
                        ? 0.8.h
                        : 0.6.h,
                  ),
                  itemBuilder: (context, index) {
                    return CourseCard(
                      quiz: quizNumber[index], // Pass image
                      name: courseNames[index],
                      completionStatus: courseCompletionStatuses[index],
                   // Pass course name
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
}

class CourseCard extends StatelessWidget {
  final String quiz;
  final String name;
  final String completionStatus;

  CourseCard({
    required this.quiz,
    required this.name,
    required this.completionStatus,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Get.to(() => QuizPage());
      },
      child: SizedBox(

        child: Container(
          decoration: BoxDecoration(
            color: Darkcontainer,
            borderRadius: BorderRadius.circular(9.r),
            border: Border.all(
              width: 1,
              color: Darkcontainer,
            ),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(6.57),
                    child: Column(

                      children: [
                        // Your main image
                        SizedBox(height: 15.h),
                        Center(child: CustomText(text: quiz, textColor: buttonColor, fontWeight: FontWeight.w700,fontsize: 22.sp,textAlign: TextAlign.center,)),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: CustomText(
                      text: name,
                      fontsize: 11.sp,
                      fontWeight: FontWeight.bold,
                      textColor: whiteColor,
                    ),
                  ),
                  SizedBox(
                      height: 15.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: CustomText(
                      text: completionStatus,
                      fontsize: 14.sp,
                      fontWeight: FontWeight.w600,
                      textColor: Colors.green
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
