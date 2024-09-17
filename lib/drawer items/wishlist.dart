import 'package:bio_medica/main.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/profile/edit_profile_screen.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/nav_bar_controller.dart';
import 'drawer.dart';

class Wishlist extends StatelessWidget {
  Wishlist({super.key});
  final NavBarController navBarController=Get.put(NavBarController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   drawer:  AppDrawer(),
   //    key: navBarController.scaffoldKey,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 38.w,
                          height: 38.h,
                          child: GestureDetector(
                            onTap: (){
                              // Open the drawer using the scaffold key
                              navBarController.scaffoldKey.currentState?.openDrawer();
                            },
                            child: GestureDetector(
                                onTap: (){Navigator.pop(context);},
                                child: Image.asset('assets/images/back_icon.png'))
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        CustomText(
                          text: "Wishlist",
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
      body: Center(child: CustomText(text: 'No Wishlist', textColor: Colors.white, fontWeight: FontWeight.bold,fontsize: 25.sp,),),
    );
  }
}
