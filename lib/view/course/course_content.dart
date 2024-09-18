import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/course/chapters.dart';
import 'package:bio_medica/view/course/quiz.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CourseContent extends StatefulWidget {
  final String title;
  final String image;
  CourseContent({required this.title, required this.image});
  @override
  _CourseContentState createState() => _CourseContentState();
}

class _CourseContentState extends State<CourseContent> {
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
                 widget.image, // Replace with actual image
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
                      child: Image.asset('assets/images/back_icon.png',height: 31.h,width: 31.w,)),)
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
                    text:
                       widget.title,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontsize: 22.sp,
                  ),
                  SizedBox(height: 20.h),

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF001A2E).withOpacity(0.4),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color: _selectedIndex == 0
                                    ? Colors.cyan
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Center(
                                child: CustomText(
                                  text: 'Overview',
                                  fontsize: 12.sp,
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
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color: _selectedIndex == 1
                                    ? Colors.cyan
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10.r),
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
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedIndex = 2;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                color: _selectedIndex == 2
                                    ? Colors.cyan
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Center(
                                child: CustomText(
                                  text: 'Quiz',
                                  fontsize: 13.sp,
                                  textColor: Colors.white,
                                  fontWeight: _selectedIndex == 2
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
                                _selectedIndex = 3;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                color: _selectedIndex == 3
                                    ? Colors.cyan
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Center(
                                child: CustomText(
                                  text: 'Resources',
                                  fontsize: 13.sp,
                                  textColor: Colors.white,
                                  fontWeight: _selectedIndex == 3
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

                  if (_selectedIndex == 0)
                    // About Section

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
                          SizedBox(height: 5.h),


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
                            minVerticalPadding: 8,
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
                            minVerticalPadding: 0,
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
                            minVerticalPadding: 8,
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
                            minVerticalPadding: 0,
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
                      ),

                  if (_selectedIndex == 1)
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomText(
                              text: 'Course Content',
                              textColor: whiteColor,
                              fontsize: 15.sp,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Color(0xFF001A2E).withOpacity(0.4),
                          ),
                          child: ExpansionTile(
                            title: CustomText(
                              text: 'Introduction',
                              fontWeight: FontWeight.w600,
                              textColor: whiteColor,
                              fontsize: 13.sp,
                            ),
                            collapsedIconColor: whiteColor,
                          ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: Color(0xFF001A2E).withOpacity(0.4),
                          ),
                          child: Theme(
                            data: Theme.of(context).copyWith(
                              dividerColor: Colors.transparent,
                            ),
                            child: ExpansionTile(children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset('assets/images/sbook.png',height: 17.h,),
                                            SizedBox(width: 10.h,),
                                            CustomText(text: 'Overview', textColor:Colors.white, fontWeight: FontWeight.w600,fontsize: 11.sp,),


                                          ],
                                        ),
                                        SizedBox(height: 10.h,),

                                      Row(
                                        children: [
                                          Image.asset('assets/images/sbook.png',height: 17.h,),
                                          SizedBox(width: 10.h,),
                                          CustomText(text: 'Hypertension', textColor:Colors.white, fontWeight: FontWeight.w600,fontsize: 11.sp,),
                                        ],
                                      ),
                                      SizedBox(height: 10.h,),
                                      Row(
                                        children: [
                                          Image.asset('assets/images/sbook.png',height: 17.h,),
                                          SizedBox(width: 10.h,),
                                          CustomText(text: 'Wrong Rules', textColor:Colors.white, fontWeight: FontWeight.w600,fontsize: 11.sp,),


                                        ],
                                      ),
                                      SizedBox(height: 10.h,),
                                      Row(
                                        children: [
                                          Image.asset('assets/images/sbook.png',height: 17.h,),
                                          SizedBox(width: 10.h,),
                                          CustomText(text: 'Summary', textColor:Colors.white, fontWeight: FontWeight.w600,fontsize: 11.sp,),


                                        ],
                                      ),
                                      SizedBox(height: 10.h,),
                                      Row(
                                        children: [
                                          Image.asset('assets/images/sbook.png',height: 17.h,),
                                          SizedBox(width: 10.h,),
                                          CustomText(text: 'Quiz', textColor:Colors.white, fontWeight: FontWeight.w600,fontsize: 11.sp,),


                                        ],
                                      ),
                                        SizedBox(height: 15.h)


                                    ],),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                      Row(
                                        children: [
                                          Text('03:23',style: TextStyle(color: Colors.white,fontSize: 11.sp),
                                         ),
                                          SizedBox(width: 10.h,),
                                          Image.asset('assets/images/check.png',height: 13.h,)
                                        ],
                                      ),
                                        SizedBox(height: 10.h,),
                                        Row(
                                          children: [
                                            Text('03:23',style: TextStyle(color: Colors.white,fontSize: 11.sp),
                                            ),
                                            SizedBox(width: 10.h,),
                                            Image.asset('assets/images/check.png',height: 13.h,)
                                          ],
                                        ),
                                        SizedBox(height: 10.h,),
                                      Text('03:23',style: TextStyle(color: Colors.white,fontSize: 11.sp),),
                                        SizedBox(height: 10.h,),
                                      Text('03:23',style: TextStyle(color: Colors.white,fontSize: 11.sp),),
                                        SizedBox(height: 10.h,),
                                      GestureDetector(
                                          onTap: (){
                                            Get.to(()=> QuizPage());
                                          },
                                          child: CustomText(text: 'Start Quiz',textColor: buttonColor,fontWeight: FontWeight.w600,fontsize: 11.sp,)),
                                      SizedBox(height: 15.h
                                        ,)
                                      
                                    ],),

                                   


                                  ],
                                ),
                              )
                            ],
                              title: CustomText(
                                text: 'What is Design',
                                fontWeight: FontWeight.w600,
                                textColor: whiteColor,
                                fontsize: 13.sp,
                              ),
                              collapsedIconColor: whiteColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 100,)
                      ],
                    ),

                  if (_selectedIndex == 2)
                    Center(
                      child: CustomText(
                          text: ' No Quiz',
                          textColor: whiteColor,

                          textAlign: TextAlign.center,
                          fontWeight: FontWeight.w500),
                    ),
                  if (_selectedIndex == 3)
                    Center(
                      child: CustomText(
                          text: 'No Resources',
                          textColor: whiteColor,
                          textAlign: TextAlign.center,

                          fontWeight: FontWeight.w500),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
          height: 53.61.h,
          child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/favIcon.png',height: 50.h,width: 50.w,),
              SizedBox(width: 11.w,),
              SizedBox(
                width: 249.w,
                //  height: 53.h,

                child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => LessonScreen());
                  },
                  style: ElevatedButton.styleFrom(

                    padding: EdgeInsets.symmetric(vertical: 13.h,horizontal: 8.w
                    ),
                    backgroundColor: Colors.cyan,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.r
                      ),
                    ),
                  ),
                  child: CustomText(
                    text:     'Start Now',
                    fontsize: 18.sp, textColor: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
