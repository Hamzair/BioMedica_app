import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearch extends StatelessWidget {
  final FocusNode? focusNode;

  const CustomSearch({Key? key, this.focusNode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Unfocus the text field when tapping outside
        FocusScope.of(context).unfocus();
      },
      child: SizedBox(
        width: 237.w,
        height: 42.h,
        // padding: EdgeInsets.symmetric(horizontal: 4.w),
        // decoration: BoxDecoration(
        //   color: Colors.white,
        //   borderRadius: BorderRadius.circular(12.r),
        //   border: Border.all(color: containerBorder, width: 1),
        // ),
        child: TextField(
          style: TextStyle(color: Colors.white),
          focusNode: focusNode,
          // textAlign: TextAlign.start,
          decoration: InputDecoration(
            fillColor: primaryColor,
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
    );
  }
}
