import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;

  CustomAppBar({required this.name});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(60.0.h),  // You can replace this with your dynamic height if needed
      child: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(13.0.r),
            bottomRight: Radius.circular(13.0.r),
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        flexibleSpace: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 5.0.h),
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      width: MediaQuery.of(context).size.width < 360 ? 30.0 : 38.0,
                      height: MediaQuery.of(context).size.width < 360 ? 30.0 : 38.0,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          'assets/images/back_icon.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: 12.0.w
                    ),
                    CustomText(
                      text:  name,

                     textColor: Darkcontainer,
                      fontWeight: FontWeight.bold,
                      fontsize: 20.sp,

                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        backgroundColor: secondaryColor,  // Replace with your secondaryColor
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0.h);  // Return your desired height here
}
