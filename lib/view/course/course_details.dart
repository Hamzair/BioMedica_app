import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/course/chapters.dart';
import 'package:bio_medica/view/course/course_content.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CourseDetailScreen extends StatefulWidget {
  final String title;
  final String image;

  CourseDetailScreen({required this.title, required this.image});

  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          // Course Image
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(30)),
                child: Image.asset(
                  widget.image,
                  height: 264.h,
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
                      child: Image.asset('assets/images/backArrow.png')))
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: ListView(
                children: [
                  // Course Category and Title
                  CustomText(
                      text: '• UX Design',
                      textColor: buttonColor2,
                      fontsize: 16.sp,
                      fontWeight: FontWeight.bold),

                  SizedBox(height: 8.h),
                  CustomText(
                    text: widget.title, // Use the passed title
                    textColor: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontsize: 17.sp,
                  ),
                  SizedBox(height: 20.h),

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF001A2E).withOpacity(0.6),
                      borderRadius:
                          BorderRadius.circular(10.r), // Rounded corners
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                color: _selectedIndex == 0
                                    ? Colors.cyan
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: CustomText(
                                  text: 'About',
                                  fontsize: 13.sp,
                                  textColor: Colors.white,
                                  fontWeight: _selectedIndex == 0
                                      ? FontWeight.bold
                                      : FontWeight.normal,
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                color: _selectedIndex == 1
                                    ? Colors.cyan
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: CustomText(
                                  text: 'Chapters',
                                  fontsize: 13.sp,
                                  textColor: Colors.white,
                                  fontWeight: _selectedIndex == 1
                                      ? FontWeight.bold
                                      : FontWeight.normal,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Course Description
                        CustomText(
                          text:
                              'Transformative journey through our comprehensive course, '
                              '‘Master Digital Product Design: UX Research & UI Design’. Created especially for budding UX/UI designers, '
                              'this immersive program invites you to explore the intricate art of crafting exceptional digital experiences....',
                          fontWeight: FontWeight.w500,
                          textColor: Colors.white,
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Read more',
                          style: TextStyle(color: buttonColor2),
                        ),
                        SizedBox(height: 20.h),

                        // Key Points
                        CustomText(
                            text: 'Key points',
                            fontsize: 18.sp,
                            fontWeight: FontWeight.bold,
                            textColor: Colors.white),
                        SizedBox(height: 15.17.h),

                        // Key Points List with aligned items
                        ListTile(
                          minTileHeight: 0,
                          minVerticalPadding: 0,
                          leading: Icon(Icons.check_circle, color: Colors.cyan),
                          title: CustomText(
                            text: 'Critical Thinking',
                            textColor: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding: EdgeInsets
                              .zero, // Aligns icon and text to the start
                          minLeadingWidth:
                              0, // Prevents extra space around leading icon
                        ),
                        ListTile(
                          minTileHeight: 0,
                          leading: Icon(Icons.check_circle, color: Colors.cyan),
                          title: CustomText(
                            text: 'User Experience Research',
                            textColor: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: 0,
                        ),
                        ListTile(
                          minTileHeight: 0,
                          leading: Icon(Icons.check_circle, color: Colors.cyan),
                          title: CustomText(
                            text: 'User Interface Design',
                            textColor: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: 0,
                        ),
                        ListTile(
                          minTileHeight: 0,
                          leading: Icon(Icons.check_circle, color: Colors.cyan),
                          title: CustomText(
                            text: 'Usability Testing',
                            textColor: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                          contentPadding: EdgeInsets.zero,
                          minLeadingWidth: 0,
                        ),
                      ],
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Course Chapters',
                          textColor: buttonColor2,
                          fontWeight: FontWeight.w700,
                          fontsize: 16.sp,
                        ),
                        SizedBox(height: 23.h),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _LessonCard(
                                    title: 'Instructor\nIntroduction',
                                    //  imagePath: 'assets/images/person.png',
                                  ),
                                  _LessonCard(
                                    title: 'Design\nShortage',
                                    //   imagePath: 'assets/images/pen.png',
                                  ),
                                  _LessonCard(
                                    title: 'Make it \nPretty',
                                    //    imagePath: 'assets/images/tulip.png',
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _LessonCard(
                                    title: 'Copy\nInspiration',
                                    //  imagePath: 'assets/images/person.png',
                                  ),
                                  _LessonCard(
                                    title: 'Make it \nPretty',
                                    //     imagePath: 'assets/images/pen.png',
                                  ),
                                  _LessonCard(
                                    title: 'Design \nShortage',
                                    //    imagePath: 'assets/images/tulip.png',
                                  ),

                                  // Add more lesson cards as needed in this row
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.all(12),
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: buttonColor,
                        width: 1,
                      ),
                      color: Colors
                          .transparent, // Ensure the container background is transparent
                    ),
                    child: Center(
                      // Center the image within the container
                      child: Image.asset(
                        'assets/images/fav icon.png',
                        height: 24.h,
                        width: 24.w,
                        fit: BoxFit.cover, // Ensure the image scales correctly
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  Container(
                    // color: Colors.transparent,
                    width: 249.w,
                    //  height: 53.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(() => CourseContent(
                            title: widget.title, image: widget.image));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            vertical: 13.h, horizontal: 8.w),
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.r),
                        ),
                      ),
                      child: CustomText(
                        text: 'Start Now',
                        fontsize: 18.sp,
                        textColor: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                color: Color(0xFF001A2E).withOpacity(0.4),
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(color: Darkcontainer, width: 1.2)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: title,
                    fontsize: 12.sp,
                    textColor: Colors.white,
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
