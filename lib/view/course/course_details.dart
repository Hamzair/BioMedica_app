import 'package:bio_medica/controller/subscription_controller.dart';
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
  final bool isPremium;

  CourseDetailScreen({required this.title, required this.image , this.isPremium = false});

  @override
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}



class _CourseDetailScreenState extends State<CourseDetailScreen> {
  int _selectedIndex = 0;


  SubscriptionService service = Get.find<SubscriptionService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      floatingActionButton:           Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 22.w,),
          Image.asset('assets/images/favIcon.png',
              height: 50.h, width: 50.w),
          SizedBox(width: 11.w),
          Container(
            height:53.h ,


            width: 249.w,
            child: ElevatedButton(
              onPressed: () {

                if(service.isPremium.value){
                  Get.to(() => CourseContent(
                      title: widget.title,
                      image: widget.image));
                }else{
                  if(widget.isPremium){
                    Get.snackbar("title", "message");
                  }else{
                    Get.to(() => CourseContent(
                        title: widget.title,
                        image: widget.image));
                  }
                }


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
                textColor: whiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),

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
              )
            ],
          ),
          SizedBox(height: 20.h,),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25.0.w,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
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
                    textColor: whiteColor,
                    fontWeight: FontWeight.w600,
                    fontsize: 17.sp,
                  ),
                  SizedBox(height: 18.h),

                  Container(
                    height: 38.h,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 28, 49, 1),
                      borderRadius:
                          BorderRadius.circular(11.38.r), // Rounded corners
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
                                  text: 'About',
                                  fontsize: 13.sp,
                                  textColor: whiteColor,
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
                              decoration: BoxDecoration(
                                color: _selectedIndex == 1
                                    ? Colors.cyan
                                    : Colors.transparent,
                                borderRadius: BorderRadius.circular(7.r),
                              ),
                              child: Center(
                                child: CustomText(
                                  text: 'Chapters',
                                  fontsize: 13.sp,
                                  textColor: whiteColor,
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
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text:
                                'Transformative journey through our comprehensive course, '
                                '‘Master Digital Product Design: UX Research & UI Design’. Created especially for budding UX/UI designers, '
                                'this immersive program invites you to explore the intricate art of crafting exceptional digital experiences....',
                            fontWeight: FontWeight.w500,
                            textColor: whiteColor,
                          ),
                          SizedBox(height: 5.h),
                          Text(
                            'Read more',
                            style: TextStyle(color: buttonColor2),
                          ),
                          SizedBox(height: 15.h),
                          CustomText(
                              text: 'Key points',
                              fontsize: 18.sp,
                              fontWeight: FontWeight.bold,
                              textColor: whiteColor),
                          SizedBox(height: 15.17.h),
                          ListTile(
                            minTileHeight: 0,
                            minVerticalPadding: 8,
                            leading: Icon(Icons.check_circle,
                                color: Colors.cyan),
                            title: CustomText(
                              text: 'Critical Thinking',
                              textColor: whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.zero,
                            minLeadingWidth: 0,
                          ),
                          ListTile(
                            minTileHeight: 0,
                            minVerticalPadding: 0,
                            leading: Icon(Icons.check_circle,
                                color: Colors.cyan),
                            title: CustomText(
                              text: 'User Experience Research',
                              textColor: whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.zero,
                            minLeadingWidth: 0,
                          ),
                          ListTile(
                            minTileHeight: 0,
                            minVerticalPadding: 8,
                            leading: Icon(Icons.check_circle,
                                color: Colors.cyan),
                            title: CustomText(
                              text: 'User Interface Design',
                              textColor: whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.zero,
                            minLeadingWidth: 0,
                          ),
                          ListTile(
                            minTileHeight: 0,
                            minVerticalPadding: 0,
                            leading: Icon(Icons.check_circle,
                                color: Colors.cyan),
                            title: CustomText(
                              text: 'Usability Testing',
                              textColor: whiteColor,
                              fontWeight: FontWeight.w500,
                            ),
                            contentPadding: EdgeInsets.zero,
                            minLeadingWidth: 0,
                          ),

                          SizedBox(
                              height: 40.h),
                          SizedBox(height: 30.h,)

                        ],
                      ),
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
                        Container(
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

                        SizedBox(height: 100.h),

                      ],
                    ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h,)
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
