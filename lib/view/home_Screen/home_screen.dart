import 'package:bio_medica/controller/nav_bar_controller.dart';
import 'package:bio_medica/view/const/color.dart';
import 'package:bio_medica/view/const/image_assets.dart';
import 'package:bio_medica/view/homeOptions/DeviceLibrary/deviceLibrary.dart';
import 'package:bio_medica/view/home_Screen/article_detail.dart';
import 'package:bio_medica/widget/custom_search.dart';
import 'package:bio_medica/widget/custom_text.dart';
import 'package:bio_medica/widget/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final NavBarController navBarController=Get.put(NavBarController());
  final List<Map<String, dynamic>> gridItems = [
    {
      'image': AppImages.DeviceLibrary,
      'title': 'Device\nlibrary',
      'page': DeviceLibrary()
    },
    {
      'image': AppImages.Therapeutic,
      'title': 'Therapeutic\nDevices',
      'page': DeviceLibrary()
    },
    {
      'image': AppImages.ClinicalEngineering,
      'title': 'Clinical\nEngineering',
      'page': DeviceLibrary()
    },
    {
      'image': AppImages.HumanAnatomy,
      'title': 'Human\nAnatomy',
      'page': DeviceLibrary()
    },
    {
      'image': AppImages.HumanPhyscology,
      'title': 'Human\nPhysiology ',
      'page': DeviceLibrary()
    },
    {
      'image': AppImages.BioMechanics,
      'title': 'Bio-\nmechanics',
      'page': DeviceLibrary()
    },
    {
      'image': AppImages.MedicalImaging,
      'title': 'Medical \nImaging',
      'page': DeviceLibrary()
    },
    {
      'image': AppImages.AdvancedDesign,
      'title': 'Advanced\nDevice',
      'page': DeviceLibrary()
    },
    {
      'image': AppImages.BioMaterials,
      'title': 'Biomaterials',
      'page': DeviceLibrary()
    },
    {
      'image': AppImages.ProstheicDevice,
      'title': 'Prosthetic\nDevices',
      'page': DeviceLibrary()
    },
  ];
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer:  AppDrawer(),
      // key: navBarController.scaffoldKey,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 12.w,
                  ),
                  SizedBox(
                      height: 38.h,
                      width: 38.w,
                      child:  GestureDetector(
                        onTap: () {
                          // Open the drawer using the scaffold key
                          navBarController.scaffoldKey.currentState?.openDrawer();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF001A2E),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.menu,
                            color: buttonColor2,
                          ),
                        ),
                      ),
                  ),
                  SizedBox(
                    width: 11.w,
                  ),
                  Flexible(
                    child: CustomSearch(),
                  ),
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
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: secondaryColor,
        ),
      ),
      body: SingleChildScrollView(

        child: Column(
          children: [
            // Grid View for home options
            Container(
              height: 350.h, // Set fixed height for GridView
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
                          builder: (context) =>
                              item['page'] ?? const SizedBox.shrink(),
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
              padding: EdgeInsets.all(10),
              // height: 321.h,
              width: 348.w,
              margin: EdgeInsets.only(bottom: 150),
              decoration: BoxDecoration(
                color: container,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: 'Trending News',
                          textColor: buttonColor,
                          fontWeight: FontWeight.w600,
                          fontsize: 17.sp,
                        ),
                        GestureDetector(

                          onTap: (){
                            Get.to(()=>ArticleDetail());
                          },
                          child: CustomText(
                            text: 'See more',
                            textColor: buttonColor2,
                            fontWeight: FontWeight.w600,
                            fontsize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14.h,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all( 16),

                            width: 249.w,
                            decoration: BoxDecoration(
                              color: container,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black, width: 0.5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.h,),
                                CustomText(
                                  text: 'Breakthrough in Wearable Cardiac Monitors',
                                  textColor: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontsize: 14.sp,
                                ),
                                SizedBox(height: 10.h,),
                                Image.asset(
                                  width: 215.w,
                                  fit: BoxFit.cover,
                                    alignment: Alignment.topLeft, AppImages.laptop),
                                SizedBox(height: 5.h,),
                                CustomText(
                                  text:
                                      'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data... ',
                                  textColor: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontsize: 11.sp,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10.w
                            ,),
                          Container(
                            padding: EdgeInsets.all( 16),

                            width: 249.w,
                            decoration: BoxDecoration(
                              color: container,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.black, width: 0.5),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 10.h,),
                                CustomText(
                                  text: 'Breakthrough in Wearable Cardiac Monitors',
                                  textColor: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontsize: 14.sp,
                                ),
                                SizedBox(height: 10.h,),
                                Image.asset(
                                    width: 215.w,
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topLeft, AppImages.laptop),
                                SizedBox(height: 5.h,),
                                CustomText(
                                  text:
                                  'Discover the latest advancements in wearable cardiac monitors, including new features for continuous heart monitoring, improved accuracy, and real-time data... ',
                                  textColor: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontsize: 11.sp,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
