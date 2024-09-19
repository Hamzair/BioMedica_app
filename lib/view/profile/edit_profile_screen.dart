import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/widget/custom_button.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/widget/custom_textfield1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String? _imagePath; // Store the image path

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _imagePath = image.path; // Update the image path
      });
    }
  }

  Future<void> _takePhoto() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);

    if (image != null) {
      setState(() {
        _imagePath = image.path; // Update the image path
      });
    }
  }
/// Image Source dialog Box
  void _showImageSourceDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Choose an option"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _pickImage(); // Pick image from gallery
                },
                child: Text("Gallery"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  _takePhoto(); // Take photo with camera
                },
                child: Text("Camera"),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(13.r),
              bottomRight: Radius.circular(13.r),
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          flexibleSpace: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13.w,vertical: 5.h),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width < 360 ? 30.w : 38.w,
                        height: MediaQuery.of(context).size.width < 360 ? 30.h : 38.h,
                        child: GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image(
                            image: AssetImage('assets/images/back_icon.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
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
          ),
          backgroundColor: secondaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Column(
            children: [
              SizedBox(height: 44.h),
              /// Profile Image And Camera Icon
              Align(
                alignment: Alignment.center,
                child: Container(
                  child: Stack(
                    children: [
                      SizedBox(
                        height: 120.h,
                        width: 120.w,
                        child: CircleAvatar(
                          backgroundImage: _imagePath != null
                              ? FileImage(File(_imagePath!))
                              : AssetImage('assets/images/profile_image.png'),
                        ),
                      ),
                      /// Image Picker
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: GestureDetector(
                          onTap: () => _showImageSourceDialog(context), // Open image source dialog
                          child: CircleAvatar(
                            backgroundColor: buttonColor2,
                            child: SizedBox(
                              width: 23.w,
                              height: 20.7.h,
                              child: Image.asset("assets/images/camera_icon.png"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 56.h),
              /// UserName TextField
              Container(
                width: double.infinity.w,
                child: CustomTextField1(
                  hintText: 'Merril Kervin',
                  prefixIcon: Icons.person,
                  hintTextSize: 14.65.sp,
                  obscuringCharacter: null,
                ),
              ),
              SizedBox(height: 16.25.h),
              /// Email TextField
              Container(
                width: double.infinity.w,
                child: CustomTextField1(
                  hintText: 'test@gmail.com',
                  hintTextSize: 14.65.sp,
                  prefixIcon: Icons.email,
                ),
              ),
              SizedBox(height: 14.25.h),
              /// Password TextField
              Container(
                width: double.infinity.w,
                child: CustomTextField1(
                  hintText: 'Enter your Password',
                  prefixIcon: Icons.lock,
                  obscureText: true,
                  obscuringCharacter: '*',
                  suffixIcon: Icons.visibility,
                  hintTextSize: 14.65.sp,
                ),
              ),
              SizedBox(height: 50.25.h),
              /// Button Save Changes
              SizedBox(
                width: double.infinity.w,
                height: 51.h,
                child: CustomButton(
                  title: 'Save changes',
                  textSize: 19.sp,
                  onTap: () {}, // Add your save functionality here
                  color: buttonColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
