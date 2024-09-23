import 'dart:ui';
import 'package:bio_medica/controller/nav_bar_controller.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/view/homeOptions/DeviceLibrary/deviceLibrary.dart';
import 'package:bio_medica/view/homeOptions/Human%20Anatomy/human_anatomy.dart';
import 'package:bio_medica/view/home_Screen/article_detail.dart';
import 'package:bio_medica/widget/custom_search.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/drawer%20items/drawer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/subscription_controller.dart';
import '../navbar/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final NavBarController navBarController = Get.put(NavBarController());
  final SubscriptionService subscriptionService =
      Get.find<SubscriptionService>();
  final List<Map<String, dynamic>> gridItems = [
    {
      'image': AppImages.DeviceLibrary,
      'title': 'Device\nlibrary',
      'page': DeviceLibrary()
    },
    {
      'image': AppImages.Therapeutic,
      'title': 'Therapeutic\nDevices',
      'page': DeviceLibrary()
    },
    {
      'image': AppImages.ClinicalEngineering,
      'title': 'Clinical\nEngineering',
      'page': DeviceLibrary()
    },
    {
      'image': AppImages.HumanAnatomy,
      'title': 'Human\nAnatomy',
      'page': HumanAnatomy(),
    },
    {
      'image': AppImages.HumanPhyscology,
      'title': 'Human\nPhysiology ',
      'page': DeviceLibrary(),
      'locked': true
    },
    {
      'image': AppImages.BioMechanics,
      'title': 'Bio-\nmechanics',
      'page': DeviceLibrary(),
      'locked': true
    },
    {
      'image': AppImages.MedicalImaging,
      'title': 'Medical \nImaging',
      'page': DeviceLibrary(),
      'locked': true
    },
    {
      'image': AppImages.AdvancedDesign,
      'title': 'Device Design',
      'page': DeviceLibrary(),
      'locked': true,
    },
    {
      'image': AppImages.BioMaterials,
      'title': 'Biomaterials',
      'page': DeviceLibrary(),
      'locked': true
    },
    {
      'image': AppImages.ProstheicDevice,
      'title': 'Prosthetic\nDevices',
      'page': DeviceLibrary(),
      'locked': true
    },
  ];

//  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
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
                          navBarController.scaffoldKey.currentState
                              ?.openDrawer();
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

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 13.h),
              // Grid View for home options
              GetBuilder<SubscriptionService>(builder: (subscriptionService) {
                double getAppBarHeight(BuildContext context) {
                  double screenHeight = MediaQuery.of(context).size.height;
                  print(screenHeight);

                  // Define height based on screen size
                  if (screenHeight < 600) {
                    // Considered small screen
                    return screenHeight / 4; // Example height for small screens
                  } else if (screenHeight == 667) {
                    return screenHeight /
                        2.15; // Default height for larger screens
                  } else {
                    return screenHeight /
                        2.6; // Default height for larger screens
                  }
                }

                return Container(
                  height: getAppBarHeight(context),
                  child: GridView.builder(
                    shrinkWrap: true, // Add this line
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.9,
                    ),

                    itemCount: gridItems.length + 2,
                    // Adjusted item count
                    itemBuilder: (context, index) {
                      //   Empty container at index 8
                      if (index == 8) {
                        return Container(); // Empty container at index 8
                      }
                      // Empty container at the last index
                      if (index == gridItems.length + 1) {
                        return Container(); // Empty container at the end
                      }

                      // Adjust the index to account for the empty container at index 8
                      final adjustedIndex = index > 8 ? index - 1 : index;
                      final item = gridItems[adjustedIndex];

                      // Check if the item is locked
                      final isLocked = item['locked'] == true &&
                          !subscriptionService.isPremium.value;

                      return GestureDetector(
                        onTap: () {
                          if (isLocked) {
                            Get.snackbar(
                              'Locked',
                              'Only accessible for premium members!',
                              backgroundColor: primaryColor,
                              colorText: secondaryColor,
                            );
                          } else {
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
                              width: 80.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Darkcontainer, width: 1.w),
                                color: Color.fromRGBO(0, 26, 46, 1),
                                borderRadius: BorderRadius.circular(5.r),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    item['image'],
                                    height: 42.h,
                                    //    width: 43.w,
                                  ),
                                  // SizedBox(height: 5.h),
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
                            if (isLocked)
                              Positioned.fill(
                                child: Container(
                                    color: Colors.black.withOpacity(0.5),
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
                                    )),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }),
              // ! TRENDING NOW
              Container(
                decoration: BoxDecoration(
                  color: container,
                  borderRadius: BorderRadius.circular(13.r),
                  border: Border.all(color: Darkcontainer, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 18.0.w, top: 16.h, right: 18.w, bottom: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Trending News',
                            textColor: buttonColor,
                            fontWeight: FontWeight.w600,
                            fontsize: 17.sp,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: CustomText(
                              text: 'See more',
                              textColor: buttonColor2,
                              fontWeight: FontWeight.w600,
                              fontsize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ArticleDetail(title: 'Breakthrough in Wearable Cardiac Monitors',image:   AppImages.laptop,));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 12.w, top: 9.h, bottom: 10.h),
                                    width: 249.w,
                                    decoration: BoxDecoration(
                                      color: container,

                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text:
                                              'Breakthrough in Wearable Cardiac Monitors',
                                          textColor: secondaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                        ),
                                        SizedBox(height: 8.h),
                                        Image.asset(
                                          AppImages.laptop,
                                          width: 215.w,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topLeft,
                                        ),
                                        SizedBox(height: 5.h),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data...',
                                                style: TextStyle(
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Read more',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      12, 192, 223, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11.sp,
                                                ),
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
                                                        Get.to(() =>
                                                            ArticleDetail(title: 'Cutting-Edge Medical Device Innovations',image: AppImages.laptop,));
                                                      },
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
                            SizedBox(width: 10.w),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ArticleDetail(title: 'Breakthrough in Wearable Cardiac Monitors',image:   AppImages.laptop,));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 12.w, top: 9.h, bottom: 10.h),
                                    width: 249.w,
                                    decoration: BoxDecoration(
                                      color: container,

                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text:
                                          'Breakthrough in Wearable Cardiac Monitors',
                                          textColor: secondaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                        ),
                                        SizedBox(height: 8.h),
                                        Image.asset(
                                          AppImages.laptop,
                                          width: 215.w,
                                          fit: BoxFit.cover,
                                          alignment: Alignment.topLeft,
                                        ),
                                        SizedBox(height: 5.h),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data...',
                                                style: TextStyle(
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Read more',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      12, 192, 223, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11.sp,
                                                ),
                                                recognizer:
                                                TapGestureRecognizer()
                                                  ..onTap = () {
                                                    Get.to(() =>
                                                        ArticleDetail(title: 'Cutting-Edge Medical Device Innovations',image: AppImages.laptop,));
                                                  },
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              // * Cutting-Edge Medical Device Innovations
              Container(
                decoration: BoxDecoration(
                  color: container,
                  borderRadius: BorderRadius.circular(13.r),
                  border: Border.all(color: Darkcontainer, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 18.0.w, top: 16.h, right: 18.w, bottom: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Cutting-Edge Medical\nDevice Innovations',
                            textColor: buttonColor,
                            fontWeight: FontWeight.w600,
                            fontsize: 17.sp,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: CustomText(
                              text: 'See more',
                              textColor: buttonColor2,
                              fontWeight: FontWeight.w600,
                              fontsize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ArticleDetail(title: 'Cutting-Edge Medical\nDevice Innovations',image: 'assets/images/m2.jpg',));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 12.w, top: 9.h, bottom: 10.h),
                                    width: 249.w,
                                    decoration: BoxDecoration(
                                      color: container,

                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text:
                                          'The latest advancements, designs, and technologies in medical devices across various fields.',
                                          textColor: secondaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                        ),
                                        SizedBox(height: 8.h),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0.r), // Adjust the value to your preference
                                          child: Image.asset(
                                            'assets/images/m2.jpg',
                                            height: 133.h,
                                            width: 215.w,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topLeft,
                                          ),
                                        ),

                                        SizedBox(height: 5.h),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data...',
                                                style: TextStyle(
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Read more',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      12, 192, 223, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11.sp,
                                                ),
                                                recognizer:
                                                TapGestureRecognizer()
                                                  ..onTap = () {
                                                    Get.to(() =>
                                                        ArticleDetail(title: 'Cutting-Edge Medical Device Innovations',image:    'assets/images/m2.jpg',));
                                                  },
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

                            SizedBox(width: 10.w),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ArticleDetail(title: 'Cutting-Edge Medical\nDevice Innovations',image: 'assets/images/m2.jpg',));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 12.w, top: 9.h, bottom: 10.h),
                                    width: 249.w,
                                    decoration: BoxDecoration(
                                      color: container,

                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text:
                                          'The latest advancements, designs, and technologies in medical devices across various fields.',
                                          textColor: secondaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                        ),
                                        SizedBox(height: 8.h),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(12.r)
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(8.r),
                                            child: Image.asset(
                                              'assets/images/m2.jpg',
                                              height: 133.h,
                                              width: 215.w,
                                            
                                              fit: BoxFit.cover,
                                              alignment: Alignment.topLeft,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data...',
                                                style: TextStyle(
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Read more',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      12, 192, 223, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11.sp,
                                                ),
                                                recognizer:
                                                TapGestureRecognizer()
                                                  ..onTap = () {
                                                    Get.to(() =>
                                                        ArticleDetail(title: 'Cutting-Edge Medical Device Innovations',image:    'assets/images/m2.jpg',));
                                                  },
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

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              // ! Revolutionary MED-Tech Breakthrough
              Container(
                decoration: BoxDecoration(
                  color: container,
                  borderRadius: BorderRadius.circular(13.r),
                  border: Border.all(color: Darkcontainer, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 18.0.w, top: 16.h, right: 18.w, bottom: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Revolutionary MED-Tech\nBreakthrough',
                            textColor: buttonColor,
                            fontWeight: FontWeight.w600,
                            fontsize: 17.sp,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: CustomText(
                              text: 'See more',
                              textColor: buttonColor2,
                              fontWeight: FontWeight.w600,
                              fontsize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ArticleDetail(title: 'Revolutionary MED-Tech Breakthroughs', image: 'assets/images/m3.jpg',));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 12.w, top: 9.h, bottom: 10.h),
                                    width: 249.w,
                                    decoration: BoxDecoration(
                                      color: container,

                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text:
                                          'Cutting-edge technologies that\nhave the potential to reshape the medical and healthcare landscape.',
                                          textColor: secondaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                        ),
                                        SizedBox(height: 8.h),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.r),
                                          child: Image.asset(
                                            'assets/images/m3.jpg',
                                            height: 133.h,
                                            width: 215.w,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topLeft,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data...',
                                                style: TextStyle(
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Read more',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      12, 192, 223, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11.sp,
                                                ),
                                                recognizer:
                                                TapGestureRecognizer()
                                                  ..onTap = () {
                                                    Get.to(() => ArticleDetail(title: 'Revolutionary MED-Tech Breakthroughs', image: '  assets/images/m3.jpg',));

                                                  },
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
                            SizedBox(width: 10.w),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ArticleDetail(title: 'Revolutionary MED-Tech Breakthroughs', image: 'assets/images/m3.jpg',));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 12.w, top: 9.h, bottom: 10.h),
                                    width: 249.w,
                                    decoration: BoxDecoration(
                                      color: container,

                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text:
                                          'Cutting-edge technologies that\nhave the potential to reshape the medical and healthcare landscape.',
                                          textColor: secondaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                        ),
                                        SizedBox(height: 8.h),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.r),
                                          child: Image.asset(
                                            'assets/images/m3.jpg',
                                            height: 133.h,
                                            width: 215.w,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topLeft,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data...',
                                                style: TextStyle(
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Read more',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      12, 192, 223, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11.sp,
                                                ),
                                                recognizer:
                                                TapGestureRecognizer()
                                                  ..onTap = () {
                                                    Get.to(() => ArticleDetail(title: 'Revolutionary MED-Tech Breakthroughs', image: '  assets/images/m3.jpg',));

                                                  },
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              // * Regulatory & Compliance Spotlight
              Container(
                decoration: BoxDecoration(
                  color: container,
                  borderRadius: BorderRadius.circular(13.r),
                  border: Border.all(color: Darkcontainer, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 18.0.w, top: 16.h, right: 18.w, bottom: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Regulatory & Compliance\nSpotlight',
                            textColor: buttonColor,
                            fontWeight: FontWeight.w600,
                            fontsize: 17.sp,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: CustomText(
                              text: 'See more',
                              textColor: buttonColor2,
                              fontWeight: FontWeight.w600,
                              fontsize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ArticleDetail(title: 'Regulatory & Compliance\nSpotlight', image:   'assets/images/m4.jpg',));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 12.w, top: 9.h, bottom: 10.h),
                                    width: 249.w,
                                    decoration: BoxDecoration(
                                      color: container,

                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text:
                                          'The latest regulatory changes, approvals, and compliance requirements',
                                          textColor: secondaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                        ),
                                        SizedBox(height: 8.h),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.r),
                                          child: Image.asset(
                                            'assets/images/m4.jpg',
                                            height: 133.h,
                                            width: 215.w,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topLeft,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data...',
                                                style: TextStyle(
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Read more',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      12, 192, 223, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11.sp,
                                                ),
                                                recognizer:
                                                TapGestureRecognizer()
                                                  ..onTap = () {
                                                    Get.to(() => ArticleDetail(title: 'Regulatory & Compliance\nSpotlight', image:   'assets/images/m4.jpg',));

                                                  },
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
                            SizedBox(width: 10.w),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ArticleDetail(title: 'Regulatory & Compliance\nSpotlight', image:   'assets/images/m4.jpg',));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 12.w, top: 9.h, bottom: 10.h),
                                    width: 249.w,
                                    decoration: BoxDecoration(
                                      color: container,

                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text:
                                          'The latest regulatory changes, approvals, and compliance requirements',
                                          textColor: secondaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                        ),
                                        SizedBox(height: 8.h),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.r),
                                          child: Image.asset(
                                            'assets/images/m4.jpg',
                                            height: 133.h,
                                            width: 215.w,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topLeft,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data...',
                                                style: TextStyle(
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Read more',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      12, 192, 223, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11.sp,
                                                ),
                                                recognizer:
                                                TapGestureRecognizer()
                                                  ..onTap = () {
                                                    Get.to(() => ArticleDetail(title: 'Regulatory & Compliance\nSpotlight', image:   'assets/images/m4.jpg',));

                                                  },
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              // ! Pioneering Clinical Research & Trials
              Container(
                decoration: BoxDecoration(
                  color: container,
                  borderRadius: BorderRadius.circular(13.r),
                  border: Border.all(color: Darkcontainer, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 18.0.w, top: 16.h, right: 18.w, bottom: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Pioneering Clinical\nResearch & Trials',
                            textColor: buttonColor,
                            fontWeight: FontWeight.w600,
                            fontsize: 17.sp,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: CustomText(
                              text: 'See more',
                              textColor: buttonColor2,
                              fontWeight: FontWeight.w600,
                              fontsize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ArticleDetail(title: 'Pioneering Clinical\nResearch & Trials',image:'assets/images/m5.jpg' ,));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 12.w, top: 9.h, bottom: 10.h),
                                    width: 249.w,
                                    decoration: BoxDecoration(
                                      color: container,

                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text:
                                          'The latest research findings,\nclinical  trials, and experimental innovations.',
                                          textColor: secondaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                        ),
                                        SizedBox(height: 8.h),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.r),
                                          child: Image.asset(
                                            'assets/images/m5.jpg',
                                            height: 133.h,
                                            width: 215.w,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topLeft,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data...',
                                                style: TextStyle(
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Read more',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      12, 192, 223, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11.sp,
                                                ),
                                                recognizer:
                                                TapGestureRecognizer()
                                                  ..onTap = () {
                                                    Get.to(() => ArticleDetail(title: 'Pioneering Clinical\nResearch & Trials',image:'assets/images/m5.jpg' ,));

                                                  },
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
                            SizedBox(width: 10.w),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ArticleDetail(title: 'Pioneering Clinical\nResearch & Trials',image:'assets/images/m5.jpg' ,));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 12.w, top: 9.h, bottom: 10.h),
                                    width: 249.w,
                                    decoration: BoxDecoration(
                                      color: container,

                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text:
                                          'The latest research findings,\nclinical trials, and experimental innovations.',
                                          textColor: secondaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                        ),
                                        SizedBox(height: 8.h),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.r),
                                          child: Image.asset(
                                            'assets/images/m5.jpg',
                                            height: 133.h,
                                            width: 215.w,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topLeft,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data...',
                                                style: TextStyle(
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Read more',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      12, 192, 223, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11.sp,
                                                ),
                                                recognizer:
                                                TapGestureRecognizer()
                                                  ..onTap = () {
                                                    Get.to(() => ArticleDetail(title: 'Pioneering Clinical\nResearch & Trials',image:'assets/images/m5.jpg' ,));

                                                  },
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // * Next-Gen Digital Health & A
              SizedBox(height: 10.h),
              Container(
                decoration: BoxDecoration(
                  color: container,
                  borderRadius: BorderRadius.circular(13.r),
                  border: Border.all(color: Darkcontainer, width: 1),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 18.0.w, top: 16.h, right: 18.w, bottom: 10.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Next-Gen Digital\nHealth & AI',
                            textColor: buttonColor,
                            fontWeight: FontWeight.w600,
                            fontsize: 17.sp,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: CustomText(
                              text: 'See more',
                              textColor: buttonColor2,
                              fontWeight: FontWeight.w600,
                              fontsize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14.h),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ArticleDetail(title: 'Next-Gen Digital\nHealth & AI', image:  'assets/images/m2.jpg',));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 12.w, top: 9.h, bottom: 10.h),
                                    width: 249.w,
                                    decoration: BoxDecoration(
                                      color: container,

                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text:
                                          'Developments in digital health,AI and telemedicine.',
                                          textColor: secondaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                        ),
                                        SizedBox(height: 8.h),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.r),
                                          child: Image.asset(
                                            'assets/images/m2.jpg',
                                            height: 133.h,
                                            width: 215.w,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topLeft,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data...',
                                                style: TextStyle(
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Read more',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      12, 192, 223, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11.sp,
                                                ),
                                                recognizer:
                                                TapGestureRecognizer()
                                                  ..onTap = () {
                                                    Get.to(() => ArticleDetail(title: 'Next-Gen Digital\nHealth & AI', image:  'assets/images/m2.jpg',));

                                                  },
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
                            SizedBox(width: 10.w),
                            GestureDetector(
                              onTap: () {
                                Get.to(() => ArticleDetail(title: 'Next-Gen Digital\nHealth & AI', image:  'assets/images/m2.jpg',));
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 12.w, top: 9.h, bottom: 10.h),
                                    width: 249.w,
                                    decoration: BoxDecoration(
                                      color: container,

                                      borderRadius: BorderRadius.circular(8.r),
                                      border: Border.all(
                                          color: Colors.black, width: 0.5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text:
                                          'Developments in digital health,AI and telemedicine.',
                                          textColor: secondaryColor,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                        ),
                                        SizedBox(height: 8.h),
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.r),
                                          child: Image.asset(
                                            'assets/images/m2.jpg',
                                            height: 133.h,
                                            width: 215.w,
                                            fit: BoxFit.cover,
                                            alignment: Alignment.topLeft,
                                          ),
                                        ),
                                        SizedBox(height: 5.h),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data...',
                                                style: TextStyle(
                                                  color: secondaryColor,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 11.sp,
                                                ),
                                              ),
                                              TextSpan(
                                                text: 'Read more',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      12, 192, 223, 1),
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 11.sp,
                                                ),
                                                recognizer:
                                                TapGestureRecognizer()
                                                  ..onTap = () {
                                                    Get.to(() => ArticleDetail(title: 'Next-Gen Digital\nHealth & AI', image:  'assets/images/m2.jpg',));

                                                  },
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100.h),
            ],
          ),
        ),
      ),
    );
  }
}
