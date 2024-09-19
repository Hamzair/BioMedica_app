import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/view/course/courses.dart';
import 'package:bio_medica/view/homeOptions/DeviceLibrary/deviceDetails.dart';
import 'package:bio_medica/widget/custom_button.dart';
import 'package:bio_medica/widget/custom_search.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/drawer%20items/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:bio_medica/controller/nav_bar_controller.dart';

import '../../../drawer items/saveitems/saveForLater.dart';
import '../../../drawer items/saveitems/save_controller.dart';

class DeviceLibrary extends StatefulWidget {
  final FocusNode? focusNode;
  const DeviceLibrary({Key? key, this.focusNode}) : super(key: key);
  @override
  _DeviceLibraryState createState() => _DeviceLibraryState();
}

class _DeviceLibraryState extends State<DeviceLibrary> {
  // List of tabs
  List<String> tabs = ['Cardiology', 'Neurology', 'Orthopedics', 'Radiology'];
   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
  final NavBarController navBarController = Get.put(NavBarController());

  List<Widget> content = [
    Center(
        child: Text(
      'No Cardiology Devices ',
      style: TextStyle(color: Colors.white),
    )),
    Neurology(),
    Center(
        child: Text(
      'No Orthopedics Devices',
      style: TextStyle(color: Colors.white),
    )),
    Center(
        child: Text(
      'No Radiology Devices',
      style: TextStyle(color: Colors.white),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const AppDrawer(),
      // key: _scaffoldKey,
      backgroundColor: primaryColor,
      appBar: AppBar(

        backgroundColor: Color.fromRGBO(192, 208, 221, 1),
        leading: Padding(
          padding:  EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              // Open the drawer using the scaffold key
               //  _scaffoldKey.currentState?.openDrawer();
              navBarController.scaffoldKey.currentState?.openDrawer();

            },
            child:Container(
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
        title: CustomText(
          text: 'Device Library',
          textColor: Color(0xFF001A2E),
          fontWeight: FontWeight.bold,
        ),
        actions: [],
      ),
      body: Column(
        children: [
          // Search bar and filter button
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(13.r)),
            child: Container(
              height: 62.h,
              color: secondaryColor,
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: GestureDetector(
                            onTap: () {
                              // Unfocus the text field when tapping outside
                              FocusScope.of(context).unfocus();
                            },
                            child: SizedBox(
                              width: 237.w,
                              height: 42.h,
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                focusNode: FocusNode(),
                                // textAlign: TextAlign.start,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.mic_rounded,
                                    color: Colors.white,
                                  ),
                                  fillColor: Color.fromRGBO(0, 26, 46, 1),
                                  filled: true,
                                  contentPadding: EdgeInsets.symmetric(),
                                  prefixIcon: Image.asset(
                                    AppImages.search,
                                  ),
                                  hintText: 'Search for anything',
                                  hintStyle: TextStyle(
                                    color: whiteColor,
                                    fontSize: 14.sp,
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(13.r),
                                      borderSide: BorderSide.none),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(13.r),
                                  ),
                                ),
                              ),
                            ),
                          ))),
                  SizedBox(width: 5.w),
                  SizedBox(
                    height: 38.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(13.r),
                        ),
                        backgroundColor: Color(0xFF001A2E),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.tune,
                            color: Colors.white,
                            size: 13.sp,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "Filter",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 17.h),

          // Horizontal Tabs
          Padding(
            padding: EdgeInsets.only(left: 13.0.w, bottom: 8.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(tabs.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      // Update selected index on tab tap
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: buildTab(tabs[index], selectedIndex == index),
                    ),
                  );
                }),
              ),
            ),
          ),

          // Display content based on the selected tab
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: content[selectedIndex], // Show content for selected tab
            ),
          ),
        ],
      ),
    );
  }

  // Function to build each tab
  Widget buildTab(String title, bool isSelected) {
    return Container(
      height: 28.h,
      width: 77.w,

      //   padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 6.w),
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : container, // Tab background color
        borderRadius: BorderRadius.circular(5.r), // Rounded corners
        border: Border.all(
          color: isSelected
              ? buttonColor2
              : Darkcontainer, // Border for selected tab
          width: 0.5.w
          ,
        ),
      ),
      child: Center(
        child: CustomText(
          text: title,
          textColor: Colors.white, // White text color
          fontWeight: FontWeight.bold,
          fontsize: 10.sp,
        ),
      ),
    );
  }
}

class Neurology extends StatelessWidget {
  final SavedItemsController savedItemsController = Get.put(SavedItemsController());

   Neurology({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.74,
        children: [
          // Item 1
          Card(
            color: tapColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r), // Border radius
              side: BorderSide(
                color: Darkcontainer, // Black border color
                width: 1.w, // Border width
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 7.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Stack(
                      // Use a Stack to overlay the icon
                      children: [
                        Image.asset(
                          'assets/images/def.png',
                          fit: BoxFit.cover,
                          height: 100.h,
                          width: double.infinity,
                        ),
                        InkWell(
                          onTap: (){savedItemsController.saveItem(SavedItem(
                            deviceName: 'Defibrillator',
                            deviceImage: 'assets/images/def.png',
                          ));
                          Get.snackbar('Saved', 'Defibrillator added to Save for Later',
                              snackPosition: SnackPosition.TOP);
                            },
                          child: Align(
                            // Position the icon in the top right corner of the image
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 25.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(6.r), // Bottom left corner radius
                                    bottomRight: Radius.circular(6.r), // Bottom right corner radius
                                  ),
                                  color: Color.fromRGBO(18, 26, 0, 0.25)),
                              child: Icon(

                                Icons
                                    .bookmark_border,
                                color: Colors.white,
                                size: 17.sp, // Set the icon size
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomText(
                    text: 'Defibrillator',
                    fontsize: 14.sp,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 5.h),
                  CustomText(
                    text:
                        'life-saving device that delivers electric shocks to the heart....',
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w500,
                    fontsize: 10.sp,
                    textColor: Colors.white,
                  ),
                  Spacer(),
                  SizedBox(
                    width: 154.w,
                    height: 34.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(
                          () => DeviceDetails(
                            deviceName: 'Defibrillator',
                            deviceImage: 'assets/images/def.png',
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: CustomText(
                        text: 'Explore',
                        fontsize: 15.sp,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Item 2
          Card(
            color: tapColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r), // Border radius
              side: BorderSide(
                color: Darkcontainer, // Black border color
                width: 1, // Border width
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 7.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Stack(
                      // Use a Stack to overlay the icon
                      children: [
                        Image.asset(
                          'assets/images/pace.png',
                          fit: BoxFit.cover,
                          height: 100.h,
                          width: double.infinity,
                        ),
                        InkWell(
                          onTap: (){savedItemsController.saveItem(SavedItem(
                            deviceName: 'Pacemaker',
                            deviceImage: 'assets/images/pace.png',
                          ));
                          Get.snackbar('Saved', 'Pacemaker added to Save for Later',
                              snackPosition: SnackPosition.TOP);
                          },
                          child: Align(
                            // Position the icon in the top right corner of the image
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 25.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(6.r), // Bottom left corner radius
                                    bottomRight: Radius.circular(6.r), // Bottom right corner radius
                                  ),
                                  color: Color.fromRGBO(18, 26, 0, 0.25)),
                              child: Icon(
                                // Your bookmark icon
                                Icons
                                    .bookmark_border, // Replace with your desired icon
                                color: Colors.white, // Set the icon color
                                size: 17.sp, // Set the icon size
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomText(
                    text: 'Pacemaker',
                    fontsize: 14.sp,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 5.h),
                  CustomText(
                    text: 'Regulates heartbeats in patients with arrhythmia',
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w500,
                    fontsize: 10.sp,
                    textColor: Colors.white,
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 34.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(
                          () => DeviceDetails(
                            deviceName: 'Pacemaker',
                            deviceImage: 'assets/images/pace.png',
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: CustomText(
                        text: 'Explore',
                        fontsize: 15.sp,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Item 3
          Card(
            color: tapColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r), // Border radius
              side: BorderSide(
                color: Darkcontainer, // Black border color
                width: 1, // Border width
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 7.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.r),
                    child: Stack(
                      // Use a Stack to overlay the icon
                      children: [
                        Image.asset(
                          'assets/images/stheth.png',
                          fit: BoxFit.cover,
                          height: 100.h,
                          width: double.infinity,
                        ),
                        InkWell(
                          onTap: (){savedItemsController.saveItem(SavedItem(
                            deviceName: 'Stethoscope',
                            deviceImage: 'assets/images/stheth.png',
                          ));
                          Get.snackbar('Saved', 'Stethoscope added to Save for Later',
                              snackPosition: SnackPosition.TOP);
                          },
                          child: Align(
                            // Position the icon in the top right corner of the image
                            alignment: Alignment.topRight,
                            child: Container(
                              height: 25.h,
                              width: 25.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(6.r), // Bottom left corner radius
                                    bottomRight: Radius.circular(6.r), // Bottom right corner radius
                                  ),
                                  color: Color.fromRGBO(18, 26, 0, 0.25)),
                              child: Icon(
                                // Your bookmark icon
                                Icons
                                    .bookmark_border, // Replace with your desired icon
                                color: Colors.white, // Set the icon color
                                size: 17.sp, // Set the icon size
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomText(
                    text: 'Stethoscope',
                    fontsize: 14.sp,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 5.h),
                  CustomText(
                    text:
                        'used to listen to heartbeats, lung sounds.',
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w500,
                    fontsize: 10.sp,
                    textColor: Colors.white,
                  ),
                  Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 34.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(
                          () => DeviceDetails(
                            deviceName: 'Stethoscope',
                            deviceImage: 'assets/images/stheth.png',
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 5.h),
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      child: CustomText(
                        text: 'Explore',
                        fontsize: 15.sp,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
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
