import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.h),
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
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child:
                              SizedBox(
                                height: 38.h,
                                width: 38.h,
                                child: Image.asset('assets/images/back_icon.png',fit: BoxFit.fill,),
                              ),
                          ),
                          SizedBox(
                            width: 12.w,
                          ),
                          CustomText(
                            text: "Privacy Policy",
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
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 7.h),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 105.w,
                    height: 112.h,
                    child: Image.asset(
                        'assets/images/biomedica_image_privacy_policy.png'),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: 'Privacy Policy',
                    textColor: buttonColor,
                    fontWeight: FontWeight.w600,
                    fontsize: 22.sp,
                  ),
                ),
                SizedBox(height: 7.h),
                Container(
                  // height: 538.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: tapColor,
                    borderRadius: BorderRadius.circular(5.69.r),
                    border: Border.all(
                      color: Darkcontainer, // Set the border color to dark blue
                      width: 1.0.w, // Adjust the border width as needed
                    ),
                  ),

                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomText(
                      text:
                          "Lorem ipsum dolor sit amet Consectetur adipiscing elit. Natoque phasellus lobortis mattis cursus faucibus hac proin risus. Turpis phasellus massa ullamcorper volutpat.\n Ornare commodo non integer fermentum nisi, morbi id. \n\nVel tortor mauris feugiat amet, maecenas facilisis risus, in faucibus. Vestibulum ullamcorper fames eget enim diam fames faucibus duis ac. Aliquam non tellus semper in dignissim nascetur venenatis lacus. Lectus vel non varius interdum vel tellus sed mattis. Sit laoreet auctor arcu mauris tincidunt sociis tristique pharetra neque. Aliquam pharetra elementum nisl sapien. Erat nisl morbi eu dolor in. Sapien ut lacus dui libero morbi tristique. Sit praesent mi, dolor, magna in pellentesque sollicitudin odio sed. \n\nSit nibh aliquam enim ipsum lectus sem fermentum congue velit. Purus habitant odio in morbi aliquet velit pulvinar. Facilisis ut amet interdum pretium. Fames pretium eget orci facilisis mattis est libero facilisis ullamcorper. Est auctor amet egestas risus libero et. Auctor faucibus sit id fringilla vitae. Ac volutpat sodales tristique ut netus turpis. Lorem ipsum dolor sit amet, consectetur Lorem ipsum dolor sit amet Consectetur adipiscing elit. Natoque phasellus lobortis mattis cursus faucibus hac proin risus. Turpis phasellus massa ullamcorper volutpat.\n Ornare commodo non integer fermentum nisi, morbi id. \n\nVel tortor mauris feugiat amet, maecenas facilisis risus, in faucibus. Vestibulum ullamcorper fames eget enim diam fames faucibus duis ac. Aliquam non tellus semper in dignissim nascetur venenatis lacus. Lectus vel non varius interdum vel tellus sed mattis. Sit laoreet auctor arcu mauris tincidunt sociis tristique pharetra neque. Aliquam pharetra elementum nisl sapien. Erat nisl morbi eu dolor in. Sapien ut lacus dui libero morbi tristique. Sit praesent mi, dolor, magna in pellentesque sollicitudin odio sed. \n\nSit nibh aliquam enim ipsum lectus sem fermentum congue velit. Purus habitant odio in morbi aliquet velit pulvinar. Facilisis ut amet interdum pretium. Fames pretium eget orci facilisis mattis est libero facilisis ullamcorper. Est auctor amet egestas risus libero et. Auctor faucibus sit id fringilla vitae. Ac volutpat sodales tristique ut netus turpis. Lorem ipsum dolor sit amet, consectetur",
                      textColor: Color.fromRGBO(255, 255, 255, 1),
                      fontWeight: FontWeight.w300,
                      fontsize: 11.sp,
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
