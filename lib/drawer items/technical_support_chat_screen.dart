import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/drawer%20items/privacy_policy.dart';
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
          preferredSize: Size.fromHeight(80.h),
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
                  height: 45.h,
                ),
                /// Back Icon & Title Text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                              onTap: (){
                                Get.back();
                              },
                              child: SizedBox(
                                height: 38.h,
                                width: 38.h,
                                child: Image.asset('assets/images/back_icon.png',fit: BoxFit.fill,),
                              ),
                          ),
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:63.w ),
                  child: Row(
                    children: [
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
                ),
                /// You are now connected to operator Text
                Padding(
                  padding: EdgeInsets.symmetric(horizontal:63.w),
                  child: Row(
                    children: [
                      CustomText(
                        text: "You are now connected to operator",
                        textColor: Color.fromRGBO(0, 26, 46, 1),
                        fontWeight: FontWeight.w400,
                        fontsize: 11.06.sp,
                      ),

                    ],
                  ),
                ),
              ],
            ),
            backgroundColor: secondaryColor,
          ),
        ),
        body:
        /// Chat Field
        Column(
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
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 220.w, // Limit the message bubble width to 220
          ),
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
      height: 79.8.h,
      width: double.infinity.w,
      color: Color(0xff001A2E),
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.4.w),
          child: SizedBox(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 56.63.h, // Height for the container
                    width: double.infinity, // Set to your desired width
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type message...',
                        hintStyle: TextStyle(color: Colors.white54),
                        filled: true,
                        fillColor: primaryColor,
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 18.h), // Adjust vertical padding
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(11.52.r),
                          borderSide: BorderSide.none,
                        ),
                        isDense: true, // Set isDense to true
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 11.52.w),
                Container(
                  height: 38.4.h,
                  width: 38.4.w,

                  decoration: BoxDecoration(
                    color: primaryColor, // Send button color
                    borderRadius: BorderRadius.circular(11.52.r)
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: (){},
                        child: SizedBox(
                            height: 23.04.h,
                            width: 23.04.w,
                            child: Image.asset('assets/images/send_image_icon.png',fit: BoxFit.contain,),
                        ),
                    ),
                  ),
                ),
              ],
            ),
          ),

      ),
    );
  }
}
