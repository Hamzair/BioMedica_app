import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/view/profile/profile_screen.dart';
import 'package:bio_medica/widget/custom_button.dart';
import 'package:bio_medica/widget/custom_search.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(13.r),
                  bottomRight: Radius.circular(13.r))),
          centerTitle: true,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                            child: Image.asset('assets/images/backArrow.png')),
                        SizedBox(
                          width: 1.w,
                        ),
                        CustomText(
                          text: "Settings",
                          textColor: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontsize: 22.sp,
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
          backgroundColor: secondaryColor,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 44.h),
              /// Profile Image And Camera Icon
              Align(alignment: Alignment.center,
                child: Container(
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 120.h,
                        width: 120.w,
                        child: CircleAvatar(
                          backgroundImage: AssetImage('assets/images/profile_image.png'),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: (){},
                          child: CircleAvatar(
                            backgroundColor: buttonColor2,
                            child: SizedBox(
                                width:23.w,
                                height:20.7.h,
                                child: Image(image: AssetImage("assets/images/camera_icon.png"))),
          
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height:56.h),
          
              CustomTextField(
                hintText: 'Username',
                prefixIcon: Icons.person,
                hintTextSize: 14.65.sp,
              ),
              SizedBox(height: 16.25.h),
              CustomTextField(
                hintText: 'Email',
                hintTextSize: 14.65.sp,
                prefixIcon: Icons.email,
              ),
              SizedBox(height: 14.25.h),
              CustomTextField(
                hintText: 'Password',
                prefixIcon: Icons.lock,
                obscureText: true,
                suffixIcon: Icons.visibility,
                hintTextSize: 14.65.sp,
              ),
              SizedBox(height: 50.25.h),
              /// Button Save Changes
              SizedBox(
                  width:311.w ,
                  height: 51.h,
                  child: CustomButton(
                    title: 'Save changes',
                    textSize: 19.sp,
                    onTap: (){},color: buttonColor,)),
          
            ],
          ),
        )
    );
  }
}

/// Text field State
class CustomTextField extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final double hintTextSize;

  CustomTextField({
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.hintTextSize = 14, // Default hint text size
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}
/// text Field Design
class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText;

  _CustomTextFieldState() : _obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 43.75,
      child: TextField(
        obscureText: widget.obscureText ? _obscureText : false,
        style: TextStyle(color: mainTextColor,),
        decoration: InputDecoration(
          filled: true,
          fillColor: secondaryColor,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: mainTextColor,fontWeight: FontWeight.bold),
          prefixIcon: Icon(widget.prefixIcon, color: mainTextColor),
          suffixIcon: widget.suffixIcon != null
              ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: mainTextColor,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13.31),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        ),
      ),
    );
  }
}