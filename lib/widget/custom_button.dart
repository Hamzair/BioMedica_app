import 'package:bio_medica/view/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


class CustomButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  final double? width;
  final double? textSize;
  final double? radius;
  final double? height;
  final Color? color;
  final Color? titleColor;
  const CustomButton(
      {super.key,
        required this.title,
        required this.onTap,
        this.loading = false,
        this.width,
        this.height,
        this.radius,
        this.textSize,
        this.color,
        this.titleColor});
  // final _controller=Get.put(BackendController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
          height: height ?? 6.h,
          width: width,
          decoration: BoxDecoration(
            color: color ?? primaryColor,

            borderRadius: BorderRadius.circular(radius ?? 13.sp),
            // border: Border.all(
            //   color: primaryColor,
            //   width: 1
            // )
          ),
          child: Center(
            child: loading == true
                ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(
                color: whiteColor,
              ),
            )
                : Text(
              title,
              style: GoogleFonts.jost(
                  color: titleColor ?? whiteColor,

                  fontSize: textSize,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ));
  }
}
