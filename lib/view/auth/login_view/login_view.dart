import 'package:bio_medica/view/auth/signup_view/signup_view.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/widget/custom_button.dart';
import 'package:bio_medica/widget/custom_route.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;
  bool rememberPass = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80.h,
              ),
              Center(
                child: SizedBox(
                  height: 261.h,
                  width: 261.w,
                  child: Image.asset(AppImages.biomedicalogo),
                ),
              ),
              SizedBox(
                height: 57.h,
              ),
              CustomText(
                text: 'Login',
                fontsize: 35.sp,
                textColor: const Color(0xff001A2E),
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: CustomTextFiled(
                  hintText: 'Your email',
                  prefixIcon: AppImages.email,
                  controller: emailController,
                  readOnly: false,
                  // hintTextSize: 11.sp,
                  hintColor: Color(0xff134064),
                ),
              ),
              SizedBox(
                height: 26.25.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: CustomTextFiled(
                  readOnly: false,
                  controller: passwordController,
                  hintText: ' Your password',
                  hintColor: Color(0xff134064),
                  // hintTextSize: 11.sp,
                  onChange: (v) {
                    return null;
                  },
                  prefixIcon: AppImages.password,
                  // isBorder: true,
                  isPassword: true,
                  isObscure: isChecked,
                  passwordFunction: () {
                    setState(() {
                      isChecked = !isChecked;
                    });
                    return null;
                  },

                  beforePasswordIcon: Icons.visibility_off_outlined,
                  afterPasswordIcon: Icons.visibility,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w, right: 25.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                        fillColor: WidgetStatePropertyAll(Colors.white),
                        checkColor: primaryColor,
                        activeColor: Colors.white,
                        side: BorderSide(
                          color: secondaryColor,
                          width: 1.w,
                        ),
                        value: rememberPass,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              rememberPass = value!;
                            },
                          );
                        }),
                    CustomText(
                        text: 'Remember information',
                        fontsize: 14.sp,
                        textColor: secondaryColor,
                        fontWeight: FontWeight.w400),
                    SizedBox(
                      width: 25.w,
                    ),
                    CustomText(
                        text: 'Forgot password?',
                        fontsize: 14.sp,
                        textColor: buttonColor2,
                        fontWeight: FontWeight.w400)
                  ],
                ),
              ),
              SizedBox(
                height: 26.h,
              ),
              CustomButton(
                textSize: 19.sp,
                height: 51.h,
                width: 311.w,
                color: buttonColor,
                onTap: () {},
                title: 'Login',
              ),
              SizedBox(
                height: 36.h,
              ),
              GestureDetector(
                onTap: () {
                  CustomRoute.navigateTo(context, SignupView());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        text: 'Don’t have an account?',
                        fontsize: 15.sp,
                        textColor: secondaryColor,
                        fontWeight: FontWeight.w400),
                    CustomText(
                        text: ' Sign Up',
                        fontsize: 15.sp,
                        textColor: buttonColor2,
                        fontWeight: FontWeight.w400),
                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
