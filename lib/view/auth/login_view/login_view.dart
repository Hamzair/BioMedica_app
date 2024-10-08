import 'package:bio_medica/drawer%20items/subscription_screen.dart';
import 'package:bio_medica/view/auth/forgot_password/forgot_main.dart';
import 'package:bio_medica/view/auth/signup_view/signup_view.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/view/navbar/nav_bar.dart';
import 'package:bio_medica/view/profile/edit_profile_screen.dart';
import 'package:bio_medica/widget/custom_button.dart';
import 'package:bio_medica/widget/custom_route.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../widget/custom_textfield1.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _rememberMe = false;

  void _toggleRememberMe() {
    setState(() {
      _rememberMe = !_rememberMe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: primaryColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 29.71.h),
                Center(
                  child: SizedBox(
                    height: 261.h,
                    width: 261.w,
                    child: Image.asset(AppImages.biomedicalogo),
                  ),
                ),
                SizedBox(height: 57.64.h),
                CustomText(
                  text: 'Login',
                  fontsize: 35.sp,
                  textColor: const Color.fromRGBO(0, 26, 46, 1),
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 6.36.h),

                /// Your Email Textfield
                Container(
                  width: double.infinity,
                  child: CustomTextField1(
                    hintText: 'Your email',
                    hintTextSize: 14.65.sp,
                    prefixIcon: Icons.email,

                  ),
                ),
                SizedBox(height: 26.25.h),

                /// Your Password Textfield
                Container(
                  width: double.infinity,
                  child: CustomTextField1(
                    hintText: 'Your password',
                    prefixIcon: Icons.lock,
                    obscureText: true,
                    obscuringCharacter: '*',
                    suffixIcon: Icons.visibility,
                    hintTextSize: 14.65.sp,

                  ),
                ),
                SizedBox(height: 16.25.h),

                /// CheckBox and Remember information Text
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: _toggleRememberMe,
                          child: Container(
                            width: 18.w,
                            height: 22.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.r),
                              color: _rememberMe ? Colors.blue : Colors.white,
                              border: Border.all(
                                color: _rememberMe ? Colors.blue : Colors.grey,
                              ),
                            ),
                            child: _rememberMe
                                ? Icon(
                              Icons.check,
                              size: 12.h,
                              color: Colors.white,
                            )
                                : null,
                          ),
                        ),
                        SizedBox(width: 8.w), // Add some space between checkbox and text
                        CustomText(
                          text: "Remember information",
                          textColor: Color.fromRGBO(192, 208, 221, 1),
                          fontWeight: FontWeight.w400,
                          fontsize: 14.sp,
                        ),
                      ],
                    ),
                    Align(alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: (){
                          Get.to(() => ForgetPasswordScreen());
                        },
                        child: CustomText(
                          text: "Forgot password?",
                          textColor: Color.fromRGBO(219, 92, 0, 1),
                          fontWeight: FontWeight.w600,
                          fontsize: 13.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 26.h),

                /// Login Button
                CustomButton(
                  textSize: 19.sp,
                  height: 51.h,
                  width: double.infinity,
                  color: buttonColor,
                  onTap: () {
                    CustomRoute.navigateTo(context, SubscriptionScreen());
                  },
                  title: 'Login',
                ),
                SizedBox(height: 97.48.h),

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
                        fontWeight: FontWeight.w400,
                      ),
                      CustomText(
                        text: ' Sign Up',
                        fontsize: 15.sp,
                        textColor: buttonColor2,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
