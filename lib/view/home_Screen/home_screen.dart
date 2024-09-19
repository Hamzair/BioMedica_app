import 'dart:ui';

import 'package:bio_medica/controller/nav_bar_controller.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/view/homeOptions/DeviceLibrary/deviceLibrary.dart';
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
      'page': DeviceLibrary()
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
      'title': 'Advanced\nDevice',
      'page': DeviceLibrary(),
      'locked': true
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

    return Scaffold(
      // drawer:  AppDrawer(),
      // key: navBarController.scaffoldKey,
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80.h),
        child: AppBar(

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(13.r),
                  bottomRight: Radius.circular(13.r))),
          centerTitle: true,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 12.w,
                    ),
                    SizedBox(
                      height: 38.h,
                      width: 38.w,
                      child: GestureDetector(
                        onTap: () {
                          // Open the drawer using the scaffold key
                          navBarController.scaffoldKey.currentState?.openDrawer();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF001A2E),
                            borderRadius: BorderRadius.circular(50.r),
                          ),
                          child: Icon(
                            Icons.menu,
                            color: buttonColor2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Flexible(
                      child: CustomSearch(),
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    GestureDetector(onTap: () {
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
                    SizedBox(
                      width: 12.w,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Grid View for home options
            GetBuilder<SubscriptionService>(builder: (subscriptionService) {

              double getAppBarHeight(BuildContext context) {
                double screenHeight = MediaQuery.of(context).size.height;
                print(screenHeight);

                // Define height based on screen size
                if (screenHeight < 600) { // Considered small screen
                  return screenHeight / 4; // Example height for small screens
                }
                else if(screenHeight ==667) {
                  return screenHeight / 2.15; // Default height for larger screens
                }

                else {
                  return screenHeight / 2.6; // Default height for larger screens
                }
              }

              return Container(
              height: getAppBarHeight(context),

                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.9,
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h
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
                            'Buy Premium to unlock this feature.',
                             backgroundColor: primaryColor,
                            colorText: Colors.white,
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
                                  color: Colors.black, width: 1.w),
                              color: container,
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
                                  textColor: Colors.white,
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
                                  )
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),

            Container(

              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
           //   width: 348.w,
              margin: EdgeInsets.only(bottom: 100.h,left:5.w,right: 5.w
              ),
              decoration: BoxDecoration(
                color: container,
                borderRadius: BorderRadius.circular(13.r),
                border: Border.all(color: Darkcontainer, width: 1),
              ),
              child: Padding(
                padding:  EdgeInsets.only(left: 18.0.w,top: 16.h,right:18.w ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    SizedBox(
                      height: 14.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ArticleDetail());
                            },
                            child: Stack(children: [
                              Container(
                                //  Image.asset('assets/images/Rectangle 22968.png',fit:BoxFit.cover)
                                padding: EdgeInsets.only(left:  12.w,top: 10.h),
                                width: 249.w,
                                decoration: BoxDecoration(
                                  color: container,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/Rectangle 22968.png',
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                      color: Colors.black, width: 0.5),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                 //   SizedBox(height: 10.h),
                                    CustomText(
                                      text:
                                      'Breakthrough in Wearable Cardiac Monitors',
                                      textColor: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontsize: 14.sp,
                                    ),
                                    SizedBox(height: 8.h),
                                    Image.asset(
                                      width: 215.w,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topLeft,
                                      AppImages.laptop,
                                    ),
                                    SizedBox(height: 5.h),

                                    // Applying blur background only for description text
                                    Stack(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                  'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data... ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 11.sp,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Read more',
                                                  style: TextStyle(
                                                    color: Colors
                                                        .blue,
                                                    // Change to your desired color
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11.sp,
                                                  ),
                                                  recognizer:
                                                  TapGestureRecognizer()
                                                    ..onTap = () {
                                                      Get.to(() =>
                                                          ArticleDetail());
                                                    },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ArticleDetail());
                            },
                            child: Stack(children: [
                              Container(
                                //  Image.asset('assets/images/Rectangle 22968.png',fit:BoxFit.cover)
                                padding: EdgeInsets.only(left:  12.w,top: 10.h),
                                width: 249.w,
                                decoration: BoxDecoration(
                                  color: container,
                                  image: DecorationImage(
                                      image: AssetImage(
                                        'assets/images/Rectangle 22968.png',
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(5.r),
                                  border: Border.all(
                                      color: Colors.black, width: 0.5),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //   SizedBox(height: 10.h),
                                    CustomText(
                                      text:
                                      'Breakthrough in Wearable Cardiac Monitors',
                                      textColor: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontsize: 14.sp,
                                    ),
                                    SizedBox(height: 8.h),
                                    Image.asset(
                                      width: 215.w,
                                      fit: BoxFit.cover,
                                      alignment: Alignment.topLeft,
                                      AppImages.laptop,
                                    ),
                                    SizedBox(height: 5.h),

                                    // Applying blur background only for description text
                                    Stack(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(8.0),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text:
                                                  'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data... ',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 11.sp,
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'Read more',
                                                  style: TextStyle(
                                                    color: Colors
                                                        .blue,
                                                    // Change to your desired color
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 11.sp,
                                                  ),
                                                  recognizer:
                                                  TapGestureRecognizer()
                                                    ..onTap = () {
                                                      Get.to(() =>
                                                          ArticleDetail());
                                                    },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
