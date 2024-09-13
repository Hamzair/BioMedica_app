import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ArticleDetail extends StatelessWidget {
  const ArticleDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
     
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(100.h),
      //   child: AppBar(
      //     shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.only(
      //             bottomLeft: Radius.circular(13.r),
      //             bottomRight: Radius.circular(13.r))),
      //     centerTitle: true,
      //     automaticallyImplyLeading: false,
      //     flexibleSpace: Column(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         SizedBox(
      //           height: 30.h,
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Row(
      //                 children: [
      //                   GestureDetector(
      //                       onTap: () {
      //                         Get.back();
      //                       },
      //                       child:
      //                       Image.asset('assets/images/back_icon.png')),
      //                   SizedBox(
      //                     width: 12.w,
      //                   ),
      //                   CustomText(
      //                     text: "Artical Detail",
      //                     textColor: primaryColor,
      //                     fontWeight: FontWeight.bold,
      //                     fontsize: 22.sp,
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //     backgroundColor: secondaryColor,
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Show the image if available
        
            Stack(
                children:[ SizedBox(
                    width: double.infinity,
                    child: Image.asset('assets/images/laptopBig.png')),
                  Positioned(
                      top: 40,
                      left: 10,
                      child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Image.asset('assets/images/back_icon.png')))
                ] ),
            SizedBox(height: 16.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomText(
                  text:    'Breakthrough in Wearable Cardiac Monitors',
                  fontsize: 22.sp, fontWeight: FontWeight.w600,textColor: whiteColor
              ),
            ),
            // Show the headline
            Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                  decoration: BoxDecoration(
                      color: tapColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black,width: 1)
                  ),
                  height: 300.h,
                  width: double.infinity,
        
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        CustomText(
                            text:     "Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data...",
                            fontsize: 16.sp, fontWeight: FontWeight.w500,textColor: whiteColor
                        ),
                        SizedBox(height: 16.h),
                        // Show the full article content
                        CustomText(
                            text:     "Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data...",
                            fontsize: 16.sp, fontWeight: FontWeight.w500,textColor: whiteColor
                        ),
                      ],
                    ),
                  )
              ),
            ),
        
        
          ],
        ),
      ),

    );
  }
}
