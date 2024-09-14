import 'package:bio_medica/controller/selected_type_controller.dart';
import 'package:bio_medica/view/auth/signup_view/signup_view.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/widget/custom_button.dart';
import 'package:bio_medica/widget/custom_phone_number.dart';
import 'package:bio_medica/widget/custom_route.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/widget/custom_textfield.dart';
import 'package:bio_medica/widget/forgot_back_button.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'forgot_phone_authentication.dart';

class ForgetPasswordEmailPhoneView extends StatefulWidget {
  const ForgetPasswordEmailPhoneView({super.key});

  @override
  State<ForgetPasswordEmailPhoneView> createState() =>
      _ForgetPasswordEmailPhoneViewState();
}

class _ForgetPasswordEmailPhoneViewState
    extends State<ForgetPasswordEmailPhoneView> {
  final selectedTypeController = Get.put(SelectedTypeController());
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  bool isLoading = false;
  // Function to generate a random 6-digit number

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: secondaryColor,
        // resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              const ForgetPasswordBackWidget(),
              SizedBox(
                height: 42.h,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 38.h,
                      decoration: BoxDecoration(
                        color: Color(0xffB4C4D1),
                        borderRadius: BorderRadius.circular(9.51.r),
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              selectedTypeController
                                  .changeSelectedType('email');
                              setState(() {});
                            },
                            child: Obx(() => Container(
                                  margin: const EdgeInsets.only(left: 7),
                                  height: 30.43.h,
                                  width: 151.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6.sp),
                                      color: selectedTypeController
                                                  .selectedType.value ==
                                              'email'
                                          ? buttonColor
                                          : transparentColor),
                                  child: Center(
                                    child: CustomText(
                                      text: 'Email',
                                      fontWeight: FontWeight.bold,
                                      textColor: selectedTypeController
                                                  .selectedType.value ==
                                              'email'
                                          ? mainTextColor
                                          : greyColor,
                                    ),
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              selectedTypeController
                                  .changeSelectedType('phone');
                              setState(() {});
                            },
                            child: Obx(() => Container(
                                  margin: const EdgeInsets.only(left: 7),
                                  height: 30.43.h,
                                  width: 150.w,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(9.51.r),
                                      color: selectedTypeController
                                                  .selectedType.value ==
                                              'phone'
                                          ? buttonColor
                                          : transparentColor),
                                  child: Center(
                                    child: CustomText(
                                      text: 'Phone',
                                      fontWeight: FontWeight.bold,
                                      textColor: selectedTypeController
                                                  .selectedType.value ==
                                              'phone'
                                          ? mainTextColor
                                          : greyColor,
                                    ),
                                  ),
                                )),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 32.h,
                    ),
                    Obx(
                      () => CustomText(
                        text:
                            selectedTypeController.selectedType.value == 'email'
                                ? "Enter your email"
                                : "Enter your phone number",
                        fontsize: 24.sp,
                        textColor: primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Obx(
                      () => CustomText(
                        text: selectedTypeController.selectedType.value ==
                                'email'
                            ? "Please enter a email address to request\na password reset."
                            : "Please enter a phone number to request a password reset.",
                        fontsize: 16.sp,
                        maxLines: 2,
                        fontWeight: FontWeight.w500,
                        textColor: Color(0xff6B7280),
                      ),
                    ),
                    SizedBox(
                      height: 28.h,
                    ),
                    selectedTypeController.selectedType.value == 'email'
                        ? EmailCustomTextFiled(
                            readOnly: false,
                            controller: emailController,
                            hintText: 'Your email',
                            hintColor: greyColor,
                            hintTextSize: 15.sp,
                            prefixIcon: AppImages.email,
                            isBorder: true,
                            borderRadius: 13.sp,
                            fillColor: transparentColor,
                          )
                        : CustomPhoneNumberField(
                            childWidget: const CountryCodePicker(
                              hideSearch: false,
                              enabled: true,
                              showDropDownButton: false,
                              onChanged: print,
                              // countryFilter: ['IQ'],
                              // initialSelection: 'IQ',
                              // favorite: ['+964', ''],
                              showCountryOnly: false,
                              showOnlyCountryWhenClosed: false,
                              alignLeft: false,
                            ),
                            controller: phoneController,
                            hintText: "",
                            passwordFunction: () {
                              phoneController.clear();
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            hintColor: greyColor,
                            hintTextSize: 15.sp,
                            isBorder: true,
                            borderRadius: 13.sp,
                            fillColor: transparentColor,
                            suffixIcon: Icons.cancel,
                          ),
                    SizedBox(
                      height: 24.h,
                    ),
                    CustomButton(
                        height: 51.h,
                        title: "Send",
                        color: primaryColor,
                        textSize: 12.sp,
                        onTap: () {
                          CustomRoute.navigateTo(
                              context, const PhoneNumberAuthenticationView());
                        })
                  ],
                ),
              ),
              // const Spacer(),
              SizedBox(
                height: 260.25.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    text: "Don't have an account?",
                    fontsize: 12.sp,
                    textColor: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  GestureDetector(
                    onTap: () {
                      CustomRoute.navigateTo(context, const SignupView());
                    },
                    child: CustomText(
                      text: "Sign Up",
                      fontsize: 12.sp,
                      textColor: buttonColor2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              )
            ],
          ),
        )),
      ),
    );
  }
}
