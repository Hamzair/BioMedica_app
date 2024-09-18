import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/widget/custom_button.dart';
import 'package:bio_medica/widget/custom_text.dart';
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
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
    child:AppBar(
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
                height: 45.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                            child: SizedBox(
                                height: 38.h,
                                width: 38.h,
                                child: Image.asset('assets/images/back_icon.png',fit: BoxFit.fill,),
                            ),
                        ),
                        SizedBox(
                          width: 7.w,
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
          
              CustomTextField1(
                hintText: 'Merril Kervin',
                prefixIcon: Icons.person,
                hintTextSize: 14.65.sp,
                obscuringCharacter: null,
              ),
              SizedBox(height: 16.25.h),
              CustomTextField1(
                hintText: 'test@gmail.com',
                hintTextSize: 14.65.sp,
                prefixIcon: Icons.email,
              ),
              SizedBox(height: 14.25.h),
              CustomTextField1(
                hintText: '************',
                prefixIcon: Icons.lock,
                obscureText: true,
                obscuringCharacter: '*',
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
class CustomTextField1 extends StatefulWidget {
  final String hintText;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText;
  final String? obscuringCharacter; // Nullable to handle non-password fields
  final double hintTextSize;

  CustomTextField1({
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.obscuringCharacter, // Nullable
    this.hintTextSize = 14,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}


class _CustomTextFieldState extends State<CustomTextField1> {
  late bool _obscureText;
  late String? _obscuringCharacter;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _obscuringCharacter = widget.obscuringCharacter;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 311.w,
      height: 43.75.h,
      child: TextField(
        obscureText: _obscureText,
        obscuringCharacter: _obscuringCharacter ?? '*', // Default to '*' if not specified
        style: TextStyle(color: Color.fromRGBO(19, 64, 100, 1)),
        decoration: InputDecoration(
          filled: true,
          fillColor: Color.fromRGBO(180, 196, 209, 1),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Color.fromRGBO(19, 64, 100, 1),
            fontWeight: FontWeight.w500,
            fontSize: widget.hintTextSize,
            fontFamily:'jost',
          ),
          prefixIcon: Icon(widget.prefixIcon, color: mainTextColor),
          suffixIcon: widget.suffixIcon != null
              ? IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: Color.fromRGBO(19, 64, 100, 1),
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          )
              : null,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13.31.r),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 12.w),
        ),
      ),
    );
  }
}

