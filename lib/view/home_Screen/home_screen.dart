import 'dart:ui';
import 'package:bio_medica/controller/nav_bar_controller.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/view/course/course_content.dart';
import 'package:bio_medica/view/course/course_details.dart';
import 'package:bio_medica/view/homeOptions/Bio-Materials.dart';
import 'package:bio_medica/view/homeOptions/Clinical%20Engineering/clinical.dart';
import 'package:bio_medica/view/homeOptions/DeviceLibrary/deviceLibrary.dart';
import 'package:bio_medica/view/homeOptions/Human%20Anatomy/human_anatomy.dart';
import 'package:bio_medica/view/homeOptions/Therapeutic%20Devices/therapy.dart';
import 'package:bio_medica/view/homeOptions/prosthetic_Devices.dart';
import 'package:bio_medica/view/home_Screen/article_detail.dart';
import 'package:bio_medica/widget/custom_search.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/drawer%20items/drawer.dart';
import 'package:bio_medica/widget/cutom_homeCard.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/subscription_controller.dart';
import '../homeOptions/Bio-Mechanics/bio-mech.dart';
import '../homeOptions/Human Physiology/humanPhys.dart';
import '../homeOptions/Medical Imaging/medicalImaging.dart';
import '../homeOptions/device_design.dart';
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
      'page': CourseDetailScreen(title: 'Therapeutic Devices', image: 'assets/images/course01.png')
    },
    {
      'image': AppImages.ClinicalEngineering,
      'title': 'Clinical\nEngineering',
      'page':  CourseDetailScreen(title: 'Clinical Engineering', image: 'assets/images/course01.png')
    },
    {
      'image': AppImages.HumanAnatomy,
      'title': 'Human\nAnatomy',
      'page':  CourseDetailScreen(title: 'Human Anatomy', image: 'assets/images/course01.png')
    },
    {
      'image': AppImages.HumanPhyscology,
      'title': 'Human\nPhysiology ',
      'page':  CourseDetailScreen(title: 'Human Physiology', image: 'assets/images/course01.png'),
      'locked': true
    },
    {
      'image': AppImages.BioMechanics,
      'title': 'Bio-\nmechanics',
      'page':  CourseDetailScreen(title: 'Bio-mechanics', image: 'assets/images/course01.png'),
      'locked': true
    },
    {
      'image': AppImages.MedicalImaging,
      'title': 'Medical \nImaging',
      'page':  CourseDetailScreen(title: 'Medical Imaging', image: 'assets/images/course01.png'),
      'locked': true
    },
    {
      'image': AppImages.AdvancedDesign,
      'title': 'Device Design',
      'page': CourseDetailScreen(title: 'Device Design', image: 'assets/images/course01.png'),
      'locked': true,
    },
    {
      'image': AppImages.BioMaterials,
      'title': 'Biomaterials',
      'page':  CourseDetailScreen(title: 'Bio-materials', image: 'assets/images/course01.png'),
      'locked': true
    },
    {
      'image': AppImages.ProstheicDevice,
      'title': 'Prosthetic\nDevices',
      'page':  CourseDetailScreen(title: 'Prosthetic Devices', image: 'assets/images/course01.png'),
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
          FocusScope.of(context).unfocus(); // Close the keyboard when tapping outside
        },
        child: SingleChildScrollView(
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

                      return screenHeight / 4; // Example height for small screens
                    } else if (screenHeight == 667) {
                      return screenHeight /
                          2.15; // Default height for larger screens
                    }  else if (screenHeight == 716.6666666666666) {
                      return screenHeight /
                          2.5; // Default height for larger screens
                    }

                    else {
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

                        if (index == gridItems.length + 1) {
                          return Container(); // Empty container at the end
                        }

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
                                // backgroundColor: primaryColor,
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

                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6.r),color: Colors.black.withOpacity(0.5),),
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
                SizedBox(height: 10.h,),
                // ! TRENDING NOW
                OuterCard(
                  title: 'Trending Now',
                  buttonText: 'See more',
                  onTap: () {
                    Get.to(() => ArticleDetail(title: 'Revolutionary MED-Tech Breakthroughs', image: AppImages.laptop));
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InnerCard(
                          image:  AppImages.laptop,
                          description: 'Cutting-edge technologies that\nhave the potential.',
                          onTap: () {
                            Get.to(() => ArticleDetail(title: 'Revolutionary MED-Tech Breakthroughs', image:  AppImages.laptop));
                          },
                        ),
                        SizedBox(width: 10.w),
                        InnerCard(
                          image:  AppImages.laptop,
                          description: 'Cutting-edge technologies that\nhave the potential..',
                          onTap: () {
                            Get.to(() => ArticleDetail(title: 'Another MED-Tech Breakthrough', image:  AppImages.laptop));
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
                    Get.to(() => ArticleDetail(title: 'Revolutionary MED-Tech Breakthroughs', image: 'assets/images/m4.jpg'));
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InnerCard(
                          image: 'assets/images/m4.jpg',
                          description: 'Cutting-edge technologies that\nhave the potential.',
                          onTap: () {
                            Get.to(() => ArticleDetail(title: 'Revolutionary MED-Tech Breakthroughs', image: 'assets/images/m4.jpg'));
                          },
                        ),
                        SizedBox(width: 10.w),
                        InnerCard(
                          image: 'assets/images/m4.jpg',
                          description: 'Cutting-edge technologies that\nhave the potential..',
                          onTap: () {
                            Get.to(() => ArticleDetail(title: 'Another MED-Tech Breakthrough', image: 'assets/images/m4.jpg'));
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
                    Get.to(() => ArticleDetail(title: 'Revolutionary MED-Tech Breakthroughs', image: 'assets/images/m3.jpg'));
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InnerCard(
                          image: 'assets/images/m3.jpg',
                          description: 'Cutting-edge technologies that\nhave the potential.',
                          onTap: () {
                            Get.to(() => ArticleDetail(title: 'Revolutionary MED-Tech Breakthroughs', image: 'assets/images/m3.jpg'));
                          },
                        ),
                        SizedBox(width: 10.w),
                        InnerCard(
                          image: 'assets/images/m3.jpg',
                          description: 'Cutting-edge technologies that\nhave the potential..',
                          onTap: () {
                            Get.to(() => ArticleDetail(title: 'Another MED-Tech Breakthrough', image: 'assets/images/m3.jpg'));
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
                    Get.to(() => ArticleDetail(title: 'Revolutionary MED-Tech Breakthroughs', image: 'assets/images/m4.jpg'));
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InnerCard(
                          image: 'assets/images/m4.jpg',
                          description: 'Cutting-edge technologies that\nhave the potential.',
                          onTap: () {
                            Get.to(() => ArticleDetail(title: 'Revolutionary MED-Tech Breakthroughs', image: 'assets/images/m4.jpg'));
                          },
                        ),
                        SizedBox(width: 10.w),
                        InnerCard(
                          image: 'assets/images/m4.jpg',
                          description: 'Cutting-edge technologies that\nhave the potential..',
                          onTap: () {
                            Get.to(() => ArticleDetail(title: 'Another MED-Tech Breakthrough', image: 'assets/images/m4.jpg'));
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
                    Get.to(() => ArticleDetail(title: 'Revolutionary MED-Tech Breakthroughs', image: 'assets/images/m6.jpg'));
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InnerCard(
                          image: 'assets/images/m3.jpg',
                          description: 'Cutting-edge technologies that\nhave the potential.',
                          onTap: () {
                            Get.to(() => ArticleDetail(title: 'Revolutionary MED-Tech Breakthroughs', image: 'assets/images/m3.jpg'));
                          },
                        ),
                        SizedBox(width: 10.w),
                        InnerCard(
                          image: 'assets/images/m3.jpg',
                          description: 'Cutting-edge technologies that\nhave the potential..',
                          onTap: () {
                            Get.to(() => ArticleDetail(title: 'Another MED-Tech Breakthrough', image: 'assets/images/m3.jpg'));
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
                    Get.to(() => ArticleDetail(title: 'Revolutionary MED-Tech Breakthroughs', image: 'assets/images/m3.jpg'));
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InnerCard(
                          image: 'assets/images/m5.jpg',
                          description: 'Cutting-edge technologies that\nhave the potential.',
                          onTap: () {
                            Get.to(() => ArticleDetail(title: 'Revolutionary MED-Tech Breakthroughs', image: 'assets/images/m3.jpg'));
                          },
                        ),
                        SizedBox(width: 10.w),
                        InnerCard(
                          image: 'assets/images/m5.jpg',
                          description: 'Cutting-edge technologies that\nhave the potential..',
                          onTap: () {
                            Get.to(() => ArticleDetail(title: 'Another MED-Tech Breakthrough', image: 'assets/images/m3.jpg'));
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
