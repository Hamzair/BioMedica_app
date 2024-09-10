import 'package:bio_medica/view/const/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../view/const/color.dart';
import 'custom_text.dart';

class ForgetPasswordBackWidget extends StatelessWidget {
  const ForgetPasswordBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 25.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Row(
              children: [
                Image.asset(
                  color: buttonColor2,
                  AppImages.bigArrow,
                  scale: 1.2,
                ),
                Image.asset(
                  color: buttonColor2,
                  AppImages.bigArrow,
                  scale: 1.9,
                ),
                CustomText(
                  text: "  Back",
                  textColor: buttonColor2,
                  fontWeight: FontWeight.bold,
                  fontsize: 20.sp,
                )
              ],
            ),
          ),
        ),
        Container(
          height: 0.4.h,
          width: double.infinity,
          color: Colors.grey.withOpacity(0.2),
        )
      ],
    );
  }
}
