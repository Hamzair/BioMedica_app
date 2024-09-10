import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'custom_home_item.dart';
import 'custom_route.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // GlobalKey<NavigatorState> navigate = GlobalKey<NavigatorState>();
    return SafeArea(
      child: Drawer(
          backgroundColor: drawerBg,
          child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Container(
                  margin:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 22.h),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 53.w,
                            height: 53.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: secondaryColor),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          CustomText(
                            maxLines: 2,
                            text: 'Merril Kervin',
                            textColor: whiteColor,
                            fontsize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Color(0xff001C31),
                  thickness: 1.5,
                ),
                CustomHomeItem(
                  text: 'Home',
                  imagePath: AppImages.homeIcon,
                  buttonColor: buttonColor,
                  textColor: whiteColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    // Define what happens when tapped
                    print('Home tapped');
                    // You can navigate to another screen or execute any function
                  },
                ),
                CustomHomeItem(
                  text: 'Wishlist',
                  imagePath: AppImages.wishlist,
                  buttonColor: buttonColor,
                  textColor: whiteColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    // Define what happens when tapped
                    print('Home tapped');
                    // You can navigate to another screen or execute any function
                  },
                ),
                CustomHomeItem(
                  text: 'Subscriptions',
                  imagePath: AppImages.subscription,
                  buttonColor: buttonColor,
                  textColor: whiteColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    // Define what happens when tapped
                    print('Home tapped');
                    // You can navigate to another screen or execute any function
                  },
                ),
                CustomHomeItem(
                  text: 'Progress Tracking',
                  imagePath: AppImages.progresstracking,
                  buttonColor: buttonColor,
                  textColor: whiteColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    // Define what happens when tapped
                    print('Home tapped');
                    // You can navigate to another screen or execute any function
                  },
                ),
                CustomHomeItem(
                  text: 'Online Support',
                  imagePath: AppImages.support,
                  buttonColor: buttonColor,
                  textColor: whiteColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    // Define what happens when tapped
                    print('Home tapped');
                    // You can navigate to another screen or execute any function
                  },
                ),
                CustomHomeItem(
                  text: 'Privacy Policy',
                  imagePath: AppImages.privacypolicy,
                  buttonColor: buttonColor,
                  textColor: whiteColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  onTap: () {
                    // Define what happens when tapped
                    print('Home tapped');
                    // You can navigate to another screen or execute any function
                  },
                ),
                SizedBox(
                  height: 50.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 29.w),
                  child: Row(
                    children: [
                      SizedBox(
                          height: 51.h,
                          width: 41.w,
                          child: Image.asset(AppImages.logout)),
                      SizedBox(
                        width: 15.w,
                      ),
                      CustomText(
                        text: 'Logout',
                        textColor: whiteColor,
                        fontWeight: FontWeight.w700,
                        fontsize: 24.sp,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 50.h,
                ),
              ]))),
    );
  }
}
