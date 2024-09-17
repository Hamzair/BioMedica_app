import 'package:bio_medica/main.dart';
import 'package:bio_medica/widget/loading_percentage_circle.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../view/const/color.dart';

class ProgressScreen extends StatelessWidget {
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
                          text: "Progress Tracking",
                          textColor: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontsize: 22.sp,
                        ),
                      ],
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.0),

              // Bar Chart
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: container,
                    border: Border.all(color: Darkcontainer, width: 1)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Stat Summary',
                          textColor: Colors.white,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.start,
                          fontsize: 18.sp,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color:
                                buttonColor, // Use a slightly transparent blue
                            borderRadius: BorderRadius.circular(
                                12), // Add rounded corners
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Month',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                              SizedBox(width: 8),
                              Icon(
                                Icons.arrow_drop_down,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      height: 200.h,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceAround,
                          maxY: 10,
                          barTouchData: BarTouchData(enabled: false),
                          titlesData: FlTitlesData(
                              show: true,
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget:
                                      (double value, TitleMeta meta) {
                                    const style = TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    );
                                    switch (value.toInt()) {
                                      case 0:
                                        return CustomText(
                                          text: 'Jan',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        );
                                      case 1:
                                        return CustomText(
                                          text: 'Feb',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        );
                                      case 2:
                                        return CustomText(
                                          text: 'March',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        );
                                      case 3:
                                        return CustomText(
                                          text: 'April',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w400,
                                        );
                                      case 4:
                                        return Text('May', style: style);
                                      case 5:
                                        return Text('Jun', style: style);
                                      case 6:
                                        return Text('Jul', style: style);
                                      default:
                                        return Text('', style: style);
                                    }
                                  },
                                ),
                              ),
                              leftTitles: AxisTitles(
                                sideTitles: SideTitles(
                                  reservedSize: 40,
                                  showTitles: true,
                                  getTitlesWidget:
                                      (double value, TitleMeta meta) {
                                    // const style = TextStyle(
                                    //   fontSize: 12,
                                    //   color: Colors.white,
                                    // );
                                    return CustomText(
                                      text: value.toInt().toString() + ' hr',
                                      textColor: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    );
                                  },
                                ),
                              ),
                              topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false)),
                              rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false))),

                          gridData: FlGridData(show: false),
                          borderData:
                              FlBorderData(show: false), // Remove the border
                          barGroups: [
                            BarChartGroupData(x: 0, barRods: [
                              BarChartRodData(
                                toY: 7,
                                color: buttonColor,
                                width: 6,
                              ),
                              BarChartRodData(
                                toY: 5,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 6,
                              ),
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                toY: 6,
                                color: buttonColor,
                                width: 6,
                              ),
                              BarChartRodData(
                                toY: 3,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 6,
                              ),
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                toY: 6,
                                color: buttonColor,
                                width: 6,
                              ),
                              BarChartRodData(
                                toY: 7,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 6,
                              ),
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(
                                toY: 8,
                                color: buttonColor,
                                width: 6,
                              ),
                              BarChartRodData(
                                toY: 4,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 6,
                              ),
                            ]),
                            BarChartGroupData(x: 4, barRods: [
                              BarChartRodData(
                                toY: 9,
                                color: buttonColor,
                                width: 6,
                              ),
                              BarChartRodData(
                                toY: 6,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 6,
                              ),
                            ]),
                            BarChartGroupData(x: 5, barRods: [
                              BarChartRodData(
                                toY: 5,
                                color: buttonColor,
                                width: 6,
                              ),
                              BarChartRodData(
                                toY: 4,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 6,
                              ),
                            ]),
                            BarChartGroupData(x: 6, barRods: [
                              BarChartRodData(
                                toY: 6,
                                color: buttonColor,
                                width: 6,
                              ),
                              BarChartRodData(
                                toY: 4,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 6,
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Legends
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LegendItem(color: buttonColor, text: 'Course'),
                  SizedBox(width: 16),
                  LegendItem(
                      color: Color.fromRGBO(219, 92, 0, 1), text: 'Quiz'),
                ],
              ),
              SizedBox(height: 7.h),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: 'Active Course',
                  textColor: buttonColor,
                  fontWeight: FontWeight.bold,
                  fontsize: 20.sp,
                ),
              ),
              /// Active Course Container1
              Container(
                width: 310.w,
                height: 117.h,
                decoration: BoxDecoration(
                  color: tapColor,
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: Color.fromRGBO(0, 28, 49, 1),

                    width: 1.w, // Width of the border
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11.39.w),
                  child: Row(
                    children: [
                      Container(
                        width: 91.01.w,
                        height: 91.01.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.69.r), // Apply the same radius here
                          child: Image(
                            image: AssetImage('assets/images/profilescren_image.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      SizedBox(width: 9.62.w),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 146.w,
                              height: 55.h,
                              child: CustomText(
                                text:
                                "UX Research in Digital Product Design: Master Class",
                                textColor: whiteColor,
                                fontWeight: FontWeight.w600,
                                fontsize: 11.sp,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            SizedBox(
                              width: 180.w,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "22 of 33 chapters",
                                    textColor: buttonColor,
                                    fontWeight: FontWeight.w700,
                                    fontsize: 11.sp,
                                  ),
                                  LoadingPercentageCircle(
                                    percentage: 15,
                                    // Example percentage
                                    size: 25,
                                    // Example size
                                    strokeWidth: 4,
                                    // Example stroke width
                                    backgroundColor: mainTextColor!,
                                    progressColor: buttonColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 7.h),
              /// Active Course Container2
              Container(
                width: 310.w,
                height: 117.h,
                decoration: BoxDecoration(
                  color: tapColor,
                  // Your tapColor can be defined or replaced here
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(
                    color: Color.fromRGBO(0, 28, 49, 1),
                    // Dark blue color for the border
                    width: 1.w, // Width of the border
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11.39.w),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 91.01.w,
                        height: 91.01.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.69.r), // Apply the same radius here
                          child: Image(
                            image: AssetImage('assets/images/my_courses_tab_image2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 9.62.w),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 146.w,
                              height: 56.h,
                              child: CustomText(
                                text:
                                "UX Research in Digital Product Design: Master Class",
                                textColor: whiteColor,
                                fontWeight: FontWeight.w600,
                                fontsize: 11.sp,
                              ),
                            ),
                            SizedBox(height:3.h),
                            SizedBox(
                              width: 180.w,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomText(
                                    text: "10 of 31 chapters",
                                    textColor: buttonColor,
                                    fontWeight: FontWeight.w700,
                                    fontsize: 11.sp,
                                  ),
                                  LoadingPercentageCircle(
                                    percentage: 45,
                                    // Example percentage
                                    size: 25,
                                    // Example size
                                    strokeWidth: 4,
                                    // Example stroke width
                                    backgroundColor: mainTextColor!,
                                    progressColor: buttonColor,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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

class LegendItem extends StatelessWidget {
  final Color color;
  final String text;

  const LegendItem({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2.r), // Add rounded corners
          ),
        ),
        SizedBox(width: 8),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
