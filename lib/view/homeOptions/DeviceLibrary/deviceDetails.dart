import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/view/course/quiz.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class DeviceDetails extends StatefulWidget {
  final String deviceName;
  final String deviceImage;

  const DeviceDetails({Key? key, required this.deviceName, required this.deviceImage}) : super(key: key);

  @override
  _DeviceDetailsState createState() => _DeviceDetailsState();
}

class _DeviceDetailsState extends State<DeviceDetails> {
  int _selectedIndex = 0;
  String _selectedImage = ''; // To store the selected image path

  // List of tabs
  List<String> tabs = ['Overview', 'Operations', 'Importance', 'Features'];

  // List of images
  List<String> images = [
    'assets/images/pace.png',
    'assets/images/def.png',
    'assets/images/stheth.png',
    'assets/images/def.png',
  ];

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.deviceImage; // Set initial image from passed argument
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.h),
        child: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(13.r),
                  bottomRight: Radius.circular(13.r))),
          centerTitle: true,
          automaticallyImplyLeading: false,
          flexibleSpace: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset('assets/images/back_icon.png')),
                        SizedBox(
                          width: 7.w,
                        ),
                        CustomText(
                          text: widget.deviceName,
                          textColor: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontsize: 22.sp,
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(()=> QuizPage());
                      },
                      child: Container(
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
                    ),
                  ],
                ),
              ),
            ],
          ),
          backgroundColor: secondaryColor,
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 341.w,
                decoration: BoxDecoration(
                    color: container, borderRadius: BorderRadius.circular(8.r)),
                child: Column(
                  children: [
                    // Main Image
                    Container(
                      height: 303.h,
                      padding: EdgeInsets.all(8),
                      child: _selectedImage.isEmpty
                          ? ModelViewer(
                        backgroundColor:
                        Color.fromARGB(0xFF, 0xEE, 0xEE, 0xEE),
                        src:
                        'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
                        alt: 'A 3D model of an astronaut',
                        ar: true,
                        autoRotate: true,
                        iosSrc:
                        'https://modelviewer.dev/shared-assets/models/Astronaut.usdz',
                        disableZoom: true,
                      )
                          : ClipRRect(
                        borderRadius: BorderRadius.circular(8.r), // Apply border radius here
                        child: Image.asset(
                          _selectedImage,
                          fit: BoxFit.cover,
                        ),
                      ), // Display the selected image
                    ),

                    // Image Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: images.map((imagePath) {
                        return buildImageItem(imagePath);
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0.w),
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
              fontWeight:
              _selectedIndex == index ? FontWeight.w700 : FontWeight.w700,
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
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
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
          SizedBox(
            height: 17.h,
          ),
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
      padding: EdgeInsets.symmetric(horizontal: 8.0.w),
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
          SizedBox(
            height: 17.h,
          ),
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
      padding: EdgeInsets.symmetric(horizontal: 8.w),
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
            'Stethoscopes are commonly used in cardiology, pulmonology, and general medicine to assess heart, lung, and vascular health.',
            textColor: Colors.white,
            fontWeight: FontWeight.w400,
            fontsize: 12.sp,
          ),
          SizedBox(
            height: 17.h,
          ),
          CustomText(
            text: 'Importance',
            textColor: buttonColor,
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
          ),
          CustomText(
            text:
            'The stethoscope is essential for diagnosing and monitoring various health conditions. It helps in detecting irregular heart rhythms, lung obstructions, and other critical conditions.',
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
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: 'Common Issues and Fixes:',
              textColor: buttonColor,
              fontWeight: FontWeight.w600,
              fontsize: 16.sp,
            ),
            SizedBox(height: 8), // Add some space between the title and the list
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                children: [
                  TextSpan(
                    text: '• ',
                    style: TextStyle(color: Colors.orange),
                  ),
                  TextSpan(
                    text: 'High sound quality for accurate diagnosis.\n',
                    style: TextStyle(color: Colors.white,fontSize: 12.sp),
                  ),
                  TextSpan(
                    text: '• ',
                    style: TextStyle(color: Colors.orange),
                  ),
                  TextSpan(
                    text: 'Lightweight and portable design.\n',
                    style: TextStyle(color: Colors.white),
                  ),
                  TextSpan(
                    text: '• ',
                    style: TextStyle(color: Colors.orange),
                  ),
                  TextSpan(
                    text: 'Durable construction for long-lasting use.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        )

    );
  }

  // Method to build an image item
  Widget buildImageItem(String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedImage = imagePath;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.0.h),
        child: Container(
          height: 50.h,
          width: 70.w,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.r), // Set border radius here
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}