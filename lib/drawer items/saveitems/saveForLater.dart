import 'package:bio_medica/drawer%20items/saveitems/save_controller.dart';
import 'package:bio_medica/main.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/profile/edit_profile_screen.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controller/nav_bar_controller.dart';
import '../../view/homeOptions/DeviceLibrary/deviceDetails.dart';
import '../drawer.dart';

class Saveforlater extends StatelessWidget {
  Saveforlater({super.key});
  final NavBarController navBarController = Get.put(NavBarController());
  final SavedItemsController savedItemsController = Get.find<SavedItemsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 45.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            'assets/images/back_icon.png',
                            height: 31.h,
                          ),
                        ),
                        SizedBox(
                          width: 7.w,
                        ),
                        CustomText(
                          text: "Saved Items",
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
        ),
      ),
      body: Obx(() {
        if (savedItemsController.savedItems.isEmpty) {
          return Center(child: Text('No items saved.'));
        }
        return GridView.builder(
          padding: EdgeInsets.all(10.w),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 10.w, // Spacing between the items horizontally
            mainAxisSpacing: 0.h,  // Spacing between the items vertically
            childAspectRatio: 0.9, // Adjust this ratio based on how you want the items to look
          ),
          itemCount: savedItemsController.savedItems.length,
          itemBuilder: (context, index) {
            final item = savedItemsController.savedItems[index];
            return  Card(
              color: tapColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.r), // Border radius
                side: BorderSide(
                  color: Darkcontainer, // Black border color
                  width: 1, // Border width
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
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
                           item.deviceImage,
                            fit: BoxFit.cover,
                            height: 100.h,
                            width: double.infinity,
                          ),

                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    CustomText(
                      text: item.deviceName,
                      fontsize: 14.sp,
                      textColor: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 5.h),

                    Spacer(),
                    SizedBox(
                      width: double.infinity,
                      height: 34.h,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(
                                () => DeviceDetails(
                              deviceName: item.deviceName,
                              deviceImage: item.deviceImage,
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
            );
          },
        );
      }),
    );
  }
}

class SavedItem {
  final String deviceName;
  final String deviceImage;

  SavedItem({required this.deviceName, required this.deviceImage});
}
