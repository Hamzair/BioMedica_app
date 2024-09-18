import 'package:bio_medica/controller/selected_type_controller.dart';
import 'package:bio_medica/view/auth/signup_view/signup_view.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/widget/custom_route.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/widget/forgot_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'forgot_phone_number.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final selectedTypeController = Get.put(SelectedTypeController());
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  int tappedContainerIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 10.h,
          ),
          const ForgetPasswordBackWidget(),
          SizedBox(height:25.h),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Forgot password?",
                  fontsize: 24.sp,
                  textColor: Color.fromRGBO(19, 64, 100, 1),
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(
                  height: 8.h,
                ),
                CustomText(
                  text: "Please choose a method to request a \npassword reset.",
                  fontsize: 16.sp,
                  textColor: const Color(0xff6B7280),
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(
                  height: 25.h,
                ),
                GestureDetector(
                  onTap: () {
                    CustomRoute.navigateTo(
                        context, const ForgetPasswordEmailPhoneView());

                    setState(() {
                      tappedContainerIndex = 1;
                      selectedTypeController.changeSelectedType('email');
                    });
                  },
                  child: Container(
                    height: 73.h,
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: tappedContainerIndex == 1
                                ? Colors.transparent
                                : const Color(0xffEEEFF2)),
                        color: tappedContainerIndex == 1
                            ? buttonColor
                            : Colors.transparent,
                        //Color(0xffF9FAFB),

                        borderRadius: BorderRadius.circular(11.38.r)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.7.w),
                          child: Row(
                            children: [
                              Container(
                                  height: 38.h,
                                  width: 38.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(9)),
                                  child: Image.asset(AppImages.email,
                                      color: tappedContainerIndex == 1
                                          ? primaryColor
                                          : const Color(0xff9CA3AF),
                                      scale: 2.2)),
                              SizedBox(
                                width: 15.7.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Your email",
                                    fontsize: 13.27.sp,
                                    textColor: const Color(0xff111827),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CustomText(
                                    text: "Enter your email",
                                    fontsize: 11.38.sp,
                                    textColor: const Color(0xff6B7280),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 17,
                                color: Color(0xff6B7280),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 11.38.h,
                ),
                GestureDetector(
                  onTap: () {
                    CustomRoute.navigateTo(
                        context, const ForgetPasswordEmailPhoneView());
                    setState(() {
                      tappedContainerIndex = 2;
                      selectedTypeController.changeSelectedType('phone');
                    });
                  },
                  child: Container(
                    height: 73.h,
                    padding: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: tappedContainerIndex == 2
                                ? Colors.transparent
                                : const Color(0xffEEEFF2)),
                        color: tappedContainerIndex == 2
                            ? buttonColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15.7.w),
                          child: Row(
                            children: [
                              Container(
                                  height: 38.h,
                                  width: 38.w,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(9)),
                                  child: Image.asset(
                                    // fit: BoxFit.fill,
                                    AppImages.phone,
                                    color: tappedContainerIndex == 2
                                        ? primaryColor
                                        : const Color(0xff9CA3AF),
                                    scale: 2.6,
                                  )),
                              SizedBox(
                                width: 15.17.w,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: "Phone number",
                                    fontsize: 13.27.sp,
                                    textColor: const Color(0xff111827),
                                    fontWeight: FontWeight.w600,
                                  ),
                                  CustomText(
                                    text: "Enter your phone number",
                                    fontsize: 11.38.sp,
                                    textColor: const Color(0xff6B7280),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              const Spacer(),
                              const Icon(
                                Icons.arrow_forward_ios_outlined,
                                size: 17,
                                color: Color(0xff6B7280),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              CustomRoute.navigateTo(context, const SignupView());
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  text: "Don't have an account?",
                  textColor: primaryColor,
                  fontWeight: FontWeight.w500,
                  fontsize: 15,
                ),
                SizedBox(
                  width: 5.w,
                ),
                CustomText(
                  text: "Sign Up",
                  textColor: buttonColor2,
                  fontWeight: FontWeight.w600,
                  fontsize: 15,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      )),
    );
  }
}
