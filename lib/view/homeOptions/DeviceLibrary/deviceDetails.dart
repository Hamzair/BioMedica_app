import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/view/course/courses.dart';
import 'package:bio_medica/widget/custom_button.dart';
import 'package:bio_medica/widget/custom_search.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class DeviceDetails extends StatefulWidget {
  @override
  _DeviceDetailsState createState() => _DeviceDetailsState();
}

class _DeviceDetailsState extends State<DeviceDetails> {
  int _selectedIndex = 0;

  // List of tabs
  List<String> tabs = ['Overview', 'Operations', 'Importance', 'Features'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(192, 208, 221, 1),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF001A2E),
                  borderRadius: BorderRadius.circular(50)),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset(
                    AppImages.backArrow,
                  ))),
        ),
        title: CustomText(
          text: 'Pacemaker',
          textColor: Color(0xFF001A2E),
          fontWeight: FontWeight.bold,
        ),
        actions: [
          Container(
            height: 38.h,

            decoration: BoxDecoration(
                color: Darkcontainer, borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Icon(
                    Icons.quiz,
                    color: Colors.yellow,
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  CustomText(
                      text: 'Quiz me',
                      textColor: Colors.white,
                      fontWeight: FontWeight.w500),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 12.w,
          ),

        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(

              width: 341.w,
              decoration: BoxDecoration(
                  color: container,
                  borderRadius: BorderRadius.circular(12)
              ),
              child: Column(
                children: [
                  Container(
                    height: 300,
                    padding: EdgeInsets.all(8),
                      child: ModelViewer(
                        backgroundColor: Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
                        src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
                        alt: 'A 3D model of an astronaut',
                        ar: true,
                        autoRotate: true,
                        iosSrc: 'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
                        disableZoom: true,
                      ),
            ),


                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildImageItem('assets/images/n1.png'),
                        buildImageItem('assets/images/n2.png'),
                        buildImageItem('assets/images/n3.png'),
                        buildImageItem('assets/images/n2.png'),
                      ],
                    ),

                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              height: 37.92.h,
              decoration: BoxDecoration(
                color: tapColor,
                borderRadius: BorderRadius.circular(11.38.r),
                border: Border.all(
                  color: Color.fromRGBO(0, 28, 49, 1),
                  width: 1.w,
                ),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildTabItem(0, 'Overview'),
                    buildDivider(),
                    buildTabItem(1, 'Operations'),
                    buildDivider(),
                    buildTabItem(2, 'Importance'),
                    buildDivider(),
                    buildTabItem(3, 'Features'),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 19.h,
          ),
          // Visibility widgets for tab contents
          buildTabContent(),
        ],
      ),
    );
  }

  // Method to build each tab item
  Widget buildTabItem(int index, String title) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Container(
          width: 100.81.w,
          height: 30.34.h,
          decoration: BoxDecoration(
            color: _selectedIndex == index ? Colors.cyan : Colors.transparent,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Center(
            child: CustomText(
              text: title,
              fontsize: 14.sp,
              textColor: _selectedIndex == index
                  ? Colors.white
                  : Color.fromRGBO(182, 182, 182, 1),
              fontWeight: _selectedIndex == index
                  ? FontWeight.w700
                  : FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  // Method to build divider container between tabs
  Widget buildDivider() {
    return Container(
      width: 1.w,
      height: 15.h,
      color: buttonColor,
    );
  }


  Widget buildTabContent() {
    switch (_selectedIndex) {
      case 0:
        return buildOverviewContent();
      case 1:
        return buildOperationsContent();
      case 2:
        return buildImportanceContent();
      case 3:
        return buildFeaturesContent();
      default:
        return Container();
    }
  }

  Widget buildOverviewContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'How it Works:',
            textColor: buttonColor,
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
          ),
          CustomText(
            text:
            'The stethoscope is a diagnostic device used by medical professionals to listen to the internal sounds of the body, including heartbeats, lung sounds, and blood flow.',
            textColor: Colors.white,
            fontWeight: FontWeight.w400,
            fontsize: 12.sp,
          ),
          SizedBox(height: 17.h,),
          CustomText(
            text: 'Anatomy',
            textColor: buttonColor,
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
          ),
          CustomText(
            text:
            'The chest piece, placed on the patient’s chest or back, transmits body sounds to the diaphragm. These sounds travel through the tubing to the earpieces, allowing the physician to detect abnormalities in heart or lung functions.',
            textColor: Colors.white,
            fontWeight: FontWeight.w400,
            fontsize: 12.sp,
          ),
        ],
      ),
    );
  }

  Widget buildOperationsContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'How it Works:',
            textColor: buttonColor,
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
          ),
          CustomText(
            text:
            'The stethoscope is a diagnostic device used by medical professionals to listen to the internal sounds of the body, including heartbeats, lung sounds, and blood flow.',
            textColor: Colors.white,
            fontWeight: FontWeight.w400,
            fontsize: 12.sp,
          ),
          SizedBox(height: 17.h,),
          CustomText(
            text: 'Operation Steps',
            textColor: buttonColor,
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
          ),
          CustomText(
            text:
            'The chest piece, placed on the patient’s chest or back, transmits body sounds to the diaphragm. These sounds travel through the tubing to the earpieces, allowing the physician to detect abnormalities in heart or lung functions.',
            textColor: Colors.white,
            fontWeight: FontWeight.w400,
            fontsize: 12.sp,
          ),
        ],
      ),
    );
  }

  Widget buildImportanceContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Field of Use:',
            textColor: buttonColor,
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
          ),
          CustomText(
            text:
            'Stethoscopes are commonly used in cardiology, pulmonology, and general diagnostics to assess heart and lung health.',
            textColor: Colors.white,
            fontWeight: FontWeight.w400,
            fontsize: 12.sp,
          ),
          SizedBox(height: 17.h,),
          CustomText(
            text: 'Common Use Cases:',
            textColor: buttonColor,
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
          ),
          CustomText(
            text:
            'The chest piece, placed on the patient’s chest or back, transmits body sounds to the diaphragm. These sounds travel through the tubing to the earpieces, allowing the physician to detect abnormalities in heart or lung functions.',
            textColor: Colors.white,
            fontWeight: FontWeight.w400,
            fontsize: 12.sp,
          ),
        ],
      ),
    );
  }

  Widget buildFeaturesContent() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: 'Key Features:',
            textColor: buttonColor,
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
          ),
          CustomText(
            text:
            'High acoustic sensitivity, lightweight design, and tunable diaphragms are some of the standout features of this stethoscope model.',
            textColor: Colors.white,
            fontWeight: FontWeight.w400,
            fontsize: 12.sp,
          ),
          SizedBox(height: 17.h,),
          CustomText(
            text: 'Additional Features:',
            textColor: buttonColor,
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
          ),
          CustomText(
            text:
            'This stethoscope is also available with noise-cancelling features, reducing ambient sounds and enhancing diagnostic capabilities in noisy environments.',
            textColor: Colors.white,
            fontWeight: FontWeight.w400,
            fontsize: 12.sp,
          ),
        ],
      ),
    );
  }
}

// Method to build an image item
Widget buildImageItem(String imagePath) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 14.0),
    child: Container(
      height: 50.h,
      width: 70.w,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}
