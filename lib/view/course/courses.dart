import 'package:bio_medica/controller/nav_bar_controller.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/widget/custom_search.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/drawer%20items/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../const/image_assets.dart';
import 'course_details.dart';

class CoursesScreen extends StatelessWidget {
  final NavBarController navBarController = Get.put(NavBarController());
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Add a list of course images and names
  final List<String> courseImages = [
    'assets/images/course01.png',
    'assets/images/course1.png',
    'assets/images/course2.png',
    'assets/images/course3.png'
  ];

  final List<String> courseNames = [
    'UX Research in Digital Product Design: Master Class',
    'The Full-Fledged Investment Banking Course 2023',
    'Photoshop: Master the Blend Tool to Enhance Your Photos',
    'End-to-End Web Design: Figma to Webflow Master'
  ];

  final List<String> courseLabels = [
    'assets/images/label1.png',
    'assets/images/label2.png',
    'assets/images/label3.png',
    'assets/images/label1.png',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(

        centerTitle: false,
        backgroundColor: Color.fromRGBO(192, 208, 221, 1),
        leading: Padding(

          padding: EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle
            ),
            width: MediaQuery.of(context).size.width < 360 ? 30.w : 38.w,
            height: MediaQuery.of(context).size.width < 360 ? 30.h : 38.h,
            child: GestureDetector(
              onTap: () {
                // Open the drawer using the scaffold key
                navBarController.scaffoldKey.currentState?.openDrawer();
              },
              child: Image(
                image: AssetImage('assets/images/left_side_bar_navigation_Icon.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        title: Align(
          alignment: AlignmentDirectional.topStart,
          child: CustomText(
            text: 'Courses',
            textColor: Color(0xFF001A2E),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [],
      ),
      body: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(13.r)),
            child: Container(
              height: 62.h,
              color: secondaryColor,
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: GestureDetector(
                            onTap: () {
                              // Unfocus the text field when tapping outside
                              FocusScope.of(context).unfocus();
                            },
                            child: SizedBox(
                              width: 237.w,
                              height: 42.h,
                              child: TextField(
                                style: TextStyle(color: whiteColor),
                                focusNode: FocusNode(),
                                // textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.mic_rounded,
                                    color: whiteColor,
                                  ),
                                  fillColor: Color.fromRGBO(0, 26, 46, 1),
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(),
                                  prefixIcon: Image.asset(
                                    AppImages.search,
                                  ),
                                  hintText: 'Search for anything',
                                  hintStyle: TextStyle(
                                    color: whiteColor,
                                    fontSize: 14.sp,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13.r),
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13.r),
                                  ),
                                ),
                              ),
                            ),
                          ))),
                  SizedBox(width: 5.w),
                  SizedBox(
                    height: 38.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.r),
                        ),
                        backgroundColor: Color(0xFF001A2E),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.tune,
                            color: whiteColor,
                            size: 13.sp,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "Filter",
                            style: TextStyle(
                                color: whiteColor,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Container(
            width: Get.width * 0.9,
            height: Get.height / 1.6,
            child: GridView.builder(
              itemCount: courseImages.length, // Adjust the count dynamically
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 10,
                childAspectRatio: 0.9,
              ),
              itemBuilder: (context, index) {
                return CourseCard(
                  image: courseImages[index], // Pass image
                  name: courseNames[index],
                  label: courseLabels[index],// Pass course name
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
  final String? label;

  CourseCard({required this.image, required this.name, this.label});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to CourseDetailScreen on tap
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseDetailScreen(
              title: name,
              image: image,

            ),
          ),
        );
      },
      child: SizedBox(
        width: 160.w, // Static width
        height: 100.h, // Static height
        child: Container(
          decoration: BoxDecoration(
            color: tapColor,
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
                    child: Stack(
                      children: [
                        // Your main image
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            image,
                            height: 90.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        if (label != null)
                        Positioned(
                          top: -25.h, right: -20.w, // Adjust the right value for positioning
                          child: Image.asset(label! , height: 80.h,),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.w),
                    child: CustomText(
                      text: name,
                      fontsize: 11.sp,
                      fontWeight: FontWeight.bold,
                      textColor: whiteColor,
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
