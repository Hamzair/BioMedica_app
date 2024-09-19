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
    'assets/images/sthetoscope.png',
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
        preferredSize: Size.fromHeight(120.h),
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
                height: 40.h,
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
                            child: Image.asset('assets/images/back_icon.png',height: 38.sp,)),
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
              padding:  EdgeInsets.symmetric(horizontal: 8.w,vertical: 18.h),
              child: Container(
                height: 303.h,
                width: 341.w,
                decoration: BoxDecoration(
                    color: container, borderRadius: BorderRadius.circular(8.r)),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 215.h,
                          width: 318.w,
                          padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 9.h),
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
                          ),
                        ),
                        // Add a position indicator to the top left corner of the image
                        Positioned(
                          top: 8.h,
                          right: 0.w,
                          child: Container(
                            height: 30.h,
                            width: 31.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(6.r), // Bottom left corner radius
                                  bottomRight: Radius.circular(6.r), // Bottom right corner radius
                                ),
                                color: Color.fromRGBO(18, 26, 0, 0.25)),
                            child: Icon(

                              Icons
                                  .bookmark_border,
                              color: Colors.white,
                              size: 17.sp, // Set the icon size
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Image Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                    color: Darkcontainer,
                    width: 1.w,
                  ),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildTabItem(0, 'Overview'),
                      if (_selectedIndex != 0) buildDivider(),

                      buildTabItem(1, 'Operations'),
                      if (_selectedIndex != 1) buildDivider(), // Only show divider if not on Operations
                      buildTabItem(2, 'Importance'),
                      if (_selectedIndex != 2) buildDivider(), // Only show divider if not on Importance
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
            SizedBox(height: 50.h,)
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
        padding:  EdgeInsets.symmetric(horizontal: 4.w
        ),
        child: Container(
          width: 100.81.w,
          height: 30.34.h,
          decoration: BoxDecoration(

            color: _selectedIndex == index ? Colors.cyan : Colors.transparent,
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: _selectedIndex == index ? buttonColor2 : Colors.transparent, // Red border for the selected image
              width: 0.5.w,
            ),

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
          SizedBox(
            height: 8.h,
          ),
          // Bullet points for operation steps
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              bulletPoint('Place the chest piece on the patient’s chest or back.'),
              bulletPoint('Adjust the earpieces to fit snugly in your ears.'),
              bulletPoint('Listen for heartbeats, breathing sounds, or bowel movements, adjusting the pressure of the stethoscope for better clarity.'),

            ],
          ),
        ],
      ),
    );
  }


  Widget bulletPoint(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Bullet container
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: 8.h,
              width: 8.h,
              decoration: BoxDecoration(
                color: buttonColor2,
                borderRadius: BorderRadius.circular(30.r),  // Circular bullet
              ),
            ),
          ),
          SizedBox(width: 10.w),  // Space between bullet and text
          // Text content
          Expanded(
            child: CustomText(
              text: text,
              textColor: Colors.white,
              fontsize: 12.sp,
              fontWeight: FontWeight.w400,
            ),
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
            text: 'Common Use Cases',
            textColor: buttonColor,
            fontWeight: FontWeight.w600,
            fontsize: 16.sp,
          ),
          SizedBox(
            height: 8.h,
          ),
          // Bullet points for operation steps
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bulletPoint('Heart Sound Monitoring: Detecting murmurs, irregular heartbeats, and abnormal rhythms.'),
              bulletPoint('Lung Sound Analysis: Listening for wheezing, crackling, or diminished breath sounds, which may indicate respiratory issues.'),
              bulletPoint('Sounds travel through the tubing to the earpieces.'),
              bulletPoint('Physician listens for abnormalities in heart or lung functions.'),
            ],
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bulletPoint('Heart Sound Monitoring: Detecting murmurs, irregular heartbeats, and abnormal rhythms.'),
                bulletPoint('Lung Sound Analysis: Listening for wheezing, crackling, or diminished breath sounds, which may indicate respiratory issues.'),
                bulletPoint('Sounds travel through the tubing to the earpieces.'),
                bulletPoint('Physician listens for abnormalities in heart or lung functions.'),
              ],
            ),
          ],
        )

    );
  }

  Widget buildImageItem(String imagePath) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedImage = imagePath; // Set the selected image path
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 14.0.h,horizontal: 4.w),
        child: Container(
          height: 51.h,
          width: 75.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(
              color: _selectedImage == imagePath ? buttonColor2 : Colors.transparent, // Red border for the selected image
              width: 2.w,
            ),
          ),
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