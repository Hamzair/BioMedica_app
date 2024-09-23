import 'package:bio_medica/controller/nav_bar_controller.dart';
import 'package:bio_medica/view/course/courses.dart';
import 'package:bio_medica/view/homeOptions/DeviceLibrary/deviceDetails.dart';
import 'package:bio_medica/view/navbar/nav_bar.dart';
import 'package:bio_medica/view/splash_screen/splash_screen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'controller/subscription_controller.dart';
import 'drawer items/saveitems/save_controller.dart';


void main() {
  runApp( MyApp());
  Get.put(SubscriptionService());
  Get.put(SavedItemsController());
  Get.put(NavBarController());
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
              home:AppNavBar(),
              // initialBinding: UserBinding(),
              );
        });
  }
}



