import 'package:bio_medica/view/auth/login_view/login_view.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/widget/custom_button.dart';
import 'package:bio_medica/widget/custom_route.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();

      },
      child: Scaffold(
        backgroundColor: secondaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  // height: 500,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // color: Colors.red,
                      image: DecorationImage(
                          image: AssetImage(AppImages.ellipse2), fit: BoxFit.fill)),
                  child: SafeArea(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30.h,
                        ),
                        SizedBox(
                            height: 139.h,
                            width: 130.w,
                            child: Image.asset(
                              AppImages.biomedicalogo,
                            )),
                        CustomText(
                            textAlign: TextAlign.center,
                            text: 'Sign up ',
                            fontsize: 35.sp,
                            textColor: Colors.white,
                            fontWeight: FontWeight.w700),
                        SizedBox(
                          height: 11.h,
                        ),
                        CustomText(
                            textAlign: TextAlign.center,
                            text:
                                'Explore new content, manage your profile, and connect with others—all from here',
                            fontsize: 14.sp,
                            textColor: Colors.white,
                            fontWeight: FontWeight.w600),
                        SizedBox(
                          height: 15.h,
                        ),
                        SizedBox(
                            height: 106.h,
                            width: 106.w,
                            child: Image.asset(AppImages.upload)),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  )),
              SizedBox(height: 18.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: SignCustomTextFiled(
                  hintText: 'Your name',
                  prefixIcon: AppImages.personIcon,
                  controller: emailController,
                  readOnly: false,
                  // hintTextSize: 11.sp,
                  hintColor: Color(0xff134064),
                ),
              ),
              SizedBox(height: 16.25.h,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: SignCustomTextFiled(
                  hintText: 'Your email',
                  prefixIcon: AppImages.email,
                  controller: emailController,
                  readOnly: false,
                  // hintTextSize: 11.sp,
                  hintColor: Color(0xff134064),
                ),
              ),
              SizedBox(height: 16.25.h,),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),
                child: SignCustomTextFiled(
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
              SizedBox(
                height: 24.25.h,
              ),
              CustomButton(
                textSize: 19.sp,
                height: 51.h,
                width: 311.w,
                color: buttonColor,
                onTap: () {},
                title: 'Continue',
              ),
              SizedBox(
                height: 24.25.h,
              ),
              CustomText(
                  textAlign: TextAlign.center,
                  text: 'By signing up you agree to our Terms of Services\nand Privacy Policy.',
                  fontsize: 14.sp,
                  textColor: Color(0xff111827),
                  fontWeight: FontWeight.w400),
              SizedBox(
                height: 35.h,
              ),
              GestureDetector(
                onTap: () {
                   CustomRoute.navigateTo(context, LoginView());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                        textAlign: TextAlign.center,
                        text: 'Already have an account? ',
                        fontsize: 15.sp,
                        textColor: Color(0xff111827),
                        fontWeight: FontWeight.w400),CustomText(
                        textAlign: TextAlign.center,
                        text: 'Sign in',
                        fontsize: 15.sp,
                        textColor: buttonColor2,
                        fontWeight: FontWeight.w400),
                  ],
                ),
              ),
              SizedBox(
                height: 22.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
