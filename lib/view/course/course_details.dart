






import 'package:bio_medica/main.dart';
import 'package:bio_medica/view/const/color.dart';
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
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
            child: Image.asset(
              'assets/images/rectangle.png', // Replace with actual image
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
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
                      fontsize: 16,
                      fontWeight: FontWeight.bold),

                  SizedBox(height: 8),
                  CustomText(
                    text:
                    'Master Digital Product Design: UX Research & UI Design',
                    textColor: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontsize: 22,
                  ),
                  SizedBox(height: 20),

                  // Tab Bar for About/Lessons
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF001A2E).withOpacity(0.6),
                      borderRadius: BorderRadius.circular(10), // Rounded corners
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
                                  horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                color: _selectedIndex == 0
                                    ? Colors.cyan
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'About',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: _selectedIndex == 0
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
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
                                  horizontal: 30, vertical: 10),
                              decoration: BoxDecoration(
                                color: _selectedIndex == 1
                                    ? Colors.cyan
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  'Lessons',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: _selectedIndex == 1
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 20),

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
                        SizedBox(height: 10),
                        Text(
                          'Read more',
                          style: TextStyle(color: buttonColor2),
                        ),
                        SizedBox(height: 20),

                        // Key Points
                        CustomText(
                            text: 'Key points',
                            fontsize: 18,
                            fontWeight: FontWeight.bold,
                            textColor: Colors.white),
                        SizedBox(height: 10),
                        ListTile(
                            leading: Icon(Icons.check_circle, color: Colors.cyan),
                            title: CustomText(
                              text: 'Critical Thinking',
                              textColor: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                        ListTile(
                            leading: Icon(Icons.check_circle, color: Colors.cyan),
                            title: CustomText(
                              text: 'User Experience Research',
                              textColor: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                        ListTile(
                            leading: Icon(Icons.check_circle, color: Colors.cyan),
                            title: CustomText(
                              text: 'User Interface Design',
                              textColor: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                        ListTile(
                            leading: Icon(Icons.check_circle, color: Colors.cyan),
                            title: CustomText(
                              text: 'Usability Testing',
                              textColor: Colors.white,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    )
                  else
                  // Lessons Section

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
                      children: [
                        // Placeholder for Lessons content
                        CustomText(
                          text: 'Course Lessons',
                          textColor: buttonColor2,
                          fontWeight: FontWeight.w500,
                          fontsize: 22,
                        ),
                        SizedBox(height: 20), // Space before the lesson cards

                        // Lesson Cards (arranged in two rows)
                        SizedBox(
                          width: double.infinity,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween, // Space evenly between cards
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
                                    title: 'Make it Pretty',
                                    imagePath: 'assets/images/tulip.png',
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
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
            // Handle start course action
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15),
            backgroundColor: Colors.cyan,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(
            'Start Now',
            style: TextStyle(fontSize: 18, color: Colors.white),
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 92.w,
          height: 82.h,
          decoration: BoxDecoration(
            color: Color(0xFF001A2E).withOpacity(0.4),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Image.asset(
            imagePath, // Load image from assets
            fit: BoxFit.contain, // Adjust image fit as needed
          ),
        ),
        SizedBox(height: 10),
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}