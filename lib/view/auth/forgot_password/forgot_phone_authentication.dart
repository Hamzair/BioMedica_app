import 'package:bio_medica/controller/selected_type_controller.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/widget/custom_button.dart';
import 'package:bio_medica/widget/custom_route.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/widget/forgot_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'forgot_reset.dart';

class PhoneNumberAuthenticationView extends StatefulWidget {
  const PhoneNumberAuthenticationView({super.key});

  @override
  State<PhoneNumberAuthenticationView> createState() =>
      _PhoneNumberAuthenticationViewState();
}

class _PhoneNumberAuthenticationViewState
    extends State<PhoneNumberAuthenticationView> {
  TextEditingController controller = TextEditingController();
  final selectedTypeController = Get.put(SelectedTypeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              const ForgetPasswordBackWidget(),
              SizedBox(
                height: 25.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Authentication Code",
                      textColor: primaryColor,
                      fontWeight: FontWeight.w700,
                      fontsize: 26.sp,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomText(
                      text: selectedTypeController.selectedType.value == 'email'
                          ? "Enter 5-digit code for reset password we just\ntexted to your phone number, test@gmail.com"
                          : "Enter 5-digit code for reset password we just\ntexted to your phone number, +1 8976889043",
                      fontsize: 12.sp,
                      textColor: Color(0xff6B7280),
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    PinCodeTextField(
                      appContext: context,
                      length: 5,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.scale,
                      controller: controller,
                      pinTheme: PinTheme(
                          borderRadius: BorderRadius.circular(11.38.r),
                          borderWidth: 1,
                          activeFillColor: primaryColor,
                          shape: PinCodeFieldShape.box,
                          activeColor: primaryColor,
                          selectedColor: primaryColor,
                          inactiveColor: Colors.white,
                          fieldHeight: 53.h,
                          fieldWidth: 53.w),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomText(
                      text: selectedTypeController.selectedType.value == 'email'
                          ? 'Use different email address'
                          : "Use different phone number",
                      fontsize: 15.sp,
                      textColor: primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                    SizedBox(
                      height: 46.32.h,
                    ),
                    CustomButton(
                        height: 51.h,
                        title: "Continue",
                        textSize: 19.sp,
                        onTap: () {
                          CustomRoute.navigateTo(context,const ResetPasswordView(email: '', password: '',));
                        }),
                    SizedBox(
                      height: 12.25.h,
                    ),
                    CustomButton(
                        height: 51,
                        title: "Resend Code",
                        textSize: 19.sp,
                        color: transparentColor,
                        titleColor: primaryColor,
                        onTap: () {}),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
