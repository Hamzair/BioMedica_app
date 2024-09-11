import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/view/homeOptions/DeviceLibrary/deviceLibrary.dart';
import 'package:bio_medica/widget/custom_search.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Map<String, dynamic>> gridItems = [
    {
      'image': AppImages.DeviceLibrary,
      'title': 'Device\nlibrary',
      'page': DeviceLibrary()
    },
    {
      'image': AppImages.Therapeutic,
      'title': 'Therapeutic\nDevices',
    },
    {
      'image': AppImages.ClinicalEngineering,
      'title': 'Clinical\nEngineering',
    },
    {
      'image': AppImages.HumanAnatomy,
      'title': 'Human\nAnatomy',
    },
    {
      'image': AppImages.HumanPhyscology,
      'title': 'Human\nPhysiology ',
    },
    {
      'image': AppImages.BioMechanics,
      'title': 'Bio-\nmechanics',
    },
    {
      'image': AppImages.MedicalImaging,
      'title': 'Medical \nImaging',
    },
    {
      'image': AppImages.AdvancedDesign,
      'title': 'Advanced\nDevice',
    },
    {
      'image': AppImages.BioMaterials,
      'title': 'Biomaterials',
    },
    {
      'image': AppImages.ProstheicDevice,
      'title': 'Prosthetic\nDevices',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 12.w,
                  ),
                  SizedBox(
                      height: 38.h,
                      width: 38.w,
                      child: Image.asset(AppImages.drawer)),
                  SizedBox(
                    width: 12.w,
                  ),
                  CustomSearch(),
                  SizedBox(
                    width: 12.w,
                  ),
                  Container(
                    width: 35.w,
                    height: 38.h,
                    decoration: BoxDecoration(
                        color: Darkcontainer,
                        borderRadius: BorderRadius.circular(13.r)),
                    child: Icon(
                      Icons.notifications,
                      color: Color(0xffBDD0EA),
                    ),
                  )
                ],
              ),
            ],
          ),
          backgroundColor: secondaryColor,
        ),
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // 4 columns
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.9,
                ),
                padding: EdgeInsets.all(10.r),
                itemCount: gridItems.length,
                itemBuilder: (context, index) {
                  final item = gridItems[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => item['page'],
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 1.w,
                        ),
                        color: container,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            item['image'],
                            height: 42.h,
                            width: 43.w,
                          ),
                          SizedBox(height: 5.h),
                          CustomText(
                            text: item['title'],
                            textAlign: TextAlign.center,
                            textColor: Colors.white,
                            fontsize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              height: 380.h,
              width: 348.w,
              decoration: BoxDecoration(
                  color: container,
                  borderRadius: BorderRadius.circular(12.r),
                  border: Border.all(color: Colors.black, width: 1.w)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Trending News',
                          textColor: buttonColor,
                          fontWeight: FontWeight.w600,
                          fontsize: 17.sp,
                        ),
                        CustomText(
                          text: 'See More',
                          textColor: buttonColor2,
                          fontWeight: FontWeight.w600,
                          fontsize: 15.sp,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(

                        children: [
                          Container(
                            height: 242.h,
                            width: 239.w,
                            decoration: BoxDecoration(
                              color: container,
                              border: Border.all(color: Colors.black, width: 0.5.w),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomText(
                                      text:
                                          'Breakthrough in Wearable Cardiac Monitors',
                                      textColor: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                Image.asset(
                                  alignment: Alignment.topLeft,
                                  AppImages.laptop,
                                  height: 133.h,
                                  width: 215.w,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: CustomText(
                                    text:
                                        'The chest piece, placed on the patient’s chest or back, transmits body sounds to the diaphragm.',
                                    textColor: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontsize: 10.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: 10.w,),
                          Container(
                            height: 242.h,
                            width: 239.w,
                            decoration: BoxDecoration(
                              color: container,
                              border: Border.all(color: Colors.black, width: 0.5),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CustomText(
                                      text:
                                      'Breakthrough in Wearable Cardiac Monitors',
                                      textColor: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                                Image.asset(
                                  alignment: Alignment.topLeft,
                                  AppImages.laptop,
                                  height: 133.h,
                                  width: 215.w,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: CustomText(
                                    text:
                                    'The chest piece, placed on the patient’s chest or back, transmits body sounds to the diaphragm. These sounds travel through the tubing ions.',
                                    textColor: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontsize: 10.sp,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}

