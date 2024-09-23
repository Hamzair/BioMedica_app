import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'custom_text.dart';

class ArticleCard extends StatelessWidget {
  final String title;
  final String image;
  final String description;
  final String buttonText;
  final Function() onTap;

  const ArticleCard({
    Key? key,
    required this.title,
    required this.image,
    required this.description,
    required this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Replace `container` with your custom color
        borderRadius: BorderRadius.circular(13.r),
        border: Border.all(color: Colors.black, width: 1), // Replace `Darkcontainer`
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 18.0.w, top: 16.h, right: 18.w, bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: title,
                  textColor: Colors.blue, // Replace with `buttonColor`
                  fontWeight: FontWeight.w600,
                  fontsize: 17.sp,
                ),
                GestureDetector(
                  onTap: () {},
                  child: CustomText(
                    text: buttonText,
                    textColor: Colors.red, // Replace with `buttonColor2`
                    fontWeight: FontWeight.w600,
                    fontsize: 15.sp,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Stack(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 12.w, top: 9.h, bottom: 10.h),
                          width: 249.w,
                          decoration: BoxDecoration(
                            color: Colors.white, // Replace `container`
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: Colors.black, width: 0.5),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: description,
                                textColor: Colors.grey, // Replace with `secondaryColor`
                                fontWeight: FontWeight.w600,
                                fontsize: 14.sp,
                              ),
                              SizedBox(height: 8.h),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.asset(
                                  image,
                                  height: 133.h,
                                  width: 215.w,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topLeft,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Discover the latest advancements in wearable cardiac monitors...',
                                      style: TextStyle(
                                        color: Colors.grey, // Replace with `secondaryColor`
                                        fontWeight: FontWeight.w400,
                                        fontSize: 11.sp,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Read more',
                                      style: TextStyle(
                                        color: Color.fromRGBO(12, 192, 223, 1),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11.sp,
                                      ),
                                      recognizer: TapGestureRecognizer()..onTap = onTap,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
