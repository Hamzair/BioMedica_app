import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/course/chapters.dart';
import 'package:bio_medica/view/course/course_content.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CourseDetailScreen extends StatefulWidget {
  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int _selectedIndex = 0; // 0 for About, 1 for Lessons

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
                  'assets/images/rectangle.png', // Replace with actual image
                  height: 300.h,
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

                  SizedBox(height: 8),
                  CustomText(
                    text:
                        'Master Digital Product Design: UX Research & UI Design',
                    textColor: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontsize: 22.sp,
                  ),
                  SizedBox(height: 20.h),

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF001A2E).withOpacity(0.6),
                      borderRadius:
                          BorderRadius.circular(10), // Rounded corners
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w
                                  , vertical: 10.h
                              ),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30.w
                                  , vertical: 10.h),
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
                            fontsize: 18,
                            fontWeight: FontWeight.bold,
                            textColor: Colors.white),
                        SizedBox(height: 10.h),
                        ListTile(
                            leading:
                                Icon(Icons.check_circle, color: Colors.cyan),
                            title: CustomText(
                              text: 'Critical Thinking',
                              textColor: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                        ListTile(
                            leading:
                                Icon(Icons.check_circle, color: Colors.cyan),
                            title: CustomText(
                              text: 'User Experience Research',
                              textColor: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                        ListTile(
                            leading:
                                Icon(Icons.check_circle, color: Colors.cyan),
                            title: CustomText(
                              text: 'User Interface Design',
                              textColor: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                        ListTile(
                            leading:
                                Icon(Icons.check_circle, color: Colors.cyan),
                            title: CustomText(
                              text: 'Usability Testing',
                              textColor: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    )
                  else
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          text: 'Course Lessons',
                          textColor: buttonColor2,
                          fontWeight: FontWeight.w500,
                          fontsize: 22.sp,
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceBetween, // Space evenly between cards
                                children: [
                                  _LessonCard(
                                    title: 'Instructor\nIntroduction',
                                    imagePath: 'assets/images/person.png',
                                  ),
                                  _LessonCard(
                                    title: 'Design\nShortage',
                                    imagePath: 'assets/images/pen.png',
                                  ),
                                  _LessonCard(
                                    title: 'Make it \nPretty',
                                    imagePath: 'assets/images/tulip.png',
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
                                    imagePath: 'assets/images/doc.png',
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
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => CourseContent()));
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15),
            backgroundColor: Colors.cyan,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.r
              ),
            ),
          ),
          child: Text(
            'Start Now',
            style: TextStyle(fontSize: 18.sp, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _LessonCard extends StatelessWidget {
  final String imagePath; // Path to the image
  final String title;

  const _LessonCard({required this.imagePath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Wrap the entire card in a Container
      width: 92.w, // Set the width of the card
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 92.w, // Set the width of the image container
            height: 82.h,
            decoration: BoxDecoration(
              color: Color(0xFF001A2E).withOpacity(0.4),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              imagePath, // Load image from assets
              height: 34.h,
              width: 43.w, // Adjust image fit as needed
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center, // Center the title text
          ),
        ],
      ),
    );
  }
}
