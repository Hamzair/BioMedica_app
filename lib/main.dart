import 'package:bio_medica/drawer%20items/progress.dart';
import 'package:bio_medica/view/course/courses.dart';
import 'package:bio_medica/view/course/quiz.dart';

import 'package:bio_medica/view/home_Screen/home_screen.dart';
import 'package:bio_medica/view/navbar/nav_bar.dart';
import 'package:bio_medica/view/tech_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'controller/subscription_controller.dart';
import 'view/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
  Get.put(SubscriptionService());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (_, child) {
          return GetMaterialApp(
              title: 'Bio Medica',
              debugShowCheckedModeBanner: false,
              home:SplashScreen(),
              // initialBinding: UserBinding(),
              );
        });
  }
}


// Container(
//   height: 300.h,
//   margin: EdgeInsets.only(bottom: 10.h),
//   child: GridView.builder(
//     physics: NeverScrollableScrollPhysics(),
//     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//       crossAxisCount: 4, // 4 columns
//       crossAxisSpacing: 10,
//       mainAxisSpacing: 10,
//       childAspectRatio: 0.9,
//     ),
//     padding: EdgeInsets.all(10.r),
//     itemCount: gridItems.length +
//         2, // Increase by 2 for the two empty containers
//     itemBuilder: (context, index) {
//       // Empty container at index 8
//       if (index == 8) {
//         return Container(); // Empty container at index 8
//       }
//
//       // Empty container at the last index
//       if (index == gridItems.length + 1) {
//         return Container(); // Empty container at the end
//       }
//
//       // Adjust the index to account for the empty container at index 8
//       final adjustedIndex = index > 8 ? index - 1 : index;
//       final item = gridItems[adjustedIndex];
//
//       return GestureDetector(
//         onTap: () {
//           if (item['locked'] == true) {
//             // Show some message if item is locked
//             Get.snackbar(
//                 'Locked', 'Buy Premium to unlock this feature.',
//                  backgroundColor: primaryColor,
//                 colorText: Colors.white);
//           } else {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) =>
//                     item['page'] ?? const SizedBox.shrink(),
//               ),
//             );
//           }
//         },
//         child: Stack(
//           children:[ Container(
//             width: 80.w,
//             decoration: BoxDecoration(
//               border: Border.all(
//                 color: Colors.black,
//                 width: 1.w,
//               ),
//               color: container,
//               borderRadius: BorderRadius.circular(5.r),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset(
//                   item['image'],
//                   height: 42.h,
//                   width: 43.w,
//                 ),
//                 SizedBox(height: 5.h),
//                 CustomText(
//                   text: item['title'],
//                   textAlign: TextAlign.center,
//                   textColor: Colors.white,
//                   fontsize: 12.sp,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ],
//             ),
//           ),
//             if (item['locked'] == true)
//               Positioned.fill(
//                 child: Container(
//                   color: Colors.black.withOpacity(0.5),
//                   child: Stack(
//                     children: [
//
//                       Positioned(
//                         top: 5,
//                         right: 5, // Position it to the top right corner
//                         child: Image.asset(
//                           'assets/images/lock.png',
//                           height: 15.h, // Adjust the height of the lock icon as per your design
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//        ]
//         ),
//
//       );
//     },
//   ),
// ),
