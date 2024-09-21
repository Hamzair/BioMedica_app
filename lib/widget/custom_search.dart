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

        child: TextField(
          style: TextStyle(color: Colors.white),
          focusNode: focusNode,
          // textAlign: TextAlign.start,
          decoration: InputDecoration(
            fillColor: Color.fromRGBO(0, 26, 46, 1),
            filled: true,
            contentPadding: EdgeInsets.symmetric(),
            prefixIcon: Image.asset(
              AppImages.search,
            ),
            hintText: 'Search for anything',
            hintStyle: TextStyle(
              color: secondaryColor,
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
