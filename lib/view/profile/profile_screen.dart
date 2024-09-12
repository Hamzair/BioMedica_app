import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/view/profile/edit_profile_screen.dart';
import 'package:bio_medica/view/profile/subscription_screen.dart';
import 'package:bio_medica/widget/custom_button.dart';
import 'package:bio_medica/widget/custom_search.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../loading_percentage_circle/loading_percentage_circle.dart';
import 'goal_settings.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(100.h), // Set the preferred height
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
                          SizedBox(
                            width: 38.w,
                            height: 38.h,
                            child: GestureDetector(
                              onTap: (){
                                Get.to(()=> SubscriptionScreen());
                              },
                              child: Image(
                                  image: AssetImage('assets/images/drawer.png')),
                            ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          CustomText(
                            text: "Profile",
                            textColor: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontsize: 22.sp,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                              width: 38.w,
                              height: 38.h,
                              child: GestureDetector(
                                onTap: (){
                                  Get.to(()=> EditProfileScreen());
                                },
                                child: Image(
                                    image: AssetImage(
                                        'assets/images/settings_image.png')),
                              )),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16.h),
              /// Profile Image And Name
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 120,
                      width: 120,
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/profile_image.png'),
                      ),
                    ),
                    SizedBox(height: 5.h),
                    CustomText(
                      text: 'Merrill Kervin',
                      textColor: whiteColor,
                      fontWeight: FontWeight.bold,
                      fontsize: 23.1,
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.h),

              /// Points, Courses, Chapters
              Container(
                height: 65.65.h,
                width: 311.w,
                padding: EdgeInsets.symmetric(vertical: 11.41.h,horizontal: 7.61.w),
                decoration: BoxDecoration(
                  color: tapColor,
                  // Your tapColor can be defined or replaced here
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: Color.fromRGBO(0, 28, 49, 1),
                    // Dark blue color for the border
                    width: 1.w, // Width of the border
                  ),
                ),
                child:Container(
                  color: tapColor,
                  child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// 22 Quizzes
                      Container(
                        width: 88.45.w,
                        height: 42.83.h,

                        child: Column(

                          children: [
                            CustomText(text: '22',
                                fontsize: 11.22.sp,
                                textColor: whiteColor,
                                fontWeight: FontWeight.w700,
                        ),
                            CustomText(text: 'Quizzes',
                              fontsize: 11.sp,
                              textColor: buttonColor,
                              fontWeight: FontWeight.w700,
                            ),
                        ],
                      ) ,),
                      /// Divider
                      Container(
                        width: 2.w,
                        height: 30.83.h,
                        color:buttonColor2,
                      ),
                      /// 12 Courses
                      Container(
                        width: 88.45.w,
                        height: 42.83.h,
                        child: Column(

                          children: [
                            CustomText(text: '12',
                              fontsize: 11.22.sp,
                              textColor: whiteColor,
                              fontWeight: FontWeight.w700,
                            ),
                            CustomText(text: 'Courses',
                              fontsize: 11.sp,
                              textColor: buttonColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ) ,
                      ),

                      Container(
                        width: 2.w,
                        height: 30.83.h,
                        color:buttonColor2,
                      ),
                      /// 140 Chapters
                      Container(
                        width: 88.45.w,
                        height: 42.83.h,
                        child: Column(

                          children: [
                            CustomText(text: '140',
                              fontsize: 11.22.sp,
                              textColor: whiteColor,
                              fontWeight: FontWeight.w700,
                            ),
                            CustomText(text: 'Chapters',
                              fontsize: 11.sp,
                              textColor: buttonColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ],
                        ) ,
                      )

                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 16.35.h,
              ),

              /// TAB MyCourses,Goals,Resources
              Container(
               
                height: 37.92.h,
                width: 310.81.w,
                decoration: BoxDecoration(
                  color: tapColor,
                  // Your tapColor can be defined or replaced here
                  borderRadius: BorderRadius.circular(11.38.r),
                  border: Border.all(
                    color: Color.fromRGBO(0, 28, 49, 1),
                    // Dark blue color for the border
                    width: 1.w, // Width of the border
                  ),
                ),
                child: Row(
                  children: [
                    /// My Courses Tab
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          child: Container(
                            width: 100.81.w,
                            height: 30.34.h,
                            decoration: BoxDecoration(
                              color: _selectedIndex == 0
                                  ? Colors.cyan
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: CustomText(
                                text: 'My Courses',
                                fontsize: 14.sp,
                                textColor: _selectedIndex == 0
                                    ? Colors.white
                                    : Color.fromRGBO(182, 182, 182, 1),
                                fontWeight: _selectedIndex == 0
                                    ? FontWeight.w700
                                    : FontWeight.w700,

                              ),

                            ),
                          ),
                        ),
                      ),
                    ),
                    /// Goals Tab
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                        child: Container(
                          width: 100.81.w,
                          height: 30.34.h,
                          decoration: BoxDecoration(
                            color: _selectedIndex == 1
                                ? Colors.cyan
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: Center(
                            child: CustomText(
                              text: 'Goals',
                              fontsize: 14.sp,
                              textColor: _selectedIndex == 1
                                  ? Colors.white
                                  :Color.fromRGBO(182, 182, 182, 1),
                              fontWeight: _selectedIndex == 1
                                  ? FontWeight.w700
                                  : FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    /// Divider
                    VerticalDivider(
                      thickness: 2, // Width of the line
                      color: buttonColor2, // Color of the line
                      width: 2.w, // Space around the divider
                      indent: 20, // Space above the divider
                      endIndent: 20, // Space below the divider
                    ),

                    /// Resources Tab
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedIndex = 2;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            width: 100.81.w,
                            height: 30.34.h,
                            decoration: BoxDecoration(
                              color: _selectedIndex == 2
                                  ? Colors.cyan
                                  : Colors.transparent,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: CustomText(
                                text: 'Resources',
                                fontsize: 14.sp,
                                textColor: _selectedIndex == 2
                                    ? Colors.white
                                    : Color.fromRGBO(182, 182, 182, 1),
                                fontWeight: _selectedIndex == 2
                                    ? FontWeight.w700
                                    : FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10.08.h),

              if (_selectedIndex == 0)

                /// My Courses Screen
                Column(
                  children: [
                    /// Course Container1
                    Container(
                      width: 310.w,
                      height: 115.h,
                      decoration: BoxDecoration(
                        color: tapColor,
                        // Your tapColor can be defined or replaced here
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: Color.fromRGBO(0, 28, 49, 1),
                          // Dark blue color for the border
                          width: 1.w, // Width of the border
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 91.01.w,
                              height: 91.01.h,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/my_courses_tab_image1.png')),
                            ),
                            SizedBox(width: 9.62.w),
                            Padding(
                              padding:  EdgeInsets.symmetric(vertical: 8.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 146.w,
                                    height: 55.h,
                                    child: CustomText(
                                      text:
                                      "UX Research in Digital Product Design: Master Class",
                                      textColor: whiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontsize: 11.sp,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  SizedBox(
                                    width: 190.w,
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: "22 of 33 chapters",
                                          textColor: buttonColor,
                                          fontWeight: FontWeight.w700,
                                          fontsize: 11.sp,
                                        ),
                                        LoadingPercentageCircle(
                                          percentage: 15,
                                          // Example percentage
                                          size: 25,
                                          // Example size
                                          strokeWidth: 4,
                                          // Example stroke width
                                          backgroundColor: mainTextColor!,
                                          progressColor: buttonColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 7.h),

                    /// Course Container2
                    Container(
                      width: 310.w,
                      height: 115.h,
                      decoration: BoxDecoration(
                        color: tapColor,
                        // Your tapColor can be defined or replaced here
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: Color.fromRGBO(0, 28, 49, 1),
                          // Dark blue color for the border
                          width: 1.w, // Width of the border
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 91.01.w,
                              height: 91.01.h,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/my_courses_tab_image2.png')),
                            ),
                            SizedBox(width: 9.62.w),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 146.w,
                                    height: 56.h,
                                    child: CustomText(
                                      text:
                                          "UX Research in Digital Product Design: Master Class",
                                      textColor: whiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontsize: 11.sp,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  SizedBox(
                                    width: 190.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CustomText(
                                          text: "10 of 31 chapters",
                                          textColor: buttonColor,
                                          fontWeight: FontWeight.w700,
                                          fontsize: 11.sp,
                                        ),
                                        LoadingPercentageCircle(
                                          percentage: 15,
                                          // Example percentage
                                          size: 25,
                                          // Example size
                                          strokeWidth: 4,
                                          // Example stroke width
                                          backgroundColor: mainTextColor!,
                                          progressColor: buttonColor,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

              if (_selectedIndex == 1)

                /// Set Goals Text and Image
                Column(
                  children: [
                    /// Set Goals Image and Text
                    GestureDetector(
                      onTap: (){
                        Get.to(() => GoalSettings());
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 27.w),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Container(
                            width: 93.w,
                            height: 28.h,
                            decoration: BoxDecoration(
                              color: tapColor,
                              // Your tapColor can be defined or replaced here
                              borderRadius: BorderRadius.circular(6.r),
                              border: Border.all(
                                color: Color.fromRGBO(0, 28, 49, 1),
                                // Dark blue color for the border
                                width: 1.w, // Width of the border
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image(
                                    image: AssetImage(
                                        'assets/images/set_goals_icon.png')),
                                CustomText(
                                    text: 'Set Goals',
                                    textColor: buttonColor,
                                    fontsize: 11.sp,
                                    fontWeight: FontWeight.w600),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    /// Goal Progress Container
                    Container(
                      width: 310.w,
                      height: 125.h,
                      decoration: BoxDecoration(
                        color: tapColor,
                        // Your tapColor can be defined or replaced here
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: Color.fromRGBO(0, 28, 49, 1),
                          // Dark blue color for the border
                          width: 1.w, // Width of the border
                        ),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 4.w),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 91.01.w,
                              height: 91.01.h,
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/my_courses_tab_image1.png')),
                            ),
                            SizedBox(width: 6.w),
                            Padding(
                              padding:  EdgeInsets.symmetric(vertical: 12.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 184.w,
                                    height: 42.h,
                                    child: CustomText(
                                      text:
                                          "UX Research in Digital Product Design: Master Class",
                                      textColor: whiteColor,
                                      fontWeight: FontWeight.w600,
                                      fontsize: 11.sp,
                                    ),
                                  ),
                                  SizedBox(height: 5.h),
                                  SizedBox(
                                    width: 200.w,
                                    // height: 8.h,
                                    child: Row(
                                      children: [
                                        CustomText(
                                          text: "Goal Progress",
                                          textColor: buttonColor,
                                          fontWeight: FontWeight.w700,
                                          fontsize: 12.sp,
                                        ),
                                        SizedBox(width: 19.w),

                                        /// Quiz Loading progress
                                        Column(
                                          children: [
                                            LoadingPercentageCircle(
                                              percentage: 15,
                                              // Example percentage
                                              size: 25,
                                              // Example size
                                              strokeWidth: 4,
                                              // Example stroke width
                                              backgroundColor: mainTextColor!,
                                              progressColor: buttonColor,
                                            ),
                                            SizedBox(height: 0.5.h),
                                            CustomText(
                                              text: "Quiz",
                                              textColor: buttonColor,
                                              fontWeight: FontWeight.w700,
                                              fontsize: 9.sp,
                                            ),
                                          ],
                                        ),
                                        SizedBox(width: 15.w),

                                        /// Chapters Loading progress
                                        Column(
                                          children: [
                                            LoadingPercentageCircle(
                                              percentage: 15,
                                              // Example percentage
                                              size: 25,
                                              // Example size
                                              strokeWidth: 4,
                                              // Example stroke width
                                              backgroundColor:mainTextColor!,
                                              progressColor: buttonColor2,
                                            ),
                                            SizedBox(height: 0.5.h),
                                            CustomText(
                                              text: "Chapters",
                                              textColor: buttonColor2,
                                              fontWeight: FontWeight.w700,
                                              fontsize: 9.sp,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 36.h),
              if (_selectedIndex == 2)
                Column(
                  children: [
                    /// UX Research ZIP Container
                    Container(
                      width: 311.w,
                      height: 73.23.h,
                      decoration: BoxDecoration(
                        color: tapColor,
                        // Your tapColor can be defined or replaced here
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: Color.fromRGBO(12, 192, 223, 1),
                          // Dark blue color for the border
                          width: 1.w, // Width of the border
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal:18.39.w ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                /// Zip File Images
                                SizedBox(
                                  width: 38.04.w,
                                  height: 38.04.h,
                                  child: Stack(children: [
                                    Image(
                                        image: AssetImage(
                                            'assets/images/ux_research_file.png')),
                                    Positioned(
                                        bottom: 12,
                                        right: 20,
                                        child: Image(image: AssetImage('assets/images/ZIP.png'))),
                                  ]
                                  ),
                                ),
                                /// Zip File Text
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical:11.21 ),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "UX Research.zip",
                                        textColor: whiteColor,
                                        fontWeight: FontWeight.w700,
                                        fontsize: 13.31.sp,
                                      ),
                                      CustomText(
                                        text: "Size: 10 MB",
                                        textColor: whiteColor,
                                        fontWeight: FontWeight.w600,
                                        fontsize: 10.41.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: (){},
                                child: Image(image: AssetImage('assets/images/download_icon.png'))),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.22.h),
                    /// Coursar  Container
                    Container(
                      width: 311.w,
                      height: 73.23.h,
                      decoration: BoxDecoration(
                        color: tapColor,
                        // Your tapColor can be defined or replaced here
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: Color.fromRGBO(12, 192, 223, 1),
                          // Dark blue color for the border
                          width: 1.w, // Width of the border
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal:18.39.w ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                /// Courses landing Images
                                SizedBox(
                                  width: 38.04.w,
                                  height: 38.04.h,
                                  child: Stack(children: [
                                    Image(
                                        image: AssetImage(
                                            'assets/images/ux_research_file.png')),
                                    Positioned(
                                        bottom: 8,
                                        right: 20,
                                        child: Image(image: AssetImage('assets/images/file_image.png'))),
                                  ]
                                  ),
                                ),
                                /// Courser landing Text
                                Padding(
                                  padding:  EdgeInsets.symmetric(vertical:11.21.h ),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Courser_LandingPage.fig",
                                        textColor: whiteColor,
                                        fontWeight: FontWeight.w700,
                                        fontsize: 13.31.sp,
                                      ),
                                      CustomText(
                                        text: "Size: 5.2 MB",
                                        textColor: whiteColor,
                                        fontWeight: FontWeight.w600,
                                        fontsize: 10.41.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                                onTap: (){},
                                child: Image(image: AssetImage('assets/images/download_icon.png'))),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15.22.h),
                    /// Resources Container
                    Container(
                      width: 311.w,
                      height: 73.23.h,
                      decoration: BoxDecoration(
                        color: tapColor,
                        // Your tapColor can be defined or replaced here
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          color: Color.fromRGBO(12, 192, 223, 1),
                          // Dark blue color for the border
                          width: 1.w, // Width of the border
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal:18.39.w ),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                /// Courser_Dashboard.fig File Images
                                SizedBox(
                                  width: 38.04.w,
                                  height: 38.04.h,
                                  child: Stack(children: [
                                    Image(
                                        image: AssetImage(
                                            'assets/images/ux_research_file.png')),
                                    Positioned(
                                        bottom: 8,
                                        right: 20,
                                        child: Image(image: AssetImage('assets/images/file_image.png'))),
                                  ]
                                  ),
                                ),
                                /// Courser_Dashboard.fig Text
                                Padding(
                                  padding:  EdgeInsets.symmetric(vertical:11.21.h ),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(
                                        text: "Courser_Dashboard.fig",
                                        textColor: whiteColor,
                                        fontWeight: FontWeight.w700,
                                        fontsize: 13.31.sp,
                                      ),
                                      CustomText(
                                        text: "Size: 5.2 MB",
                                        textColor: whiteColor,
                                        fontWeight: FontWeight.w600,
                                        fontsize: 11.41.sp,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                                onTap: (){},
                                child: Image(image: AssetImage('assets/images/download_icon.png'))),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              SizedBox(height: 100.h),

            ],
          ),
        ),
    );
  }
}
