import 'package:bio_medica/controller/subscription_controller.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/course/chapters.dart';
import 'package:bio_medica/view/course/course_content.dart';
import 'package:bio_medica/view/course/courses_subtopics.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CoursesSubtopics extends StatefulWidget {
   final String title;
   final String image;
   final bool isPremium;

  CoursesSubtopics(
      {required this.title, required this.image, this.isPremium = false});

  @override
  _CoursesSubtopicsState createState() => _CoursesSubtopicsState();
}

class _CoursesSubtopicsState extends State<CoursesSubtopics> {
  int _selectedIndex = 0;

  SubscriptionService service = Get.find<SubscriptionService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,

      body: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                BorderRadius.vertical(bottom: Radius.circular(30.r)),
                child: Image.asset(
                  widget.image,
                  //    height: 264.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                left: 10,
                top: 40,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset(
                      'assets/images/back_icon.png',
                      height: 31.h,
                      width: 31.w,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.0.w,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  CustomText(
                    text: widget.title,
                    textColor: whiteColor,
                    fontWeight: FontWeight.w600,
                    fontsize: 17.sp,
                  ),
                  SizedBox(height: 18.h),
                  Container(
                    height: 38.h,
                    decoration: BoxDecoration(
                      color:Darkcontainer,
                      borderRadius:
                      BorderRadius.circular(11.38.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = 0;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 3.5.w, vertical: 3.5.h),
                              decoration: BoxDecoration(
                                color: _selectedIndex == 0
                                    ? Colors.cyan
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                              child: Center(
                                child: CustomText(
                                  text: 'Topics',
                                  fontsize: 14.sp,
                                  textColor: whiteColor,
                                  fontWeight: _selectedIndex == 0
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = 1;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 3.5.w, vertical: 3.5.h),
                              decoration: BoxDecoration(
                                color: _selectedIndex == 1
                                    ? Colors.cyan
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                              child: Center(
                                child: CustomText(
                                  text: 'Sub-Chapters',
                                  fontsize: 13.sp,
                                  textColor: whiteColor,
                                  fontWeight: _selectedIndex == 1
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  // Content based on selected index
                  if (_selectedIndex == 0)
                  // About Section
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [


                          CustomText(
                              text: 'You will be Learning:',
                              fontsize: 18.sp,
                              fontWeight: FontWeight.bold,
                              textColor: buttonColor2),
                          SizedBox(height: 10.17.h),
                          _buildTopicTile('Critical Thinking'),
                          SizedBox(height: 10.h),
                          _buildTopicTile('User Experience Research'),
                          SizedBox(height: 10.h),
                          _buildTopicTile('User Interface Design'),
                          SizedBox(height: 10.h),
                          _buildTopicTile('Usability Testing'),
                          SizedBox(height: 40.h),
                          SizedBox(
                            height: 30.h,
                          )
                        ],
                      ),
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Chapters Overview:',
                          textColor: buttonColor2,
                          fontWeight: FontWeight.w700,
                          fontsize: 16.sp,
                        ),
                        SizedBox(height: 23.h),
                        Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                               //   Get.to(() => CoursesSubtopics());
                                },
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    _LessonCard(
                                      title: 'Sub-Chapter\n1',
                                    ),
                                    _LessonCard(
                                      title: 'Sub-Chapter\n2',
                                    ),
                                    _LessonCard(
                                      title: 'Sub-Chapter\n3',
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 20.h),
                              GestureDetector(
                                onTap: () {
                           //       Get.to(() => CoursesSubtopics());
                                },
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    _LessonCard(
                                      title: 'Sub-Chapter\n4',
                                    ),
                                    _LessonCard(
                                      title: 'Sub-Chapter\n5',
                                    ),
                                    _LessonCard(
                                      title: 'Sub-Chapter\n6',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 100.h),
                      ],
                    ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}

Widget _buildTopicTile(String title) {
  return Card(
    color: Darkcontainer,
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r), // Rounded corners
    ),
    child: ListTile(
      leading: Icon(Icons.check_circle, color: Colors.cyanAccent),
      title: CustomText(
        text: title,
        textColor: whiteColor,
        fontWeight: FontWeight.w500,
        fontsize: 18.sp, // Custom font size
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 16.w),
    ),
  );
}

class _LessonCard extends StatelessWidget {
  final String title;
//  final String imagePath;

  const _LessonCard({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 92.w,
            height: 82.h,
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 28, 49, 1),
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Darkcontainer, width: 1.2)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: title,
                    fontsize: 12.sp,
                    textColor: whiteColor,
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center, // Center the title text
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
