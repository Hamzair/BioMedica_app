import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HumanAnatomy extends StatefulWidget {
  const HumanAnatomy({super.key});

  @override
  State<HumanAnatomy> createState() => _HumanAnatomyState();
}

class _HumanAnatomyState extends State<HumanAnatomy> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/videos/video1.mp4', // Replace with your video path
    )..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            padding: EdgeInsets.symmetric(horizontal: 13.w, vertical: 5.h),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width < 360
                            ? 30.w
                            : 38.w,
                        height: MediaQuery.of(context).size.width < 360
                            ? 30.h
                            : 38.h,
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
                        text: "Human Anatomy",
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
      body: Center(
        child: _controller.value.isInitialized
            ? SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(
                              _isPlaying ? Icons.pause : Icons.play_arrow,
                              color: secondaryColor,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPlaying
                                    ? _controller.pause()
                                    : _controller.play();
                                _isPlaying = !_isPlaying;
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.stop),
                            onPressed: () {
                              _controller.seekTo(Duration.zero);
                              _controller.pause();
                              setState(() {
                                _isPlaying = false;
                              });
                            },
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomText(
                        text: 'Introduction',
                        textColor: buttonColor2,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.start,
                        fontsize: 22.sp,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomText(
                          text:
                              'Patient presents today with complaints of persistent headache, dizziness, and nausea for the past 3 days. She denies fever or any recent trauma. Her medical history is significant for hypertension and Type 2 diabetes. She is currently on medication for both conditions. Social history reveals she is a non-smoker, occasional alcohol consumer, and works as a teacher. Family history is significant for cardiovascular disease.',
                          textColor: secondaryColor,
                          fontWeight: FontWeight.w500),
                      SizedBox(
                        height: 15.h,
                      ),
                      CustomText(
                        text: 'Overview',
                        textColor: buttonColor2,
                        fontWeight: FontWeight.w600,
                        textAlign: TextAlign.start,
                        fontsize: 22.sp,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      CustomText(text: 'Medical Discharge Summary:\nPatient was admitted to the hospital on [date] for [reason for admission]. She underwent [procedure] and was discharged on [date] in good condition. Discharge instructions include [medication instructions], [follow-up appointment schedule], and [any other necessary information', textColor: secondaryColor, fontWeight: FontWeight.w500)
                    ],
                  ),
                ),
            )
            : CircularProgressIndicator(),
      ),
    );
  }
}
