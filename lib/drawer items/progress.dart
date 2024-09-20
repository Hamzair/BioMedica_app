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
            padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 5.h),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width < 360 ? 30.w : 38.w,
                        height: MediaQuery.of(context).size.width < 360 ? 30.h : 38.h,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child:   Image.asset('assets/images/back_icon.png'),
                        ),
                      ),
                      SizedBox(width: 12.w),
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
          ),
          backgroundColor: secondaryColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
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
                      height: 160.h,
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
                                          fontsize: 9.2.sp,
                                        );
                                      case 1:
                                        return CustomText(
                                          text: 'Feb',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontsize: 9.2.sp,
                                        );
                                      case 2:
                                        return CustomText(
                                          text: 'Mar',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontsize: 9.2.sp,
                                        );
                                      case 3:
                                        return CustomText(
                                          text: 'Apr',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontsize: 9.2.sp,
                                        );
                                      case 4:
                                        return CustomText(
                                          text: 'May',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontsize: 9.2.sp,
                                        );
                                      case 5:
                                        return CustomText(
                                          text: 'Jun',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontsize: 9.2.sp,
                                        );
                                      case 6:
                                        return CustomText(
                                          text: 'Jul',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontsize: 9.2.sp,
                                        );
                                      case 7:
                                        return CustomText(
                                          text: 'Aug',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontsize: 9.2.sp,
                                        );
                                      case 8:
                                        return CustomText(
                                          text: 'Sep',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontsize: 9.2.sp,
                                        );
                                      case 9:
                                        return CustomText(
                                          text: 'Oct',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontsize: 9.2.sp,
                                        );
                                      case 10:
                                        return CustomText(
                                          text: 'Nov',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontsize: 9.2.sp,
                                        );
                                      case 11:
                                        return CustomText(
                                          text: 'Dec',
                                          textColor: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontsize: 9.2.sp,
                                        );

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
                                width: 5,
                              ),
                              BarChartRodData(
                                toY: 5,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 5,
                              ),
                            ]),
                            BarChartGroupData(x: 1, barRods: [
                              BarChartRodData(
                                toY: 6,
                                color: buttonColor,
                                width: 5,
                              ),
                              BarChartRodData(
                                toY: 3,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 5,
                              ),
                            ]),
                            BarChartGroupData(x: 2, barRods: [
                              BarChartRodData(
                                toY: 6,
                                color: buttonColor,
                                width: 5,
                              ),
                              BarChartRodData(
                                toY: 7,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 5,
                              ),
                            ]),
                            BarChartGroupData(x: 3, barRods: [
                              BarChartRodData(
                                toY: 8,
                                color: buttonColor,
                                width: 5,
                              ),
                              BarChartRodData(
                                toY: 4,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 5,
                              ),
                            ]),
                            BarChartGroupData(x: 4, barRods: [
                              BarChartRodData(
                                toY: 9,
                                color: buttonColor,
                                width: 5,
                              ),
                              BarChartRodData(
                                toY: 6,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 5,
                              ),
                            ]),
                            BarChartGroupData(x: 5, barRods: [
                              BarChartRodData(
                                toY: 5,
                                color: buttonColor,
                                width: 5,
                              ),
                              BarChartRodData(
                                toY: 4,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 5,
                              ),
                            ]),
                            BarChartGroupData(x: 6, barRods: [
                              BarChartRodData(
                                toY: 6,
                                color: buttonColor,
                                width: 5,
                              ),
                              BarChartRodData(
                                toY: 4,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 5,
                              ),
                            ]),
                            BarChartGroupData(x: 7, barRods: [
                              BarChartRodData(
                                toY: 6,
                                color: buttonColor,
                                width: 5,
                              ),
                              BarChartRodData(
                                toY: 4,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 5,
                              ),
                            ]),
                            BarChartGroupData(x: 8, barRods: [
                              BarChartRodData(
                                toY: 1,
                                color: buttonColor,
                                width: 5,
                              ),
                              BarChartRodData(
                                toY: 1,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 5,
                              ),
                            ]), BarChartGroupData(x: 9, barRods: [
                              BarChartRodData(
                                toY: 1,
                                color: buttonColor,
                                width: 5,
                              ),
                              BarChartRodData(
                                toY: 1,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 5,
                              ),
                            ]),

                            BarChartGroupData(x: 10, barRods: [
                              BarChartRodData(
                                toY: 1,
                                color: buttonColor,
                                width: 5,
                              ),
                              BarChartRodData(
                                toY: 1,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 5,
                              ),
                            ]),

                            BarChartGroupData(x: 11, barRods: [
                              BarChartRodData(
                                toY: 1,
                                color: buttonColor,
                                width: 5,
                              ),
                              BarChartRodData(
                                toY: 1,
                                color: Color.fromRGBO(219, 92, 0, 1),
                                width: 5,
                              ),
                            ]),

                          ],
                        ),
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
                  ],
                ),
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

              /// Active Course Container2
              Stack(
                children: [

                  Container(
                    width: double.infinity.w,
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
                                image: AssetImage('assets/images/profilescren_image.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 9.62.w),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
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

                                SizedBox(height: 18.62.w),
                                SizedBox(
                                  width: 180.w,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: "22/33 chapters",
                                        textColor: buttonColor,
                                        fontWeight: FontWeight.w700,
                                        fontsize: 11.sp,
                                      ),
                                      CustomText(
                                        text: "22/30 chapters",
                                        textColor: Color.fromRGBO(219, 92, 0, 1),
                                        fontWeight: FontWeight.w700,
                                        fontsize: 11.sp,
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
                  Positioned(
                    right: 22.w,
                    bottom: 0.h,
                    top: 0.h,
                    child: LoadingPercentageCircle(
                      percentage: 15,
                      // Example percentage
                      size: 38,
                      // Example size
                      strokeWidth: 6,
                      // Example stroke width
                      backgroundColor: mainTextColor!,
                      progressColor: buttonColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 7.h),
              /// Course Container2
              Stack(
                children: [

                  Container(
                    width: double.infinity.w,
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
                                image: AssetImage('assets/images/ux_design_image_2.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 9.62.w),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
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

                                SizedBox(height: 18.62.w),
                                SizedBox(
                                  width: 180.w,
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomText(
                                        text: "10/31 chapters",
                                        textColor: buttonColor,
                                        fontWeight: FontWeight.w700,
                                        fontsize: 11.sp,
                                      ),
                                      CustomText(
                                        text: "44/50 chapters",
                                        textColor: Color.fromRGBO(219, 92, 0, 1),
                                        fontWeight: FontWeight.w700,
                                        fontsize: 11.sp,
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
                  Positioned(
                    right: 22.w,
                    bottom: 0.h,
                    top: 0.h,
                    child: LoadingPercentageCircle(
                      percentage: 45,
                      // Example percentage
                      size: 38,
                      // Example size
                      strokeWidth: 6,
                      // Example stroke width
                      backgroundColor: mainTextColor!,
                      progressColor: buttonColor,
                    ),
                  ),
                ],
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
