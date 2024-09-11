import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/course/courses.dart';
import 'package:bio_medica/view/homeOptions/DeviceLibrary/deviceDetails.dart';
import 'package:bio_medica/widget/custom_button.dart';
import 'package:bio_medica/widget/custom_search.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeviceLibrary extends StatefulWidget {
  @override
  _DeviceLibraryState createState() => _DeviceLibraryState();
}

class _DeviceLibraryState extends State<DeviceLibrary> {
  // List of tabs
  List<String> tabs = ['Cardiology', 'Neurology', 'Orthopedics', 'Radiology'];

  int selectedIndex = 0;

  List<Widget> content = [
    Center(
        child: Text(
      'No Cardiology Devices ',
      style: TextStyle(color: Colors.white),
    )),
    Neurology(),
    Center(
        child: Text(
      'No Orthopedics Devices',
      style: TextStyle(color: Colors.white),
    )),
    Center(
        child: Text(
      'No Radiology Devices',
      style: TextStyle(color: Colors.white),
    )),
  ];

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
              child: Icon(
                Icons.menu,
                color: buttonColor2,
              )),
        ),
        title: CustomText(
          text: 'Device Library',
          textColor: Color(0xFF001A2E),
          fontWeight: FontWeight.bold,
        ),
        actions: [],
      ),
      body: Column(
        children: [
          // Search bar and filter button
          ClipRRect(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
            child: Container(
              height: 70,
              color: secondaryColor,
              child: Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: CustomSearch(),
                  )),
                  SizedBox(width: 5),
                  SizedBox(
                    height: 38.h,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Color(0xFF001A2E),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.tune,
                            color: Colors.white,
                            size: 25,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            "Filter",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          // Horizontal Tabs
          Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(tabs.length, (index) {
                  return GestureDetector(
                    onTap: () {
                      // Update selected index on tab tap
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: buildTab(tabs[index], selectedIndex == index),
                    ),
                  );
                }),
              ),
            ),
          ),

          // Display content based on the selected tab
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: content[selectedIndex], // Show content for selected tab
            ),
          ),
        ],
      ),
    );
  }

  // Function to build each tab
  Widget buildTab(String title, bool isSelected) {
    return Container(

      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: container, // Tab background color
        borderRadius: BorderRadius.circular(8), // Rounded corners
        border: Border.all(
          color: isSelected
              ? buttonColor2
              : Colors.transparent, // Border for selected tab
          width: 1,
        ),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white, // White text color
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Neurology extends StatelessWidget {
  const Neurology({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        children: [
          // Item 1
          Card(
            color: container,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/n1.png',

                    fit: BoxFit.cover, // Replace with your image path
                    height: 100,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  const CustomText(
                    text: 'Defibrillator',
                    fontsize: 16,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 5),
                  CustomText(
                    text:
                        'life-saving device that delivers electric shocks to the heart....',
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w500,
                    fontsize: 10.sp,
                    textColor: Colors.white,
                  ),
                  Spacer(),
                  SizedBox(
                    width: 154.w,
                    height: 34.h,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => DeviceDetails()));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: CustomText(
                        text: 'Explore',
                        fontsize: 15.sp,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Item 2
          Card(
            color: container,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/n2.png',

                    fit: BoxFit.cover, // Replace with your image path
                    height: 100,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  const CustomText(
                    text: 'Pacemaker',
                    fontsize: 16,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 5),
                  CustomText(
                    text: 'Regulates heartbeats in patients with arrhythmia',
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w500,
                    fontsize: 10.sp,
                    textColor: Colors.white,
                  ),
                  Spacer(),
                  SizedBox(
                    width: 154.w,
                    height: 34.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => CourseContent()));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: CustomText(
                        text: 'Explore',
                        fontsize: 15.sp,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Item 3
          Card(
            color: container,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/images/n3.png',

                    fit: BoxFit.cover, // Replace with your image path
                    height: 100,
                    width: double.infinity,
                  ),
                  const SizedBox(height: 10),
                  const CustomText(
                    text: 'Stethoscope',
                    fontsize: 16,
                    textColor: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                  const SizedBox(height: 5),
                  CustomText(
                    text:
                        'used to listen to heartbeats, lung sounds, and other body sounds.',
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w500,
                    fontsize: 10.sp,
                    textColor: Colors.white,
                  ),
                  Spacer(),
                  SizedBox(
                    width: 154.w,
                    height: 34.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => CourseContent()));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        backgroundColor: Colors.cyan,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: CustomText(
                        text: 'Explore',
                        fontsize: 15.sp,
                        textColor: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
