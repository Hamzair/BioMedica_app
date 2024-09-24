import 'package:bio_medica/controller/auth_controller.dart';
import 'package:bio_medica/view/auth/login_view/login_view.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/widget/custom_button.dart';
import 'package:bio_medica/widget/custom_route.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/widget/custom_textfield.dart';
import 'package:bio_medica/widget/forgot_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class ResetPasswordView extends StatefulWidget {
  final String? email;
  final String password;

  const ResetPasswordView({super.key, required this.email, required this.password});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final AuthController _authController = Get.put(AuthController());
  bool isChecked = true;
  bool isChecked1 = true;

  final RegExp numberOrSymbolRegExp = RegExp(r'[0-9!@#\$&*~]');
  final RegExp lowerCaseRegExp = RegExp(r'[a-z]');
  final RegExp upperCaseRegExp = RegExp(r'[A-Z]');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus(); // Close the keyboard when tapping outside
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                const ForgetPasswordBackWidget(),
                SizedBox(height: 37.82.h),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "Reset Password",
                        textColor: primaryColor,
                        fontWeight: FontWeight.w700,
                        fontsize: 26.sp,
                      ),
                      SizedBox(height: 74.18.h),
                      CustomText(
                        text: "New Password",
                        textColor: primaryColor,
                        fontWeight: FontWeight.w500,
                        fontsize: 19.sp,
                      ),
                      SizedBox(height: 10.h),
                      Form(
                        child: SizedBox(
                          height: 43.75.h,
                          child: EmailCustomTextFiled(
                            readOnly: false,
                            controller: _authController.newPasswordController.value,
                            hintText: '*********',
                            hintColor: Colors.grey,
                            hintTextSize: 11.sp,
                            onChange: (v) {
                              _authController.update();
                              _authController.refresh();
                              return null;
                            },
                            prefixIcon: AppImages.password,
                            isBorder: true,
                            isPassword: true,
                            isObscure: isChecked,
                            obscuringCharacter: '*',
                            passwordFunction: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                              return null;
                            },
                            borderRadius: 13.sp,
                            fillColor: transparentColor,
                            beforePasswordIcon: Icons.visibility_off_outlined,
                            afterPasswordIcon: Icons.visibility,
                          ),
                        ),
                      ),
                      SizedBox(height: 25.25.h),
                      GetBuilder<AuthController>(builder: (_authController) {
                        bool containsNumberOrSymbol =
                        numberOrSymbolRegExp.hasMatch(
                            _authController.newPasswordController.value.text);
                        bool containsLowerCase = lowerCaseRegExp.hasMatch(
                            _authController.newPasswordController.value.text);
                        bool containsUpperCase = upperCaseRegExp.hasMatch(
                            _authController.newPasswordController.value.text);
                        bool containsBoth =
                            containsLowerCase && containsUpperCase;
                        double checks = (containsNumberOrSymbol ? 0.5 : 0) +
                            (containsLowerCase ? 0.5 : 0) +
                            (containsUpperCase ? 0.5 : 0) +
                            (_authController.newPasswordController.value.length >= 8
                                ? 2
                                : 0);

                        double password_strength = (checks / 4);
                        return LinearProgressIndicator(
                          value: password_strength,
                          backgroundColor: Colors.grey[300],
                          minHeight: 5,
                          color: password_strength <= 1 / 4
                              ? Colors.red
                              : password_strength == 2 / 4
                              ? Colors.yellow
                              : password_strength == 3 / 4
                              ? Colors.blue
                              : Colors.green,
                        );
                      }),
                      SizedBox(height: 12.25.h),
                      GetBuilder<AuthController>(builder: (_authController) {
                        bool containsLowerCase = lowerCaseRegExp.hasMatch(
                            _authController.newPasswordController.value.text);
                        bool containsUpperCase = upperCaseRegExp.hasMatch(
                            _authController.newPasswordController.value.text);
                        bool containsBoth =
                            containsLowerCase && containsUpperCase;
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _authController.newPasswordController.value.length >= 8
                                    ? Image.asset(
                                  AppImages.tickIcon,
                                  height: 9.6.h,
                                  width: 13.w,
                                  color: primaryColor,
                                )
                                    : const CircleAvatar(
                                  radius: 4,
                                  backgroundColor: primaryColor,
                                ),
                                SizedBox(width: 6.w),
                                CustomText(
                                  text: "Least 8 characters".tr,
                                  fontsize: 12.25.sp,
                                  textColor: _authController.newPasswordController.value.length >= 8
                                      ? primaryColor
                                      : Colors.grey,
                                  fontWeight: FontWeight.w500,
                                )
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                numberOrSymbolRegExp.hasMatch(
                                    _authController.newPasswordController.value.text)
                                    ? Image.asset(
                                  AppImages.tickIcon,
                                  height: 9.6.h,
                                  width: 13.w,
                                  color: primaryColor,
                                )
                                    : const CircleAvatar(
                                  radius: 4,
                                  backgroundColor: primaryColor,
                                ),
                                SizedBox(width: 6.w),
                                CustomText(
                                  text: "Least one number (0-9) or symbol".tr,
                                  fontsize: 12.25.sp,
                                  textColor: numberOrSymbolRegExp.hasMatch(
                                      _authController.newPasswordController.value.text)
                                      ? primaryColor
                                      : Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                containsBoth
                                    ? Image.asset(
                                  AppImages.tickIcon,
                                  height: 9.6.h,
                                  width: 13.w,
                                  color: primaryColor,
                                )
                                    : const CircleAvatar(
                                  radius: 4,
                                  backgroundColor: primaryColor,
                                ),
                                SizedBox(width: 6.w),
                                CustomText(
                                  text: "Lowercase (a-z) and uppercase (A-Z)".tr,
                                  fontsize: 12.25.sp,
                                  textColor: containsBoth ? primaryColor : Colors.grey,
                                  fontWeight: FontWeight.w500,
                                ),
                              ],
                            ),
                          ],
                        );
                      }),
                      SizedBox(height: 25.34.h),
                      CustomText(
                        text: "Confirm Password",
                        textColor: primaryColor,
                        fontWeight: FontWeight.w500,
                        fontsize: 17.sp,
                      ),
                      SizedBox(height: 10.h),
                      SizedBox(
                        height: 43.75.h,
                        child: EmailCustomTextFiled(
                          readOnly: false,
                          controller: _authController.confirmPasswordController.value,
                          hintText: '*********',
                          hintColor: Colors.grey,
                          hintTextSize: 11.sp,
                          prefixIcon: AppImages.password,
                          isBorder: true,
                          isPassword: true,
                          obscuringCharacter: '*',
                          isObscure: isChecked1,
                          passwordFunction: () {
                            setState(() {
                              isChecked1 = !isChecked1;
                            });
                            return null;
                          },
                          borderRadius: 13.sp,
                          fillColor: transparentColor,
                          beforePasswordIcon: Icons.visibility_off_outlined,
                          afterPasswordIcon: Icons.visibility,
                        ),
                      ),
                      SizedBox(height: 42.25.h),
                      CustomButton(
                        height: 51.h,
                        title: "Reset Password",
                        textSize: 19.sp,
                        onTap: () {
                          if (_authController.newPasswordController.value.text ==
                              _authController.confirmPasswordController.value.text) {
                            CustomRoute1.navigateAndRemoveUntil(
                                context,
                                const LoginView(),
                                    (route) => false);
                          } else {
                            Get.snackbar("Error", "Passwords do not match",
                                colorText: Colors.white);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
