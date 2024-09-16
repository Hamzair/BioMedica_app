import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:bio_medica/controller/nav_bar_controller.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/view/homeOptions/DeviceLibrary/deviceLibrary.dart';
import 'package:bio_medica/view/home_Screen/article_detail.dart';
import 'package:bio_medica/widget/custom_search.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Freehomescreen extends StatelessWidget {
  Freehomescreen({super.key});
  final NavBarController navBarController = Get.put(NavBarController());
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer:  AppDrawer(),
      // key: navBarController.scaffoldKey,
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
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
                          borderRadius: BorderRadius.circular(50),
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
                  Container(
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
                  SizedBox(
                    width: 12.w,
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: secondaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Grid View for home options
            Container(
              height: 330.h,
              margin: EdgeInsets.only(bottom: 20.h),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                padding: EdgeInsets.all(10.r),
                itemCount: gridItems.length,
                itemBuilder: (context, index) {
                  final item = gridItems[index];
                  return GestureDetector(
                    onTap: () {
                      if (item['locked'] == true) {
                        // Show some message if item is locked
                        Get.snackbar('Locked', 'Buy Premium to unlock this feature.',
                            // backgroundColor: primaryColor,
                            colorText: Colors.white);
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
                      children:[ Container(
                        width: 80.w,

                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 1.w,
                          ),
                          color: container,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              item['image'],
                              height: 42.h,
                              width: 43.w,
                            ),
                            SizedBox(height: 5.h),
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
                        if (item['locked'] == true)
                          Positioned.fill(
                            child: Container(
                              color: Colors.black.withOpacity(0.5),
                              child: Stack(
                                children: [

                                  Positioned(
                                    top: 5,
                                    right: 5, // Position it to the top right corner
                                    child: Image.asset(
                                      'assets/images/lock.png',
                                      height: 15.h, // Adjust the height of the lock icon as per your design
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                      ]   ),
                  );
                },
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              width: 348.w,
              margin: EdgeInsets.only(bottom: 100),
              decoration: BoxDecoration(
                color: container,
                borderRadius: BorderRadius.circular(13.r),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
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
                            child: Stack(
                                children:[

                                  Container(
                                    //  Image.asset('assets/images/Rectangle 22968.png',fit:BoxFit.cover)
                                    padding: EdgeInsets.all(16),
                                    width: 249.w,
                                    decoration: BoxDecoration(
                                      color: container,
                                      image: DecorationImage(image: AssetImage('assets/images/Rectangle 22968.png',),fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(5.r),
                                      border:
                                      Border.all(color: Colors.black, width: 0.5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10.h),
                                        CustomText(
                                          text:
                                          'Breakthrough in Wearable Cardiac Monitors',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                        ),
                                        SizedBox(height: 10.h),
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
                                            // The blurred background
                                            // Positioned.fill(
                                            //   child: BackdropFilter(
                                            //     filter: ImageFilter.blur(
                                            //         sigmaX: 0, sigmaY: 0),
                                            //     child: Container(
                                            //       decoration: BoxDecoration(
                                            //         borderRadius:
                                            //             BorderRadius.circular(10),
                                            //         color: Colors.white.withOpacity(
                                            //             0.3), // White with some transparency
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                            // The text on top of the blur
                                            Container(
                                              padding: EdgeInsets.all(8.0),
                                              child: CustomText(
                                                text:
                                                'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data... ',
                                                textColor: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontsize: 11.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ]  ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ArticleDetail());
                            },
                            child: Stack(
                                children:[

                                  Container(
                                    //  Image.asset('assets/images/Rectangle 22968.png',fit:BoxFit.cover)
                                    padding: EdgeInsets.all(16),
                                    width: 249.w,
                                    decoration: BoxDecoration(
                                      color: container,
                                      image: DecorationImage(image: AssetImage('assets/images/Rectangle 22968.png',),fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(5.r),
                                      border:
                                      Border.all(color: Colors.black, width: 0.5),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 10.h),
                                        CustomText(
                                          text:
                                          'Breakthrough in Wearable Cardiac Monitors',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontsize: 14.sp,
                                        ),
                                        SizedBox(height: 10.h),
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
                                            // The blurred background
                                            // Positioned.fill(
                                            //   child: BackdropFilter(
                                            //     filter: ImageFilter.blur(
                                            //         sigmaX: 0, sigmaY: 0),
                                            //     child: Container(
                                            //       decoration: BoxDecoration(
                                            //         borderRadius:
                                            //             BorderRadius.circular(10),
                                            //         color: Colors.white.withOpacity(
                                            //             0.3), // White with some transparency
                                            //       ),
                                            //     ),
                                            //   ),
                                            // ),
                                            // The text on top of the blur
                                            Container(
                                              padding: EdgeInsets.all(8.0),
                                              child: CustomText(
                                                text:
                                                'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data... ',
                                                textColor: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontsize: 11.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ]  ),
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
