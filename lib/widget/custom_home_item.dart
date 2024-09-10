import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class CustomHomeItem extends StatelessWidget {
  final String text;
  final String imagePath;
  final Color buttonColor;
  final Color textColor;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback onTap;

  CustomHomeItem({
    required this.text,
    required this.imagePath,
    required this.buttonColor,
    required this.textColor,
    required this.fontSize,
    required this.fontWeight,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Define the onTap behavior
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),

            child: Row(
              children: [
                SizedBox(
                  height: 32.h,
                  width: 32.w,
                  child: Image.asset(
                    imagePath,
                    color: buttonColor,
                  ),
                ),
                SizedBox(width: 14.w),
                CustomText(
                  maxLines: 2,
                  text: text,
                  textColor: textColor,
                  fontsize: fontSize,
                  fontWeight: fontWeight,
                ),
              ],
            ),
          ),
          Divider(
            color: Color(0xff001C31),
            thickness: 1.5,
          ),
        ],
      ),
    );
  }
}
