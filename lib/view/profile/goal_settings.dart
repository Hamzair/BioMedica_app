import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widget/custom_button.dart';

class GoalSettings extends StatefulWidget {
  const GoalSettings({super.key});

  @override
  _GoalSettingsState createState() => _GoalSettingsState();
}

class _GoalSettingsState extends State<GoalSettings> {
  // List of courses for the dropdown
  final List<String> _courses = ['Course 1', 'Course 2', 'Course 3'];
  // Set default selected value to "Course 1"
  String? _selectedCourse = 'Course 1';

  // Counter variables for Quiz Points and Chapters
  int quizPoints = 20;
  int secondquizPoints = 20;
  int chapters = 14;

  // Create a GlobalKey for the dropdown button
  final GlobalKey _dropdownKey = GlobalKey();

  void _openDropdown() {
    // Implementation of dropdown
  }

  // Increment and Decrement functions for Quiz Points
  void incrementQuizPoints() {
    setState(() {
      quizPoints++;
    });
  }

  void decrementQuizPoints() {
    setState(() {
      if (quizPoints > 0) {
        quizPoints--;
      }
    });
  }  // Increment and Decrement functions for Quiz Points
  void secondincrementQuizPoints() {
    setState(() {
      secondquizPoints++;
    });
  }

  void seconddecrementQuizPoints() {
    setState(() {
      if (secondquizPoints > 0) {
        secondquizPoints--;
      }
    });
  }

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
                bottomRight: Radius.circular(13.r))),
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 45.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: SizedBox(
                            height: 38.h,
                            width: 38.h,
                            child: Image.asset('assets/images/back_icon.png',fit: BoxFit.fill,),
                          ),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                      CustomText(
                        text: "Goal Setting",
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
      ),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              SizedBox(height: 87.h),
              /// DropDown Field
              SizedBox(
                width: 311.w,
                height: 50.h,
                child: DropdownButtonFormField<String>(
                  key: _dropdownKey,
                  value: _selectedCourse,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedCourse = newValue;
                    });
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: secondaryColor, // Keep the fill color unchanged
                    contentPadding: EdgeInsets.symmetric(horizontal: 12.w),
                    prefixIcon: Padding(
                      padding: EdgeInsets.only(left: 13.w),
                      child: Image.asset(
                        'assets/images/coursesIcon.png',
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_sharp,color: Color.fromRGBO(0, 28, 49, 1,)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.31.r),
                      borderSide:
                      BorderSide(color: Color.fromRGBO(0, 28, 49, 1)), // Border color for default state
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.31.r),
                      borderSide:
                      BorderSide(color: Color.fromRGBO(0, 28, 49, 1)), // Border color when enabled
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.31.r),
                      borderSide:
                      BorderSide(color: Color.fromRGBO(0, 28, 49, 1)), // Border color when focused
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.31.r),
                      borderSide:
                      BorderSide(color: Color.fromRGBO(0, 28, 49, 1)), // Border color when error occurs
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(13.31.r),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(0, 28, 49, 1)), // Border color when focused with error
                    ),
                  ),
                  icon: SizedBox.shrink(), // This removes the default dropdown arrow
                  dropdownColor: secondaryColor, // Set the dropdown background color to light blue
                  items: _courses.map((String course) {
                    return DropdownMenuItem<String>(
                      value: course,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.77.w), // Ensure padding is correct
                        child: CustomText(
                          text: course,
                          textColor: Color.fromRGBO(19, 64, 100, 1),
                          fontsize: 14.65.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 36.h),
              /// Text Enter Goals
              CustomText(
                text: 'Enter Goals',
                textColor: buttonColor,
                fontWeight: FontWeight.w700,
                fontsize: 21.sp,
              ),
              SizedBox(height: 14.h),
              /// Container with Quiz Points and Increment/Decrement Buttons
              Container(
                height: 69.h,
                width: 309.w,
                decoration: BoxDecoration(
                  color: tapColor,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: Color.fromRGBO(0, 28, 49, 1),
                    width: 1.w,
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical:12.h,horizontal: 13.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Quiz Points',
                            textColor: whiteColor,
                            fontWeight: FontWeight.w700,
                            fontsize: 16.sp,
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: 'Total achievable:',
                                textColor: whiteColor,
                                fontWeight: FontWeight.w500,
                                fontsize: 12.sp,
                              ),
                              CustomText(
                                text: ' 200',
                                textColor: buttonColor2,
                                fontWeight: FontWeight.w500,
                                fontsize: 12.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Centers the whole row
                        children: [
                          // Decrement Button with Border
                          Container(
                            padding: EdgeInsets.all(1), // Adds space for the border
                            decoration: BoxDecoration(
                              border: Border.all(color: Color.fromRGBO(0, 28, 49, 1), width: 1.w), // Dark blue border
                              shape: BoxShape.circle, // Keeps the circular shape
                            ),
                            child: CircleAvatar(
                              radius: 13.0.r,
                              backgroundColor: Color.fromRGBO(19, 64, 100, 1),
                              child: IconButton(
                                onPressed: decrementQuizPoints,
                                icon: Icon(Icons.remove, color: Color.fromRGBO(255, 255, 255, 1), size: 16.0),
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                              ),
                            ),
                          ),
                          SizedBox(width: 2.w),

                          // Center Text Container with Border and Rounded Corners
                          Container(
                            height: 35.h,
                            width: 58.w,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(19, 64, 100, 1),
                              border: Border.all(color: Color.fromRGBO(0, 28, 49, 1), width: 1.w), // Dark blue border
                              borderRadius: BorderRadius.circular(8.r), // Adjust radius as needed
                            ),
                            alignment: Alignment.center, // Center the text within the Container
                            child: Text(
                              '$quizPoints',
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(width: 2.w),

                          // Increment Button with Border
                          Container(
                            padding: EdgeInsets.all(1), // Adds space for the border
                            decoration: BoxDecoration(
                              border: Border.all(color: Color.fromRGBO(0, 28, 49, 1), width: 1.w), // Dark blue border
                              shape: BoxShape.circle, // Keeps the circular shape
                            ),
                            child: CircleAvatar(
                              radius: 13.0.r,
                              backgroundColor: Color.fromRGBO(19, 64, 100, 1),
                              child: IconButton(
                                onPressed: incrementQuizPoints,
                                icon: Icon(Icons.add, color: Color.fromRGBO(255, 255, 255, 1), size: 16.0),
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                              ),
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
              SizedBox(height: 9.h),
              /// Container with Chapters Text and Increment/Decrement Buttons
              Container(
                height: 69.h,
                width: 309.w,
                decoration: BoxDecoration(
                  color: tapColor,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: Color.fromRGBO(0, 28, 49, 1),
                    width: 1.w,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:12,horizontal: 13),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: 'Quiz Points',
                            textColor: whiteColor,
                            fontWeight: FontWeight.w700,
                            fontsize: 16.sp,
                          ),
                          Row(
                            children: [
                              CustomText(
                                text: 'Total achievable:',
                                textColor: whiteColor,
                                fontWeight: FontWeight.w500,
                                fontsize: 12.sp,
                              ),
                              CustomText(
                                text: ' 200',
                                textColor: buttonColor2,
                                fontWeight: FontWeight.w500,
                                fontsize: 12.sp,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Centers the whole row
                        children: [
                          // Decrement Button with Border
                          Container(
                            padding: EdgeInsets.all(1), // Adds space for the border
                            decoration: BoxDecoration(
                              border: Border.all(color: Color.fromRGBO(0, 28, 49, 1), width: 1.w), // Dark blue border
                              shape: BoxShape.circle, // Keeps the circular shape
                            ),
                            child: CircleAvatar(
                              radius: 13.0.r,
                              backgroundColor: Color.fromRGBO(19, 64, 100, 1),
                              child: IconButton(
                                onPressed: seconddecrementQuizPoints,
                                icon: Icon(Icons.remove, color: Color.fromRGBO(255, 255, 255, 1), size: 16.0),
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                              ),
                            ),
                          ),
                          SizedBox(width: 2.w),

                          // Center Text Container with Border and Rounded Corners
                          Container(
                            height: 35.h,
                            width: 58.w,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(19, 64, 100, 1),
                              border: Border.all(color: Color.fromRGBO(0, 28, 49, 1), width: 1), // Dark blue border
                              borderRadius: BorderRadius.circular(8.r), // Adjust radius as needed
                            ),
                            alignment: Alignment.center, // Center the text within the Container
                            child: Text(
                              '$secondquizPoints',
                              style: TextStyle(
                                color: whiteColor,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(width: 2.w),

                          // Increment Button with Border
                          Container(
                            padding: EdgeInsets.all(1), // Adds space for the border
                            decoration: BoxDecoration(
                              border: Border.all(color: Color.fromRGBO(0, 28, 49, 1), width: 1.w), // Dark blue border
                              shape: BoxShape.circle, // Keeps the circular shape
                            ),
                            child: CircleAvatar(
                              radius: 13.0.r,
                              backgroundColor: Color.fromRGBO(19, 64, 100, 1),
                              child: IconButton(
                                onPressed: secondincrementQuizPoints,
                                icon: Icon(Icons.add, color: Color.fromRGBO(255, 255, 255, 1), size: 16.0),
                                padding: EdgeInsets.zero,
                                constraints: BoxConstraints(),
                              ),
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
              SizedBox(height:68.h),
              /// Button Save Goals
              SizedBox(
                  width:311.w ,
                  height: 51.h,
                  child: CustomButton(
                    title: 'Save Goals',
                    textSize: 19.sp,
                    onTap: (){},color: buttonColor,)),
            ],
          ),
        ),
      ),
    );
  }
}
