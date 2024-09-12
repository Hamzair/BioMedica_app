import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/profile/privacy_policy.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class TechnicalSupportChatScreen extends StatelessWidget {
  const TechnicalSupportChatScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(140.h),
          child:AppBar(
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
                /// Back Icon & Title Text
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: Image.asset('assets/images/back_icon.png')),
                          SizedBox(
                            width: 12.w,
                          ),
                          CustomText(
                            text: "Technical Support",
                            textColor: Color.fromRGBO(0, 26, 46, 1),
                            fontWeight: FontWeight.w600,
                            fontsize: 22.sp,
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
                /// Our Team is online Text
                Row(
                  children: [
                    SizedBox(
                      width: 59.w,
                    ),
                    CustomText(
                      text: "Our Team is online",
                      textColor: Color.fromRGBO(0, 26, 46, 1),
                      fontWeight: FontWeight.w600,
                      fontsize: 12.86.sp,
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.circle, color: Color.fromRGBO(37, 208, 118, 1), size: 8),
                  ],
                ),
                /// You are now connected to operator Text
                Row(
                  children: [
                    SizedBox(
                      width: 59.w,
                    ),
                    CustomText(
                      text: "You are now connected to operator",
                      textColor: Color.fromRGBO(0, 26, 46, 1),
                      fontWeight: FontWeight.w400,
                      fontsize: 11.06.sp,
                    ),
                    SizedBox(width: 4),
                    Icon(Icons.circle, color: Color.fromRGBO(37, 208, 118, 1), size: 8.sp),
                  ],
                ),
              ],
            ),
            backgroundColor: secondaryColor,
          ),
        ),
        body:Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.all(16),
                children: [
                  // Support Message
                  _buildSupportMessage(
                    'Alright.\n\nYou can track your progress by accessing the "My Courses" or "My Progress" section in the app.\n\nIt will show you the courses you’re enrolled in, your completion status, and any assessments or quizzes you’ve completed.',
                  ),
                  // User Message
                  _buildUserMessage("That's good to know."),
                  // User Message
                  _buildUserMessage(
                      "Thank you so much for your help! I appreciate it."),
                  // Support Message
                  _buildSupportMessage(
                    "You’re very welcome!\n\nIf you have any more questions in the future or need assistance with anything else, feel free to reach out.",
                  ),
                  _buildSupportMessage('Happy studying!'),
                ],
              ),
            ),
            _buildMessageInput(),
          ],
        ),
    );
  }
/// Support Team Text Field Design
  Widget _buildSupportMessage(String message) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          backgroundColor: Color.fromRGBO(0, 26, 46, 1),
          child: Image.asset('assets/images/chat_avatar.png')
        ),
        SizedBox(width: 10.w),
        Flexible(
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(vertical: 6.h),
            decoration: BoxDecoration(
              color: tapColor, // Support bubble color
              borderRadius: BorderRadius.circular(5.69.r),
            ),
            child: Text(
              message,
              style: TextStyle(
                  color: Color.fromRGBO(255, 255, 255, 1),
                fontSize: 13.27.sp,
                fontWeight: FontWeight.w400,

              ),
            ),
          ),
        ),
      ],
    );
  }
/// User Text Message Field Design
  Widget _buildUserMessage(String message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Container(
            padding: EdgeInsets.all(12),
            margin: EdgeInsets.symmetric(vertical: 6.h),
            decoration: BoxDecoration(
              color: buttonColor, // User bubble color
              borderRadius: BorderRadius.circular(5.69.r),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: Color.fromRGBO(0, 28, 49, 1),
                fontSize: 13.27.sp,
                fontWeight: FontWeight.w400,

              ),
            ),
          ),
        ),
      ],
    );
  }
/// Type Message TextField
  Widget _buildMessageInput() {
    return Container(
      height: 76.8.h,
      width: 360.w,
      color: Color(0xff001A2E),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Type message...',
                    hintStyle: TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: tapColor,
                    contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11.52.r),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                height: 38.4.h,
                width: 38.4.w,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: tapColor, // Send button color
                  borderRadius: BorderRadius.circular(11.52.r)
                ),
                child: GestureDetector(
                  onTap: (){
                  },
                    child: Icon(Icons.send, color: buttonColor2,size: 17.sp,)),
              ),
            ],
          ),

      ),
    );
  }
}
