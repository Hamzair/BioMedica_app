import 'package:bio_medica/controller/nav_bar_controller.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/widget/custom_search.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'course_details.dart';

class CoursesScreen extends StatelessWidget {
  final NavBarController navBarController = Get.put(NavBarController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Add a list of course images and names
  final List<String> courseImages = [
    'assets/images/z3.png',
    'assets/images/z2.png',
    'assets/images/z1.png',
    'assets/images/z6.png'
  ];

  final List<String> courseNames = [
    'UX Research in Digital Product Design: Master Class',
    'The Full-Fledged Investment Banking Course 2023',
    'Photoshop: Master the Blend Tool to Enhance Your Photos',
    'End-to-End Web Design: Figma to Webflow Master'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(192, 208, 221, 1),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              navBarController.scaffoldKey.currentState?.openDrawer();
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF001A2E),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.menu,
                color: buttonColor2,
              ),
            ),
          ),
        ),
        title: CustomText(
          text: 'Courses',
          textColor: Color(0xFF001A2E),
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.r)),
            child: Container(
              height: 70.h,
              color: secondaryColor,
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                      child: CustomSearch(),
                    ),
                  ),
                  SizedBox(width: 5.w),
                  SizedBox(
                    height: 38.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Color(0xFF001A2E),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.tune,
                            color: Colors.white,
                            size: 25.sp,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "Filter",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: GridView.builder(
              itemCount: courseImages.length, // Adjust the count dynamically
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                return CourseCard(
                  image: courseImages[index], // Pass image
                  name: courseNames[index],   // Pass course name
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  final String image;
  final String name;

  CourseCard({required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CourseDetailScreen()),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(9.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 15, 10, 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5.r),
                    topRight: Radius.circular(5.r),
                  ),
                  child: Image.asset(
                    image, // Use the passed image
                    height: 120.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.h),
                    CustomText(
                      text: name,
                      fontsize: 11.sp,
                      fontWeight: FontWeight.bold,
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
