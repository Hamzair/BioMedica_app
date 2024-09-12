import 'package:bio_medica/main.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor: secondaryColor,
          title: Row(
            children: [
              Image.asset(AppImages.backArrow),
              SizedBox(width: 8),
              CustomText(
                text: 'Technical Support',
                fontWeight: FontWeight.bold,
                textColor: Darkcontainer,
              ),
            ],
          ),
        ),
        body: Column(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  chatMessage(
                    text:
                        'Alright,\nYou can track your progress by accessing the \'My Courses\' or \'My Progress\' section in the app.\nIt will show you the courses you\'re enrolled in, your completion status, and any assessments or quizzes you\'ve completed.',
                    isSender: false,
                    profileImage:
                        'assets/images/profile_image.png',
                  ),
                  chatMessage(
                    text: 'That\'s good to know.',
                    isSender: true,
                  ),
                  chatMessage(
                    text: 'Thank you so much for your help! I appreciate it.',
                    isSender: true,
                  ),
                  chatMessage(
                    text:
                        'You\'re very welcome!\nIf you have any more questions in the future or need assistance with anything else, feel free to reach out.',
                    isSender: false,
                    profileImage: 'assets/images/profile_image.png',
                  ),
                  chatMessage(
                    text: 'Happy studying!',
                    isSender: false,
                    profileImage: 'assets/images/profile_image.png',
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            height: 79.h,
            decoration: BoxDecoration(
              color: Color(0xFF0A2E52),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                // Text input field
                Expanded(
                  child: Container(
                    height: 53.h,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(12)),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Type message...",
                        hintStyle: TextStyle(
                          color: Color(0xFF9BB5C8),
                        ),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),

                Container(
                  height: 40.0.h,
                  width: 40.0.w,
                  decoration: BoxDecoration(
                    color: Color(0xFFFF7E2E),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      // Handle send action here
                    },
                  ),
                ),
              ],
            ),
          ),
        ]));
  }

  Widget chatMessage({
    required String text,
    required bool isSender,
    String? profileImage,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Align(
        alignment: isSender ? Alignment.bottomRight : Alignment.bottomLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isSender)
              CircleAvatar(
                backgroundImage:
                    AssetImage(profileImage!), // Display profile image
                radius: 20,
              ),
            SizedBox(width: 8.w
            ),
            Container(
              width: 264.w,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: isSender ? buttonColor : container,
                borderRadius: BorderRadius.circular(10),
              ),
              child: CustomText(
                  text: text,
                  fontWeight: FontWeight.w500,
                  textColor: isSender ? Colors.black : Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
