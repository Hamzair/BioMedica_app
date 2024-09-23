import 'dart:async'; // Import the Timer class
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class Prosthetic extends StatefulWidget {
  const Prosthetic({super.key});

  @override
  State<Prosthetic> createState() => _ProstheticState();
}

class _ProstheticState extends State<Prosthetic> {
  late VideoPlayerController _controller;
  bool _isPlaying = false;
  bool _showPlayPauseIcon = true; // Controls the visibility of the play/pause icon
  Timer? _iconTimer; // Timer to control when the icon disappears

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'assets/videos/video4.mp4', // Replace with your video path
    )..initialize().then((_) {
      setState(() {});
    });
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying ? _controller.pause() : _controller.play();
      _isPlaying = !_isPlaying;
      _resetIconTimer(); // Reset the icon timer on play/pause toggle
    });
  }

  void _resetIconTimer() {
    _showPlayPauseIcon = true;
    _iconTimer?.cancel(); // Cancel any existing timer
    if (_isPlaying) {
      _iconTimer = Timer(const Duration(seconds: 2), () {
        setState(() {
          _showPlayPauseIcon = false; // Hide the icon after 1 second
        });
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _iconTimer?.cancel(); // Cancel the timer to prevent memory leaks
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
                        text: "Prosthetic Devices",
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
                SizedBox(height: 30.h),

                /// Video Player with play/pause icon
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r), // Border radius of 20

                      child: AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: GestureDetector(
                          onTap: () {
                            _togglePlayPause(); // Toggle play/pause on tap
                          },
                          child: VideoPlayer(_controller),
                        ),
                      ),
                    ),

                    /// Visibility wrapper for the play/pause icon
                    Visibility(
                      visible: _showPlayPauseIcon,
                      child: GestureDetector(
                        onTap: _togglePlayPause,
                        child: Icon(
                          _isPlaying
                              ? Icons.pause_circle_filled
                              : Icons.play_circle_filled,
                          size: 60,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),

                /// Introduction Text
                CustomText(
                  text: 'Introduction',
                  textColor: buttonColor2,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                  fontsize: 22.sp,
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text:
                  'Patient presents today with complaints of persistent headache, dizziness, and nausea for the past 3 days. She denies fever or any recent trauma. Her medical history is significant for hypertension and Type 2 diabetes. She is currently on medication for both conditions. Social history reveals she is a non-smoker, occasional alcohol consumer, and works as a teacher. Family history is significant for cardiovascular disease.',
                  textColor: secondaryColor,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 15.h),

                /// Overview Text
                CustomText(
                  text: 'Overview',
                  textColor: buttonColor2,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.start,
                  fontsize: 22.sp,
                ),
                SizedBox(height: 10.h),
                CustomText(
                  text:
                  'Medical Discharge Summary:\nPatient was admitted to the hospital on [date] for [reason for admission]. She underwent [procedure] and was discharged on [date] in good condition. Discharge instructions include [medication instructions], [follow-up appointment schedule], and [any other necessary information]',
                  textColor: secondaryColor,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        )
            : CircularProgressIndicator(),
      ),
    );
  }
}
