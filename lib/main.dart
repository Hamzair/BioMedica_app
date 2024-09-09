import 'package:bio_medica/course_details.dart';
import 'package:bio_medica/view/courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'view/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
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
             home: CoursesScreen()
            // initialBinding: UserBinding(),
          );
        });
  }
}
