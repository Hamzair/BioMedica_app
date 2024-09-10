import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/widget/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(13.r),bottomRight: Radius.circular(13.r))),
          centerTitle: true,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 12.w,
                  ),
                  SizedBox(
                      height: 38.h,
                      width: 38.w,
                      child: Image.asset(AppImages.drawer)),
                  SizedBox(
                    width: 12.w,
                  ),
                  CustomSearch(),
                  SizedBox(
                    width: 12.w,
                  ),
                  Container(
                    width: 35.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(13.r)),
                    child: Icon(
                      Icons.notifications,
                      color: Color(0xffBDD0EA),
                    ),
                  )
                ],
              ),
            ],
          ),
          backgroundColor: secondaryColor,
        ),
        body: Column(
          children: [],
        ));
  }
}
