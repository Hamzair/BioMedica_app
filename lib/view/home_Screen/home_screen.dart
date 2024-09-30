import 'dart:ui';
import 'package:bio_medica/controller/nav_bar_controller.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/view/course/course_details.dart';
import 'package:bio_medica/view/homeOptions/DeviceLibrary/deviceLibrary.dart';
import 'package:bio_medica/view/home_Screen/article_detail.dart';
import 'package:bio_medica/widget/custom_search.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/widget/cutom_homeCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/subscription_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, });

  final NavBarController navBarController = Get.put(NavBarController());

  final SubscriptionService subscriptionService =
  Get.find<SubscriptionService>();

  final List<Map<String, dynamic>> gridItems = [
    // !  Grid Item 0
    {
      'image': AppImages.DeviceLibrary,
      'title': 'Device\nlibrary',
      'page': DeviceLibrary()
    },
    // !  Grid Item 1
    {
      'image': AppImages.Therapeutic,
      'title': 'Therapeutic\nDevices',
      'page': CourseDetailScreen(
        title: 'Therapeutic Devices',
        image: 'assets/images/course01.png',
      )
    },
    // !  Grid Item 2
    {
      'image': AppImages.ClinicalEngineering,
      'title': 'Clinical\nEngineering',
      'page': CourseDetailScreen(
        title: 'Clinical Engineering',
        image: 'assets/images/course01.png',
      )
    },
    // !  Grid Item 3
    {
      'image': AppImages.HumanPhyscology,
      'title': 'Human\nPhysiology',
      'page': CourseDetailScreen(
        title: 'Human Physiology',
        image: 'assets/images/course01.png',
      )
    },
    // !  Grid Item 4
    {
      'image': AppImages.HumanAnatomy,
      'title': 'Human\nAnatomy ',
      'page': CourseDetailScreen(
        title: 'Human Anatomy',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // !  Grid Item 5
    {
      'image': AppImages.BioMechanics,
      'title': 'Bio-\nmechanics',
      'page': CourseDetailScreen(
        title: 'Bio-mechanics',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // !  Grid Item 6
    {
      'image': AppImages.MedicalImaging,
      'title': 'Medical \nImaging',
      'page': CourseDetailScreen(
        title: 'Medical Imaging',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // !  Grid Item 7
    {
      'image': AppImages.AdvancedDesign,
      'title': 'Device Design',
      'page': CourseDetailScreen(
        title: 'Device Design',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true,
    },
    // !  Grid Item 8
    {
      'image': AppImages.BioMaterials,
      'title': 'Biomaterials',
      'page': CourseDetailScreen(
        title: 'Bio-materials',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // !  Grid Item 9
    {
      'image': AppImages.ProstheicDevice,
      'title': 'Prosthetic\nDevices',
      'page': CourseDetailScreen(
        title: 'Prosthetic Devices',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // ?  New courses
    // !  Grid Item 10
    {
      'image': AppImages.BME,
      'title': 'Intro to\nBME',
      'page': CourseDetailScreen(
        title: 'Intro toBME',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // !  Grid Item 11
    {
      'image': AppImages.Chemistry,
      'title': 'Chemistry of life',
      'page': CourseDetailScreen(
        title: 'Chemistry of life',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // !  Grid Item 12
    {
      'image': AppImages.Biology,
      'title': 'Intro into biology',
      'page': CourseDetailScreen(
        title: 'Intro into biology',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // !  Grid Item 13
    {
      'image': AppImages.Modelling,
      'title': 'Modeling and simulation',
      'page': CourseDetailScreen(
        title: 'Modeling and simulation',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // !  Grid Item 14
    {
      'image': AppImages.Signals,
      'title': 'Signals and system',
      'page': CourseDetailScreen(
        title: 'Signals and system',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // !  Grid Item 15
    {
      'image': AppImages.Phys,
      'title': 'Physiological signals & instrumentation',
      'page': CourseDetailScreen(
        title: 'Physiological signals\n & instrumentation',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // !  Grid Item 16
    {
      'image': AppImages.MRI,
      'title': 'MRI',
      'page': CourseDetailScreen(
        title: 'MRI',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // !  Grid Item 17
    {
      'image': AppImages.Cell,
      'title': 'Cell & Tissue engineering',
      'page': CourseDetailScreen(
        title: 'Cell & Tissue engineering',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // !  Grid Item 18
    {
      'image': AppImages.Rehab,
      'title': 'Rehabilitation engineering',
      'page': CourseDetailScreen(
        title: 'Rehabilitation engineering',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // !  Grid Item 19
    {
      'image': AppImages.Bio_nan,
      'title': 'Bio-nanotechnology',
      'page': CourseDetailScreen(
        title: 'Bio-nanotechnology',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // !  Grid Item 20
    {
      'image': AppImages.MedicalIm,
      'title': 'Medical imaging physics',
      'page': CourseDetailScreen(
        title: 'Medical imaging physics',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // !  Grid Item 21
    {
      'image': AppImages.Biostat,
      'title': 'Biostatistics',
      'page': CourseDetailScreen(
        title: 'Biostatistics',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },
    // !  Grid Item 22
    {
      'image': AppImages.Neuro,
      'title': 'Neuro-engineering',
      'page': CourseDetailScreen(
        title: 'Neuro-engineering',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true
    },



  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var rows = [
      // Create a list of lists for each row in the grid
      [
        // First row
        gridItems[0],
        gridItems[1],
        gridItems[2],
        gridItems[3],
        gridItems[4],
        gridItems[5],
        gridItems[6],
        gridItems[7],

      ],
      [
        // Second row
        gridItems[8],
        gridItems[9],
        gridItems[10],
        gridItems[11],
        gridItems[12],
        gridItems[13],
        gridItems[14],
        gridItems[15],
      ],
      [
        // Third row
        gridItems[16],
        gridItems[17],
        gridItems[18],
        gridItems[19],
        gridItems[20],
        gridItems[21],
        gridItems[22],
     
      ],

    ];
    return Scaffold(
      // drawer:  AppDrawer(),
      // key: navBarController.scaffoldKey,
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.076),
        child: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(13.r),
                  bottomRight: Radius.circular(13.r))),
          centerTitle: false,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SizedBox(
                    //   width: 12.w,
                    // ),
                    Container(
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      width:
                      MediaQuery.of(context).size.width < 360 ? 30.w : 38.w,
                      height:
                      MediaQuery.of(context).size.width < 360 ? 30.h : 38.h,
                      child: GestureDetector(
                        onTap: () {
                          // Open the drawer using the scaffold key
                          navBarController.openDrawer(context);
                        },
                        child: Image(
                          image: AssetImage(
                              'assets/images/left_side_bar_navigation_Icon.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Container(
                      width: 237.w,
                      child: CustomSearch(),
                    ),
                    // Flexible(
                    //   child: CustomSearch(),
                    // ),
                    SizedBox(
                      width: 12.w,
                    ),
                    GestureDetector(
                      onTap: () {
                        //   Get.offAll(()=>AppNavBar());
                      },
                      child: Container(
                        width: 35.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                            color: Darkcontainer,
                            borderRadius: BorderRadius.circular(13.r)),
                        child: Icon(
                          Icons.notifications,
                          color: Color(0xffBDD0EA),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          backgroundColor: secondaryColor,
        ),
      ),

      body: GestureDetector(
        onTap: () {
          FocusScope.of(context)
              .unfocus(); // Close the keyboard when tapping outside
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 7.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(
                      text: 'Featured Courses',
                      textColor: buttonColor,
                      fontWeight: FontWeight.w500,
                      fontsize: 17.sp,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: 'Scroll for more',
                          textColor: buttonColor2,
                          fontWeight: FontWeight.w500,
                          fontsize: 11.sp,
                        ),
                        SizedBox(width: 4.h),
                        Image.asset(
                          'assets/images/arrow_forward.png',
                          height: 17.h,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 5.h),
                // Grid View for home options
                GetBuilder<SubscriptionService>(
                  builder: (subscriptionService) {
                    double getAppBarHeight(BuildContext context) {
                      double screenHeight = MediaQuery.of(context).size.height;
                      print(screenHeight);

                      // Define height based on screen size
                      if (screenHeight < 600) {
                        return screenHeight /
                            4; // Example height for small screens
                      } else if (screenHeight == 667) {
                        return screenHeight /
                            2.15; // Default height for larger screens
                      } else if (screenHeight == 716.6666666666666) {
                        return screenHeight /
                            2.5; // Default height for larger screens
                      } else {
                        return screenHeight /
                            2.6; // Default height for larger screens
                      }
                    }

                    return Column(
                      children: List.generate(rows.length, (rowIndex) {
                        return Container(
                          padding: EdgeInsets.zero,
                          margin: EdgeInsets.only(bottom: 8.h),
                          height: 100.h, // Adjust as needed for row height
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: rows[rowIndex].length,
                            itemBuilder: (context, index) {
                              final item = rows[rowIndex][index];

                              // Check if the item is locked
                              final isLocked = item['locked'] == true &&
                                  !subscriptionService.isPremium.value;

                              return GestureDetector(
                                onTap: () {
                                  if (!isLocked) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                        item['page'] ?? const SizedBox.shrink(),
                                      ),
                                    );
                                  }
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 8.h),
                                      width: 80.w,
                                      height: 82.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Darkcontainer, width: 1.w),
                                        color: Darkcontainer,
                                        borderRadius: BorderRadius.circular(5.r),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            item['image'],
                                            height: 39.h,
                                          ),
                                          CustomText(
                                            text: item['title'],
                                            textAlign: TextAlign.center,
                                            textColor: secondaryColor,
                                            fontsize: 12.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ],
                                      ),
                                    ),
                                    // if (isLocked)
                                    //   Positioned.fill(
                                    //     child: Container(
                                    //         decoration: BoxDecoration(
                                    //           borderRadius:
                                    //           BorderRadius.circular(6.r),
                                    //           color:
                                    //           Colors.black.withOpacity(0.5),
                                    //         ),
                                    //         child: Stack(
                                    //           children: [
                                    //             Positioned(
                                    //               top: 5,
                                    //               right: 5,
                                    //               // Position it to the top right corner
                                    //               child: Image.asset(
                                    //                 'assets/images/lock.png',
                                    //                 height: 15
                                    //                     .h, // Adjust the height of the lock icon as per your design
                                    //               ),
                                    //             ),
                                    //           ],
                                    //         )),
                                    //   ),
                                  ],
                                ),
                              );
                            },
                          ),
                        );
                      }),
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                // ! TRENDING NOW
                OuterCard(
                  title: 'Trending Now',
                  buttonText: 'See more',
                  onTap: () {
                    Get.to(() => ArticleDetail(
                        title: 'Revolutionary MED-Tech Breakthroughs',
                        image: AppImages.laptop));
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InnerCard(
                          image: AppImages.laptop,
                          description:
                          'Cutting-edge technologies that\nhave the potential.',
                          onTap: () {
                            Get.to(() => ArticleDetail(
                                title: 'Revolutionary MED-Tech Breakthroughs',
                                image: AppImages.laptop));
                          },
                        ),
                        SizedBox(width: 10.w),
                        InnerCard(
                          image: AppImages.laptop,
                          description:
                          'Cutting-edge technologies that\nhave the potential..',
                          onTap: () {
                            Get.to(() => ArticleDetail(
                                title: 'Another MED-Tech Breakthrough',
                                image: AppImages.laptop));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                // * Cutting-Edge Medical Device Innovations
                OuterCard(
                  title: 'Cutting-Edge Medical\nDevice Innovations',
                  buttonText: 'See more',
                  onTap: () {
                    Get.to(() => ArticleDetail(
                        title: 'Revolutionary MED-Tech Breakthroughs',
                        image: 'assets/images/m4.jpg'));
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InnerCard(
                          image: 'assets/images/m4.jpg',
                          description:
                          'Cutting-edge technologies that\nhave the potential.',
                          onTap: () {
                            Get.to(() => ArticleDetail(
                                title: 'Revolutionary MED-Tech Breakthroughs',
                                image: 'assets/images/m4.jpg'));
                          },
                        ),
                        SizedBox(width: 10.w),
                        InnerCard(
                          image: 'assets/images/m4.jpg',
                          description:
                          'Cutting-edge technologies that\nhave the potential..',
                          onTap: () {
                            Get.to(() => ArticleDetail(
                                title: 'Another MED-Tech Breakthrough',
                                image: 'assets/images/m4.jpg'));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                // ! Revolutionary MED-Tech Breakthrough
                OuterCard(
                  title: 'Revolutionary MED-Tech\nBreakthrough',
                  buttonText: 'See more',
                  onTap: () {
                    Get.to(() => ArticleDetail(
                        title: 'Revolutionary MED-Tech Breakthroughs',
                        image: 'assets/images/m3.jpg'));
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InnerCard(
                          image: 'assets/images/m3.jpg',
                          description:
                          'Cutting-edge technologies that\nhave the potential.',
                          onTap: () {
                            Get.to(() => ArticleDetail(
                                title: 'Revolutionary MED-Tech Breakthroughs',
                                image: 'assets/images/m3.jpg'));
                          },
                        ),
                        SizedBox(width: 10.w),
                        InnerCard(
                          image: 'assets/images/m3.jpg',
                          description:
                          'Cutting-edge technologies that\nhave the potential..',
                          onTap: () {
                            Get.to(() => ArticleDetail(
                                title: 'Another MED-Tech Breakthrough',
                                image: 'assets/images/m3.jpg'));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                // * Regulatory & Compliance Spotlight
                OuterCard(
                  title: 'Regulatory & Compliance\nSpotlight',
                  buttonText: 'See more',
                  onTap: () {
                    Get.to(() => ArticleDetail(
                        title: 'Revolutionary MED-Tech Breakthroughs',
                        image: 'assets/images/m4.jpg'));
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InnerCard(
                          image: 'assets/images/m4.jpg',
                          description:
                          'Cutting-edge technologies that\nhave the potential.',
                          onTap: () {
                            Get.to(() => ArticleDetail(
                                title: 'Revolutionary MED-Tech Breakthroughs',
                                image: 'assets/images/m4.jpg'));
                          },
                        ),
                        SizedBox(width: 10.w),
                        InnerCard(
                          image: 'assets/images/m4.jpg',
                          description:
                          'Cutting-edge technologies that\nhave the potential..',
                          onTap: () {
                            Get.to(() => ArticleDetail(
                                title: 'Another MED-Tech Breakthrough',
                                image: 'assets/images/m4.jpg'));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                // ! Pioneering Clinical Research & Trials
                OuterCard(
                  title: 'Pioneering Clinical\nResearch & Trials',
                  buttonText: 'See more',
                  onTap: () {
                    Get.to(() => ArticleDetail(
                        title: 'Revolutionary MED-Tech Breakthroughs',
                        image: 'assets/images/m6.jpg'));
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InnerCard(
                          image: 'assets/images/m3.jpg',
                          description:
                          'Cutting-edge technologies that\nhave the potential.',
                          onTap: () {
                            Get.to(() => ArticleDetail(
                                title: 'Revolutionary MED-Tech Breakthroughs',
                                image: 'assets/images/m3.jpg'));
                          },
                        ),
                        SizedBox(width: 10.w),
                        InnerCard(
                          image: 'assets/images/m3.jpg',
                          description:
                          'Cutting-edge technologies that\nhave the potential..',
                          onTap: () {
                            Get.to(() => ArticleDetail(
                                title: 'Another MED-Tech Breakthrough',
                                image: 'assets/images/m3.jpg'));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                // * Next-Gen Digital Health & A
                SizedBox(height: 10.h),
                OuterCard(
                  title: 'Next-Gen Digital Health\n& AI',
                  buttonText: 'See more',
                  onTap: () {
                    Get.to(() => ArticleDetail(
                        title: 'Revolutionary MED-Tech Breakthroughs',
                        image: 'assets/images/m3.jpg'));
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InnerCard(
                          image: 'assets/images/m5.jpg',
                          description:
                          'Cutting-edge technologies that\nhave the potential.',
                          onTap: () {
                            Get.to(() => ArticleDetail(
                                title: 'Revolutionary MED-Tech Breakthroughs',
                                image: 'assets/images/m3.jpg'));
                          },
                        ),
                        SizedBox(width: 10.w),
                        InnerCard(
                          image: 'assets/images/m5.jpg',
                          description:
                          'Cutting-edge technologies that\nhave the potential..',
                          onTap: () {
                            Get.to(() => ArticleDetail(
                                title: 'Another MED-Tech Breakthrough',
                                image: 'assets/images/m3.jpg'));
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}