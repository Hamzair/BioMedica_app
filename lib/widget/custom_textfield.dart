// ignore_for_file: must_be_immutable

import 'package:bio_medica/view/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFiled extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  bool? isFilled;
  Color? fillColor;
  String? fontFamily;
  Color? hintColor;
  FontWeight? fontWeight;
  double? hintTextSize;
  String? Function(String?)? validator;
  Function(String)? onChange;
  VoidCallback? passwordFunction;
  double? borderRadius;
  bool? isBorder;
  IconData? suffixIcon;
  String? prefixIcon;
  bool? isErrorBorder;
  TextInputType? keyboardType;
  bool? isPassword;
  IconData? beforePasswordIcon;
  IconData? afterPasswordIcon;
  bool? isObscure;
  final bool readOnly;

  CustomTextFiled({
    super.key,
    this.hintText,
    this.controller,
    this.isFilled,
    this.fillColor,
    this.fontFamily,
    this.hintColor,
    this.hintTextSize,
    this.fontWeight,
    this.validator,
    this.isBorder,
    this.borderRadius,
    this.suffixIcon,
    this.prefixIcon,
    this.isErrorBorder,
    this.onChange,
    this.keyboardType,
    this.isPassword,
    this.passwordFunction,
    this.beforePasswordIcon,
    this.isObscure,
    this.afterPasswordIcon,
    required this.readOnly,

  });

  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChange,
      keyboardType: keyboardType,
      obscureText: isObscure ?? false,
      focusNode: _focusNode,
      style: TextStyle(
        color: primaryColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      readOnly: readOnly,
      decoration: InputDecoration(
        suffixIcon: isPassword == true
            ? IconButton(
                onPressed: passwordFunction,
                icon: Icon(
                  // size: 15,
                  isObscure == true ? beforePasswordIcon : afterPasswordIcon,
                  color: primaryColor,
                ),
              )
            : Icon(
                suffixIcon,

              ),
        prefixIcon: prefixIcon != null
            ? Image.asset(
                prefixIcon!,
                color: primaryColor,
                  scale: 3,
              // fit: BoxFit.fill,
              )
            : null,
        filled: isFilled ?? true,
        fillColor: fillColor ?? secondaryColor,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: fontFamily ?? 'jost',
          fontSize: hintTextSize ?? 15.sp,
          color: hintColor ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.w400,
        ),
        border: isBorder == true
            ? OutlineInputBorder(
                borderRadius: BorderRadius.circular(13.r),
                borderSide: const BorderSide(color: blackColor, width: 1),
              )
            : InputBorder.none,
        errorBorder: isErrorBorder == true
            ? OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red),
                borderRadius: BorderRadius.circular(13.r),
              )
            : InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: blackColor, width: 1),
          borderRadius: BorderRadius.circular(13.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: blackColor, width: 1),
          borderRadius: BorderRadius.circular(13.r),
        ),
      ),
    );
  }
}

class EmailCustomTextFiled extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  bool? isFilled;
  Color? fillColor;
  String? fontFamily;
  Color? hintColor;
  FontWeight? fontWeight;
  double? hintTextSize;
  String? Function(String?)? validator;
  Function(String)? onChange;
  VoidCallback? passwordFunction;
  double? borderRadius;
  bool? isBorder;
  IconData? suffixIcon;
  String? prefixIcon;
  bool? isErrorBorder;
  TextInputType? keyboardType;
  bool? isPassword;
  IconData? beforePasswordIcon;
  IconData? afterPasswordIcon;
  bool? isObscure;
  final bool readOnly;

  EmailCustomTextFiled({
    super.key,
    this.hintText,
    this.controller,
    this.isFilled,
    this.fillColor,
    this.fontFamily,
    this.hintColor,
    this.hintTextSize,
    this.fontWeight,
    this.validator,
    this.isBorder,
    this.borderRadius,
    this.suffixIcon,
    this.prefixIcon,
    this.isErrorBorder,
    this.onChange,
    this.keyboardType,
    this.isPassword,
    this.passwordFunction,
    this.beforePasswordIcon,
    this.isObscure,
    this.afterPasswordIcon,
    required this.readOnly,
  });

  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChange,
      keyboardType: keyboardType,
      obscureText: isObscure ?? false,
      focusNode: _focusNode,
      style: TextStyle(
        color: primaryColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
      ),
      readOnly: readOnly,
      decoration: InputDecoration(
        suffixIcon: isPassword == true
            ? IconButton(
          onPressed: passwordFunction,
          icon: Icon(
            // size: 15,
            isObscure == true ? beforePasswordIcon : afterPasswordIcon,
            color: primaryColor,
          ),
        )
            : Icon(
          suffixIcon,

        ),
        prefixIcon: prefixIcon != null
            ? Image.asset(
          prefixIcon!,
          color: primaryColor,
          scale: 3,
          // fit: BoxFit.fill,
        )
            : null,
        filled: isFilled ?? true,
        fillColor: fillColor ?? secondaryColor,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: fontFamily ?? 'jost',
          fontSize: hintTextSize ?? 15.sp,
          color: hintColor ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.w400,
        ),
        border: isBorder == true
            ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.r),
          borderSide: const BorderSide(color: buttonColor, width: 1),
        )
            : InputBorder.none,
        errorBorder: isErrorBorder == true
            ? OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(13.r),
        )
            : InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: buttonColor, width: 1),
          borderRadius: BorderRadius.circular(13.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: buttonColor, width: 1),
          borderRadius: BorderRadius.circular(13.r),
        ),
      ),
    );
  }
}

class SignCustomTextFiled extends StatelessWidget {
  String? hintText;
  TextEditingController? controller;
  bool? isFilled;
  Color? fillColor;
  String? fontFamily;
  Color? hintColor;
  FontWeight? fontWeight;
  double? hintTextSize;
  String? Function(String?)? validator;
  Function(String)? onChange;
  VoidCallback? passwordFunction;
  double? borderRadius;
  bool? isBorder;
  IconData? suffixIcon;
  String? prefixIcon;
  bool? isErrorBorder;
  TextInputType? keyboardType;
  bool? isPassword;
  IconData? beforePasswordIcon;
  IconData? afterPasswordIcon;
  bool? isObscure;
  final bool readOnly;

  SignCustomTextFiled({
    super.key,
    this.hintText,
    this.controller,
    this.isFilled,
    this.fillColor,
    this.fontFamily,
    this.hintColor,
    this.hintTextSize,
    this.fontWeight,
    this.validator,
    this.isBorder,
    this.borderRadius,
    this.suffixIcon,
    this.prefixIcon,
    this.isErrorBorder,
    this.onChange,
    this.keyboardType,
    this.isPassword,
    this.passwordFunction,
    this.beforePasswordIcon,
    this.isObscure,
    this.afterPasswordIcon,
    required this.readOnly,
  });

  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      onChanged: onChange,
      keyboardType: keyboardType,
      obscureText: isObscure ?? false,
      focusNode: _focusNode,
      style: TextStyle(
        color: primaryColor,
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
      ),
      readOnly: readOnly,
      decoration: InputDecoration(
        suffixIcon: isPassword == true
            ? IconButton(
          onPressed: passwordFunction,
          icon: Icon(
            // size: 15,
            isObscure == true ? beforePasswordIcon : afterPasswordIcon,
            color: primaryColor,
          ),
        )
            : Icon(
          suffixIcon,

        ),
        prefixIcon: prefixIcon != null
            ? Image.asset(
          prefixIcon!,
          color: primaryColor,
          scale: 3,
          // fit: BoxFit.fill,
        )
            : null,
        filled: isFilled ?? true,
        fillColor: fillColor ?? Color(0xffB4C4D1),
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: fontFamily ?? 'jost',
          fontSize: hintTextSize ?? 10.sp,
          color: hintColor ?? Colors.black,
          fontWeight: fontWeight ?? FontWeight.w400,
        ),
        border: isBorder == true
            ? OutlineInputBorder(
          borderRadius: BorderRadius.circular(13.r),
          borderSide: const BorderSide(color: Colors.transparent, width: 1),

        )
            : InputBorder.none,
        errorBorder: isErrorBorder == true
            ? OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 1),

          borderRadius: BorderRadius.circular(13.r),
        )
            : InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 1),
          borderRadius: BorderRadius.circular(13.r),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent, width: 1),

          borderRadius: BorderRadius.circular(13.r),
        ),
      ),
    );
  }
}
