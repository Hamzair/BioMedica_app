import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/view/course/courses.dart';
import 'package:bio_medica/widget/custom_button.dart';
import 'package:bio_medica/widget/custom_search.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeviceDetails extends StatefulWidget {
  @override
  _DeviceDetailsState createState() => _DeviceDetailsState();
}

class _DeviceDetailsState extends State<DeviceDetails> {
  // List of tabs
  List<String> tabs = ['Cardiology', 'Neurology', 'Orthopedics', 'Radiology'];

  int selectedIndex = 0;



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
                onTap: (){
                  Navigator.pop(context);
                },
                  child: Image.asset(AppImages.backArrow,))
          ),
        ),
        title: CustomText(
          text: 'Pacemaker',
          textColor: Color(0xFF001A2E),
          fontWeight: FontWeight.bold,
        ),
        actions: [Container(
          height: 38.h,
          width: 92.w,
          decoration: BoxDecoration(
            color: Darkcontainer,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(

              children: [
                Icon(Icons.quiz,color: Colors.yellow,),
                SizedBox(width: 5.w
                  ,),
                CustomText(text: 'Quiz me', textColor: Colors.white, fontWeight: FontWeight.w500),
              ],
            ),
          ),
        ),
          SizedBox(width: 12.w
            ,)
        ],
      ),
      body: Column(
        children: [
        ],
      ),
    );
  }}
