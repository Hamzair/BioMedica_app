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
  HomeScreen({
    super.key,
  });

  final NavBarController navBarController = Get.put(NavBarController());

  final SubscriptionService subscriptionService =
      Get.find<SubscriptionService>();

  final List<Map<String, dynamic>> gridItems = [
    // Row 1
    {
      'image': AppImages.DeviceLibrary,
      'title': 'Device\nLibrary',
      'page': DeviceLibrary(),
      'locked': false,
    },
    {
      'image': AppImages.Therapeutic,
      'title': 'Therapeutic\nDevices',
      'page': CourseDetailScreen(
        title: 'Therapeutic Devices',
        image: 'assets/images/course01.png',
      ),
      'locked': false,
    },
    {
      'image': AppImages.Cell,
      'title': 'Cell & Tissue\nEngineering',
      'page': CourseDetailScreen(
        title: 'Cell & Tissue Engineering',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true,
    },
    {
      'image': AppImages.BioMechanics,
      'title': 'Bio-\nMechanics',
      'page': CourseDetailScreen(
        title: 'Bio-mechanics',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true,
    },
    {
      'image': AppImages.Chemistry,
      'title': 'Chemistry of\nLife',
      'page': CourseDetailScreen(
        title: 'Chemistry of Life',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true,
    },
    {
      'image': AppImages.BME,
      'title': 'Intro to\nBME',
      'page': CourseDetailScreen(
        title: 'Intro to BME',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true,
    },
    {
      'image': AppImages.AdvancedDesign,
      'title': 'Device\nDesign',
      'page': CourseDetailScreen(
        title: 'Device Design',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true,
    },
    {
      'image': AppImages.Bio_nan,
      'title': 'Bio-Nano\ntechnology',
      'page': CourseDetailScreen(
        title: 'Bio-nanotechnology',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true,
    },

    // Row 2
    {
      'image': AppImages.MedicalImaging,
      'title': 'Medical\nImaging',
      'page': CourseDetailScreen(
        title: 'Medical Imaging',
        image: 'assets/images/course01.png',
      ),
      'locked': false,
    },
    {
      'image': AppImages.ProstheicDevice,
      'title': 'Prosthetic\nDevices',
      'page': CourseDetailScreen(
        title: 'Prosthetic Devices',
        image: 'assets/images/course01.png',

      ),

    },
    {
      'image': AppImages.MRI,
      'title': 'MRI Physics',
      'page': CourseDetailScreen(
        title: 'MRI Physics',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true,
    },
    {
      'image': AppImages.HumanPhyscology,
      'title': 'Human\nPhysiology',
      'page': CourseDetailScreen(
        title: 'Human Physiology',
        image: 'assets/images/course01.png',
      ),
      'locked': true,
    },
    {
      'image': AppImages.Biology,
      'title': 'Intro into\nBiology',
      'page': CourseDetailScreen(
        title: 'Intro into Biology',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true,
    },
    {
      'image': AppImages.HumanAnatomy,
      'title': 'Human\nAnatomy',
      'page': CourseDetailScreen(
        title: 'Human Anatomy',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true,
    },
    {
      'image': AppImages.MedicalIm,
      'title': 'Medical Imaging\nPhysics',
      'page': CourseDetailScreen(
        title: 'Medical Imaging Physics',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true,
    },
    {
      'image': AppImages.Biostat,
      'title': 'Biostatistics',
      'page': CourseDetailScreen(
        title: 'Biostatistics',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true,
    },

    // Row 3
    {
      'image': AppImages.BioMaterials,
      'title': 'Biomaterials',
      'page': CourseDetailScreen(
        title: 'Biomaterials',
        image: 'assets/images/course01.png',
      ),
      'locked': false,
    },
    {
      'image': AppImages.Phys,
      'title': 'Instrumentation',
      'page': CourseDetailScreen(
        title: 'Instrumentation',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': false,
    },
    {
      'image': AppImages.ClinicalEngineering,
      'title': 'Clinical\nEngineering',
      'page': CourseDetailScreen(
        title: 'Clinical Engineering',
        image: 'assets/images/course01.png',
      ),
      'locked': true,
    },
    {
      'image': AppImages.Signals,
      'title': 'Signals &\nSystems',
      'page': CourseDetailScreen(
        title: 'Signals & Systems',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true,
    },
    {
      'image': AppImages.Rehab,
      'title': 'Rehabilitation\nEngineering',
      'page': CourseDetailScreen(
        title: 'Rehabilitation Engineering',
        image: 'assets/images/course01.png',
      ),
      'locked': true,
    },
    {
      'image': AppImages.Modelling,
      'title': 'Modeling &\nSimulation',
      'page': CourseDetailScreen(
        title: 'Modeling & Simulation',
        image: 'assets/images/course01.png',
        isPremium: true,
      ),
      'locked': true,
    },
    {
      'image': AppImages.Neuro,
      'title': 'Neuro-\nEngineering',
      'page': CourseDetailScreen(
        title: 'Neuro-engineering',
        image: 'assets/images/course01.png',
      ),
      'locked': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var rows = [

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

                          height: 90.h, // Adjust as needed for row height
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
                                    // If it's not locked, navigate to the course page
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            item['page'] ??
                                            const SizedBox.shrink(),
                                      ),
                                    );
                                  } else {
                                    // If it's locked, navigate to the course page but show a premium message
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            item['page'] ??
                                            const SizedBox.shrink(),
                                      ),
                                    );
                                  }
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 8.h),
                                      width: 71.w,
                                      height: 82.81.h,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Darkcontainer, width: 1.w),
                                        color: Darkcontainer,
                                        borderRadius:
                                            BorderRadius.circular(5.r),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              left: item['image'] ==
                                                      AppImages.Rehab
                                                  ? 8.0.w
                                                  : 0.0, // Apply left padding if image is Rehab
                                            ),
                                            child: Image.asset(
                                              item['image'],
                                              height: item['image'] ==
                                                      AppImages.Rehab
                                                  ? 42.h
                                                  : 36.h, // Conditional height
                                            ),
                                          ),
                                          Text(
                                            item['title'],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: secondaryColor,
                                              fontSize: item['title'] == 'Instrumentation' ||
                                                      item['title'] ==
                                                          'Bio-nanotechnology' ||
                                                      item['title'] ==
                                                          'Medical Imaging physics' ||
                                                      item['title'] ==
                                                          'Rehabilitation\nEngineering'
                                                  ? 7.sp
                                                  : 9.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 6,
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (isLocked)
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 8.w, top: 0.h),
                                        height: 81.81.h,
                                        width: 71.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6.r),
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 5,
                                              right: 5,
                                              // Position it to the top right corner
                                              child: Image.asset(
                                                'assets/images/lock.png',
                                                height: 15
                                                    .h, // Adjust the height of the lock icon as per your design
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
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
